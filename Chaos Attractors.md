# Feedback: Chaos Attractor Architecture

> Technical document for the multi-attractor excitation system in Feedback, a physical modeling instrument built on African tuning systems and polyrhythmic voice allocation.

---

## Abstract

Feedback uses strange attractors as excitation sources for a bank of six waveguide resonators tuned to 19 African tuning systems. The current implementation uses the Lorenz system; this document specifies the extension to five attractor types with three combining modes, creating a controllable chaos ecosystem that drives physically-modeled resonance through culturally-grounded pitch and rhythm structures.

The core research question: **how do the topological properties of different strange attractors translate into musically distinct timbral behaviour when used as waveguide excitation through non-Western tuning architectures?**

---

## 1. System Architecture

```
                    ┌─────────────┐
                    │ ATTRACTOR A  │──┐
                    │ (selectable) │  │
                    └─────────────┘  │   ┌──────────┐
                                     ├──▶│ COMBINER  │
                    ┌─────────────┐  │   │ blend /   │
                    │ ATTRACTOR B  │──┘   │ modulate /│    ┌──────────────────┐
                    │ (optional)   │      │ route     │───▶│ 6 WAVEGUIDE      │
                    └─────────────┘      └──────────┘    │ RESONATORS       │
                                                          │ (African tuning)  │
                    ┌─────────────┐                       │                    │
                    │ POLYRHYTHMIC │──────────────────────▶│ Voice activation  │
                    │ PATTERN      │                       │ (bitmask/step)    │
                    │ ENGINE       │                       └──────────────────┘
                    └─────────────┘                              │
                                                                 ▼
                    ┌─────────────┐                       ┌──────────────────┐
                    │ ROOT         │──────────────────────▶│ STEREO MIX       │
                    │ SNAP-BACK    │                       │ + Sub-bass       │
                    └─────────────┘                       │ + Saturation     │
                                                          └──────────────────┘
```

### Signal Chain

1. **Attractor(s)** produce three continuous signals (x, y, z) exhibiting deterministic chaos
2. **Combiner** merges or routes attractor outputs according to one of three modes
3. **Excitation scaling** maps attractor output to waveguide drive amplitude via `chaos_gain`
4. **Waveguide resonators** (6 voices) receive excitation, each tuned to a scale degree within the selected African tuning system
5. **Polyrhythmic pattern engine** gates voice activation per step using 6-bit bitmasks
6. **ADSR envelope** shapes each voice's amplitude independently
7. **Sub-bass waveguide** tracks voice 1 at -1 octave with independent envelope (drone or pattern-following)
8. **Stereo mix** with output saturation via `tanh(signal * drive)`

### Voice-to-Axis Mapping

| Voice | Timbre | Chaos Axis | Cultural Reference |
|-------|--------|------------|-------------------|
| 1 | Sub Bass | X | iya ilu (mother drum) |
| 2 | Body | Y | omele (supporting drum) |
| 3 | Metallic | Z | ogene (iron bell) |
| 4 | Transient | X | gudugudu (tension drum) |
| 5 | Drone | Y | continuous tone |
| 6 | Crystalline | Z | shekere (gourd rattle) |

Each axis of the attractor drives two voices with contrasting timbral character. The three-dimensional phase space of the attractor is thus mapped onto a six-voice timbral ensemble.

---

## 2. Implemented Attractor: Lorenz System

### Equations

```
dx/dt = σ(y - x)
dy/dt = x(ρ - z) - y
dz/dt = xy - βz
```

### Parameters and Musical Mapping

| Parameter | Default | Range | Musical Effect |
|-----------|---------|-------|---------------|
| σ (sigma) | 10 | 0-50 | Sharpness of transitions between lobes. Higher = more angular, percussive excitation |
| ρ (rho) | 28 | 0-200 | **Primary character control.** 20 = converging (quiet), 24.74 = onset of chaos, 28 = classic chaos, 100 = periodic orbit (pitched), 166 = stable periodic |
| β (beta) | 2.667 | 0-20 | Z-axis damping. Affects metallic and crystalline voice energy |
| dt | 0.0012 | 0.0003-0.004 | Integration rate. Controls speed of attractor evolution |
| chaos_gain | 0.01 | 0-0.5 | Excitation amplitude into waveguides |

