// PASS 1: Minimum distance to full lusona path
// Output: R = minDist, G = 0, B = 0, A = 1
// Input: uniform vec2 uPath[250] from CHOP array param
// Node: lusona_viz GLSL TOP
// Key discovery: NO conditionals in GLSL loops on mobile RTX 4090!
// The NVIDIA driver silently breaks loops with if/break/step inside.
uniform vec2 uPath[250];

layout(location = 0) out vec4 fragColor;

void main()
{
    vec2 uv = vUV.st;

    float minDist = 10.0;
    for (int i = 1; i < 140; i++) {
        vec2 a = uPath[i-1];
        vec2 b = uPath[i];
        vec2 pa = uv - a;
        vec2 ba = b - a;
        float denom = dot(ba, ba);
        float h = clamp(dot(pa, ba) / max(denom, 1e-8), 0.0, 1.0);
        minDist = min(minDist, length(pa - ba * h));
    }

    fragColor = TDOutputSwizzle(vec4(minDist, 0.0, 0.0, 1.0));
}
