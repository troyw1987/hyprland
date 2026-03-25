// Balatro Background - High Definition (Anti-Aliased)
#define SPIN_EASE 1.0

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // --- Configuration ---
    float spin_rotation_speed = 2.0;
    float move_speed = 7.0;
    vec2 offset = vec2(0.0, 0.0);
    //vec4 colour_1 = vec4(0.5 + 0.5*cos(iTime*0.05), 0.5 + 0.5*sin(iTime*0.05), 0.5, 1.0);
    vec4 colour_1 = vec4(0.5 + 0.5*cos(iTime*0.05), 0.5 + 0.5*sin(iTime*0.05), 0.5, 1.0);

    vec4 colour_2 = vec4(0.0, 0.42, 0.706, 1.0);
    vec4 colour_3 = vec4(0.086, 0.137, 0.145, 1.0);
    float contrast = 3.5;
    float lighting = 0.4;
    float spin_amount = 0.25;

    vec2 screenSize = iResolution.xy;
    
    // --- REMOVED PIXELATION LOGIC ---
    // Instead of floor/pixel_size, we use direct UV coordinates
    vec2 uv = (fragCoord.xy - 0.5 * screenSize.xy) / length(screenSize.xy) - offset;
    float uv_len = length(uv);

    float speed = (spin_rotation_speed * SPIN_EASE * 0.2);
    speed += 302.2;

    float new_pixel_angle = (atan(uv.y, uv.x)) + speed - SPIN_EASE * 20.0 * (1.0 * spin_amount * uv_len + (1.0 - 1.0 * spin_amount));
    vec2 mid = (screenSize.xy / length(screenSize.xy)) / 2.0;
    uv = (vec2((uv_len * cos(new_pixel_angle) + mid.x), (uv_len * sin(new_pixel_angle) + mid.y)) - mid);

    uv *= 30.0;
    float move_time = iTime * move_speed;
    vec2 uv2 = vec2(uv.x + uv.y);

    for(int i=0; i < 5; i++) {
        // uv2 += exp(sin(max(uv.x, uv.y))) + uv; // sharp
        // uv2 += pow(abs(sin(uv.x)), 2.0) + uv; // soft
        uv2 += exp(sin(uv.x)) + uv; // organic
        uv  += 0.5 * vec2(cos(5.1123314 + 0.353 * uv2.y + move_time * 0.131121), sin(uv2.x - 0.113 * move_time));
        uv  -= 1.0 * cos(uv.x + uv.y) - 1.0 * sin(uv.x * 0.711 - uv.y);
    }

    float contrast_mod = (0.25 * contrast + 0.5 * spin_amount + 1.2);
    float paint_res = min(2.0, max(0.0, length(uv) * 0.035 * contrast_mod));
    float c1p = max(0.0, 1.0 - contrast_mod * abs(1.0 - paint_res));
    float c2p = max(0.0, 1.0 - contrast_mod * abs(paint_res));
    float c3p = 1.0 - min(1.0, c1p + c2p);

    float light = (lighting - 0.2) * max(c1p * 5.0 - 4.0, 0.0) + lighting * max(c2p * 5.0 - 4.0, 0.0);
    vec4 ret_col = (0.3 / contrast) * colour_1 + (1.0 - 0.3 / contrast) * (colour_1 * c1p + colour_2 * c2p + vec4(c3p * colour_3.rgb, c3p * colour_1.a)) + light;

    fragColor = ret_col;
}
