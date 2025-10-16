shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture; // <<--- adicionado para Godot 4

uniform float overlay_opacity : hint_range(0.0, 1.0) = 0.9; // força do efeito (0 = original, 1 = 100% hack)
uniform float intensity : hint_range(0.0, 2.0) = 1.0;      // força das distorções
uniform float speed : hint_range(0.0, 5.0) = 1.0;          // velocidade das animações
uniform float scanline_strength : hint_range(0.0, 0.5) = 0.06;
uniform float glitch_bands : hint_range(1.0, 40.0) = 12.0; // quantas bandas horizontais
uniform float noise_scale : hint_range(1.0, 200.0) = 80.0;
uniform float chroma_offset : hint_range(0.0, 0.03) = 0.007;
uniform vec3 tint = vec3(0.35, 1.0, 0.35);                 // cor do "hack" (verde típico)
uniform float grain_strength : hint_range(0.0, 1.0) = 0.12;

float hash21(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float noise(vec2 uv) {
    vec2 i = floor(uv);
    vec2 f = fract(uv);
    float a = hash21(i);
    float b = hash21(i + vec2(1.0, 0.0));
    float c = hash21(i + vec2(0.0, 1.0));
    float d = hash21(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

void fragment() {
    vec2 uv = SCREEN_UV;
    float t = TIME * speed;

    // base noise (temporal)
    float n = noise(uv * noise_scale + vec2(t * 0.3, t * 0.6));
    // bandas glitch horizontais (mover e aparecer aleatoriamente)
    float band_wave = sin((uv.y * glitch_bands + t * 3.0) * 6.28318);
    float band_mask = smoothstep(0.6, 0.9, fract(sin((uv.y * glitch_bands + floor(t*2.0)) * 12.9898) * 43758.5453));
    band_mask *= step(0.7, fract(t*0.5 + uv.x*3.0)); // pisca
    float band_strength = band_mask * intensity * 0.25;

    // deslocamento horizontal randômico por banda
    float offset_x = (n - 0.5) * intensity * 0.03 + band_strength * sign(sin(t*20.0 + uv.y*300.0));
    vec2 offset = vec2(offset_x, 0.0);

    // cromatic aberration: amostramos canais R/G/B com pequenos deslocamentos
    vec3 col_r = texture(SCREEN_TEXTURE, uv + offset + vec2(chroma_offset, 0.0)).rgb;
    vec3 col_g = texture(SCREEN_TEXTURE, uv + offset).rgb;
    vec3 col_b = texture(SCREEN_TEXTURE, uv + offset - vec2(chroma_offset, 0.0)).rgb;
    vec3 hacked = vec3(col_r.r, col_g.g, col_b.b);

    // scanlines finas
    float scan = sin((uv.y * 1200.0) + t * 50.0);
    float scan_mod = 1.0 - scanline_strength * (0.5 + 0.5 * scan);

    // grain/ruído final
    float grain = (hash21(uv * vec2(100.0, 100.0) + floor(t*10.0)) - 0.5) * grain_strength;

    // aplicar tinta verde e brilho
    hacked = mix(texture(SCREEN_TEXTURE, uv + offset).rgb, hacked * tint, 0.8);
    hacked *= (1.0 + n * 0.15) * scan_mod;
    hacked += grain;

    // pequenas linhas/brilhos aleatórios
    hacked += band_strength * vec3(0.7, 1.0, 0.5);

    // mistura final entre original e hack (overlay_opacity controla)
    vec3 original = texture(SCREEN_TEXTURE, uv).rgb;
    vec3 outc = mix(original, hacked, overlay_opacity);

    COLOR = vec4(outc, 1.0);
}
