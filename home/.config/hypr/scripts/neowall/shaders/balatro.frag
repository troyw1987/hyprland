// balatro.frag
precision highp float;
uniform float time;
uniform vec2 resolution;

void main() {
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    uv = uv * 2.0 - 1.0;
    uv.x *= resolution.x / resolution.y;

    // The "Swirl" math
    float t = time * 0.5;
    vec2 p = uv;
    for(int i=1; i<4; i++) {
        p.x += 0.3 / float(i) * sin(float(i) * 3.0 * p.y + t);
        p.y += 0.3 / float(i) * sin(float(i) * 3.0 * p.x + t);
    }

    // Colors (Adjust HEX-style colors here)
    vec3 col1 = vec3(0.87, 0.27, 0.23); // Reddish
    vec3 col2 = vec3(0.0, 0.42, 0.71);  // Bluish
    
    float v = 0.5 + 0.5 * sin(p.x + p.y);
    vec3 finalCol = mix(col1, col2, v);

    gl_FragColor = vec4(finalCol, 1.0);
}
