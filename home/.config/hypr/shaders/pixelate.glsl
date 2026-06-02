#version 300 es

// pixelate.glsl — Hyprshade / Hyprland screen shader
// Pixelates the entire screen by snapping UVs to a coarse grid.
//
// Install:
//   cp pixelate.glsl ~/.config/hypr/shaders/
//   hyprshade on pixelate

precision mediump float;

in  vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;

// ── Tweak these ────────────────────────────────────────────────────────────
const float PIXEL_SIZE = 32.0; // size of each "pixel" block in screen texels
                                // (try 8.0 for subtle, 32.0 for very blocky)
// ───────────────────────────────────────────────────────────────────────────

void main() {
    vec2 resolution = vec2(textureSize(tex, 0));

    // Snap the UV to the nearest block corner
    vec2 uv = floor(v_texcoord * resolution / PIXEL_SIZE)
              * PIXEL_SIZE / resolution;

    fragColor = texture(tex, uv);
}