### Implementation Details

- **4× unrolled Euler integration** per sample for trajectory smoothness
- **Output scaling**: `cx = lx * 0.05, cy = ly * 0.04, cz = (lz - 25) * 0.04` (z offset compensates for Lorenz attractor's z-axis bias)
- **State clamping**: `clamp(±100)` prevents numerical explosion
- **Noise injection**: `+ noise() * 0.01` prevents attractor from settling on unstable fixed points
- **Parameter smoothing**: Selectable 0/500ms/50ms/5ms interpolation on σ, ρ, β, dt, chaos_gain for click-free live parameter changes
- **External modulation**: Audio input (in 1) is added to ρ, allowing external signals to perturb the attractor's character

### Sonic Character

The Lorenz system produces **angular, explosive** excitation. The two-lobe structure creates alternating bursts that drive waveguides with irregular but bounded energy. At classic chaos (ρ = 28), the switching between lobes produces complex rhythmic excitation that interacts with the polyrhythmic pattern engine. At periodic orbits (ρ = 100+), the attractor produces pitched, quasi-periodic excitation that reinforces waveguide resonance.

---

## 3. Planned Attractors

### 3.1 Rössler System

```
dx/dt = -y - z
dy/dt = x + ay
dz/dt = b + z(x - c)
```

| Parameter | Default | Musical Effect |
|-----------|---------|---------------|
| a | 0.2 | Spiral tightness — lower = tighter, more tonal |
| b | 0.2 | Z-coupling strength |
| c | 5.7 | **Character control.** Fold point — higher = more pronounced reinjection events |

**Sonic character:** Smooth, spiraling excitation with periodic reinjection spikes. The Rössler attractor spends most of its time in a slowly expanding spiral (gentle, tonal excitation) punctuated by sudden z-axis excursions (sharp transients). This produces waveguide behaviour qualitatively different from Lorenz: sustained resonance with intermittent disruption rather than continuous angular chaos.

**Musical use cases:** Ambient drones, melodic chaos, slow-evolving textures. The spiral provides tonal centre that Lorenz lacks. Ideal for film scoring (sustained tension with surprise), installation contexts (gentle long-form evolution), and tonal African tuning exploration where you want to hear the intervals clearly.

**Output scaling:** `cx = rx * 0.08, cy = ry * 0.08, cz = (rz - 12) * 0.08`

**Integration rate:** dt ≈ 0.005 (slower than Lorenz — the Rössler orbit is larger and needs smaller steps for numerical stability).

### 3.2 Chua's Circuit

```
h(x) = m₁x + ½(m₀ - m₁)(|x + 1| - |x - 1|)
dx/dt = α(y - x - h(x))
dy/dt = x - y + z
dz/dt = -β_c · y
```

| Parameter | Default | Musical Effect |
|-----------|---------|---------------|
| α (alpha) | 15.6 | **Character control.** Scroll speed — how fast the trajectory switches between lobes |
| β_c | 28 | Scroll width — separation between the two attracting regions |
| m₀ | -1.143 | Nonlinearity shape (inner slope) |
| m₁ | -0.714 | Nonlinearity shape (outer slope) |

**Sonic character:** Sharp, binary switching between two scroll regions. The piecewise-linear nonlinearity `h(x)` creates abrupt transitions that are qualitatively different from the smooth folds of Lorenz and Rössler. The excitation has a **digital, glitchy** quality — fast binary oscillation between two attracting regions with occasional chaotic switching.

**Musical use cases:** Percussive, glitch-oriented textures. The binary switching creates almost rhythmic excitation at certain parameter values, which interacts with the polyrhythmic engine in unpredictable ways. Well-suited to experimental electronic contexts where the "digital" quality is desirable.

**Output scaling:** `cx = chx * 0.4, cy = chy * 2.0, cz = chz * 0.25` (Chua has a much smaller state space than Lorenz — scaling compensates).

### 3.3 Halvorsen System

```
dx/dt = -ax - 4y - 4z - y²
dy/dt = -ay - 4z - 4x - z²
dz/dt = -az - 4x - 4y - x²
```

| Parameter | Default | Musical Effect |
|-----------|---------|---------------|
| a | 1.89 | **Single parameter control.** Orbit tightness — the only free parameter. Lower = tighter symmetric orbits, higher = wider excursions |

**Sonic character:** The Halvorsen attractor has **three-fold rotational symmetry** — all three axes are structurally equivalent. This is unique among the five attractors and has a direct musical consequence: the X, Y, and Z excitation signals have identical statistical properties but are phase-shifted. The six voices receive balanced, symmetric excitation rather than the axis-biased excitation of Lorenz.

**Musical use cases:** Balanced ensemble textures where all six voices contribute equally. The symmetry means bass voices and crystal voices have the same energy distribution — the timbral differentiation comes entirely from the tuning and waveguide character, not from excitation bias. Particularly interesting for the **route combining mode**, where the symmetric Halvorsen drives voices 1-3 and an asymmetric attractor (Lorenz or Chua) drives voices 4-6, creating deliberate symmetry/asymmetry tension.

**Output scaling:** `cx = hx * 0.1, cy = hy * 0.1, cz = hz * 0.1`

### 3.4 Aizawa System

```
dx/dt = (z - b)x - dy
dy/dt = dx + (z - b)y
dz/dt = c + az - z³/3 - (x² + y²)(1 + ez) + fzx³
```

| Parameter | Default | Musical Effect |
|-----------|---------|---------------|
| a | 0.95 | Z-axis instability — higher = more z excursion |
| b | 0.7 | Rotation centre offset |
| c | 0.6 | **Character control.** Z-axis drive — shifts between torus and chaos |
| d | 3.5 | Rotation speed — higher = faster xy spiraling |
| e | 0.25 | Nonlinear coupling |
| f | 0.1 | Cubic coupling |

**Sonic character:** The Aizawa attractor is **torus-like** — the trajectory winds around a donut-shaped surface with occasional excursions. This produces the smoothest, most predictable excitation of all five attractors. The xy-plane creates a slow rotation (gentle amplitude modulation of voice pairs) while the z-axis occasionally breaks from the torus (subtle transient events).

**Musical use cases:** Installation and ambient contexts where **predictable, bounded behaviour** is required. Directly addresses the concerns of Profile 12 ("chaos is a hard sell when the installation runs unsupervised for six months") and Profile 25 ("I need instruments to guide people toward stillness"). The Aizawa system provides chaos-adjacent complexity without the explosiveness of Lorenz.

**Output scaling:** `cx = aix * 0.7, cy = aiy * 0.7, cz = (aiz - 0.5) * 1.0`

---

## 4. Attractor Combining System

Three modes for merging two simultaneously-computed attractors.

### 4.1 Blend Mode

Linear interpolation of attractor outputs:

```
output_x = A_x * (1 - mix) + B_x * mix
output_y = A_y * (1 - mix) + B_y * mix
output_z = A_z * (1 - mix) + B_z * mix
```

**Parameter:** `blend_mix` (0.0 = A only, 1.0 = B only, 0.5 = equal)

**Musical effect:** Creates hybrid excitation that inherits characteristics from both attractors. Lorenz (0.7) + Rössler (0.3) produces mostly angular chaos with a smooth undertow. The blend is applied after output scaling, so both attractors contribute at comparable amplitudes regardless of their native state space ranges.

### 4.2 Modulate Mode

Attractor B's output modulates attractor A's parameters before A's computation:

```
// B computed first
B_x, B_y, B_z = compute_attractor_B()

// B's output modulates A's parameters
A.character_param += B_x * mod_depth * 5.0    // B.x → A's primary character
A.shape_param    += B_y * mod_depth * 2.0     // B.y → A's secondary shape
// B.z reserved for future use (brightness modulation, chaos_gain, etc.)

// A computed with modulated parameters
A_x, A_y, A_z = compute_attractor_A()

// Output is A only (B's contribution is embedded in A's trajectory)
output_x = A_x
output_y = A_y
output_z = A_z
```

**Parameter:** `mod_depth` (0.0 = no modulation, 1.0 = full)

**Musical effect:** This is the most musically significant combining mode. The modulating attractor creates **long-form structural evolution** in the primary attractor's behaviour. For example:

- **A = Lorenz, B = Aizawa**: The smooth torus of Aizawa slowly drifts Lorenz's ρ parameter, causing the primary chaos to breathe between convergent and chaotic regimes over periods of 10-60 seconds. The result is a chaos engine with emergent macro-structure — something no single attractor can produce.

- **A = Lorenz, B = Rössler**: The Rössler spiral creates periodic modulation of Lorenz's character, with sudden spikes during Rössler's z-axis reinjection events. This produces mostly-stable chaos punctuated by dramatic parameter shifts.

This mode addresses a fundamental limitation of single-attractor instruments: the sound is self-similar at all time scales. With modulation, the attractor's qualitative behaviour evolves over time, creating the kind of long-form narrative arc needed for film scoring, installation, and extended live performance.

### 4.3 Route Mode

Different attractors drive different voice groups:

```
// Voices 1-3 (bass, body, metallic) driven by A
exc1 = A_x * chaos_gain * ...
exc2 = A_y * chaos_gain * ...
exc3 = A_z * chaos_gain * ...

// Voices 4-6 (transient, drone, crystal) driven by B
exc4 = B_x * chaos_gain * ...
exc5 = B_y * chaos_gain * ...
exc6 = B_z * chaos_gain * ...
```

**Musical effect:** Creates a **dual-ensemble instrument** where the bass register and treble register have independent chaotic behaviour. This is musically analogous to how a traditional West African drum ensemble operates: the lead drummer (djembe) improvises freely while the supporting ensemble (dundun, bell) maintains independent patterns. In route mode, the two attractor "ensembles" are tuned to the same scale but driven by different chaos, creating emergent polyrhythmic relationships at the excitation level that layer on top of the explicit polyrhythmic patterns in the arp engine.

This is particularly powerful when combined with the African rhythm patterns. The bitmask voice allocation (which determines WHICH voices sound on each step) now selects between two different chaos characters, not just two different timbres. A Bembe bell pattern that alternates between bass voices and crystal voices is simultaneously alternating between (for example) Lorenz angular chaos and Halvorsen symmetric chaos.

---

## 5. Shared Parameter Architecture

### The Problem

Five attractors with unique parameter sets would require 15+ dedicated parameters and an unmanageable UI. Each attractor has 1-6 native parameters with different ranges and meanings.

### The Solution: Semantic Mapping

Three shared knobs that are semantically mapped per attractor:

| Shared Knob | Semantic Role | Lorenz | Rössler | Chua | Halvorsen | Aizawa |
|-------------|--------------|--------|---------|------|-----------|--------|
| **Character** | Primary behaviour control | ρ (0-200) | c (1-20) | α (5-30) | a (1-3) | c (0.1-2) |
| **Shape** | Secondary shape modifier | σ (1-50) | a (0.05-1) | β_c (10-50) | — | d (1-10) |
| **Colour** | Tertiary timbral detail | β (0.5-10) | b (0.05-1) | — | — | a (0.5-1.5) |

Plus the shared parameters that apply to all attractors:
- `dt` (integration rate)
- `chaos_gain` (excitation amplitude)
- Lorenz parameter smoothing modes (0/500ms/50ms/5ms)

This design allows the performer to develop muscle memory for the three knobs regardless of which attractor is selected. "Character always controls the main behaviour" is a consistent physical gesture.

---

## 6. Integration with Tuning and Rhythm

### Attractor → Tuning Interaction

Each attractor type interacts differently with the 19 tuning systems:

- **Lorenz + septimal tuning** (e.g., Yoruba Pentatonic with flex parameter): The angular switching excites waveguides at irregular intervals, producing beating effects against the just-intonation intervals. The flex parameter (blending Pythagorean and just ratios) creates microtonal tension that the chaos amplifies.

- **Rössler + equi-heptatonic** (e.g., 7-TET): The smooth spiral provides sustained excitation that allows the equally-spaced intervals to ring clearly. The periodic reinjection events create punctuation without destroying the tonal centre.

- **Chua + dundun 3-tone**: The binary switching maps naturally onto the 3-note system — the two Chua scrolls can be heard as alternating between tonal regions.

- **Halvorsen + any system**: The three-fold symmetry means all three chaos axes drive the waveguides with equal statistical energy. This is the only attractor where the bass/mid/treble voice groups receive identical excitation, making the tuning system's interval structure maximally audible.

- **Aizawa + BaAka/Pygmy 5-TET**: The smooth torus creates gentle amplitude modulation of the equally-spaced pentatonic, producing a shimmering, breathing texture suitable for ambient and installation contexts.

### Attractor × Rhythm Pattern Interaction

The 9 rhythm patterns (Bembe, Shiko, Gahu, Son Clave, Fume Fume, Kassa, Poly 3:2, Triplet, Call/Response) interact with the attractor in two ways:

1. **Temporal gating**: The pattern engine gates which voices sound on each step. The attractor continues running continuously, but its excitation only reaches voices that are currently active. This means the attractor's state at the moment a voice activates determines that note's character — creating controlled randomness within a structured rhythmic framework.

2. **Route mode timbral layering** (with two attractors): When the pattern activates a bass voice, it selects attractor A's excitation. When it activates a crystal voice, it selects attractor B's excitation. The rhythmic pattern becomes a timbral orchestration tool — not just deciding WHEN voices sound, but which CHAOS CHARACTER they carry.

---

## 7. Product Architecture

### Core Tier

- **Attractor**: Lorenz only
- **Tuning**: All 19 African systems
- **Patterns**: All 9 polyrhythmic patterns
- **Features**: Sub-bass waveguide (drone/follow), root snap-back, ADSR, MIDI clock sync, brightness, register, output saturation
- **Audience**: Performance-focused electronic musicians, Afrofuturist producers, film composers

### Pro Tier

Everything in Core, plus:
- **5 attractors** (Lorenz, Rössler, Chua, Halvorsen, Aizawa) with switchable selection
- **3 combining modes** (blend, modulate, route)
- **Shared parameter mapping** (Character / Shape / Colour knobs)
- Per-resonator outputs (6-channel)
- Audio input excitation
- Tuning morphing between systems
- **Audience**: Power users, installation artists, researchers, modular integrators

---

## 8. Gen~ Implementation Outline

### New Declarations (Pro tier)

```genexpr
// Attractor selection
Param att_sel(0);           // 0=Lorenz, 1=Rossler, 2=Chua, 3=Halvorsen, 4=Aizawa
Param att_b_sel(-1);        // Secondary: -1=off, 0-4=same
Param combine_mode(0);      // 0=A only, 1=blend, 2=modulate, 3=route
Param blend_mix(0.5);       // A:B ratio for blend
Param mod_depth(0.5);       // Modulation depth

// State histories (Lorenz lx/ly/lz already exist)
History rx(1);   History ry(0);   History rz(0);     // Rossler
History chx(0.1); History chy(0); History chz(0);    // Chua
History hx(1);   History hy(0);   History hz(0);     // Halvorsen
History aix(0.1); History aiy(0); History aiz(0);    // Aizawa
```

### Computation Structure (pseudocode)

```
// 1. Compute attractor B first (needed for modulate mode)
b_active = (att_b_sel > -0.5);
if b_active:
    compute selected B attractor → bx, by, bz (scaled)

// 2. Apply modulation from B → A's character param
if combine_mode == modulate:
    character_offset = bx * mod_depth * 5.0
    shape_offset = by * mod_depth * 2.0
else:
    character_offset = 0; shape_offset = 0

// 3. Compute attractor A (with modulated params)
compute selected A attractor → ax, ay, az (scaled)

// 4. Combine
if combine_mode == blend:
    cx = ax*(1-mix) + bx*mix; cy = ...; cz = ...
elif combine_mode == route:
    cx_123 = ax, ay, az;  cx_456 = bx, by, bz
else:  // A only or modulate
    cx = ax; cy = ay; cz = az

// 5. Apply to voices (route mode splits at excitation)
```

### CPU Budget

| Component | Ops/sample | At 48kHz |
|-----------|-----------|----------|
| 1 attractor (4× unrolled) | ~40 | 1.9M/s |
| 2 attractors | ~80 | 3.8M/s |
| Combiner logic | ~12 | 0.6M/s |
| **Total additional cost** | **~92** | **4.4M/s** |

Modern CPUs execute ~10 billion integer ops/s. The attractor system adds < 0.05% CPU load. **No optimisation needed.**

---

## 9. Research Context

### Precedent

- **Chua's circuit as audio source**: Rodet & Lambert (IRCAM, 2005) explored Chua-based oscillators for musical timbre. Our contribution extends this to multiple attractor types with culturally-grounded resonator tuning.
- **Lorenz in modular synthesis**: Cherry Audio Lorenz, Make Noise Strega, Nonlinear Circuits Sloth all use Lorenz for CV generation. Our contribution uses attractors as waveguide excitation within a complete instrument system.
- **Physical modeling + chaos**: Bilbao (2009) "Numerical Sound Synthesis" provides the waveguide theory. Our contribution is the novel excitation-resonator-tuning pipeline.
- **African tuning in synthesis**: Sethares (2005) "Tuning, Timbre, Spectrum, Scale" establishes the theoretical framework. Our contribution implements this as synthesis architecture rather than scale files.

### Novel Contributions

1. **Multi-attractor waveguide excitation with cultural tuning** — no existing instrument combines selectable chaos sources with ethnomusicologically-grounded tuning systems
2. **Attractor modulation mode** — using one strange attractor to modulate another's parameters creates emergent long-form structure not achievable with single attractors or LFO modulation
3. **Route mode as timbral orchestration** — mapping different attractors to different voice groups creates a dual-ensemble instrument with independent chaos characters, analogous to the multi-part structure of West African drum ensembles
4. **Pattern-aware voice allocation with chaos routing** — rhythm patterns that select between chaos sources (not just voices) on each step, creating a higher-order compositional structure

### Relevant Venues

- **NIME 2026** (London, June 23-26): Paper + demo. Theme: "what NIME can learn from other musical communities"
- **ICMC 2026** (Hamburg, May 10-17): Peer-reviewed paper + concert
- **SMC 2026** (Zagreb, Nov 2-7): Theme "INTERPLAY" — human-machine-sonic environment
- **DAFx 2026** (MIT): Signal processing focus

### Residency Alignment

| Residency | What to develop | Duration |
|-----------|----------------|----------|
| **IRCAM** (Paris) | Full attractor system implementation in gen~, combining modes, RNBO export to VST/AU. Access to FluCoMa tools, Max/MSP expertise, technical staff for waveguide optimisation. | 3-6 months |
| **ZKM** (Karlsruhe) | Multi-channel installation version with route mode across speaker arrays. 8-channel per-resonator output. Aizawa-based generative installation mode. | 2-4 months |
| **EMS Stockholm** | Sound design exploration — mapping all 5 attractors × 19 tuning systems × 9 patterns. Recording a comprehensive library of timbral combinations. | 2-6 weeks |
| **Harvestworks NYC** | Hardware prototype — RNBO export to Bela/Daisy for dedicated hardware instrument. Physical interface design (knobs for Character/Shape/Colour). | 2-3 months |

---

## 10. Preset Combinations

### Shipped Presets (Pro Tier)

| Name | Attractor A | Attractor B | Combine | Musical Context |
|------|------------|------------|---------|-----------------|
| **Classic Chaos** | Lorenz | Off | — | The core instrument as it exists today |
| **Breathing Chaos** | Lorenz | Aizawa | Modulate | Lorenz with slow tidal evolution. Film scoring, long performances |
| **Dual Ensemble** | Lorenz | Chua | Route | Angular bass voices + glitchy treble. Two independent chaos characters |
| **Smooth Spiral** | Rössler | Off | — | Melodic, tonal. Hearing the tuning intervals clearly |
| **Tidal Drone** | Aizawa | Off | — | Installation and ambient. Bounded, predictable, smooth |
| **Glitch Metal** | Chua | Halvorsen | Blend | Sharp digital switches + symmetric orbits |
| **Film Tension** | Lorenz | Rössler | Modulate | Chaos that breathes. Rössler's spiral creates periodic parameter drift |
| **Symmetric Dance** | Halvorsen | Lorenz | Route | Balanced ensemble (1-3) vs angular bass (4-6) |
| **Calm Mode** | Aizawa | Rössler | Blend | Minimal chaos. For therapeutic and sound healing contexts |
| **Full Chaos** | Lorenz | Chua | Blend | Maximum unpredictability. Both aggressive attractors combined |

---

## Appendix A: Attractor Equations Reference

### Lorenz (1963)

```
dx/dt = σ(y - x)
dy/dt = x(ρ - z) - y
dz/dt = xy - βz
```

Standard parameters: σ = 10, ρ = 28, β = 8/3. Exhibits chaos for ρ > 24.74 (Hopf bifurcation). Two-lobe structure in the xz-plane. Typical state space: x, y ∈ [-20, 20], z ∈ [0, 50].

### Rössler (1976)

```
dx/dt = -y - z
dy/dt = x + ay
dz/dt = b + z(x - c)
```

Standard parameters: a = 0.2, b = 0.2, c = 5.7. Single-scroll attractor with reinjection. Period-doubling route to chaos as c increases. Typical state space: x, y ∈ [-12, 12], z ∈ [0, 25].

### Chua (1983)

```
h(x) = m₁x + ½(m₀ - m₁)(|x + 1| - |x - 1|)
dx/dt = α(y - x - h(x))
dy/dt = x - y + z
dz/dt = -βy
```

Standard parameters: α = 15.6, β = 28, m₀ = -1.143, m₁ = -0.714. Double-scroll attractor. Piecewise-linear nonlinearity. Originally derived from an electronic circuit. Typical state space: x ∈ [-3, 3], y ∈ [-0.5, 0.5], z ∈ [-4, 4].

### Halvorsen (attribution uncertain)

```
dx/dt = -ax - 4y - 4z - y²
dy/dt = -ay - 4z - 4x - z²
dz/dt = -az - 4x - 4y - x²
```

Standard parameter: a = 1.89. Three-fold rotational symmetry. All three axes are structurally equivalent. Typical state space: x, y, z ∈ [-10, 10].

### Aizawa (1982)

```
dx/dt = (z - b)x - dy
dy/dt = dx + (z - b)y
dz/dt = c + az - z³/3 - (x² + y²)(1 + ez) + fzx³
```

Standard parameters: a = 0.95, b = 0.7, c = 0.6, d = 3.5, e = 0.25, f = 0.1. Torus-like structure — trajectory winds around a donut with occasional z-axis excursions. The smoothest attractor in the set. Typical state space: x, y ∈ [-1.5, 1.5], z ∈ [-1, 2].

---

## Appendix B: Output Scaling Reference

All attractors are scaled to produce comparable excitation amplitudes (approximately ±1 before chaos_gain multiplication):

| Attractor | X scaling | Y scaling | Z scaling |
|-----------|----------|----------|----------|
| Lorenz | × 0.05 | × 0.04 | (z - 25) × 0.04 |
| Rössler | × 0.08 | × 0.08 | (z - 12) × 0.08 |
| Chua | × 0.4 | × 2.0 | × 0.25 |
| Halvorsen | × 0.1 | × 0.1 | × 0.1 |
| Aizawa | × 0.7 | × 0.7 | (z - 0.5) × 1.0 |

---

*Document version: 2026-03-02*
*Part of the Feedback instrument system — chaos attractors driving waveguide resonators through African tuning architectures*
