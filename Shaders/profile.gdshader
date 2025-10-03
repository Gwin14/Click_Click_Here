shader_type canvas_item;

void fragment() {
    // centro do retângulo
    vec2 center = vec2(0.5, 0.5);
    float radius = 0.5; // raio do círculo (0.5 = metade do tamanho)
    
    // distância do pixel atual ao centro
    float dist = distance(UV, center);
    
    // descarta pixels fora do círculo
    if (dist > radius) {
        discard;
    } else {
        // mostra a textura normalmente dentro do círculo
        COLOR = texture(TEXTURE, UV);
    }
}
