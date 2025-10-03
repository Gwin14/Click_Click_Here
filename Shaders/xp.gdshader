shader_type canvas_item;

// Para pegar o que está atrás
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float wave_speed : hint_range(0.01, 1.0) = 0.1;      // muito lento
uniform float wave_amplitude : hint_range(0.0, 0.00001) = 0.00000001; // distorção mínima

void fragment() {
    vec2 uv = UV;

    // Distorção diagonal super sutil
    float wave = sin((uv.x + uv.y) * 3.0 + TIME * wave_speed) * wave_amplitude;
    vec2 displaced_uv = uv + vec2(1.0, 1.0) * wave;

    COLOR = texture(SCREEN_TEXTURE, displaced_uv);
}
