#version 300 es

// box_blur.glsl — Hyprshade / Hyprland screen shader
// Fast box blur with bilinear trick + configurable step size for performance.
//
// Install:
//   cp box_blur.glsl ~/.config/hypr/shaders/
//   hyprshade on box_blur

precision mediump float;

in  vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;

// ── Tweak these ────────────────────────────────────────────────────────────
const int   BLUR_RADIUS = 3;  // kernel half-width in steps
const float STEP_SIZE   = 6.0; // texels between samples (2.0–6.0)
                                // higher = faster + blurrier, more blocky
// ───────────────────────────────────────────────────────────────────────────

void main() {
    vec2 texelSize = 1.0 / vec2(textureSize(tex, 0));

    vec4 colorSum = vec4(0.0);
    int  samples  = 0;

    // Sample at every STEP_SIZE texels, with +0.5 bilinear offset so each
    // fetch blends a 2x2 block of neighbours for free. Effective coverage
    // per fetch = STEP_SIZE * 2 texels on each axis.
    for (int x = -BLUR_RADIUS; x <= BLUR_RADIUS; x++) {
        for (int y = -BLUR_RADIUS; y <= BLUR_RADIUS; y++) {
            vec2 offset = (vec2(float(x), float(y)) * STEP_SIZE + 0.5) * texelSize;
            colorSum += texture(tex, clamp(v_texcoord + offset, 0.0, 1.0));
            samples++;
        }
    }

    fragColor = colorSum / float(samples);
}
