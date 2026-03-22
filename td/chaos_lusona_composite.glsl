// Cymatic Field + Lusona Lines + Dots + Head Glow
// Node: chaos_viz GLSL TOP
// Input 0: lusona_viz (precomputed distance field, R = minDist)
//
// vec params:
//   vec0: uChaos (x, y, z, loudness)
//   vec1: uParams1 (kuramotoR, time, chaosGain, progress)
//   vec2: uParams2 (lusonaRows, lusonaCols, lusonaMargin, lusonaPoints)
//   vec3: uParams3 (cymaticBright, lineBright, lineWidth, dotBright)
//   vec4: uParams4 (headGlow, headX, headY, 0)
//
// Key discoveries:
//   1. const params on GLSL TOP are BROKEN for >8 slots — use vec params instead
//   2. Uniform arrays (vec2 uPath[250]) work perfectly for path data
//   3. NO conditionals (if/break/step) inside GLSL loops on mobile RTX 4090

uniform vec4 uChaos;
uniform vec4 uParams1;
uniform vec4 uParams2;
uniform vec4 uParams3;
uniform vec4 uParams4;

layout(location = 0) out vec4 fragColor;

#define PI 3.14159265359

float chladni(vec2 p, float n, float m) {
    return sin(n * PI * p.x) * sin(m * PI * p.y)
         + sin(m * PI * p.x) * sin(n * PI * p.y);
}

void main()
{
    vec2 uv = vUV.st;
    vec2 res = uTDOutputInfo.res.zw;
    float displayAspect = res.x / res.y;

    // Unpack params
    float kr = clamp(uParams1.x, 0.0, 1.0);
    float t = uParams1.y;
    float progress = clamp(uParams1.w, 0.0, 1.0);
    float loudness = clamp(abs(uChaos.w), 0.0, 1.0);

    float rows = max(uParams2.x, 1.0);
    float cols = max(uParams2.y, 1.0);
    float margin = uParams2.z;

    float cymaticBright = uParams3.x;
    float lineBright = uParams3.y;
    float lineW = max(uParams3.z, 0.001);
    float dotBrightP = uParams3.w;

    float headGlowP = uParams4.x;
    vec2 headPos = uParams4.yz;

    // === CHLADNI CYMATIC FIELD ===
    vec2 plate = (uv - 0.5) * 2.0;
    plate.x *= displayAspect;
    float baseN = 2.0 + abs(uChaos.x) * 0.1;
    float baseM = 3.0 + abs(uChaos.y) * 0.08;
    float drift = t * 0.1;

    float cymatic = 0.0;
    for (int i = 0; i < 3; i++) {
        float fi = float(i);
        float ni = baseN + fi * 1.3 + sin(drift + fi) * 0.5;
        float mi = baseM + fi * 0.9 + cos(drift * 0.7 + fi) * 0.5;
        cymatic += (1.0 / (1.0 + fi * 0.5)) * chladni(plate * 0.5, ni, mi);
    }
    cymatic *= mix(0.5, 1.0, kr);
    float fw = fwidth(cymatic);
    float nodalLine = 1.0 - smoothstep(0.0, fw * 1.5, abs(cymatic));

    // === LUSONA DISTANCE (from Pass 1 texture) ===
    float minDist = texture(sTD2DInputs[0], uv).r;
    float lineMask = smoothstep(lineW, lineW * 0.3, minDist);
    float lusonaField = exp(-minDist * minDist / (lineW * 8.0));

    // === DOT GRID (branchless 56-iteration flat loop) ===
    float dotBright = 0.0;
    float dotScale = 1.0 - 2.0 * margin;
    float dotR = 0.005;

    for (int k = 0; k < 56; k++) {
        float fk = float(k);
        float row = floor(fk / cols);
        float col = fk - row * cols;
        float dotX = margin + (2.0 * col + 1.0) / (2.0 * cols) * dotScale;
        float dotY = margin + (2.0 * row + 1.0) / (2.0 * rows) * dotScale;
        float dd = length(uv - vec2(dotX, dotY));
        dotBright += smoothstep(dotR, dotR * 0.3, dd);
    }
    dotBright = clamp(dotBright, 0.0, 1.0);

    // === HEAD GLOW ===
    float headGlow = 0.0;
    float hd = length(uv - headPos);
    headGlow = exp(-hd * hd / 0.001) * headGlowP;

    // === COLOR COMBINE ===
    vec3 cymaticColor = vec3(0.85, 0.9, 1.0);
    vec3 lineColor = vec3(0.9, 0.9, 0.88);
    vec3 dotColor = vec3(0.7, 0.7, 0.65);

    float cymaticBase = cymaticBright + loudness * cymaticBright * 3.0;
    float cymaticBoost = 1.0 + lusonaField * lineBright * 4.0;

    vec3 color = vec3(0.0);

    // Cymatics — boosted along lusona path
    color += cymaticColor * nodalLine * cymaticBase * cymaticBoost;

    // Lusona line — prominent trace
    color += lineColor * lineMask * lineBright;

    // Dots
    color += dotColor * dotBright * dotBrightP;

    // Head glow
    color += vec3(1.0, 0.98, 0.95) * headGlow;

    // Vignette
    float vig = 1.0 - length(uv - vec2(0.5)) * 0.4;
    color *= clamp(vig, 0.3, 1.0);

    // Background
    color = max(color, vec3(0.005, 0.005, 0.01));

    fragColor = TDOutputSwizzle(vec4(color, 1.0));
}
