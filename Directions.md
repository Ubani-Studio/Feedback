# Feedback Instrument — Directions & Strategy

> Lorenz chaos attractor → 6 waveguide resonators + sub-bass → 19 African tuning systems → 9 polyrhythmic patterns → live performance instrument

---

## Table of Contents

1. [Sound Improvement Directions](#1-sound-improvement-directions)
2. [Beta Test Scores: 30 ICP Profiles](#2-beta-test-scores-30-icp-profiles)
3. [Non-Customers & Unexpected Avenues](#3-non-customers--unexpected-avenues)
4. [Grants, Funding & Residencies](#4-grants-funding--residencies)
5. [Festivals & Presentation Contexts](#5-festivals--presentation-contexts)
6. [Direct Competitors](#6-direct-competitors)
7. [ERRC Blue Ocean Analysis — Moat Protection](#7-errc-blue-ocean-analysis--moat-protection)
8. [Problem Statement](#8-problem-statement)
9. [Value Increase Strategies](#9-value-increase-strategies)

---

## 1. Sound Improvement Directions

### A. Body Resonance (Cabinet / Amplifier Modeling)

The waveguides currently produce raw string/tube resonances. Real instruments have **bodies** that shape the sound — wood, metal, glass, stone. Adding body resonance transforms Feedback from "synth" to "instrument."

**Implementation paths:**

1. **Convolution body**: Short impulse responses (IRs) of physical objects — a calabash, a metal drum shell, a clay pot, a sheet of corrugated iron. Apply via `[buffir~]` or gen~ convolution. Low CPU, instant character.

2. **Parametric cabinet model**: A bank of 4-6 biquad filters modeling body resonances. Parameters: body size (shifts all resonant frequencies), material (damping/decay of each band), brightness (tilt EQ). This gives real-time tweakable "body" without needing IR files.

3. **Sympathetic resonance**: Add 2-4 extra waveguides that are NOT directly excited but resonate sympathetically from the output of the 6 main voices. Like a sitar's sympathetic strings or a piano's open strings ringing. This adds shimmer, depth, and a sense of physical space.

### B. Exciter Diversity

Currently the Lorenz attractor drives all 6 voices. More exciter types = more timbral range:

- **Bowed excitation**: Continuous friction model (velocity × force → slip-stick oscillation). Produces sustained, cello-like tones from waveguides.
- **Struck excitation**: Short noise burst shaped by an amplitude envelope. For bell, mbira, kalimba-like attacks.
- **Blown excitation**: Turbulent airflow model (noise through a bandpass → waveguide). For flute/pipe resonances.
- **Plucked excitation**: Classic Karplus-Strong (noise burst → feedback delay). Already partially there.

Mix-and-match per voice: voice 1 bowed, voice 2 struck, voice 3 blown, voices 4-6 chaos-driven.

### C. Resonant Sheet / Metallic Body

The blue-ocean direction: **a resonant sheet model** — imagine a large sheet of metal (like a thunder sheet, a gamelan gong, or Éliane Radigue's feedback setup) that the waveguides excite.

**How it works:**
- 2D waveguide mesh (a grid of delay lines instead of 1D strings)
- The 6 voices feed into different points on the mesh
- The mesh produces inharmonic, spatially complex resonances
- Material parameter morphs between: metal sheet → wooden board → glass plate → membrane
- Size parameter changes from small bell to room-sized gong

This is computationally expensive but would be the signature sound. No other instrument does this.

### D. Post-Processing Chain

Built-in FX that complete the sound without external plugins:

1. **Feedback delay**: Short delay (20-200ms) fed back into the waveguide input. Creates self-exciting resonant loops.
2. **Spectral freeze**: FFT-based freeze that captures a moment and lets it ring. For drones and transitions.
3. **Saturator/Waveshaper**: Tube-style saturation → adds harmonics and weight. Essential for sub bass.
4. **Reverb with character**: Not generic — model specific spaces (concrete hall, metal container, open air).

### E. Summary: Sound Roadmap

| Phase | Addition | Impact | Effort |
|-------|----------|--------|--------|
| Now | Parametric cabinet model | +Body character | Medium |
| Now | Saturator on output | +Weight, bass presence | Low |
| Next | Sympathetic resonance strings | +Shimmer, depth | Medium |
| Next | Bowed/struck/blown exciters | +Timbral range | High |
| Later | 2D resonant sheet mesh | +Signature sound, blue ocean | Very high |
| Later | Spectral freeze | +Performance tool | Medium |

---

## 2. Beta Test Scores: 30 ICP Profiles

### Category 1: Experimental Electronic Producers (Avg: 7.6/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 1 | Berlin glitch producer, CTM/Atonal regular, Ableton + Max/MSP workflow | **9/10** | "The Lorenz attractor as a sound source isn't new, but routing it through waveguides with actual tuning systems instead of arbitrary math — that's the missing link I've been patching around for years." | Praise: mathematical chaos with musical intentionality. Will want CV/modular integration. |
| 2 | London hyperpop producer, PC Music adjacent, Unsound and Le Guess Who | **7/10** | "The timbres are sick but I need to be able to resample this into something that sits in a pop structure — give me a one-shot export mode and I'm in." | Concern: workflow integration. Wants to capture moments, not perform live. |
| 3 | Brooklyn noise/experimental artist, Issue Project Room and MUTEK regular | **8/10** | "Root snap-back is quietly the best feature — every chaos instrument I've used just drifts into unusable territory after 90 seconds live." | Praise: the live performance constraint. |
| 4 | Tokyo glitch-ambient producer, Ars Electronica and SonarD+ | **6/10** | "Beautiful engine but 19 tuning systems is overwhelming without some kind of morphing or transition logic between them — I'd use maybe three." | Concern: feature overload. Wants fewer, deeper options. |
| 5 | Sao Paulo bass music / deconstructed club producer, Rewire and MUTEK MX | **8/10** | "The polyrhythmic arp synced to MIDI clock is exactly what I need — I've been faking African polyrhythm in my DAW with probability sequencers and it never feels right." | Praise: rhythmic authenticity with electronic workflow. |

### Category 2: Afrofuturist / African Electronic Musicians (Avg: 8.6/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 6 | Lagos electronic producer, Eko Jazz / Afro-electronic, Lagos Biennial | **9/10** | "Someone finally built an instrument that treats these tuning systems as living musical knowledge instead of an exotic preset bank — the Bembe pattern through septimal tuning made me emotional honestly." | Praise: cultural respect embedded in the architecture. Core audience. |
| 7 | Nairobi sound artist, Nyege Nyege regular, Kampala-Nairobi scene | **9/10** | "Every synth I own was designed by someone who thinks music starts and ends with 12-TET — this is the first instrument that doesn't make me translate my ideas into someone else's framework." | Praise: decolonized instrument design. Will become an evangelist. |
| 8 | Joburg producer, Gqom-adjacent experimental, Fak'ugesi Festival | **7/10** | "The chaos engine is interesting but I need this to hit harder in the low end — gqom needs sub weight and the waveguides sound more midrange-focused right now." | Concern: low-frequency performance. Wants bass presence. |
| 9 | Accra electronic musician, highlife-influenced futurist, SXSW Africa | **8/10** | "Fume Fume pattern locked to MIDI clock from my drum machine and I had a full arrangement in ten minutes — this thing writes music with you." | Praise: generative composition partner, not just a sound source. |
| 10 | Kampala experimental artist, Nyege Nyege Tapes roster, Boutiq Festival | **10/10** | "This is the instrument I would have designed if I could code — chaos that you can steer, tunings that are mine, rhythms that are mine, and it still surprises me every time I touch it." | Pure alignment. Dream user. Will push the instrument into new territory. |

### Category 3: Sound Artists / Installation Artists (Avg: 6.75/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 11 | Museum-context sound artist, multichannel installations, Serpentine/Tate | **7/10** | "The Lorenz attractor gives me the long-form evolution I need for 8-hour installations, but I need spatialization outputs — mono or stereo isn't enough for a gallery context." | Needs multichannel or per-resonator outs. |
| 12 | Immersive audio designer, teamLab-adjacent, experiential spaces | **6/10** | "Fascinating sound palette but my clients need guaranteed behavior within known parameters — chaos is a hard sell when the installation runs unsupervised for six months." | Needs bounded chaos modes or preset evolution paths. |
| 13 | Conceptual sound artist, decolonial sonics, documenta/Venice Biennale | **9/10** | "The fact that the tuning systems aren't decorative — they're structural to the synthesis — makes this a genuine artistic statement, not cultural tourism." | Praise: intellectual and political coherence of the design. |
| 14 | Field recording / processed sound artist, GRM-lineage, acousmatic | **5/10** | "It sounds good but I work from recorded material outward — I'd need audio input to excite the resonators with field recordings instead of the chaos oscillator." | Wants external audio excitation. Real feature request. |

### Category 4: Live Performers / Hardware Musicians (Avg: 7.0/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 15 | Modular synth performer, Superbooth regular, Norbergfestival | **7/10** | "Root snap-back and brightness are good performance controls but I want voltage control — if this were a VCV Rack module or had CV inputs I'd never unplug it." | Wants CV integration, not just MIDI. |
| 16 | Live techno performer, Elektron RYTM + Digitone, Berghain Kantine | **8/10** | "MIDI clock sync actually works tight — I ran Son Clave through the arp against my RYTM patterns for two hours and it never drifted." | Praise: clock implementation quality. Zero tolerance for sloppy sync. |
| 17 | Loop-based live performer, Ableton Push hybrid, Boiler Room | **6/10** | "The sounds are amazing in isolation but I can't figure out how to make it sit in a mix — it fills up the whole frequency spectrum." | Needs better filtering or built-in EQ. |
| 18 | Hardware jam artist, TE/Elektron ecosystem, YouTube gear channel 15K subs | **7/10** | "The 19 tuning systems and 9 rhythm patterns is a content goldmine but the learning curve means most of my audience would bounce off it." | Mixed: marketing value vs. accessibility concern. |

### Category 5: Film/Game Composers (Avg: 8.0/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 19 | Textural film scorer, A24-style horror/drama, sample library user | **8/10** | "I just scored an entire scene of dread and unease in 20 minutes by slowly increasing the chaos parameters — this is faster than layering samples and it sounds more alive." | Horror/tension scoring is a killer use case. |
| 20 | AAA game audio designer, procedural audio, Wwise/FMOD | **7/10** | "The Lorenz parameters responding to game state would be incredible for adaptive music — but I need this as a plugin or engine integration." | Wants VST/AU or middleware format. |
| 21 | Documentary / world cinema composer, African diaspora filmmakers | **9/10** | "Directors keep asking me for sounds that feel authentically rooted but not like a sample library — this is the first tool that gives me that without me feeling like I'm strip-mining someone's culture." | Ethical source material for culturally-engaged scoring. |

### Category 6: Academic / Research (Avg: 7.0/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 22 | Ethnomusicologist, studies West African tuning systems | **8/10** | "The septimal and Chopi tuning implementations are surprisingly accurate — whoever built this actually studied the source material instead of approximating from Western intervals." | Praise: tuning accuracy. Will validate or critique publicly. Wants documentation. |
| 23 | Music technology researcher, NIME community regular | **7/10** | "Interesting mapping choices — the chaos-to-pitch relationship through snap-back creates a novel control paradigm worth writing about." | Sees research value. Will want to co-author a NIME paper. |
| 24 | Music therapy researcher, non-Western tonal frameworks | **6/10** | "The tuning systems open up tonal territory my clients respond to differently than 12-TET, but the chaos is too unpredictable for clinical settings without a 'calm mode.'" | Needs constrained/deterministic modes for therapy. |

### Category 7: Non-Customers / Unexpected Avenues (Avg: 6.3/10)

| # | Archetype | Score | Quote | Key Point |
|---|-----------|-------|-------|-----------|
| 25 | Sound healing practitioner, singing bowl ceremonies, Ibiza/Tulum | **4/10** | "The tuning systems are beautiful but the chaos element feels agitating — I need instruments to guide people toward stillness, not complexity." | A "meditative mode" with low chaos could open this market. |
| 26 | Architecture firm sound designer, luxury hotels and airports | **5/10** | "The ambient textures at low chaos settings are genuinely unique — I could see using this for a lobby installation — but I need 24/7 reliability and generative automation." | Needs headless generative mode. Real B2B market. |
| 27 | High school music teacher, Afrobeats production club, Title I Atlanta | **7/10** | "My students would lose their minds hearing Bembe rhythm come out of something that looks like a synth — this could bridge traditional stuff and production." | Pedagogical bridge. Price sensitivity is the barrier. |
| 28 | Fashion show music director, Lagos Fashion Week and Afropunk | **8/10** | "I need 12 minutes of unrepeatable, culturally-rooted, high-tension sound that photographs well as a performance — this is literally that." | Spectacle + cultural authenticity. Real market for one-off sonic experiences. |
| 29 | AI/ML researcher, sonification for data exploration | **6/10** | "Using Lorenz attractors for sonification isn't novel but the waveguide resonator bank adds musically useful dimensionality reduction — I'd want to swap in other strange attractors." | Niche but real. Wants customizable chaos engines. |
| 30 | Dance/movement artist, choreographs to live generative sound, Sadler's Wells | **8/10** | "Root snap-back gives me a rhythmic anchor for choreography while the chaos gives my dancers something genuinely unpredictable to respond to." | Snap-back as choreographic tool. Chaos/return tension is physically useful for dance. |

### Summary Statistics

| Category | Avg Score | Range | Verdict |
|----------|-----------|-------|---------|
| Experimental Electronic | 7.6 | 6-9 | Strong fit, some workflow concerns |
| **Afrofuturist / African Electronic** | **8.6** | **7-10** | **Core market. Build for these people first.** |
| Sound Art / Installation | 6.75 | 5-9 | Interested but needs format adaptation |
| Live Performers / Hardware | 7.0 | 6-8 | Good fit if integration is right |
| Film/Game Composers | 8.0 | 7-9 | Sleeper market, especially documentary |
| Academic / Research | 7.0 | 6-8 | Validation + credibility channel |
| Non-Customers | 6.3 | 4-8 | Surprising pockets of demand |

**Overall Average: 7.3/10** | **Median: 7/10** | **Would-buy (7+): 70%** | **Evangelists (9+): 17%**

### Top 3 Most-Requested Features Across All Profiles
1. **Audio input** to excite resonators with external sound (field recordings, other instruments)
2. **Per-resonator outputs** for spatialization and mixing
3. **Bounded/calm chaos modes** for installation and therapeutic contexts

### Key Insight: Root Snap-Back Is Undersold
Multiple profiles across unrelated categories (experimental, dance, live performance) identified root snap-back as the key differentiator. It makes Feedback a **playable instrument** rather than a chaos generator. Lead with it in marketing.

---

## 3. Non-Customers & Unexpected Avenues

### 3a. Five Non-Obvious Markets

**1. Runway / Fashion Show Sonic Direction**
Fashion shows need 8-15 minutes of unrepeatable, culturally-loaded sound performed live. Lagos Fashion Week, Afropunk, and the growing African luxury fashion scene need sonic identity that isn't just a DJ playing tracks. The instrument itself becomes part of the brand narrative.
- Revenue: licensing per show + cultural cachet
- Entry: one fashion music director adopting it

**2. Dance / Choreography Tool**
The snap-back mechanism is unexpectedly useful for choreographers. Dance needs sound unpredictable enough to provoke genuine physical response but structured enough to rehearse to. The chaos-to-return arc maps onto tension-release in movement.
- Entry: residency at Sadler's Wells, Baryshnikov Arts Center, Dance Base Edinburgh
- One choreographer adopting it = entire contemporary dance world exposure

**3. Afrobeats Production Education Pipeline**
Trojan horse for music education in diaspora communities. The instrument makes African rhythmic and tonal systems tangible and cool inside electronic music. Title I schools in Atlanta, community programs in Brixton, youth centers in Marseille — anywhere young people of African descent see traditional music as their grandparents' thing.
- Strategy: educational pricing or free licenses for qualifying programs
- Long game: build a generation who grow into your professional market

**4. Procedural Game Audio / Adaptive Soundtrack Engine**
Lorenz attractor parameters responding to game state (player stress, proximity to danger, narrative tension). Waveguide resonators provide timbral richness that procedural audio typically lacks. Tuning systems shift by game region or cultural context.
- Requires different product format (plugin/middleware, not standalone)
- Partner with one indie studio for proof of concept

**5. Architectural Acoustics / Sonic Environment Design**
Luxury hospitality and retail investing heavily in sonic branding. Low-chaos ambient textures from Feedback are unlike anything in the current sonic branding toolkit. Hotel lobby in Lagos, concept store in Dubai, museum cafe in London.
- Requires "generative ambient" headless mode
- B2B product alongside the artist instrument

---

## 4. Grants, Funding & Residencies

### Tier 1: US Arts Grants (High Relevance)

| Grant | Amount | Fit | Notes |
|-------|--------|-----|-------|
| **LACMA Art + Technology Lab** | Up to $50,000 | Perfect — explicitly funds art/tech intersection | Deadline: April 22, 2026 |
| **Creative Capital Award** | Up to $50,000 + professional development | Strong — funds innovative, original artistic works | Open application |
| **NEA Grants for Arts Projects** | $10,000 - $100,000 | Good — media arts, music, multidisciplinary | FY27 cycle: Feb 25, 2026 deadline |
| **United States Artists Fellowship** | $50,000 unrestricted | Strong — music category | Nomination-based only |
| **Herb Alpert Award (Music)** | $75,000 unrestricted | Perfect — risk-taking mid-career composers | Nomination-based only |
| **Foundation for Contemporary Arts** | $45,000 | Strong — peer-nominated grants to artists | Cannot apply directly |
| **FCA Emergency Grants** | $500 - $3,000 | Good — for specific performances | Rolling, 8-10 weeks before event |

### Tier 2: European / International Grants

| Grant | Amount | Fit | Notes |
|-------|--------|-----|-------|
| **Giga-Hertz Award (ZKM + SWR)** | EUR 25,000 total (EUR 10K grand prize) | Perfect — electronic music and sound art | Winners produce at ZKM and premiere at KUBUS |
| **British Council International Collaboration** | GBP 25,000 - 75,000 | Strong if partnered with UK institution | e.g., NIME 2026 at Imperial College |
| **British Council International Showcase Fund** | Up to GBP 5,500 | Good — for performing at international festivals | CTM, Unsound, MUTEK etc. |
| **WAYS Programme (Goethe-Institut)** | EUR 27,000 - 1,600,000 | Strong — Germany/non-Europe collaborations, Africa focus | Long-term artistic collaborations |
| **Africa-Europe Mobility Grants** | Up to EUR 4,000 per trip | Good — travel for performances/presentations | Rolling quarterly through Sept 2027 |

### Tier 3: African-Focused Funding

| Grant | Amount | Fit | Notes |
|-------|--------|-----|-------|
| **Africa No Filter** | Up to $100,000 (org grants) | Strong — narrative-shifting stories about Africa + technology | Individual: up to $15K |
| **Africa No Filter Kekere** | $500 - $3,000 | Good — emerging artists fund | Lower barrier |
| **Prince Claus Seed Award** | EUR 5,000 (100 awarded/year) | Good — early-career, eligible countries incl. Nigeria | 2026 deadline passed — apply 2027 |
| **Art Moves Africa** | Travel costs + visa | Good — presenting at African festivals | For intra-Africa travel |

### Key Residencies

| Residency | Duration | What You Get | Fit |
|-----------|----------|-------------|-----|
| **EMS Stockholm** | 2-6 weeks | World-class electronic music studio | Develop all four instruments |
| **ZKM/IRCAM Joint** | 6+ months | IRCAM (Paris) + ZKM (Karlsruhe) facilities | FluCoMa ecosystem, physical modeling research |
| **IRCAM Artistic Research** | 3-6 months | IRCAM research labs + technical staff | Synthesis engine development |
| **Harvestworks NYC** | Variable | T.E.A.M. Lab access, public presentation | Technology + sound art |
| **Cryptic/Cove Park Scotland** | Variable | Leads to Sonica 2026 presentation (Sept 24 - Oct 4) | Festival pipeline |
| **Pioneer Works Brooklyn** | Variable | Studio + exhibition/performance space | NYC exposure |
| **Akademie der Künste Berlin** | Variable | Studio for Electroacoustic Music | Berlin scene access |

### Grant Pitch Angles

1. **For music technology grants** (LACMA, Creative Capital, Giga-Hertz): "Chaos mathematics driving physical modeling synthesis — a new approach to instrument design"
2. **For African diaspora/cultural grants** (Africa No Filter, Prince Claus, British Council): "The first synthesizers built on Yoruba pentatonic tuning, dundun speech-tone systems, and Igbo ogene intervals"
3. **For residencies** (EMS, IRCAM, ZKM): "Developing African-grounded synthesis tools using European research infrastructure (FluCoMa, Max/MSP)"

---

## 5. Festivals & Presentation Contexts

### Festival Circuit (Year-Round)

**Spring 2026:**
- **Rewire** — April 9-12, The Hague. Forward-thinking, genre-bending.
- **Superbooth 26** — May 7-9, FEZ Berlin. Synthesizer trade fair. Position as "what synthesis sounds like built on African systems."
- **ICMC 2026** — May 10-17, Hamburg (Ligeti Center). Peer-reviewed paper + concert.
- **Africa Rising Music Conference** — May 22-23, Johannesburg. Music + tech, Pan-African ecosystems.
- **Berlin Atonal × Unsound: "The Infinite Now"** — May 16-17, Kraftwerk Berlin. 30-hour continuous programme.

**Summer 2026:**
- **NIME 2026** — June 23-26, London (Imperial College + Rich Mix). Paper + demo + performance. Theme: "what NIME can learn from other musical communities."
- **MUTEK Montreal** — August 25-30. Call for projects OPEN. AV performance opportunity.
- **Berlin Atonal** — August 27-31, Kraftwerk. Massive concrete space = natural resonator.

**Fall 2026:**
- **Sonica Glasgow** — September 24 - October 4. Audio-visual art, 11-day biennial.
- **Nyege Nyege** — September/October, Jinja, Uganda. THE African electronic music festival. 26,000 attendees. Homecoming narrative.
- **Unsound Krakow** — ~October. Experimental music.
- **SMC 2026** — November 2-7, Zagreb. Theme: "INTERPLAY" — humans, machines, sonic environments.

**Winter 2026/27:**
- **CTM Berlin 2027** — January. "Resynthesising the Traditional" research lab aligns exactly with Feedback's thesis.

### Academic Conferences
- **NIME 2026** (London, June) — Core venue
- **ICMC 2026** (Hamburg, May) — Peer-reviewed
- **SMC 2026** (Zagreb, November) — "INTERPLAY" theme
- **DAFx 2026** (MIT) — Synthesis and signal processing

---

## 6. Direct Competitors

### Physical Modeling Synthesis (Closest Category)

| Product | Price | What | Gap vs Feedback |
|---------|-------|------|----------------|
| **Madrona Labs Kaivo** | ~$129 | Granular + physical modeling, semi-modular | No African tuning, no chaos, no polyrhythm |
| **AAS Chromaphone 3** | ~$199 | Physical modeling percussion, 8 resonator types | 12-TET only, preset-based, no chaos |
| **Arturia Pigments 6** | ~$199 | 6-engine synth, modal synthesis engine | Commercial synth, no tuning systems, no chaos |
| **Modartt Pianoteq** | $149-$579 | Physical modeling piano/percussion | Acoustic emulation, not experimental |
| **Surge XT** | Free | Open source, Scala microtuning support | Can load custom tunings but no built-in African knowledge, no chaos |

### Chaos / Attractor Instruments

| Product | Price | What | Gap vs Feedback |
|---------|-------|------|----------------|
| **Make Noise Strega** | ~$599 | Analog chaos + feedback synth (with Cortini) | No digital waveguide, no tuning systems, no polyrhythm. Noise-oriented. |
| **Cherry Audio Lorenz** | ~$15 | Software Lorenz CV generator | CV only — no synthesis, no resonators |
| **Make Noise Wogglebug** | ~$239 | Eurorack chaos CV generator | Random voltage source, not a synthesizer |
| **Nonlinear Circuits Sloth** | ~$100-180 | Eurorack Lorenz at very slow rates | Slow modulation only, not audio-rate |
| **Ornament & Crime** | ~$300 | Multi-function module with Lorenz mode | CV only, one mode among many |

### Physical Modeling Hardware (Eurorack)

| Product | Price | What | Gap vs Feedback |
|---------|-------|------|----------------|
| **Mutable Instruments Rings** | Discontinued | Modal/sympathetic string resonator | Single resonator, no chaos, no tuning system. A module, not a system. |
| **Mutable Instruments Elements** | Discontinued | Complete modal synthesizer | Single voice, 12-TET |

### Microtonal / Tuning Software

| Product | Price | What | Gap vs Feedback |
|---------|-------|------|----------------|
| **Entonal Studio** | ~$69 | 200+ tuning presets, hosts plugins | Infrastructure only — no musicological African tuning knowledge |
| **Scala** | Free | Tuning scale creation (.scl files) | File format standard, not an instrument |

### What Does NOT Exist

**No product on the market combines:**
1. Chaos attractor as excitation source
2. Multiple waveguide resonators with heterogeneous timbres
3. Built-in African tuning systems (Yoruba, dundun, ogene, equiheptatonic, etc.)
4. Polyrhythmic engine with West African timeline patterns
5. Live performance controls (root snap-back, brightness, octave range)
6. Integrated as a single system

**Closest competitor:** Madrona Labs Kaivo (physical modeling + experimental). But no chaos, no African tuning, no polyrhythmic architecture.

**Second closest:** Make Noise Strega (chaos + feedback). But no physical modeling resonators, no tuning systems, no digital precision.

---

## 7. ERRC Blue Ocean Analysis — Moat Protection

> **THE MOAT:** African tuning systems as synthesis architecture + polyrhythmic voice allocation + steerable chaos + root snap-back. These four pillars are interlocking — copying one without the others produces a lesser product.

### ELIMINATE (attack the assumptions competitors can't abandon)

- **12-TET as default tuning** — Every competitor (Kaivo, Chromaphone, Pigments, Surge XT) starts from Western equal temperament. Even with Scala support, their engines are 12-TET first, microtonal as afterthought. We eliminate 12-TET as starting point entirely. African tuning is the foundation, not a flavor.
- **Preset banks as product** — AAS and Arturia sell preset packs as DLC. Feedback is a system that generates sound from principles, not a library of pre-made sounds. This is un-copyable because the sound comes from the interaction between chaos, tuning, and rhythm — not from stored parameter snapshots.
- **Sample playback** — Nothing is sampled. This eliminates the entire cultural extraction problem (sampling African instruments without context) while making the sound generation engine the product, not the samples.
- **MIDI keyboard as primary input** — Competitors assume note-per-key polyphony. We don't. The arpeggiator and pattern engine handle voice allocation through culturally-informed rhythmic patterns, not chromatic note input. This is a fundamental architectural difference.

### REDUCE (constrain to sharpen the moat)

- **Voice count to 6** — Competitors boast 128+ voices. We use exactly 6, each with distinct timbral character (sub bass / body / metallic / transient / drone / crystalline). This makes pattern-aware voice allocation meaningful — Bembe step 5 hits body+transient, step 7 hits metallic, because those are the RIGHT timbres for those positions in the bell pattern. 128 generic voices can't do this.
- **Plugin format (for now)** — Max patch first, RNBO export later. Staying in Max protects development speed and keeps us ahead of anyone trying to clone the architecture. When we do export, the gen~ codebox IS the IP.
- **General accessibility** — 19 tuning systems, 9 rhythm patterns, chaos parameters with smoothing modes. The learning curve filters for power users who will become evangelists, not casual browsers who churn. Profile 10 (Kampala, 10/10): "This is the instrument I would have designed if I could code."
- **Feature breadth** — One chain done deeply: chaos → waveguide → African tuning → polyrhythmic voice allocation → live performance control. Competitors spread wide (Pigments: 6 engines). We go narrow and deep where no one else is.

### RAISE (amplify what protects the moat)

- **Tuning system depth** — 19 systems across 5 African regions, each with musicological sourcing (Akinbo 2019 for dundun, Chopi timbila field measurements, BaAka Pygmy 5-TET). This isn't microtonal curiosity — it's ethnomusicological accuracy. Profile 22 (ethnomusicologist): "whoever built this actually studied the source material." This knowledge base is a moat within the moat — hard to replicate without the research.
- **Per-voice rhythmic intelligence** — Each pattern step has a 6-bit bitmask that activates specific voice combinations for timbral intent. Bembe bell: bass on beat 1, mid on beat 5, metallic on beat 7, crystal on beat 9. Son Clave: low body on the three-side, full spread on the two-side. This isn't random — it's compositional knowledge embedded in the engine. No sequencer or probability module can replicate this without understanding WHY these voices go on these beats.
- **Root snap-back** — Multiple unrelated profiles (experimental #3, dance #30, live performer #16) independently identified this as the key differentiator. It solves the fundamental problem of chaos instruments: interesting for 90 seconds, unusable for a performance. Snap-back makes chaos PLAYABLE. The v2 implementation is bulletproof (11 edge-case scenarios verified, delay-based with home-store gate architecture).
- **Sub-bass presence** — Dedicated sub waveguide tracking voice 1 at -1 octave, very dark (brightness 0.1), very high feedback (0.99995), with output saturation via tanh(signal * drive). This directly addresses Profile 8 (Joburg/gqom, 7→target 9): "gqom needs sub weight." Bass physical presence is critical for dance contexts (Profile 30) and fashion shows (Profile 28).

### CREATE (things no competitor can build without our architecture)

- **Chaos-to-resonance-to-tuning pipeline** — Lorenz attractor → 6 heterogeneous waveguides → African tuning ratios. This is ONE system, not three bolted-together modules. The chaos drives the resonators which are pitched by the tuning which is arpeggiated by the patterns. Remove any piece and the product is fundamentally different. A competitor would need to rebuild the entire chain, not just copy a feature.
- **Pattern-aware timbral voice allocation** — The bitmask system means each rhythm pattern is also a TIMBRAL COMPOSITION. Gahu (15-step Ewe dance bell): bass+metallic → mid → low-mid+mid-high → crystal → bass+mid → metallic+crystal. This is not a sequencer triggering notes — it's a rhythmic orchestration engine. No one else has this because it requires the intersection of ethnomusicological knowledge + synthesis architecture + specific timbral voice assignments.
- **Cultural architecture, not cultural preset** — The Yoruba pentatonic flex parameter (blending Pythagorean ratios with just intervals at runtime) isn't a scale you load — it's a synthesis behavior. The dundun 3-tone system shapes the waveguide ratios differently than the Ethiopian Tizita. The tuning IS the sound engine. This is structurally impossible to replicate by adding a preset pack to an existing synth.
- **Steerable chaos with musical anchoring** — Root snap-back + Lorenz parameter smoothing + bounded chaos gain + MIDI clock sync. The chaos is musically useful because you can steer it: rho controls the character (20=converging, 28=classic chaos, 100=periodic), root snap-back gives you a home base, MIDI sync locks the arp to your drummer. Profile 3 (Brooklyn): "every chaos instrument I've used just drifts into unusable territory after 90 seconds live."
- **The four-instrument system** — Feedback is instrument 1 of 4 (Feedback → Corpus Resonance → Coupled Rhythm Engine → Swarm Polyphony). Each builds on the same African-tuning-as-architecture thesis with different synthesis models. A competitor would need to replicate an entire instrument family, not just one product.

### Moat Durability Assessment

| Moat Pillar | Time to Copy | Why Hard |
|------------|-------------|----------|
| 19 African tuning systems | 6-12 months | Requires ethnomusicological research, not just Scala files |
| Polyrhythmic voice allocation | 3-6 months | Requires understanding WHY specific timbres go on specific beats |
| Steerable chaos (snap-back) | 1-3 months | Technically simple, but requires understanding the DESIGN PROBLEM it solves |
| Sub-bass waveguide | 1 month | Easy to copy in isolation, but worthless without the tuning architecture |
| **Full system integration** | **12-18 months** | **All four pillars must work together. Copying one misses the point.** |

**The real moat is the INTERSECTION.** Any individual feature is copiable. The combination of chaos + waveguides + African tuning + polyrhythmic voice allocation + snap-back is not, because it requires understanding all five domains simultaneously. A synthesizer company could add African tuning presets. A chaos module could add snap-back. But neither would have the timbral voice allocation or the culturally-informed rhythmic patterns, because those emerge from the intersection.

---

## 8. Problem Statement

### What Problem Does Feedback Solve?

**For electronic musicians working with African music traditions:**
Every synthesizer on the market was designed from Western musical assumptions — 12 equal divisions of the octave, 4/4 time signatures, harmonic series based on European instrument models. Musicians rooted in African traditions must constantly translate their musical ideas into someone else's framework. Feedback eliminates that translation layer by building synthesis from African tuning systems, polyrhythmic patterns, and non-Western timbral models as the starting point.

**For experimental electronic producers:**
Chaos-based instruments exist (Strega, Wogglebug, various Eurorack modules) but they produce chaos you can't control — interesting for 90 seconds, unusable for a full performance. Feedback solves the "chaos instrument" problem by adding root snap-back, bounded chaos parameters, and rhythmic structure that keeps the chaos musically useful over long durations.

**For film/game composers:**
Scoring work that engages with African stories, diaspora narratives, or non-Western settings currently relies on sample libraries (culturally extractive) or generic "world" presets (culturally empty). Feedback provides an instrument that generates sound FROM African musical principles rather than sampling them — solving the ethical and aesthetic problem simultaneously.

**For the live performance context:**
The instrument solves the "laptop performance problem" — audiences can see and hear that the sound is being generated and shaped in real time through physical interaction, not just pressing play on a sequence. The chaos is visually and sonically legible as live.

**In one sentence:** Feedback is the first synthesizer that treats African musical systems as architecture rather than decoration, while solving the fundamental problem of making chaos musically controllable.

---

## 9. Value Increase Strategies

### Short-Term (Next 3 Months)

1. **Add body resonance** — Parametric cabinet model transforms "synth sound" into "instrument sound." Immediate sonic upgrade.
2. **Add audio input** — Let users excite resonators with field recordings, voice, other instruments. This was the #1 feature request from beta profiles.
3. **NIME 2026 paper submission** — Academic validation opens grant doors and credibility.
4. **Video demos** — 3-5 minute videos showing each tuning system and rhythm pattern. YouTube + Instagram Reels. The content goldmine identified by Profile 18.

### Medium-Term (3-9 Months)

5. **RNBO export to VST/AU** — Unlocks the film/game composer market (Profile 19-21) and the Ableton-centric producers. Free for <$200K revenue.
6. **Per-resonator outputs** — Multichannel output for installation artists and mixers. Opens the gallery/museum market.
7. **TouchDesigner visual integration** — Lorenz attractor driving both sound AND visuals. AV performance at MUTEK, Berlin Atonal.
8. **Sync mode between instances** — Two Feedback instances recognizing each other for call-and-response or polyrhythmic layering. A unique live performance feature.

### Long-Term (9-18 Months)

9. **Complete the four-instrument system** — Corpus Resonance, Coupled Rhythm Engine, Swarm Polyphony. The full system is the real product.
10. **Headless generative mode** — For architectural/installation market. Runs autonomously, set parameters, leave it.
11. **Educational version** — Free or reduced price for qualifying schools/programs. Build the pipeline.
12. **Hardware version** — Dedicated hardware instrument (Raspberry Pi + custom interface via RNBO). The ultimate form factor.

### Value Multipliers

| Strategy | Multiplier | Why |
|----------|-----------|-----|
| Academic publication (NIME/ICMC) | 3x credibility | Opens every grant application |
| One prominent artist using it live | 5x visibility | Festival circuit word-of-mouth |
| Fashion show / dance performance | 3x market reach | Non-music contexts = new audiences |
| RNBO plugin export | 10x addressable market | Standalone → every DAW user |
| Four-instrument system complete | 5x product value | System, not instrument |

---

*Last updated: 2026-03-02*
