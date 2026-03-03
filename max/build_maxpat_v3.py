import json, os

# Gen~ codebox code — v3 with ADSR, mute, BPM sync, African rhythm patterns,
# scale-degree transpose, arp phase reset for MIDI sync
code = r"""// CHAOS RESONATOR — 5 Attractors -> 6 Waveguide Resonators
// Lorenz, Rossler, Chua, Halvorsen, Aizawa.
// 3 combine modes: Blend, Modulate, Route.
// 19 African tuning systems. Arpeggiator. ADSR envelope.
// BPM-synced arp. African rhythm patterns. Mute.
// Scale-degree transpose. MIDI sync reset.
// tanh() in feedback = self-limiting.

// === Declarations ===
Param sigma(10);
Param rho(28);
Param beta(2.667);
Param lorenz_dt(0.0012);
Param chaos_gain(0.03);
Param root(55);
Param flex(0.5);
Param tuning_system(0);
Param master_gain(0.7);
Param deg1(0);
Param deg2(1);
Param deg3(3);
Param deg4(4);
Param deg5(0);
Param deg6(2);
Param oct1(-1);
Param oct2(0);
Param oct3(0);
Param oct4(1);
Param oct5(-1);
Param oct6(1);
Param glide(0.001);
Param reset(0);
Param arp_mode(0);
Param arp_rate(2);
Param arp_bpm(120);
Param arp_div(0);
Param inversion(0);
Param env_attack(0.005);
Param env_decay(0.05);
Param env_sustain(0.8);
Param env_release(0.1);
Param mute(0);
Param transpose(0);
Param arp_reset(0);
Param clk_enable(0);
Param user_pat_len(16);
Param us0(63); Param us1(0); Param us2(0); Param us3(0);
Param us4(63); Param us5(0); Param us6(0); Param us7(0);
Param us8(63); Param us9(0); Param us10(0); Param us11(0);
Param us12(63); Param us13(0); Param us14(0); Param us15(0);
Param brightness(0);
Param register(0);
Param bass_oct(0);
Param treble_oct(0);
Param smooth_speed(2);
Param sub_amt(0.5);
Param sub_drive(0.0);
Param sub_drone(1);
Param sub_oct(-1);
Param sub_chaos(0);
Param eucl_pulses(3);
Param eucl_steps(8);
Param att_sel(0);
Param att_b_sel(-1);
Param combine_mode(0);
Param blend_mix(0.5);
Param mod_depth(0.5);
Param root_offset(0);
Param root_mode(0);
Param root_return(0.5);
Param ross_c(5.7);
Param chua_alpha(15.6);
Param halv_a(1.89);
Param aiz_c(0.6);
Param aiz_d(3.5);
Data tuning_table(190);
Data arp_pat_data(240);
History init_done(0);
History s_sigma(10);
History s_rho(28);
History s_beta(2.667);
History s_dt(0.0012);
History s_cg(0.03);
History lx(0.1);
History ly(0);
History lz(0);
History r1_pd(0);
History r2_pd(0);
History r3_pd(0);
History r4_pd(0);
History r5_pd(0);
History r6_pd(0);
History r1_sdl(0);
History r2_sdl(0);
History r3_sdl(0);
History r4_sdl(0);
History r5_sdl(0);
History r6_sdl(0);
History arp_phase(0);
History arp_step(0);
History arp_dir(1);
History v_amp1(0);
History v_amp2(0);
History v_amp3(0);
History v_amp4(0);
History v_amp5(0);
History v_amp6(0);
History pk1(0);
History pk2(0);
History pk3(0);
History pk4(0);
History pk5(0);
History pk6(0);
History mute_s(0);
History r_sub_pd(0);
History r_sub_sdl(0);
History sub_env_h(0);
History rx(1); History ry(0); History rz(0);
History chx(0.1); History chy(0); History chz(0);
History hx(1); History hy(0); History hz(0);
History aix(0.1); History aiy(0); History aiz_h(0);
History bx_h(0); History by_h(0); History bz_h(0);
History s_root_off(0);
History clk_prev(0);
History clk_count(0);
History clk_bpm(120);
Delay r1_d(48000);
Delay r2_d(48000);
Delay r3_d(48000);
Delay r4_d(48000);
Delay r5_d(48000);
Delay r6_d(48000);
Delay r_sub(48000);

// === INIT (tuning tables + rhythm patterns, runs once) ===
if (init_done < 0.5) {
    // 0: Yoruba Pentatonic (Pythagorean base, flex at runtime)
    poke(tuning_table, 5, 0, 0);
    poke(tuning_table, 1.0, 1, 0);
    poke(tuning_table, 1.125, 2, 0);
    poke(tuning_table, 1.265625, 3, 0);
    poke(tuning_table, 1.5, 4, 0);
    poke(tuning_table, 1.6875, 5, 0);
    // 1: Dundun 3-Tone (0, 200, 400c)
    poke(tuning_table, 3, 10, 0);
    poke(tuning_table, 1.0, 11, 0);
    poke(tuning_table, 1.12246, 12, 0);
    poke(tuning_table, 1.25992, 13, 0);
    // 2: Balafon Equi-Pentatonic (0, 220, 460, 690, 930c)
    poke(tuning_table, 5, 20, 0);
    poke(tuning_table, 1.0, 21, 0);
    poke(tuning_table, 1.13534, 22, 0);
    poke(tuning_table, 1.30486, 23, 0);
    poke(tuning_table, 1.49180, 24, 0);
    poke(tuning_table, 1.71002, 25, 0);
    // 3: Equi-Heptatonic 7-TET
    poke(tuning_table, 7, 30, 0);
    poke(tuning_table, 1.0, 31, 0);
    poke(tuning_table, 1.10409, 32, 0);
    poke(tuning_table, 1.21901, 33, 0);
    poke(tuning_table, 1.34590, 34, 0);
    poke(tuning_table, 1.48599, 35, 0);
    poke(tuning_table, 1.64059, 36, 0);
    poke(tuning_table, 1.81145, 37, 0);
    // 4: BaAka/Pygmy 5-TET (0, 240, 480, 720, 960c)
    poke(tuning_table, 5, 40, 0);
    poke(tuning_table, 1.0, 41, 0);
    poke(tuning_table, 1.14870, 42, 0);
    poke(tuning_table, 1.31951, 43, 0);
    poke(tuning_table, 1.51572, 44, 0);
    poke(tuning_table, 1.74110, 45, 0);
    // 5: Shona Nyamaropa (0, 180, 380, 500, 700, 880, 1080c)
    poke(tuning_table, 7, 50, 0);
    poke(tuning_table, 1.0, 51, 0);
    poke(tuning_table, 1.10957, 52, 0);
    poke(tuning_table, 1.24574, 53, 0);
    poke(tuning_table, 1.33484, 54, 0);
    poke(tuning_table, 1.49831, 55, 0);
    poke(tuning_table, 1.65948, 56, 0);
    poke(tuning_table, 1.86121, 57, 0);
    // 6: Shona Gandanga (0, 100, 300, 500, 700, 800, 1000c)
    poke(tuning_table, 7, 60, 0);
    poke(tuning_table, 1.0, 61, 0);
    poke(tuning_table, 1.05946, 62, 0);
    poke(tuning_table, 1.18921, 63, 0);
    poke(tuning_table, 1.33484, 64, 0);
    poke(tuning_table, 1.49831, 65, 0);
    poke(tuning_table, 1.58740, 66, 0);
    poke(tuning_table, 1.78180, 67, 0);
    // 7: Kora Silaba (0, 200, 385, 500, 700, 900, 1085c)
    poke(tuning_table, 7, 70, 0);
    poke(tuning_table, 1.0, 71, 0);
    poke(tuning_table, 1.12246, 72, 0);
    poke(tuning_table, 1.24915, 73, 0);
    poke(tuning_table, 1.33484, 74, 0);
    poke(tuning_table, 1.49831, 75, 0);
    poke(tuning_table, 1.68179, 76, 0);
    poke(tuning_table, 1.86459, 77, 0);
    // 8: Kora Sauta (0, 185, 405, 605, 700, 885, 1105c)
    poke(tuning_table, 7, 80, 0);
    poke(tuning_table, 1.0, 81, 0);
    poke(tuning_table, 1.11278, 82, 0);
    poke(tuning_table, 1.26330, 83, 0);
    poke(tuning_table, 1.41747, 84, 0);
    poke(tuning_table, 1.49831, 85, 0);
    poke(tuning_table, 1.66230, 86, 0);
    poke(tuning_table, 1.88800, 87, 0);
    // 9: Ethiopian Tizita Major (0, 200, 400, 700, 900c)
    poke(tuning_table, 5, 90, 0);
    poke(tuning_table, 1.0, 91, 0);
    poke(tuning_table, 1.12246, 92, 0);
    poke(tuning_table, 1.25992, 93, 0);
    poke(tuning_table, 1.49831, 94, 0);
    poke(tuning_table, 1.68179, 95, 0);
    // 10: Ethiopian Tizita Minor (0, 200, 300, 700, 800c)
    poke(tuning_table, 5, 100, 0);
    poke(tuning_table, 1.0, 101, 0);
    poke(tuning_table, 1.12246, 102, 0);
    poke(tuning_table, 1.18921, 103, 0);
    poke(tuning_table, 1.49831, 104, 0);
    poke(tuning_table, 1.58740, 105, 0);
    // 11: Ethiopian Bati (0, 200, 500, 700, 900c)
    poke(tuning_table, 5, 110, 0);
    poke(tuning_table, 1.0, 111, 0);
    poke(tuning_table, 1.12246, 112, 0);
    poke(tuning_table, 1.33484, 113, 0);
    poke(tuning_table, 1.49831, 114, 0);
    poke(tuning_table, 1.68179, 115, 0);
    // 12: Ethiopian Ambassel (0, 200, 400, 700, 800c)
    poke(tuning_table, 5, 120, 0);
    poke(tuning_table, 1.0, 121, 0);
    poke(tuning_table, 1.12246, 122, 0);
    poke(tuning_table, 1.25992, 123, 0);
    poke(tuning_table, 1.49831, 124, 0);
    poke(tuning_table, 1.58740, 125, 0);
    // 13: Ethiopian Anchihoye (0, 100, 500, 600, 900c)
    poke(tuning_table, 5, 130, 0);
    poke(tuning_table, 1.0, 131, 0);
    poke(tuning_table, 1.05946, 132, 0);
    poke(tuning_table, 1.33484, 133, 0);
    poke(tuning_table, 1.41421, 134, 0);
    poke(tuning_table, 1.68179, 135, 0);
    // 14: Bugandan Amadinda (0, 240, 480, 720, 960c)
    poke(tuning_table, 5, 140, 0);
    poke(tuning_table, 1.0, 141, 0);
    poke(tuning_table, 1.14870, 142, 0);
    poke(tuning_table, 1.31951, 143, 0);
    poke(tuning_table, 1.51572, 144, 0);
    poke(tuning_table, 1.74110, 145, 0);
    // 15: Chopi Timbila (0, 175, 346, 519, 681, 854, 1025c)
    poke(tuning_table, 7, 150, 0);
    poke(tuning_table, 1.0, 151, 0);
    poke(tuning_table, 1.10653, 152, 0);
    poke(tuning_table, 1.22082, 153, 0);
    poke(tuning_table, 1.34890, 154, 0);
    poke(tuning_table, 1.48160, 155, 0);
    poke(tuning_table, 1.63720, 156, 0);
    poke(tuning_table, 1.80699, 157, 0);
    // 16: San Musical Bow (0, 200, 386, 498, 702, 884c)
    poke(tuning_table, 6, 160, 0);
    poke(tuning_table, 1.0, 161, 0);
    poke(tuning_table, 1.12246, 162, 0);
    poke(tuning_table, 1.24984, 163, 0);
    poke(tuning_table, 1.33322, 164, 0);
    poke(tuning_table, 1.50000, 165, 0);
    poke(tuning_table, 1.66212, 166, 0);
    // 17: Wagogo Ilimba — harmonics 4-9
    poke(tuning_table, 6, 170, 0);
    poke(tuning_table, 1.0, 171, 0);
    poke(tuning_table, 1.25, 172, 0);
    poke(tuning_table, 1.5, 173, 0);
    poke(tuning_table, 1.75, 174, 0);
    poke(tuning_table, 2.0, 175, 0);
    poke(tuning_table, 2.25, 176, 0);
    // 18: Igbo Pentatonic (0, 200, 386, 702, 884c)
    poke(tuning_table, 5, 180, 0);
    poke(tuning_table, 1.0, 181, 0);
    poke(tuning_table, 1.12246, 182, 0);
    poke(tuning_table, 1.24984, 183, 0);
    poke(tuning_table, 1.50000, 184, 0);
    poke(tuning_table, 1.66212, 185, 0);

    // === RHYTHM PATTERN DATA ===
    // Each pattern: [length, mask0, mask1, ...] at offset = patIdx * 16
    // Voice bitmask: v1=1, v2=2, v3=4, v4=8, v5=16, v6=32

    // Pattern 0 — Polyrhythm 3:2 (arp_mode 6, offset 0)
    poke(arp_pat_data, 6, 0, 0);
    poke(arp_pat_data, 63, 1, 0);
    poke(arp_pat_data, 0, 2, 0);
    poke(arp_pat_data, 21, 3, 0);
    poke(arp_pat_data, 42, 4, 0);
    poke(arp_pat_data, 21, 5, 0);
    poke(arp_pat_data, 0, 6, 0);

    // Pattern 1 — Triplet (arp_mode 7, offset 16)
    poke(arp_pat_data, 3, 16, 0);
    poke(arp_pat_data, 3, 17, 0);
    poke(arp_pat_data, 12, 18, 0);
    poke(arp_pat_data, 48, 19, 0);

    // Pattern 2 — Bembe 12/8 bell (arp_mode 8, offset 32)
    poke(arp_pat_data, 12, 32, 0);
    poke(arp_pat_data, 1, 33, 0);
    poke(arp_pat_data, 0, 34, 0);
    poke(arp_pat_data, 4, 35, 0);
    poke(arp_pat_data, 0, 36, 0);
    poke(arp_pat_data, 2, 37, 0);
    poke(arp_pat_data, 8, 38, 0);
    poke(arp_pat_data, 0, 39, 0);
    poke(arp_pat_data, 16, 40, 0);
    poke(arp_pat_data, 0, 41, 0);
    poke(arp_pat_data, 32, 42, 0);
    poke(arp_pat_data, 0, 43, 0);
    poke(arp_pat_data, 4, 44, 0);

    // Pattern 3 — Shiko (arp_mode 9, offset 48)
    poke(arp_pat_data, 12, 48, 0);
    poke(arp_pat_data, 17, 49, 0);
    poke(arp_pat_data, 0, 50, 0);
    poke(arp_pat_data, 0, 51, 0);
    poke(arp_pat_data, 8, 52, 0);
    poke(arp_pat_data, 0, 53, 0);
    poke(arp_pat_data, 0, 54, 0);
    poke(arp_pat_data, 6, 55, 0);
    poke(arp_pat_data, 0, 56, 0);
    poke(arp_pat_data, 0, 57, 0);
    poke(arp_pat_data, 0, 58, 0);
    poke(arp_pat_data, 32, 59, 0);
    poke(arp_pat_data, 0, 60, 0);

    // Pattern 4 — Call & Response (arp_mode 10, offset 64)
    poke(arp_pat_data, 8, 64, 0);
    poke(arp_pat_data, 19, 65, 0);
    poke(arp_pat_data, 19, 66, 0);
    poke(arp_pat_data, 0, 67, 0);
    poke(arp_pat_data, 0, 68, 0);
    poke(arp_pat_data, 44, 69, 0);
    poke(arp_pat_data, 44, 70, 0);
    poke(arp_pat_data, 0, 71, 0);
    poke(arp_pat_data, 0, 72, 0);

    // Pattern 5 — Gahu (arp_mode 11, offset 80, length 15)
    // Ewe social dance bell: x..x..x.x..x..x (15 steps)
    poke(arp_pat_data, 15, 80, 0);
    poke(arp_pat_data, 17, 81, 0);   // step 0: v1+v5 bass+metallic
    poke(arp_pat_data, 0, 82, 0);
    poke(arp_pat_data, 0, 83, 0);
    poke(arp_pat_data, 4, 84, 0);    // step 3: v3 mid
    poke(arp_pat_data, 0, 85, 0);
    poke(arp_pat_data, 0, 86, 0);
    poke(arp_pat_data, 10, 87, 0);   // step 6: v2+v4 low-mid+mid-high
    poke(arp_pat_data, 0, 88, 0);
    poke(arp_pat_data, 32, 89, 0);   // step 8: v6 crystal
    poke(arp_pat_data, 0, 90, 0);
    poke(arp_pat_data, 0, 91, 0);
    poke(arp_pat_data, 5, 92, 0);    // step 11: v1+v3 bass+mid
    poke(arp_pat_data, 0, 93, 0);
    poke(arp_pat_data, 0, 94, 0);
    poke(arp_pat_data, 48, 95, 0);   // step 14: v5+v6 metallic+crystal

    // Pattern 6 — Son Clave 3:2 (arp_mode 12, offset 96, length 15)
    // Foundational Afro-Cuban rhythm: x..x..x...x.x.. (15 steps)
    poke(arp_pat_data, 15, 96, 0);
    poke(arp_pat_data, 19, 97, 0);   // step 0: v1+v2+v5 low body
    poke(arp_pat_data, 0, 98, 0);
    poke(arp_pat_data, 0, 99, 0);
    poke(arp_pat_data, 12, 100, 0);  // step 3: v3+v4 mid crack
    poke(arp_pat_data, 0, 101, 0);
    poke(arp_pat_data, 0, 102, 0);
    poke(arp_pat_data, 32, 103, 0);  // step 6: v6 crystal
    poke(arp_pat_data, 0, 104, 0);
    poke(arp_pat_data, 0, 105, 0);
    poke(arp_pat_data, 0, 106, 0);
    poke(arp_pat_data, 5, 107, 0);   // step 10: v1+v3 bass+mid
    poke(arp_pat_data, 0, 108, 0);
    poke(arp_pat_data, 42, 109, 0);  // step 12: v2+v4+v6 full spread
    poke(arp_pat_data, 0, 110, 0);
    poke(arp_pat_data, 0, 111, 0);

    // Pattern 7 — Fume Fume (arp_mode 13, offset 112, length 12)
    // Ewe ceremonial bell: x.x..x.x..x. (12 steps)
    poke(arp_pat_data, 12, 112, 0);
    poke(arp_pat_data, 3, 113, 0);   // step 0: v1+v2 bass pair
    poke(arp_pat_data, 0, 114, 0);
    poke(arp_pat_data, 24, 115, 0);  // step 2: v4+v5 mid-high pair
    poke(arp_pat_data, 0, 116, 0);
    poke(arp_pat_data, 0, 117, 0);
    poke(arp_pat_data, 36, 118, 0);  // step 5: v3+v6 mid+crystal
    poke(arp_pat_data, 0, 119, 0);
    poke(arp_pat_data, 17, 120, 0);  // step 7: v1+v5 bass+metallic
    poke(arp_pat_data, 0, 121, 0);
    poke(arp_pat_data, 0, 122, 0);
    poke(arp_pat_data, 14, 123, 0);  // step 10: v2+v3+v4 mid spread
    poke(arp_pat_data, 0, 124, 0);

    // Pattern 8 — Kassa (arp_mode 14, offset 128, length 12)
    // Manding harvest dance: xx.x.xx.x.x. (12 steps) — dense, energetic
    poke(arp_pat_data, 12, 128, 0);
    poke(arp_pat_data, 17, 129, 0);  // step 0: v1+v5 bass+metallic
    poke(arp_pat_data, 4, 130, 0);   // step 1: v3 mid
    poke(arp_pat_data, 0, 131, 0);
    poke(arp_pat_data, 34, 132, 0);  // step 3: v2+v6 low-mid+crystal
    poke(arp_pat_data, 0, 133, 0);
    poke(arp_pat_data, 8, 134, 0);   // step 5: v4 mid-high
    poke(arp_pat_data, 5, 135, 0);   // step 6: v1+v3 bass+mid
    poke(arp_pat_data, 0, 136, 0);
    poke(arp_pat_data, 48, 137, 0);  // step 8: v5+v6 metallic+crystal
    poke(arp_pat_data, 0, 138, 0);
    poke(arp_pat_data, 10, 139, 0);  // step 10: v2+v4 low-mid+mid-high
    poke(arp_pat_data, 0, 140, 0);

    // === LUSOPHONE / DIASPORA PATTERNS ===

    // Pattern 9 — Kuduro (arp_mode 15, offset 144, length 15)
    // Angolan: heavy kick pattern, syncopated. x..x..x.x..x..x at 140 BPM
    poke(arp_pat_data, 15, 144, 0);
    poke(arp_pat_data, 3, 145, 0);   // step 0: v1+v2 bass+body (kick)
    poke(arp_pat_data, 0, 146, 0);
    poke(arp_pat_data, 0, 147, 0);
    poke(arp_pat_data, 3, 148, 0);   // step 3: kick
    poke(arp_pat_data, 0, 149, 0);
    poke(arp_pat_data, 0, 150, 0);
    poke(arp_pat_data, 12, 151, 0);  // step 6: v3+v4 mid+transient (snare)
    poke(arp_pat_data, 3, 152, 0);   // step 7: kick (syncopation)
    poke(arp_pat_data, 0, 153, 0);
    poke(arp_pat_data, 0, 154, 0);
    poke(arp_pat_data, 3, 155, 0);   // step 10: kick
    poke(arp_pat_data, 0, 156, 0);
    poke(arp_pat_data, 0, 157, 0);
    poke(arp_pat_data, 12, 158, 0);  // step 13: snare
    poke(arp_pat_data, 3, 159, 0);   // step 14: kick (syncopation)

    // Pattern 10 — Semba (arp_mode 16, offset 160, length 15)
    // Angolan: flowing, 2-bar feel, bass-heavy with clave accent
    poke(arp_pat_data, 15, 160, 0);
    poke(arp_pat_data, 1, 161, 0);   // step 0: v1 bass
    poke(arp_pat_data, 0, 162, 0);
    poke(arp_pat_data, 0, 163, 0);
    poke(arp_pat_data, 6, 164, 0);   // step 3: v2+v3 body+metallic
    poke(arp_pat_data, 0, 165, 0);
    poke(arp_pat_data, 1, 166, 0);   // step 5: v1 bass
    poke(arp_pat_data, 0, 167, 0);
    poke(arp_pat_data, 48, 168, 0);  // step 7: v5+v6 shimmer
    poke(arp_pat_data, 1, 169, 0);   // step 8: v1 bass
    poke(arp_pat_data, 0, 170, 0);
    poke(arp_pat_data, 8, 171, 0);   // step 10: v4 transient
    poke(arp_pat_data, 0, 172, 0);
    poke(arp_pat_data, 6, 173, 0);   // step 12: v2+v3 body+metallic
    poke(arp_pat_data, 0, 174, 0);
    poke(arp_pat_data, 1, 175, 0);   // step 14: v1 bass

    // Pattern 11 — Kizomba (arp_mode 17, offset 176, length 8)
    // Angolan slow: intimate bass pulse, minimal percussion. 90 BPM.
    poke(arp_pat_data, 8, 176, 0);
    poke(arp_pat_data, 3, 177, 0);   // step 0: v1+v2 bass+body
    poke(arp_pat_data, 0, 178, 0);
    poke(arp_pat_data, 48, 179, 0);  // step 2: v5+v6 shimmer
    poke(arp_pat_data, 0, 180, 0);
    poke(arp_pat_data, 3, 181, 0);   // step 4: bass+body
    poke(arp_pat_data, 0, 182, 0);
    poke(arp_pat_data, 4, 183, 0);   // step 6: v3 metallic
    poke(arp_pat_data, 0, 184, 0);

    // Pattern 12 — Marrabenta (arp_mode 18, offset 192, length 12)
    // Mozambican: 12/8 guitar-derived, bright and driving
    poke(arp_pat_data, 12, 192, 0);
    poke(arp_pat_data, 5, 193, 0);   // step 0: v1+v3 bass+metallic
    poke(arp_pat_data, 0, 194, 0);
    poke(arp_pat_data, 32, 195, 0);  // step 2: v6 crystal
    poke(arp_pat_data, 2, 196, 0);   // step 3: v2 body
    poke(arp_pat_data, 0, 197, 0);
    poke(arp_pat_data, 16, 198, 0);  // step 5: v5 drone
    poke(arp_pat_data, 5, 199, 0);   // step 6: v1+v3 bass+metallic
    poke(arp_pat_data, 0, 200, 0);
    poke(arp_pat_data, 8, 201, 0);   // step 8: v4 transient
    poke(arp_pat_data, 2, 202, 0);   // step 9: v2 body
    poke(arp_pat_data, 0, 203, 0);
    poke(arp_pat_data, 48, 204, 0);  // step 11: v5+v6 shimmer

    init_done = 1;
}

// === TUNING SETUP ===
ts = clamp(floor(tuning_system), 0, 18);
ts_base = ts * 10;
ts_size = max(peek(tuning_table, ts_base, 0), 1);
j0 = 1.0; j1 = 1.111111; j2 = 1.25; j3 = 1.5; j4 = 1.666667;

// === INVERSION (-2 to +2) ===
inv_off = floor(clamp(inversion, -2, 2));
inv_up = (inv_off > 0.5) ? inv_off : 0;
inv_dn = (inv_off < -0.5) ? inv_off : 0;
reg = floor(clamp(register, -3, 3));
boct = floor(clamp(bass_oct, -2, 2));
toct = floor(clamp(treble_oct, 0, 4));

// === LORENZ PARAM SMOOTHING ===
// 0=off (instant), 1=slow (~500ms), 2=medium (~50ms), 3=fast (~5ms)
sm = floor(clamp(smooth_speed, 0, 3));
sm_coeff = (sm < 0.5) ? 1.0 : (sm < 1.5) ? (1.0 - exp(-1.0 / (0.5 * samplerate))) : (sm < 2.5) ? (1.0 - exp(-1.0 / (0.05 * samplerate))) : (1.0 - exp(-1.0 / (0.005 * samplerate)));
s_sigma = s_sigma + (sigma - s_sigma) * sm_coeff;
s_rho = s_rho + (rho - s_rho) * sm_coeff;
s_beta = s_beta + (beta - s_beta) * sm_coeff;
s_dt = s_dt + (lorenz_dt - s_dt) * sm_coeff;
s_cg = s_cg + (chaos_gain - s_cg) * sm_coeff;

// === CHAOS ATTRACTOR SYSTEM ===

// --- LORENZ (4x unrolled Euler) ---
rho_mod = s_rho + in1;
tx = lx; ty = ly; tz = lz;
dx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;
tx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;
dx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;
tx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;
dx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;
tx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;
dx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;
tx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;
lx = (reset > 0.5) ? 0.1 : clamp(tx, -100, 100) + noise() * 0.01;
ly = (reset > 0.5) ? 0.0 : clamp(ty, -100, 100) + noise() * 0.01;
lz = (reset > 0.5) ? 0.0 : clamp(tz, -100, 100) + noise() * 0.01;
lor_x = lx * 0.05; lor_y = ly * 0.04; lor_z = (lz - 25) * 0.04;

// --- ROSSLER (4x unrolled Euler) ---
dt_r = 0.006;
rtx = rx; rty = ry; rtz = rz;
rdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);
rtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;
rdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);
rtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;
rdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);
rtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;
rdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);
rtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;
rx = (reset > 0.5) ? 1.0 : clamp(rtx, -100, 100) + noise() * 0.01;
ry = (reset > 0.5) ? 0.0 : clamp(rty, -100, 100) + noise() * 0.01;
rz = (reset > 0.5) ? 0.0 : clamp(rtz, -100, 100) + noise() * 0.01;
ros_x = rx * 0.08; ros_y = ry * 0.08; ros_z = (rz - 12) * 0.08;

// --- CHUA (4x unrolled Euler) ---
dt_c = 0.0012;
ctx = chx; cty = chy; ctz = chz;
ch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));
cdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;
ctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;
ch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));
cdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;
ctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;
ch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));
cdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;
ctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;
ch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));
cdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;
ctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;
chx = (reset > 0.5) ? 0.1 : clamp(ctx, -10, 10) + noise() * 0.001;
chy = (reset > 0.5) ? 0.0 : clamp(cty, -3, 3) + noise() * 0.001;
chz = (reset > 0.5) ? 0.0 : clamp(ctz, -20, 20) + noise() * 0.001;
chu_x = chx * 0.25; chu_y = chy * 0.8; chu_z = chz * 0.1;

// --- HALVORSEN (4x unrolled Euler) ---
dt_h = 0.005;
htx = hx; hty = hy; htz = hz;
hdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;
hdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;
hdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;
htx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;
hdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;
hdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;
hdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;
htx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;
hdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;
hdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;
hdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;
htx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;
hdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;
hdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;
hdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;
htx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;
hx = (reset > 0.5) ? 1.0 : clamp(htx, -20, 20) + noise() * 0.01;
hy = (reset > 0.5) ? 0.0 : clamp(hty, -20, 20) + noise() * 0.01;
hz = (reset > 0.5) ? 0.0 : clamp(htz, -20, 20) + noise() * 0.01;
hal_x = hx * 0.1; hal_y = hy * 0.1; hal_z = hz * 0.1;

// --- AIZAWA (4x unrolled Euler) ---
dt_a = 0.006;
atx = aix; aty = aiy; atz = aiz_h;
adx = (atz - 0.7) * atx - 3.5 * aty;
ady = 3.5 * atx + (atz - 0.7) * aty;
ar2 = atx*atx + aty*aty;
adz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;
atx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;
adx = (atz - 0.7) * atx - 3.5 * aty;
ady = 3.5 * atx + (atz - 0.7) * aty;
ar2 = atx*atx + aty*aty;
adz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;
atx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;
adx = (atz - 0.7) * atx - 3.5 * aty;
ady = 3.5 * atx + (atz - 0.7) * aty;
ar2 = atx*atx + aty*aty;
adz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;
atx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;
adx = (atz - 0.7) * atx - 3.5 * aty;
ady = 3.5 * atx + (atz - 0.7) * aty;
ar2 = atx*atx + aty*aty;
adz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;
atx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;
aix = (reset > 0.5) ? 0.1 : clamp(atx, -3, 3) + noise() * 0.001;
aiy = (reset > 0.5) ? 0.0 : clamp(aty, -3, 3) + noise() * 0.001;
aiz_h = (reset > 0.5) ? 0.0 : clamp(atz, -3, 3) + noise() * 0.001;
aiz_x = aix * 0.7; aiz_y = aiy * 0.7; aiz_z = (aiz_h - 0.5) * 1.0;

// --- SELECT ATTRACTOR A ---
as = floor(clamp(att_sel, 0, 4));
ax = (as < 0.5) ? lor_x : (as < 1.5) ? ros_x : (as < 2.5) ? chu_x : (as < 3.5) ? hal_x : aiz_x;
ay = (as < 0.5) ? lor_y : (as < 1.5) ? ros_y : (as < 2.5) ? chu_y : (as < 3.5) ? hal_y : aiz_y;
az = (as < 0.5) ? lor_z : (as < 1.5) ? ros_z : (as < 2.5) ? chu_z : (as < 3.5) ? hal_z : aiz_z;

// --- SELECT ATTRACTOR B ---
bs = floor(clamp(att_b_sel, -1, 4));
b_active = (bs > -0.5);
bx_raw = (bs < 0.5) ? lor_x : (bs < 1.5) ? ros_x : (bs < 2.5) ? chu_x : (bs < 3.5) ? hal_x : aiz_x;
by_raw = (bs < 0.5) ? lor_y : (bs < 1.5) ? ros_y : (bs < 2.5) ? chu_y : (bs < 3.5) ? hal_y : aiz_y;
bz_raw = (bs < 0.5) ? lor_z : (bs < 1.5) ? ros_z : (bs < 2.5) ? chu_z : (bs < 3.5) ? hal_z : aiz_z;

// --- COMBINING MODES ---
cm = floor(clamp(combine_mode, 0, 2));

// Mode 0: BLEND — linear crossfade
bl_x = ax * (1.0 - blend_mix) + bx_raw * blend_mix;
bl_y = ay * (1.0 - blend_mix) + by_raw * blend_mix;
bl_z = az * (1.0 - blend_mix) + bz_raw * blend_mix;

// Mode 1: MODULATE — B modulates A amplitude (one-sample delay)
md_x = ax * (1.0 + bx_h * mod_depth);
md_y = ay * (1.0 + by_h * mod_depth);
md_z = az * (1.0 + bz_h * mod_depth);
bx_h = bx_raw; by_h = by_raw; bz_h = bz_raw;

// Mode 2: ROUTE — A drives voices 1-3, B drives voices 4-6 (handled at excitation)

// Final combined output for voices 1-3
cx = b_active ? ((cm < 0.5) ? bl_x : (cm < 1.5) ? md_x : ax) : ax;
cy = b_active ? ((cm < 0.5) ? bl_y : (cm < 1.5) ? md_y : ay) : ay;
cz = b_active ? ((cm < 0.5) ? bl_z : (cm < 1.5) ? md_z : az) : az;

// Route mode: separate chaos for voices 4-6
cx_456 = (b_active * (cm > 1.5)) ? bx_raw : cx;
cy_456 = (b_active * (cm > 1.5)) ? by_raw : cy;
cz_456 = (b_active * (cm > 1.5)) ? bz_raw : cz;

// === ANALOG CLOCK INPUT (rising edge → BPM) ===
clk_in = in2;
clk_edge = (clk_in > 0.5) * (clk_prev < 0.5) * (clk_enable > 0.5);
clk_prev = clk_in;
clk_count = clk_edge ? 0 : clk_count + 1;
clk_hz = clk_edge ? (samplerate / max(clk_count, 1)) : 0;
clk_bpm = clk_edge ? clamp(clk_hz * 60.0, 20, 300) : clk_bpm;
eff_arp_bpm = (clk_enable > 0.5) ? clk_bpm : arp_bpm;

// === ARPEGGIATOR (BPM sync + patterns + MIDI reset) ===
eff_rate = (arp_div > 0.01) ? (eff_arp_bpm / 60.0 * arp_div) : arp_rate;
arp_ph_new = arp_phase + eff_rate / samplerate;
arp_trig_flag = (arp_ph_new >= 1.0);
arp_phase = arp_ph_new - floor(arp_ph_new);

// Pattern detection
is_user_pat = (arp_mode > 19.5);
is_eucl = ((arp_mode > 18.5) * (arp_mode < 19.5));
is_pattern = (arp_mode > 5.5);
pat_idx = clamp(floor(arp_mode - 6), 0, 12);
pat_base = pat_idx * 16;
e_steps = clamp(floor(eucl_steps), 1, 16);
pat_len = is_user_pat ? max(user_pat_len, 1) : (is_eucl ? e_steps : (is_pattern ? max(peek(arp_pat_data, pat_base, 0), 1) : 6));

// Standard mode stepping
up_s = mod(arp_step + 1, 6);
dn_s = mod(arp_step + 5, 6);
pp_next = arp_step + arp_dir;
pp_rev_hi = (pp_next > 5);
pp_rev_lo = (pp_next < 0);
pp_new_dir = pp_rev_hi ? -1 : (pp_rev_lo ? 1 : arp_dir);
pp_s = pp_rev_hi ? 4 : (pp_rev_lo ? 1 : clamp(pp_next, 0, 5));
rnd_s = clamp(floor(abs(noise()) * 6), 0, 5);
std_new_s = (arp_mode > 3.5) ? rnd_s : (arp_mode > 2.5) ? pp_s : (arp_mode > 1.5) ? dn_s : (arp_mode > 0.5) ? up_s : arp_step;

// Pattern mode: sequential stepping, wraps at pat_len
pat_next_s = mod(arp_step + 1, pat_len);

// Select step
new_s = is_pattern ? pat_next_s : std_new_s;
new_d = ((arp_mode > 2.5) * (arp_mode < 3.5)) ? pp_new_dir : arp_dir;
arp_step = arp_trig_flag ? new_s : arp_step;
arp_dir = arp_trig_flag ? new_d : arp_dir;

// Phase reset (MIDI sync — snaps pattern to downbeat)
arp_step = (arp_reset > 0.5) ? 0 : arp_step;
arp_phase = (arp_reset > 0.5) ? 0 : arp_phase;

cur = floor(arp_step);

// Standard voice activation (modes 0-5)
arp_active = ((arp_mode > 0.5) * (arp_mode < 4.5));
st1 = arp_active ? (abs(cur) < 0.5 ? 1.0 : 0.0) : 1.0;
st2 = arp_active ? (abs(cur - 1) < 0.5 ? 1.0 : 0.0) : 1.0;
st3 = arp_active ? (abs(cur - 2) < 0.5 ? 1.0 : 0.0) : 1.0;
st4 = arp_active ? (abs(cur - 3) < 0.5 ? 1.0 : 0.0) : 1.0;
st5 = arp_active ? (abs(cur - 4) < 0.5 ? 1.0 : 0.0) : 1.0;
st6 = arp_active ? (abs(cur - 5) < 0.5 ? 1.0 : 0.0) : 1.0;

// Euclidean rhythm (Bjorklund algorithm inline — threshold method)
// A step fires if floor(k * (step+1) / n) > floor(k * step / n)
e_pulses = clamp(floor(eucl_pulses), 0, e_steps);
e_cur = clamp(cur, 0, e_steps - 1);
e_hit = (floor(e_pulses * (e_cur + 1.0) / e_steps) - floor(e_pulses * e_cur / e_steps)) > 0.5;
eucl_mask = e_hit ? 63 : 0;

// Pattern voice activation (bitmask decode)
ucur = clamp(cur, 0, 15);
user_mask = (ucur<0.5)?us0:(ucur<1.5)?us1:(ucur<2.5)?us2:(ucur<3.5)?us3:(ucur<4.5)?us4:(ucur<5.5)?us5:(ucur<6.5)?us6:(ucur<7.5)?us7:(ucur<8.5)?us8:(ucur<9.5)?us9:(ucur<10.5)?us10:(ucur<11.5)?us11:(ucur<12.5)?us12:(ucur<13.5)?us13:(ucur<14.5)?us14:us15;
mask = is_user_pat ? user_mask : (is_eucl ? eucl_mask : peek(arp_pat_data, pat_base + 1 + clamp(cur, 0, 15), 0));
m = floor(mask);
pt1 = mod(m, 2) > 0.5;
pt2 = mod(floor(m / 2), 2) > 0.5;
pt3 = mod(floor(m / 4), 2) > 0.5;
pt4 = mod(floor(m / 8), 2) > 0.5;
pt5 = mod(floor(m / 16), 2) > 0.5;
pt6 = mod(floor(m / 32), 2) > 0.5;

// Select voice activation path
t1 = is_pattern ? pt1 : st1;
t2 = is_pattern ? pt2 : st2;
t3 = is_pattern ? pt3 : st3;
t4 = is_pattern ? pt4 : st4;
t5 = is_pattern ? pt5 : st5;
t6 = is_pattern ? pt6 : st6;

// === ADSR ENVELOPE ===
a_rate = 1.0 / max(env_attack * samplerate, 1);
d_coeff = 1.0 - exp(-4.0 / max(env_decay * samplerate, 1));
r_coeff = 1.0 - exp(-4.0 / max(env_release * samplerate, 1));

gate1 = t1 > 0.5;
atk_ph1 = gate1 * (1.0 - pk1);
pk1 = gate1 ? min(pk1 + (v_amp1 >= 0.999), 1.0) : 0.0;
v_amp1 = atk_ph1 ? min(v_amp1 + a_rate, 1.0) : (gate1 ? (v_amp1 + (env_sustain - v_amp1) * d_coeff) : (v_amp1 + (0.0 - v_amp1) * r_coeff));

gate2 = t2 > 0.5;
atk_ph2 = gate2 * (1.0 - pk2);
pk2 = gate2 ? min(pk2 + (v_amp2 >= 0.999), 1.0) : 0.0;
v_amp2 = atk_ph2 ? min(v_amp2 + a_rate, 1.0) : (gate2 ? (v_amp2 + (env_sustain - v_amp2) * d_coeff) : (v_amp2 + (0.0 - v_amp2) * r_coeff));

gate3 = t3 > 0.5;
atk_ph3 = gate3 * (1.0 - pk3);
pk3 = gate3 ? min(pk3 + (v_amp3 >= 0.999), 1.0) : 0.0;
v_amp3 = atk_ph3 ? min(v_amp3 + a_rate, 1.0) : (gate3 ? (v_amp3 + (env_sustain - v_amp3) * d_coeff) : (v_amp3 + (0.0 - v_amp3) * r_coeff));

gate4 = t4 > 0.5;
atk_ph4 = gate4 * (1.0 - pk4);
pk4 = gate4 ? min(pk4 + (v_amp4 >= 0.999), 1.0) : 0.0;
v_amp4 = atk_ph4 ? min(v_amp4 + a_rate, 1.0) : (gate4 ? (v_amp4 + (env_sustain - v_amp4) * d_coeff) : (v_amp4 + (0.0 - v_amp4) * r_coeff));

gate5 = t5 > 0.5;
atk_ph5 = gate5 * (1.0 - pk5);
pk5 = gate5 ? min(pk5 + (v_amp5 >= 0.999), 1.0) : 0.0;
v_amp5 = atk_ph5 ? min(v_amp5 + a_rate, 1.0) : (gate5 ? (v_amp5 + (env_sustain - v_amp5) * d_coeff) : (v_amp5 + (0.0 - v_amp5) * r_coeff));

gate6 = t6 > 0.5;
atk_ph6 = gate6 * (1.0 - pk6);
pk6 = gate6 ? min(pk6 + (v_amp6 >= 0.999), 1.0) : 0.0;
v_amp6 = atk_ph6 ? min(v_amp6 + a_rate, 1.0) : (gate6 ? (v_amp6 + (env_sustain - v_amp6) * d_coeff) : (v_amp6 + (0.0 - v_amp6) * r_coeff));

// === MUTE (click-free ~5ms fade) ===
mute_coeff = 1.0 - exp(-1.0 / (0.005 * samplerate));
mute_s = mute_s + (mute - mute_s) * mute_coeff;
unmute = 1.0 - mute_s;

// === ROOT SPRING / LATCH SYSTEM ===
spring_target = (root_mode > 0.5) ? root_offset : 0.0;
track_c = 1.0 - exp(-1.0 / (0.01 * samplerate));
spring_c = 1.0 - exp(-1.0 / max(root_return * samplerate, 1));
moving_away = abs(root_offset - spring_target) > abs(s_root_off - spring_target);
rcoeff = moving_away ? track_c : spring_c;
s_root_off = s_root_off + (root_offset - s_root_off) * rcoeff;
eff_root = root * pow(2.0, s_root_off / 12.0);

// === Voice 1: Sub Bass (iya ilu) ===
inv_adj1 = (oct1 < -0.5) * inv_up + (oct1 > 0.5) * inv_dn;
eff_oct1 = oct1 + inv_adj1 + reg + (oct1 < -0.5) * boct + (oct1 > 0.5) * toct;
deg1_eff = deg1 + transpose;
deg1_w = mod(floor(deg1_eff) + ts_size * 20, ts_size);
oct1_x = floor(deg1_eff / ts_size);
r1_rat = peek(tuning_table, ts_base + 1 + deg1_w, 0);
r1_jrat = (deg1_w<0.5)?j0:(deg1_w<1.5)?j1:(deg1_w<2.5)?j2:(deg1_w<3.5)?j3:j4;
r1_rat = (ts < 0.5) ? (r1_rat * (1.0-flex) + r1_jrat * flex) : r1_rat;
r1_freq = eff_root * r1_rat * pow(2.0, eff_oct1 + oct1_x);
r1_target = samplerate / max(r1_freq, 20);
r1_sdl = (r1_sdl < 1) ? r1_target : r1_sdl + (r1_target - r1_sdl) * glide;
exc1 = cx * s_cg * v_amp1 * unmute;
r1_del = r1_d.read(r1_sdl);
r1_avg = (r1_del + r1_pd) * 0.5;
r1_pd = r1_del;
r1_b = clamp(0.2 + brightness, 0, 1);
r1_filt = r1_del * r1_b + r1_avg * (1.0 - r1_b);
r1_out = tanh(r1_filt) * 0.9995;
r1_d.write(exc1 + r1_out);

// === SUB-BASS WAVEGUIDE (tracks voice 1 at -1 octave) ===
// sub_drone=1: always resonates (gqom/dance bass bed)
// sub_drone=0: follows voice 1 with 50ms attack / 2s release (pattern pulse)
sub_tgt = (sub_drone > 0.5) ? 1.0 : v_amp1;
sub_up = (sub_tgt > sub_env_h);
sub_coeff = sub_up ? (1.0 - exp(-1.0 / (0.05 * samplerate))) : (1.0 - exp(-1.0 / (2.0 * samplerate)));
sub_env_h = sub_env_h + (sub_tgt - sub_env_h) * sub_coeff;
sub_freq = r1_freq * pow(2.0, sub_oct);
sub_target = samplerate / max(sub_freq, 15);
r_sub_sdl = (r_sub_sdl < 1) ? sub_target : r_sub_sdl + (sub_target - r_sub_sdl) * glide;
// sub_chaos: 0=normal (voice1 excitation), 1=direct chaos (dirtier, for gqom)
exc_sub_clean = cx * s_cg * sub_env_h * unmute * 1.5;
exc_sub_chaos = (cx * cx + cy * cy + cz * cz) * s_cg * sub_env_h * unmute * 3.0;
exc_sub = exc_sub_clean * (1.0 - sub_chaos) + exc_sub_chaos * sub_chaos;
sub_del = r_sub.read(r_sub_sdl);
sub_avg = (sub_del + r_sub_pd) * 0.5;
r_sub_pd = sub_del;
sub_filt = sub_del * 0.1 + sub_avg * 0.9;
sub_out = tanh(sub_filt) * 0.99995;
r_sub.write(exc_sub + sub_out);

// === Voice 2: Body (omele) ===
inv_adj2 = (oct2 < -0.5) * inv_up + (oct2 > 0.5) * inv_dn;
eff_oct2 = oct2 + inv_adj2 + reg + (oct2 < -0.5) * boct + (oct2 > 0.5) * toct;
deg2_eff = deg2 + transpose;
deg2_w = mod(floor(deg2_eff) + ts_size * 20, ts_size);
oct2_x = floor(deg2_eff / ts_size);
r2_rat = peek(tuning_table, ts_base + 1 + deg2_w, 0);
r2_jrat = (deg2_w<0.5)?j0:(deg2_w<1.5)?j1:(deg2_w<2.5)?j2:(deg2_w<3.5)?j3:j4;
r2_rat = (ts < 0.5) ? (r2_rat * (1.0-flex) + r2_jrat * flex) : r2_rat;
r2_freq = eff_root * r2_rat * pow(2.0, eff_oct2 + oct2_x);
r2_target = samplerate / max(r2_freq, 20);
r2_sdl = (r2_sdl < 1) ? r2_target : r2_sdl + (r2_target - r2_sdl) * glide;
exc2 = cy * s_cg * v_amp2 * unmute;
r2_del = r2_d.read(r2_sdl);
r2_avg = (r2_del + r2_pd) * 0.5;
r2_pd = r2_del;
r2_b = clamp(0.4 + brightness, 0, 1);
r2_filt = r2_del * r2_b + r2_avg * (1.0 - r2_b);
r2_out = tanh(r2_filt) * 0.998;
r2_d.write(exc2 + r2_out);

// === Voice 3: Metallic (ogene) ===
inv_adj3 = (oct3 < -0.5) * inv_up + (oct3 > 0.5) * inv_dn;
eff_oct3 = oct3 + inv_adj3 + reg + (oct3 < -0.5) * boct + (oct3 > 0.5) * toct;
deg3_eff = deg3 + transpose;
deg3_w = mod(floor(deg3_eff) + ts_size * 20, ts_size);
oct3_x = floor(deg3_eff / ts_size);
r3_rat = peek(tuning_table, ts_base + 1 + deg3_w, 0);
r3_jrat = (deg3_w<0.5)?j0:(deg3_w<1.5)?j1:(deg3_w<2.5)?j2:(deg3_w<3.5)?j3:j4;
r3_rat = (ts < 0.5) ? (r3_rat * (1.0-flex) + r3_jrat * flex) : r3_rat;
r3_freq = eff_root * r3_rat * pow(2.0, eff_oct3 + oct3_x);
r3_target = samplerate / max(r3_freq, 20);
r3_sdl = (r3_sdl < 1) ? r3_target : r3_sdl + (r3_target - r3_sdl) * glide;
exc3 = cz * s_cg * v_amp3 * unmute;
r3_del = r3_d.read(r3_sdl);
r3_avg = (r3_del + r3_pd) * 0.5;
r3_pd = r3_del;
r3_b = clamp(0.85 + brightness, 0, 1);
r3_filt = r3_del * r3_b + r3_avg * (1.0 - r3_b);
r3_out = tanh(r3_filt) * 0.996;
r3_d.write(exc3 + r3_out);

// === Voice 4: Transient (gudugudu) ===
inv_adj4 = (oct4 < -0.5) * inv_up + (oct4 > 0.5) * inv_dn;
eff_oct4 = oct4 + inv_adj4 + reg + (oct4 < -0.5) * boct + (oct4 > 0.5) * toct;
deg4_eff = deg4 + transpose;
deg4_w = mod(floor(deg4_eff) + ts_size * 20, ts_size);
oct4_x = floor(deg4_eff / ts_size);
r4_rat = peek(tuning_table, ts_base + 1 + deg4_w, 0);
r4_jrat = (deg4_w<0.5)?j0:(deg4_w<1.5)?j1:(deg4_w<2.5)?j2:(deg4_w<3.5)?j3:j4;
r4_rat = (ts < 0.5) ? (r4_rat * (1.0-flex) + r4_jrat * flex) : r4_rat;
r4_freq = eff_root * r4_rat * pow(2.0, eff_oct4 + oct4_x);
r4_target = samplerate / max(r4_freq, 20);
r4_sdl = (r4_sdl < 1) ? r4_target : r4_sdl + (r4_target - r4_sdl) * glide;
exc4 = cx_456 * s_cg * v_amp4 * unmute;
r4_del = r4_d.read(r4_sdl);
r4_avg = (r4_del + r4_pd) * 0.5;
r4_pd = r4_del;
r4_b = clamp(0.9 + brightness, 0, 1);
r4_filt = r4_del * r4_b + r4_avg * (1.0 - r4_b);
r4_out = tanh(r4_filt) * 0.97;
r4_d.write(exc4 + r4_out);

// === Voice 5: Drone ===
inv_adj5 = (oct5 < -0.5) * inv_up + (oct5 > 0.5) * inv_dn;
eff_oct5 = oct5 + inv_adj5 + reg + (oct5 < -0.5) * boct + (oct5 > 0.5) * toct;
deg5_eff = deg5 + transpose;
deg5_w = mod(floor(deg5_eff) + ts_size * 20, ts_size);
oct5_x = floor(deg5_eff / ts_size);
r5_rat = peek(tuning_table, ts_base + 1 + deg5_w, 0);
r5_jrat = (deg5_w<0.5)?j0:(deg5_w<1.5)?j1:(deg5_w<2.5)?j2:(deg5_w<3.5)?j3:j4;
r5_rat = (ts < 0.5) ? (r5_rat * (1.0-flex) + r5_jrat * flex) : r5_rat;
r5_freq = eff_root * r5_rat * pow(2.0, eff_oct5 + oct5_x);
r5_target = samplerate / max(r5_freq, 20);
r5_sdl = (r5_sdl < 1) ? r5_target : r5_sdl + (r5_target - r5_sdl) * glide;
exc5 = cy_456 * s_cg * v_amp5 * unmute;
r5_del = r5_d.read(r5_sdl);
r5_avg = (r5_del + r5_pd) * 0.5;
r5_pd = r5_del;
r5_b = clamp(0.3 + brightness, 0, 1);
r5_filt = r5_del * r5_b + r5_avg * (1.0 - r5_b);
r5_out = tanh(r5_filt) * 0.9998;
r5_d.write(exc5 + r5_out);

// === Voice 6: Crystalline (shekere) ===
inv_adj6 = (oct6 < -0.5) * inv_up + (oct6 > 0.5) * inv_dn;
eff_oct6 = oct6 + inv_adj6 + reg + (oct6 < -0.5) * boct + (oct6 > 0.5) * toct;
deg6_eff = deg6 + transpose;
deg6_w = mod(floor(deg6_eff) + ts_size * 20, ts_size);
oct6_x = floor(deg6_eff / ts_size);
r6_rat = peek(tuning_table, ts_base + 1 + deg6_w, 0);
r6_jrat = (deg6_w<0.5)?j0:(deg6_w<1.5)?j1:(deg6_w<2.5)?j2:(deg6_w<3.5)?j3:j4;
r6_rat = (ts < 0.5) ? (r6_rat * (1.0-flex) + r6_jrat * flex) : r6_rat;
r6_freq = eff_root * r6_rat * pow(2.0, eff_oct6 + oct6_x);
r6_target = samplerate / max(r6_freq, 20);
r6_sdl = (r6_sdl < 1) ? r6_target : r6_sdl + (r6_target - r6_sdl) * glide;
exc6 = cz_456 * s_cg * v_amp6 * unmute;
r6_del = r6_d.read(r6_sdl);
r6_avg = (r6_del + r6_pd) * 0.5;
r6_pd = r6_del;
r6_b = clamp(0.95 + brightness, 0, 1);
r6_filt = r6_del * r6_b + r6_avg * (1.0 - r6_b);
r6_out = tanh(r6_filt) * 0.994;
r6_d.write(exc6 + r6_out);

// === STEREO MIX (with sub-bass + drive saturation) ===
sub_g = sub_amt;
left = r1_out*v_amp1*0.7 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.2 + r4_out*v_amp4*0.4 + r5_out*v_amp5*0.6 + r6_out*v_amp6*0.3 + sub_out*sub_g;
right = r1_out*v_amp1*0.3 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.8 + r4_out*v_amp4*0.6 + r5_out*v_amp5*0.4 + r6_out*v_amp6*0.7 + sub_out*sub_g;
drv = max(1.0 + sub_drive, 1.0);
out1 = tanh(left * drv) * master_gain * unmute;
out2 = tanh(right * drv) * master_gain * unmute;
// Attractor state outputs (for visual sync — normalized chaos XYZ)
out3 = cx * s_cg;
out4 = cy * s_cg;
out5 = cz * s_cg;"""

# ==============================================================================
# LAYOUT HELPERS
# ==============================================================================
def box(id, maxclass, **kw):
    b = {"id": id, "maxclass": maxclass, "numinlets": kw.get("numinlets",1), "numoutlets": kw.get("numoutlets",0)}
    for k in ["outlettype","text","patching_rect","fontsize","fontface","linecount","minimum","maximum","parameter_enable"]:
        if k in kw: b[k] = kw[k]
    return {"box": b}

def comment(id, text, rect, **kw):
    return box(id, "comment", text=text, patching_rect=rect, numoutlets=0, fontsize=kw.get("fontsize",12.0),
               **{k:v for k,v in kw.items() if k!="fontsize"})

def flonum(id, rect, mn=None, mx=None):
    b = box(id, "flonum", patching_rect=rect, numinlets=1, numoutlets=2, outlettype=["","bang"], parameter_enable=0)
    if mn is not None: b["box"]["minimum"] = mn
    if mx is not None: b["box"]["maximum"] = mx
    return b

def intnum(id, rect, mn=None, mx=None):
    b = box(id, "number", patching_rect=rect, numinlets=1, numoutlets=2, outlettype=["","bang"], parameter_enable=0)
    if mn is not None: b["box"]["minimum"] = mn
    if mx is not None: b["box"]["maximum"] = mx
    return b

def msg(id, text, rect):
    return box(id, "message", text=text, patching_rect=rect, numinlets=2, numoutlets=1, outlettype=[""])

def newobj(id, text, rect, numinlets=1, numoutlets=1, outlettype=None):
    kw = {"text": text, "patching_rect": rect, "numinlets": numinlets, "numoutlets": numoutlets}
    if outlettype: kw["outlettype"] = outlettype
    return box(id, "newobj", **kw)

def line(src, srcout, dst, dstin):
    return {"patchline": {"source": [src, srcout], "destination": [dst, dstin]}}

boxes = []
lines = []

# ==============================================================================
# ZONE A (x=15-290): Title, ezdac, STOP, reset, voice legend, MIDI sync
# ==============================================================================
boxes.append(comment("obj-title",
    "CHAOS RESONATOR v4\n\n5 attractors \u2192 6 waveguide resonators.\nBlend / Modulate / Route combining.\n19 African tuning systems. Arpeggiator.\nADSR. African patterns. BPM sync.\nMIDI clock. Scale-degree transpose.\n\n1. Turn on ezdac\n2. Choose attractor(s) + combine mode\n3. Connect MIDI clock (RYTM etc)\n4. STOP = click-free mute",
    [15.0, 15.0, 280.0, 195.0], linecount=11))

boxes.append(box("obj-ezdac", "ezdac~", numinlets=2, numoutlets=0, patching_rect=[15.0, 210.0, 45.0, 45.0]))

# Loadbang → auto-start DSP + send defaults to gen~
boxes.append(newobj("obj-loadbang", "loadbang", [200.0, 215.0, 55.0, 22.0], numinlets=1, numoutlets=1, outlettype=["bang"]))
# Start DSP automatically — startwindow sent to dac~ turns on audio
boxes.append(msg("obj-startdsp", "startwindow", [280.0, 215.0, 75.0, 22.0]))
lines.append(line("obj-loadbang", 0, "obj-startdsp", 0))
lines.append(line("obj-startdsp", 0, "obj-dac", 0))
# Delay 100ms to ensure gen~ is compiled before sending params
boxes.append(newobj("obj-init-delay", "delay 100", [200.0, 240.0, 55.0, 22.0], numinlets=2, numoutlets=1, outlettype=["bang"]))
boxes.append(msg("obj-init-msg", "mute 0, chaos_gain 0.03, master_gain 0.7, rho 28, root 55, arp_mode 0",
                 [200.0, 265.0, 290.0, 22.0]))
boxes.append(newobj("obj-s-init", "s toGen", [200.0, 290.0, 52.0, 22.0], numinlets=1, numoutlets=0))
lines.append(line("obj-loadbang", 0, "obj-init-delay", 0))
lines.append(line("obj-init-delay", 0, "obj-init-msg", 0))
lines.append(line("obj-init-msg", 0, "obj-s-init", 0))

# STOP toggle
boxes.append({"box": {"id": "obj-mute-tog", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["int"], "parameter_enable": 0, "patching_rect": [75.0, 215.0, 30.0, 30.0]}})
boxes.append(comment("obj-mute-label", "STOP", [110.0, 220.0, 45.0, 20.0], fontface=1))
boxes.append(msg("obj-mute-m", "mute $1", [75.0, 250.0, 55.0, 22.0]))
boxes.append(newobj("obj-s-mute", "s toGen", [140.0, 250.0, 52.0, 22.0], numinlets=1, numoutlets=0))
lines.append(line("obj-mute-tog", 0, "obj-mute-m", 0))
lines.append(line("obj-mute-m", 0, "obj-s-mute", 0))

# Reset
boxes.append(box("obj-reset-btn", "button", numinlets=1, numoutlets=1, outlettype=["bang"],
                  parameter_enable=0, patching_rect=[15.0, 280.0, 30.0, 30.0]))
boxes.append(comment("obj-reset-label", "RESET", [50.0, 285.0, 50.0, 20.0], fontface=1))
boxes.append(msg("obj-reset-on", "reset 1", [15.0, 318.0, 50.0, 22.0]))
boxes.append(newobj("obj-reset-del", "delay 100", [75.0, 318.0, 65.0, 22.0], numinlets=2, numoutlets=1, outlettype=["bang"]))
boxes.append(msg("obj-reset-off", "reset 0", [75.0, 345.0, 50.0, 22.0]))
boxes.append(newobj("obj-s-reset", "s toGen", [15.0, 370.0, 52.0, 22.0], numinlets=1, numoutlets=0))
lines.append(line("obj-reset-btn", 0, "obj-reset-on", 0))
lines.append(line("obj-reset-btn", 0, "obj-reset-del", 0))
lines.append(line("obj-reset-on", 0, "obj-s-reset", 0))
lines.append(line("obj-reset-del", 0, "obj-reset-off", 0))
lines.append(line("obj-reset-off", 0, "obj-s-reset", 0))

# Lorenz param smoothing
boxes.append(comment("obj-sm-label", "smooth:", [15.0, 398.0, 50.0, 20.0], fontface=1))
sm_buttons = [("Off", 0, 70, 32), ("Slow", 1, 106, 38), ("Med", 2, 148, 36), ("Fast", 3, 188, 38)]
sm_msg_ids = []
for label, val, x, w in sm_buttons:
    boxes.append(msg(f"obj-sm-{val}", f"smooth_speed {val}", [x, 398.0, w, 22.0]))
    sm_msg_ids.append(f"obj-sm-{val}")
boxes.append(newobj("obj-s-smooth", "s toGen", [70.0, 423.0, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in sm_msg_ids:
    lines.append(line(mid, 0, "obj-s-smooth", 0))

# Voice legend
boxes.append(comment("obj-voices",
    "VOICES (Main/Layer):\n1 Sub Bass (iya ilu) \u2190 X\n2 Body (omele) \u2190 Y\n3 Metallic (ogene) \u2190 Z\n4 Transient (gudugudu) \u2190 X (route)\n5 Drone \u2190 Y (route)\n6 Crystalline (shekere) \u2190 Z (route)",
    [15.0, 450.0, 260.0, 105.0], fontsize=11.0, linecount=7))

# ==============================================================================
# MIDI SYNC SUBPATCHER (in Zone A, below voice legend)
# ==============================================================================
boxes.append(comment("obj-midi-label", "\u2014\u2014 LIVE / MIDI \u2014\u2014", [15.0, 565.0, 160.0, 20.0], fontface=1))

# Build MIDI sync subpatcher
midi_boxes = [
    # Input
    {"box": {"id": "m-in", "maxclass": "newobj", "text": "midiin", "numinlets": 1, "numoutlets": 1,
             "outlettype": ["int"], "patching_rect": [30.0, 30.0, 42.0, 22.0]}},
    {"box": {"id": "m-sel", "maxclass": "newobj", "text": "select 248 250 252", "numinlets": 1, "numoutlets": 4,
             "outlettype": ["bang", "bang", "bang", ""], "patching_rect": [30.0, 60.0, 110.0, 22.0]}},

    # Clock chain: count 6 ticks (1/4 of QN), measure interval, derive BPM
    {"box": {"id": "m-ctr", "maxclass": "newobj", "text": "counter 0 5", "numinlets": 5, "numoutlets": 3,
             "outlettype": ["int", "bang", "bang"], "patching_rect": [30.0, 95.0, 68.0, 22.0]}},
    {"box": {"id": "m-tmr", "maxclass": "newobj", "text": "timer", "numinlets": 2, "numoutlets": 1,
             "outlettype": ["float"], "patching_rect": [30.0, 125.0, 38.0, 22.0]}},
    {"box": {"id": "m-bpm", "maxclass": "newobj", "text": "!/ 15000.", "numinlets": 2, "numoutlets": 1,
             "outlettype": ["float"], "patching_rect": [30.0, 155.0, 62.0, 22.0]}},
    {"box": {"id": "m-clip", "maxclass": "newobj", "text": "clip 30. 300.", "numinlets": 3, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 185.0, 75.0, 22.0]}},
    {"box": {"id": "m-slide", "maxclass": "newobj", "text": "slide 5 5", "numinlets": 3, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 215.0, 55.0, 22.0]}},
    {"box": {"id": "m-chg", "maxclass": "newobj", "text": "change", "numinlets": 2, "numoutlets": 2,
             "outlettype": ["", "bang"], "patching_rect": [30.0, 245.0, 48.0, 22.0]}},
    {"box": {"id": "m-bpm-msg", "maxclass": "message", "text": "arp_bpm $1", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 275.0, 68.0, 22.0]}},

    # Start chain (outlet 1 of select)
    {"box": {"id": "m-trig", "maxclass": "newobj", "text": "t b b", "numinlets": 1, "numoutlets": 2,
             "outlettype": ["bang", "bang"], "patching_rect": [175.0, 95.0, 33.0, 22.0]}},
    {"box": {"id": "m-unmute", "maxclass": "message", "text": "mute 0", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [175.0, 125.0, 42.0, 22.0]}},
    {"box": {"id": "m-rst-on", "maxclass": "message", "text": "arp_reset 1", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [230.0, 125.0, 70.0, 22.0]}},
    {"box": {"id": "m-rst-del", "maxclass": "newobj", "text": "delay 50", "numinlets": 2, "numoutlets": 1,
             "outlettype": ["bang"], "patching_rect": [230.0, 155.0, 52.0, 22.0]}},
    {"box": {"id": "m-rst-off", "maxclass": "message", "text": "arp_reset 0", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [230.0, 185.0, 70.0, 22.0]}},

    # Stop chain (outlet 2 of select)
    {"box": {"id": "m-stop", "maxclass": "message", "text": "mute 1", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [330.0, 95.0, 42.0, 22.0]}},

    # Send to gen~ (wireless)
    {"box": {"id": "m-send", "maxclass": "newobj", "text": "s toGen", "numinlets": 1, "numoutlets": 0,
             "patching_rect": [30.0, 310.0, 50.0, 22.0]}},

    # Output: BPM display
    {"box": {"id": "m-out1", "maxclass": "newobj", "text": "out 1", "numinlets": 1, "numoutlets": 0,
             "patching_rect": [120.0, 310.0, 35.0, 22.0]}},

    # Labels
    {"box": {"id": "m-label1", "maxclass": "comment", "text": "MIDI Clock \u2192 BPM sync\nStart = unmute + phase reset\nStop = mute",
             "numinlets": 1, "numoutlets": 0, "patching_rect": [30.0, 340.0, 200.0, 50.0], "fontsize": 10.0, "linecount": 3}},
]

midi_lines = [
    # midiin → select
    line("m-in", 0, "m-sel", 0),
    # Clock: select.0 → counter → timer → BPM
    line("m-sel", 0, "m-ctr", 0),
    line("m-ctr", 1, "m-tmr", 0),    # carry (outlet 1) → timer left inlet
    line("m-tmr", 0, "m-bpm", 0),
    line("m-bpm", 0, "m-clip", 0),
    line("m-clip", 0, "m-slide", 0),
    line("m-slide", 0, "m-chg", 0),
    line("m-chg", 0, "m-bpm-msg", 0),
    line("m-bpm-msg", 0, "m-send", 0),
    # BPM to output display
    line("m-chg", 0, "m-out1", 0),
    # Start: select.1 → trigger → unmute + reset
    line("m-sel", 1, "m-trig", 0),
    line("m-trig", 0, "m-unmute", 0),
    line("m-trig", 1, "m-rst-on", 0),
    line("m-unmute", 0, "m-send", 0),
    line("m-rst-on", 0, "m-send", 0),
    line("m-rst-on", 0, "m-rst-del", 0),
    line("m-rst-del", 0, "m-rst-off", 0),
    line("m-rst-off", 0, "m-send", 0),
    # Stop: select.2 → mute
    line("m-sel", 2, "m-stop", 0),
    line("m-stop", 0, "m-send", 0),
]

midi_patcher = {
    "fileversion": 1,
    "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
    "rect": [200, 200, 450, 420],
    "editing_bgcolor": [0.65, 0.65, 0.65, 1.0],
    "bglocked": 0, "openinpresentation": 0,
    "default_fontsize": 12.0, "default_fontname": "Arial",
    "gridonopen": 1, "gridsize": [15.0, 15.0],
    "gridsnaponopen": 1, "toolbarvisible": 1,
    "boxes": midi_boxes,
    "lines": midi_lines
}

# Add subpatcher to main patch
boxes.append({"box": {"id": "obj-midi", "maxclass": "newobj", "text": "p midi_sync",
              "numinlets": 0, "numoutlets": 1, "outlettype": [""],
              "patching_rect": [15.0, 588.0, 80.0, 22.0], "patcher": midi_patcher}})

# BPM display flonum (read-only display)
boxes.append(flonum("obj-bpm-disp", [100.0, 588.0, 50.0, 22.0]))
boxes.append(comment("obj-bpm-disp-l", "BPM", [155.0, 591.0, 30.0, 20.0], fontface=1))
lines.append(line("obj-midi", 0, "obj-bpm-disp", 0))

# ==============================================================================
# MIDI LEARN subpatcher (Zone A, below BPM display)
# ==============================================================================
# Learnable params: name, min, max
learn_params = [
    "chaos_gain 0. 0.1",
    "rho 20. 200.",
    "root_offset -24. 24.",
    "flex 0. 1.",
    "master_gain 0. 1.5",
    "blend_mix 0. 1.",
    "mod_depth 0. 2.",
    "sub_amt 0. 1.5",
    "arp_bpm 20. 300.",
    "arp_rate 0.1 50.",
    "brightness -1. 1.",
    "sub_chaos 0. 1.",
]
param_names = [p.split()[0] for p in learn_params]

# Build the coll default data as a list of "index, data" lines
# Coll stores: CC# → param_name min max (set during learn)
# We also need a reverse lookup: which param was selected in the menu

ml_boxes = [
    # Inlets: 0=CC value, 1=CC number, 2=learn toggle, 3=param menu index
    {"box": {"id": "ml-in-val", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30, 20, 30, 30], "comment": "CC value (0-127)"}},
    {"box": {"id": "ml-in-cc", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [80, 20, 30, 30], "comment": "CC number"}},
    {"box": {"id": "ml-in-learn", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [130, 20, 30, 30], "comment": "learn toggle"}},
    {"box": {"id": "ml-in-param", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [200, 20, 30, 30], "comment": "param menu idx"}},
    # Gate: when learn=1, CC number goes to store logic
    {"box": {"id": "ml-gate", "maxclass": "newobj", "text": "gate",
             "numinlets": 2, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [130, 70, 40, 22]}},
    # Store selected param index
    {"box": {"id": "ml-paramidx", "maxclass": "newobj", "text": "i 0",
             "numinlets": 2, "numoutlets": 1, "outlettype": ["int"],
             "patching_rect": [200, 70, 30, 22]}},
    # When CC arrives during learn: pack CC# + param_idx
    {"box": {"id": "ml-pack", "maxclass": "newobj", "text": "pack i i",
             "numinlets": 2, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [130, 100, 60, 22]}},
    # Coll stores: CC# → param_index (0-based into learn_params list)
    {"box": {"id": "ml-coll", "maxclass": "newobj", "text": "coll midi_learn_map",
             "numinlets": 1, "numoutlets": 4, "outlettype": ["", "", "", ""],
             "patching_rect": [30, 160, 120, 22]}},
    # Route CC value: CC# → coll lookup → get param index
    {"box": {"id": "ml-lookup-msg", "maxclass": "newobj", "text": "prepend refer",
             "numinlets": 1, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [80, 100, 80, 22]}},
    # Use message box approach: CC# as key to coll
    {"box": {"id": "ml-cc-lookup", "maxclass": "newobj", "text": "prepend",
             "numinlets": 1, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [80, 130, 55, 22]}},
    # The output message with param name
    {"box": {"id": "ml-out", "maxclass": "outlet", "numinlets": 1, "numoutlets": 0,
             "patching_rect": [30, 240, 30, 30], "comment": "param messages to toGen"}},
    # JS for the mapping logic (simpler than pure Max objects)
    {"box": {"id": "ml-js", "maxclass": "newobj", "text": "js midi_learn.js",
             "numinlets": 4, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [30, 200, 100, 22]}},
]
ml_lines = [
    {"patchline": {"source": ["ml-in-val", 0], "destination": ["ml-js", 0]}},
    {"patchline": {"source": ["ml-in-cc", 0], "destination": ["ml-js", 1]}},
    {"patchline": {"source": ["ml-in-learn", 0], "destination": ["ml-js", 2]}},
    {"patchline": {"source": ["ml-in-param", 0], "destination": ["ml-js", 3]}},
    {"patchline": {"source": ["ml-js", 0], "destination": ["ml-out", 0]}},
]
ml_patcher = {
    "fileversion": 1, "appversion": {"major": 8, "minor": 6, "revision": 5},
    "rect": [0, 0, 400, 300], "editing_bgcolor": [0.9, 0.9, 0.9, 1.0],
    "boxes": ml_boxes, "lines": ml_lines
}

# Write midi_learn.js — handles mapping logic
midi_learn_js = '''// midi_learn.js — CC-to-parameter mapping with learn mode
inlets = 4;   // 0=CC value, 1=CC number, 2=learn toggle, 3=param menu index
outlets = 1;  // messages like "chaos_gain 0.05"

var learn_mode = 0;
var selected_param = 0;
var mappings = {};  // CC# -> {param: "name", min: 0, max: 1}

var params = [
''' + ',\n'.join([f'    {{ name: "{p.split()[0]}", min: {p.split()[1]}, max: {p.split()[2]} }}' for p in learn_params]) + '''
];

function msg_int(v) {
    if (inlet == 0) {
        // CC value received — look up mapping and output scaled message
        // (CC number was already stored via inlet 1)
    } else if (inlet == 1) {
        // CC number
        var cc = v;
        if (learn_mode && selected_param >= 0 && selected_param < params.length) {
            mappings[cc] = selected_param;
            post("MIDI Learn: CC" + cc + " -> " + params[selected_param].name + "\\n");
        }
        // Store for value lookup
        msg_int.last_cc = cc;
    } else if (inlet == 2) {
        learn_mode = v;
    } else if (inlet == 3) {
        selected_param = v;
    }
}

function list(v) {
    // ctlin sends cc_value cc_number channel as list
    // But we split them to separate inlets, so this handles inlet 0
}

// Called when CC value arrives (inlet 0)
function msg_float(v) {
    handle_value(v);
}

function handle_value(val) {
    var cc = msg_int.last_cc;
    if (cc === undefined) return;
    if (mappings[cc] !== undefined) {
        var p = params[mappings[cc]];
        var scaled = p.min + (val / 127.0) * (p.max - p.min);
        outlet(0, p.name, scaled);
    }
}

msg_int.last_cc = undefined;

// Override msg_int for inlet 0 to handle values
var _orig = msg_int;
function anything() {
    // Fallback
}
'''

# Actually, simpler approach: use Max objects directly instead of JS
# Let me use a different strategy: [ctlin] already gives CC val + CC num
# We'll use a coll-based approach with a js that's simpler

# Simplest practical approach: write a JS file that does everything
midi_learn_js_clean = '''// midi_learn.js — MIDI CC learn system for Chaos Resonator
// Inlet 0: list from [ctlin] (value, cc#, channel)
// Inlet 1: learn toggle (0/1)
// Inlet 2: param index from umenu
// Outlet 0: messages like "chaos_gain 0.05" to [s toGen]
inlets = 3;
outlets = 1;

var learn_mode = 0;
var selected_param = 0;
var mappings = {};

var params = [
''' + ',\n'.join([f'    {{ name: "{p.split()[0]}", min: {p.split()[1]}, max: {p.split()[2]} }}' for p in learn_params]) + '''
];

function list(val, cc, chan) {
    if (inlet == 0) {
        if (learn_mode && selected_param >= 0 && selected_param < params.length) {
            mappings[cc] = selected_param;
            post("MIDI Learn: CC" + cc + " -> " + params[selected_param].name + "\\n");
            learn_mode = 0;  // auto-disable learn after mapping
        }
        if (mappings[cc] !== undefined) {
            var p = params[mappings[cc]];
            var scaled = p.min + (val / 127.0) * (p.max - p.min);
            outlet(0, p.name, scaled);
        }
    }
}

function msg_int(v) {
    if (inlet == 1) {
        learn_mode = v;
    } else if (inlet == 2) {
        selected_param = v;
    }
}

function bang() {
    if (inlet == 1) {
        // Clear all mappings
        mappings = {};
        post("MIDI Learn: all mappings cleared\\n");
    }
}
'''

js_path = "/home/sphinxy/Feedback/max/midi_learn.js"
with open(js_path, 'w') as f:
    f.write(midi_learn_js_clean)

# Rebuild the subpatcher more simply: ctlin → js → outlet
ml_patcher_simple = {
    "fileversion": 1, "appversion": {"major": 8, "minor": 6, "revision": 5},
    "rect": [0, 0, 400, 250], "editing_bgcolor": [0.9, 0.9, 0.9, 1.0],
    "boxes": [
        {"box": {"id": "ml-ctl", "maxclass": "newobj", "text": "ctlin",
                 "numinlets": 1, "numoutlets": 3, "outlettype": ["int", "int", "int"],
                 "patching_rect": [30, 30, 42, 22]}},
        {"box": {"id": "ml-pack", "maxclass": "newobj", "text": "pack 0 0 0",
                 "numinlets": 3, "numoutlets": 1, "outlettype": [""],
                 "patching_rect": [30, 60, 65, 22]}},
        {"box": {"id": "ml-in-learn", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
                 "outlettype": [""], "patching_rect": [130, 20, 30, 30], "comment": "learn toggle"}},
        {"box": {"id": "ml-in-param", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
                 "outlettype": [""], "patching_rect": [200, 20, 30, 30], "comment": "param index"}},
        {"box": {"id": "ml-js", "maxclass": "newobj", "text": "js midi_learn.js",
                 "numinlets": 3, "numoutlets": 1, "outlettype": [""],
                 "patching_rect": [30, 100, 100, 22]}},
        {"box": {"id": "ml-out", "maxclass": "outlet", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [30, 150, 30, 30], "comment": "param messages"}},
    ],
    "lines": [
        {"patchline": {"source": ["ml-ctl", 0], "destination": ["ml-pack", 0]}},
        {"patchline": {"source": ["ml-ctl", 1], "destination": ["ml-pack", 1]}},
        {"patchline": {"source": ["ml-ctl", 2], "destination": ["ml-pack", 2]}},
        {"patchline": {"source": ["ml-pack", 0], "destination": ["ml-js", 0]}},
        {"patchline": {"source": ["ml-in-learn", 0], "destination": ["ml-js", 1]}},
        {"patchline": {"source": ["ml-in-param", 0], "destination": ["ml-js", 2]}},
        {"patchline": {"source": ["ml-js", 0], "destination": ["ml-out", 0]}},
    ]
}

# Place MIDI learn UI in Zone A below BPM display
ML_Y = 620.0
boxes.append(comment("obj-ml-label", "\u2014\u2014 MIDI LEARN \u2014\u2014", [15.0, ML_Y, 160.0, 20.0], fontface=1))

# Learn toggle
boxes.append({"box": {"id": "obj-ml-tog", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["int"], "parameter_enable": 0, "patching_rect": [15.0, ML_Y+25, 20.0, 20.0]}})
boxes.append(comment("obj-ml-tog-l", "LEARN", [38.0, ML_Y+25, 45.0, 20.0], fontface=1))

# Param selector umenu
umenu_items = " ".join([f'"{n}"' for n in param_names])
boxes.append({"box": {"id": "obj-ml-menu", "maxclass": "umenu", "numinlets": 1, "numoutlets": 3,
              "outlettype": ["int", "", ""],
              "items": param_names,
              "patching_rect": [90.0, ML_Y+25, 120.0, 22.0]}})
boxes.append(comment("obj-ml-hint", "1. Select param  2. Toggle LEARN  3. Move a CC", [15.0, ML_Y+50, 280.0, 14.0], fontsize=9.0))

# Subpatcher
boxes.append({"box": {"id": "obj-ml-p", "maxclass": "newobj", "text": "p midi_learn",
              "numinlets": 2, "numoutlets": 1, "outlettype": [""],
              "patching_rect": [15.0, ML_Y+70, 82.0, 22.0], "patcher": ml_patcher_simple}})
boxes.append(newobj("obj-s-ml", "s toGen", [15.0, ML_Y+95, 52.0, 22.0], numinlets=1, numoutlets=0))

# Wiring
lines.append(line("obj-ml-tog", 0, "obj-ml-p", 0))
lines.append(line("obj-ml-menu", 0, "obj-ml-p", 1))
lines.append(line("obj-ml-p", 0, "obj-s-ml", 0))

# ==============================================================================
# ZONE B (x=381+): Lorenz, Attractor, Resonator, Sub-Bass, Tuning, Arp, ADSR
# ==============================================================================
BX = 381  # Zone B x_start (matches user's D: drive layout)

# --- LORENZ (y=24-89) ---
boxes.append(comment("obj-lc-label", "\u2014\u2014 LORENZ \u2014\u2014", [BX, 24.0, 160.0, 20.0], fontface=1))
lorenz_params = [
    ("sigma", BX, 0, 50, "sigma $1", 55),
    ("rho", BX+65, 0, 200, "rho $1", 45),
    ("beta", BX+120, 0, 20, "beta $1", 50),
    ("dt", BX+185, 0.0003, 0.004, "lorenz_dt $1", 78),
    ("cg", BX+275, 0.0, 0.5, "chaos_gain $1", 85),
]
lor_msg_ids = []
for name, x, mn, mx, mtxt, mw in lorenz_params:
    label = "dt" if name == "dt" else ("chaos" if name == "cg" else name)
    boxes.append(comment(f"obj-{name}-l", label, [x, 44.0, 50.0, 20.0], fontface=1))
    boxes.append(flonum(f"obj-{name}-n", [x, 64.0, 55.0, 22.0], mn, mx))
    boxes.append(msg(f"obj-{name}-m", mtxt, [x, 89.0, mw, 22.0]))
    lines.append(line(f"obj-{name}-n", 0, f"obj-{name}-m", 0))
    lor_msg_ids.append(f"obj-{name}-m")
# Lorenz section sender (offset right to avoid collision with attractor label)
boxes.append(newobj("obj-s-lor", "s toGen", [BX+200, 114.0, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in lor_msg_ids:
    lines.append(line(mid, 0, "obj-s-lor", 0))

# --- ATTRACTOR (y=124-479) ---
ATT_Y = 124
boxes.append(comment("obj-att-label", "\u2014\u2014 ATTRACTOR \u2014\u2014", [BX, ATT_Y, 160.0, 20.0], fontface=1))

# Row 1: Main attractor selector (was "Attractor A")
boxes.append(comment("obj-att-a-l", "Main:", [BX, ATT_Y+25, 50.0, 20.0], fontface=1))
att_a_labels = [("Lorenz", BX+63), ("Rossler", BX+126), ("Chua", BX+189), ("Halv", BX+252), ("Aizawa", BX+338)]
for label, x in att_a_labels:
    boxes.append(comment(f"obj-att-a-lbl-{label[:3].lower()}", label, [x, ATT_Y+25, 55.0, 16.0], fontsize=10.0))
att_a_buttons = [(0, BX+63, 55), (1, BX+126, 55), (2, BX+189, 45), (3, BX+252, 55), (4, BX+338, 52)]
att_msg_ids = []
for val, x, w in att_a_buttons:
    boxes.append(msg(f"obj-att-a-{val}", f"att_sel {val}", [x, ATT_Y+43, w, 22.0]))
    att_msg_ids.append(f"obj-att-a-{val}")

# Row 2: Layer attractor selector (was "Attractor B")
boxes.append(comment("obj-att-b-l", "Layer:", [BX, ATT_Y+75, 50.0, 20.0], fontface=1))
att_b_labels = [("Off", BX+63), ("Lor", BX+105), ("Ross", BX+158), ("Chua", BX+211), ("Halv", BX+258), ("Aiz", BX+338)]
for label, x in att_b_labels:
    boxes.append(comment(f"obj-att-b-lbl-{label[:3].lower()}", label, [x, ATT_Y+75, 42.0, 16.0], fontsize=10.0))
att_b_buttons = [(-1, BX+63, 38), (0, BX+105, 48), (1, BX+158, 48), (2, BX+211, 42), (3, BX+258, 48), (4, BX+338, 45)]
for val, x, w in att_b_buttons:
    boxes.append(msg(f"obj-att-b-{val}", f"att_b_sel {val}", [x, ATT_Y+93, w, 22.0]))
    att_msg_ids.append(f"obj-att-b-{val}")

# Row 3: Combine mode buttons with hints
boxes.append(comment("obj-cm-l", "Combine:", [BX, ATT_Y+125, 65.0, 20.0], fontface=1))
cm_labels = [("Blend", BX+63), ("Modulate", BX+148), ("Route", BX+252)]
for label, x in cm_labels:
    boxes.append(comment(f"obj-cm-lbl-{label[:3].lower()}", label, [x, ATT_Y+125, 60.0, 16.0], fontsize=10.0))
cm_buttons = [(0, BX+63, 55), (1, BX+148, 75), (2, BX+252, 50)]
for val, x, w in cm_buttons:
    boxes.append(msg(f"obj-cm-{val}", f"combine_mode {val}", [x, ATT_Y+143, w, 22.0]))
    att_msg_ids.append(f"obj-cm-{val}")
boxes.append(comment("obj-cm-hint", "Blend=crossfade  Modulate=AM  Route=split voices", [BX+63, ATT_Y+168, 320.0, 16.0], fontsize=10.0))

# Row 4: Blend mix + Mod depth knobs
boxes.append(comment("obj-bmix-l", "blend mix:", [BX, ATT_Y+188, 65.0, 20.0], fontface=1))
boxes.append(flonum("obj-bmix-n", [BX+70, ATT_Y+188, 48.0, 22.0], 0.0, 1.0))
boxes.append(msg("obj-bmix-m", "blend_mix $1", [BX+70, ATT_Y+213, 78.0, 22.0]))
lines.append(line("obj-bmix-n", 0, "obj-bmix-m", 0))
att_msg_ids.append("obj-bmix-m")

boxes.append(comment("obj-mdep-l", "mod depth:", [BX+170, ATT_Y+188, 65.0, 20.0], fontface=1))
boxes.append(flonum("obj-mdep-n", [BX+240, ATT_Y+188, 48.0, 22.0], 0.0, 2.0))
boxes.append(msg("obj-mdep-m", "mod_depth $1", [BX+240, ATT_Y+213, 78.0, 22.0]))
lines.append(line("obj-mdep-n", 0, "obj-mdep-m", 0))
att_msg_ids.append("obj-mdep-m")

# Row 5: Per-attractor character params
boxes.append(comment("obj-atp-l", "Character:", [BX, ATT_Y+248, 75.0, 20.0], fontface=1))
boxes.append(comment("obj-atp-hint", "per-attractor tuning", [BX+80, ATT_Y+248, 150.0, 16.0], fontsize=10.0))
# Sub-row 1: ross_c, chua_alpha, halv_a
att_char_row1 = [
    ("ross_c", BX+19, 1, 20, "ross_c $1", 62, "ross c"),
    ("chua_a", BX+104, 5, 30, "chua_alpha $1", 82, "chua \u03b1"),
    ("halv_a", BX+204, 0.5, 5, "halv_a $1", 62, "halv a"),
]
for name, x, mn, mx, mtxt, mw, label in att_char_row1:
    boxes.append(comment(f"obj-{name}-l", label, [x, ATT_Y+268, 55.0, 20.0], fontface=1))
    boxes.append(flonum(f"obj-{name}-n", [x, ATT_Y+288, 55.0, 22.0], mn, mx))
    boxes.append(msg(f"obj-{name}-m", mtxt, [x, ATT_Y+313, mw, 22.0]))
    lines.append(line(f"obj-{name}-n", 0, f"obj-{name}-m", 0))
    att_msg_ids.append(f"obj-{name}-m")
# Sub-row 2: aiz_c, aiz_d
att_char_row2 = [
    ("aizc", BX+19, 0.1, 2, "aiz_c $1", 52, "aiz c"),
    ("aizd", BX+104, 1, 10, "aiz_d $1", 52, "aiz d"),
]
for name, x, mn, mx, mtxt, mw, label in att_char_row2:
    boxes.append(comment(f"obj-{name}-l", label, [x, ATT_Y+343, 55.0, 20.0], fontface=1))
    boxes.append(flonum(f"obj-{name}-n", [x, ATT_Y+363, 55.0, 22.0], mn, mx))
    boxes.append(msg(f"obj-{name}-m", mtxt, [x, ATT_Y+388, mw, 22.0]))
    lines.append(line(f"obj-{name}-n", 0, f"obj-{name}-m", 0))
    att_msg_ids.append(f"obj-{name}-m")

# Row 6: chaos_amount macro (single knob → rho + chaos_gain)
boxes.append(comment("obj-camac-l", "chaos amount:", [BX, ATT_Y+420, 90.0, 20.0], fontface=1))
boxes.append(flonum("obj-camac-n", [BX+95, ATT_Y+420, 55.0, 22.0], 0.0, 1.0))
# 0→1 maps to rho 100→28 (inverted: more chaos_amount = more chaotic)
boxes.append(newobj("obj-camac-srho", "scale 0. 1. 100. 28.", [BX+95, ATT_Y+445, 130.0, 22.0]))
boxes.append(msg("obj-camac-rhom", "rho $1", [BX+95, ATT_Y+470, 52.0, 22.0]))
# 0→1 maps to chaos_gain 0.002→0.01
boxes.append(newobj("obj-camac-scg", "scale 0. 1. 0.002 0.01", [BX+240, ATT_Y+445, 130.0, 22.0]))
boxes.append(msg("obj-camac-cgm", "chaos_gain $1", [BX+240, ATT_Y+470, 88.0, 22.0]))
lines.append(line("obj-camac-n", 0, "obj-camac-srho", 0))
lines.append(line("obj-camac-n", 0, "obj-camac-scg", 0))
lines.append(line("obj-camac-srho", 0, "obj-camac-rhom", 0))
lines.append(line("obj-camac-scg", 0, "obj-camac-cgm", 0))
att_msg_ids.append("obj-camac-rhom")
att_msg_ids.append("obj-camac-cgm")
boxes.append(comment("obj-camac-hint", "0=ordered  1=full chaos", [BX+160, ATT_Y+420, 160.0, 16.0], fontsize=10.0))

# Attractor section sender (offset right to avoid collision with resonators label)
boxes.append(newobj("obj-s-att", "s toGen", [BX+200, ATT_Y+500, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in att_msg_ids:
    lines.append(line(mid, 0, "obj-s-att", 0))

# --- RESONATORS (y=560) ---
RES_Y = 650
boxes.append(comment("obj-rc-label", "\u2014\u2014 RESONATORS \u2014\u2014", [BX, RES_Y, 150.0, 20.0], fontface=1))
res_msg_ids = []
res_params = [
    ("flex", BX+95, 0, 1, "flex $1", 48),
    ("mg", BX+170, 0, 1.5, "master_gain $1", 95),
    ("glide", BX+270, 0.0001, 0.05, "glide $1", 55),
]
for name, x, mn, mx, mtxt, mw in res_params:
    label = "master" if name == "mg" else name
    boxes.append(comment(f"obj-{name}-l", label, [x, RES_Y+22, 55.0, 20.0], fontface=1))
    boxes.append(flonum(f"obj-{name}-n", [x, RES_Y+42, 55.0, 22.0], mn, mx))
    boxes.append(msg(f"obj-{name}-m", mtxt, [x, RES_Y+67, mw, 22.0]))
    lines.append(line(f"obj-{name}-n", 0, f"obj-{name}-m", 0))
    res_msg_ids.append(f"obj-{name}-m")

# --- ROOT with snap-back ---
boxes.append(comment("obj-root-l", "root", [BX, RES_Y+22, 55.0, 20.0], fontface=1))
boxes.append(intnum("obj-root-n", [BX, RES_Y+42, 55.0, 22.0], 20, 500))
boxes.append(msg("obj-root-m", "root $1", [BX, RES_Y+67, 55.0, 22.0]))
lines.append(line("obj-root-n", 0, "obj-root-m", 0))
res_msg_ids.append("obj-root-m")

# Root display subpatcher (simplified — spring logic moved to gen~ DSP)
# Inlet 0: unused (kept for backwards compat)
# Outlet 0: "set N" messages for intnum display when presets change root
# Presets intercepted via [r toGen] → [route root] → update display.
rs_boxes = [
    # --- Inlet (unused, kept for wiring compat) ---
    {"box": {"id": "rs-in1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [200.0, 15.0, 30.0, 22.0],
             "comment": "unused (kept for compat)"}},
    # --- Preset interception ---
    {"box": {"id": "rs-recv", "maxclass": "newobj", "text": "r toGen", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 15.0, 50.0, 22.0]}},
    {"box": {"id": "rs-route", "maxclass": "newobj", "text": "route root", "numinlets": 1, "numoutlets": 2,
             "outlettype": ["", ""], "patching_rect": [30.0, 50.0, 68.0, 22.0]}},
    # --- Display update ---
    {"box": {"id": "rs-set", "maxclass": "newobj", "text": "prepend set", "numinlets": 1, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 85.0, 72.0, 22.0]}},
    {"box": {"id": "rs-out1", "maxclass": "newobj", "text": "out 1", "numinlets": 1, "numoutlets": 0,
             "patching_rect": [30.0, 120.0, 35.0, 22.0]}},
    # --- Display current root value ---
    {"box": {"id": "rs-num", "maxclass": "number", "numinlets": 1, "numoutlets": 2,
             "outlettype": ["", "bang"], "parameter_enable": 0,
             "patching_rect": [30.0, 155.0, 55.0, 22.0]}},
    # --- Label ---
    {"box": {"id": "rs-label", "maxclass": "comment",
             "text": "Root display (spring logic in gen~ DSP)\nPresets update display via [r toGen]",
             "numinlets": 1, "numoutlets": 0, "patching_rect": [30.0, 185.0, 250.0, 40.0], "fontsize": 10.0, "linecount": 2}},
]

rs_lines = [
    # Preset interception: r toGen → route root → display
    line("rs-recv", 0, "rs-route", 0),
    line("rs-route", 0, "rs-set", 0),
    line("rs-set", 0, "rs-out1", 0),
    line("rs-route", 0, "rs-num", 0),     # also show in number box
]

rs_patcher = {
    "fileversion": 1,
    "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
    "rect": [300, 200, 450, 320],
    "editing_bgcolor": [0.65, 0.65, 0.65, 1.0],
    "bglocked": 0, "openinpresentation": 0,
    "default_fontsize": 12.0, "default_fontname": "Arial",
    "gridonopen": 1, "gridsize": [15.0, 15.0],
    "gridsnaponopen": 1, "toolbarvisible": 1,
    "boxes": rs_boxes,
    "lines": rs_lines
}

boxes.append({"box": {"id": "obj-root-snap", "maxclass": "newobj", "text": "p root_snap",
              "numinlets": 1, "numoutlets": 1, "outlettype": [""],
              "patching_rect": [15.0, 620.0, 78.0, 22.0], "patcher": rs_patcher}})

# Wiring: intnum value → root_snap inlet 0 (unused but kept), snap out → intnum (preset display)
lines.append(line("obj-root-n", 0, "obj-root-snap", 0))    # value passthrough
lines.append(line("obj-root-snap", 0, "obj-root-n", 0))    # set message → intnum

# Brightness (waveguide feedback filter)
boxes.append(comment("obj-brt-l", "bright", [BX+360, RES_Y+22, 50.0, 20.0], fontface=1))
boxes.append(flonum("obj-brt-n", [BX+360, RES_Y+42, 55.0, 22.0], -1.0, 1.0))
boxes.append(msg("obj-brt-m", "brightness $1", [BX+360, RES_Y+67, 85.0, 22.0]))
lines.append(line("obj-brt-n", 0, "obj-brt-m", 0))
res_msg_ids.append("obj-brt-m")

# Resonator defaults button
boxes.append(comment("obj-res-def-l", "defaults:", [BX, RES_Y+94, 55.0, 20.0], fontface=1))
boxes.append(msg("obj-res-def", "root 55, flex 0.5, master_gain 0.7, glide 0.001, brightness 0, sub_amt 0.5, sub_drive 0, sub_drone 1, sub_oct -1", [BX+60, RES_Y+94, 400.0, 22.0]))
res_msg_ids.append("obj-res-def")

# Resonator section sender (offset right to avoid collision with sub-bass label)
boxes.append(newobj("obj-s-res", "s toGen", [BX+200, RES_Y+120, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in res_msg_ids:
    lines.append(line(mid, 0, "obj-s-res", 0))

# --- SUB-BASS CONTROLS (y=690) ---
SUB_Y = 790
boxes.append(comment("obj-sub-label", "\u2014\u2014 SUB-BASS \u2014\u2014", [BX, SUB_Y, 120.0, 20.0], fontface=1))
sub_msg_ids = []
# Sub amount (mix level of sub waveguide)
boxes.append(comment("obj-sub-l", "sub amt", [BX, SUB_Y+22, 55.0, 20.0], fontface=1))
boxes.append(flonum("obj-sub-n", [BX, SUB_Y+42, 55.0, 22.0], 0.0, 1.5))
boxes.append(msg("obj-sub-m", "sub_amt $1", [BX, SUB_Y+67, 70.0, 22.0]))
lines.append(line("obj-sub-n", 0, "obj-sub-m", 0))
sub_msg_ids.append("obj-sub-m")
# Sub drive (output saturation for harmonic weight)
boxes.append(comment("obj-drv-l", "drive", [BX+95, SUB_Y+22, 50.0, 20.0], fontface=1))
boxes.append(flonum("obj-drv-n", [BX+95, SUB_Y+42, 55.0, 22.0], 0.0, 5.0))
boxes.append(msg("obj-drv-m", "sub_drive $1", [BX+95, SUB_Y+67, 80.0, 22.0]))
lines.append(line("obj-drv-n", 0, "obj-drv-m", 0))
sub_msg_ids.append("obj-drv-m")
# Sub drone/follow toggle
boxes.append(comment("obj-sdr-l", "drone", [BX+200, SUB_Y+22, 45.0, 20.0], fontface=1))
boxes.append({"box": {"id": "obj-sdr-tog", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["int"], "parameter_enable": 0, "patching_rect": [BX+200, SUB_Y+42, 24.0, 24.0]}})
boxes.append(msg("obj-sdr-m", "sub_drone $1", [BX+200, SUB_Y+67, 80.0, 22.0]))
boxes.append(comment("obj-sdr-hint", "ON=const OFF=follow", [BX+200, SUB_Y+90, 120.0, 14.0], fontsize=9.0))
lines.append(line("obj-sdr-tog", 0, "obj-sdr-m", 0))
sub_msg_ids.append("obj-sdr-m")
# Sub oct (transpose in octaves, default -1)
boxes.append(comment("obj-soct-l", "sub oct", [BX+280, SUB_Y+22, 50.0, 20.0], fontface=1))
boxes.append(flonum("obj-soct-n", [BX+280, SUB_Y+42, 50.0, 22.0], -3.0, 1.0))
boxes.append(msg("obj-soct-m", "sub_oct $1", [BX+280, SUB_Y+67, 68.0, 22.0]))
boxes.append(comment("obj-soct-hint", "-1=oct below\n0=unison", [BX+332, SUB_Y+40, 70.0, 28.0], fontsize=9.0, linecount=2))
lines.append(line("obj-soct-n", 0, "obj-soct-m", 0))
sub_msg_ids.append("obj-soct-m")

# Sub chaos (direct chaos excitation — dirtier for gqom)
boxes.append(comment("obj-sch-l", "chaos", [BX+360, SUB_Y+22, 45.0, 20.0], fontface=1))
boxes.append(flonum("obj-sch-n", [BX+360, SUB_Y+42, 50.0, 22.0], 0.0, 1.0))
boxes.append(msg("obj-sch-m", "sub_chaos $1", [BX+360, SUB_Y+67, 85.0, 22.0]))
boxes.append(comment("obj-sch-hint", "0=clean 1=dirty", [BX+360, SUB_Y+90, 90.0, 14.0], fontsize=9.0))
lines.append(line("obj-sch-n", 0, "obj-sch-m", 0))
sub_msg_ids.append("obj-sch-m")

# Sub-bass section sender
boxes.append(newobj("obj-s-sub", "s toGen", [BX, SUB_Y+110, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in sub_msg_ids:
    lines.append(line(mid, 0, "obj-s-sub", 0))

# --- TUNING + INVERSION + TRANSPOSE (y=810) ---
TUN_Y = 920
tun_msg_ids = []
boxes.append(comment("obj-ts-label", "\u2014\u2014 TUNING \u2014\u2014", [BX, TUN_Y, 120.0, 20.0], fontface=1))
boxes.append(comment("obj-ts-l", "system (0-18)", [BX, TUN_Y+20, 90.0, 20.0]))
boxes.append(flonum("obj-ts-n", [BX, TUN_Y+40, 45.0, 22.0], 0, 18))
boxes.append(msg("obj-ts-m", "tuning_system $1", [BX, TUN_Y+65, 105.0, 22.0]))
lines.append(line("obj-ts-n", 0, "obj-ts-m", 0))
tun_msg_ids.append("obj-ts-m")

boxes.append(comment("obj-inv-l", "inversion", [BX+120, TUN_Y+20, 70.0, 20.0], fontface=1))
boxes.append(intnum("obj-inv-n", [BX+120, TUN_Y+40, 40.0, 22.0], -2, 2))
boxes.append(msg("obj-inv-m", "inversion $1", [BX+120, TUN_Y+65, 80.0, 22.0]))
lines.append(line("obj-inv-n", 0, "obj-inv-m", 0))
tun_msg_ids.append("obj-inv-m")

# Transpose (scale degrees, not semitones)
boxes.append(comment("obj-trn-l", "transpose", [BX+235, TUN_Y+20, 65.0, 20.0], fontface=1))
boxes.append(intnum("obj-trn-n", [BX+235, TUN_Y+40, 40.0, 22.0], -12, 12))
boxes.append(msg("obj-trn-m", "transpose $1", [BX+235, TUN_Y+65, 80.0, 22.0]))
lines.append(line("obj-trn-n", 0, "obj-trn-m", 0))
tun_msg_ids.append("obj-trn-m")

# Row 2: Register, Bass Octave, Treble Octave
boxes.append(comment("obj-reg-l", "register", [BX, TUN_Y+90, 65.0, 20.0], fontface=1))
boxes.append(intnum("obj-reg-n", [BX, TUN_Y+110, 40.0, 22.0], -3, 3))
boxes.append(msg("obj-reg-m", "register $1", [BX, TUN_Y+135, 72.0, 22.0]))
lines.append(line("obj-reg-n", 0, "obj-reg-m", 0))
tun_msg_ids.append("obj-reg-m")

boxes.append(comment("obj-boct-l", "bass oct", [BX+120, TUN_Y+90, 65.0, 20.0], fontface=1))
boxes.append(intnum("obj-boct-n", [BX+120, TUN_Y+110, 40.0, 22.0], -2, 2))
boxes.append(msg("obj-boct-m", "bass_oct $1", [BX+120, TUN_Y+135, 72.0, 22.0]))
lines.append(line("obj-boct-n", 0, "obj-boct-m", 0))
tun_msg_ids.append("obj-boct-m")

boxes.append(comment("obj-toct-l", "treble oct", [BX+235, TUN_Y+90, 70.0, 20.0], fontface=1))
boxes.append(intnum("obj-toct-n", [BX+235, TUN_Y+110, 40.0, 22.0], 0, 4))
boxes.append(msg("obj-toct-m", "treble_oct $1", [BX+235, TUN_Y+135, 78.0, 22.0]))
lines.append(line("obj-toct-n", 0, "obj-toct-m", 0))
tun_msg_ids.append("obj-toct-m")

# Row 3: Root Spring / Latch system
boxes.append(comment("obj-rsp-label", "—— ROOT SPRING ——", [BX, TUN_Y+165, 160.0, 20.0], fontface=1))

# Root offset (semitones, -24 to +24)
boxes.append(comment("obj-roff-l", "offset (st)", [BX, TUN_Y+185, 70.0, 20.0]))
boxes.append(flonum("obj-roff-n", [BX, TUN_Y+205, 55.0, 22.0], -24.0, 24.0))
boxes.append(msg("obj-roff-m", "root_offset $1", [BX, TUN_Y+230, 95.0, 22.0]))
lines.append(line("obj-roff-n", 0, "obj-roff-m", 0))
tun_msg_ids.append("obj-roff-m")

# Spring / Latch toggle
boxes.append(comment("obj-rmod-l", "mode", [BX+120, TUN_Y+185, 40.0, 20.0], fontface=1))
boxes.append({"box": {"id": "obj-rmod-tog", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["int"], "parameter_enable": 0, "patching_rect": [BX+120, TUN_Y+205, 24.0, 24.0]}})
boxes.append(msg("obj-rmod-m", "root_mode $1", [BX+120, TUN_Y+230, 85.0, 22.0]))
boxes.append(comment("obj-rmod-hint", "0=Spring 1=Latch", [BX+150, TUN_Y+207, 110.0, 16.0], fontsize=9.0))
lines.append(line("obj-rmod-tog", 0, "obj-rmod-m", 0))
tun_msg_ids.append("obj-rmod-m")

# Return speed (seconds)
boxes.append(comment("obj-rret-l", "return (s)", [BX+235, TUN_Y+185, 70.0, 20.0]))
boxes.append(flonum("obj-rret-n", [BX+235, TUN_Y+205, 55.0, 22.0], 0.05, 3.0))
boxes.append(msg("obj-rret-m", "root_return $1", [BX+235, TUN_Y+230, 95.0, 22.0]))
lines.append(line("obj-rret-n", 0, "obj-rret-m", 0))
tun_msg_ids.append("obj-rret-m")

# MIDI CC input for root_offset: [ctlin] → [scale 0 127 -24 24] → [prepend root_offset] → [s toGen]
boxes.append(comment("obj-rcc-l", "MIDI CC → offset", [BX, TUN_Y+258, 110.0, 16.0], fontsize=10.0))
boxes.append(newobj("obj-rcc-ctl", "ctlin", [BX, TUN_Y+276, 40.0, 22.0], numinlets=1, numoutlets=3, outlettype=["", "", ""]))
boxes.append(newobj("obj-rcc-scl", "scale 0 127 -24 24", [BX, TUN_Y+301, 115.0, 22.0]))
boxes.append(newobj("obj-rcc-prep", "prepend root_offset", [BX, TUN_Y+326, 110.0, 22.0]))
lines.append(line("obj-rcc-ctl", 0, "obj-rcc-scl", 0))
lines.append(line("obj-rcc-scl", 0, "obj-rcc-prep", 0))
lines.append(line("obj-rcc-scl", 0, "obj-roff-n", 0))  # also update flonum display
tun_msg_ids.append("obj-rcc-prep")

# Tuning section sender
boxes.append(newobj("obj-s-tun", "s toGen", [BX, TUN_Y+355, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in tun_msg_ids:
    lines.append(line(mid, 0, "obj-s-tun", 0))

# --- ARPEGGIATOR (y=1000) ---
ARP_Y = 1200
arp_msg_ids = []
boxes.append(comment("obj-arp-label", "\u2014\u2014 ARPEGGIATOR \u2014\u2014", [BX, ARP_Y, 160.0, 20.0], fontface=1))

# Row 1: Standard modes (0-5)
arp_modes = [("Off",BX,50),("Up",BX+55,40),("Down",BX+100,55),("P-Pong",BX+160,60),("Rand",BX+225,50),("Drone",BX+280,55)]
for i, (label, x, w) in enumerate(arp_modes):
    boxes.append(msg(f"obj-arp-{i}", f"arp_mode {i}", [x, ARP_Y+22, w, 22.0]))
    arp_msg_ids.append(f"obj-arp-{i}")

# Row 2: African rhythm patterns (6-10)
boxes.append(comment("obj-afr-labels", "Poly3:2   Triplet    Bembe     Shiko    Call/Rsp", [BX, ARP_Y+50, 350.0, 16.0], fontsize=10.0))
afr_x_w = [(BX, 68), (BX+73, 64), (BX+142, 62), (BX+209, 58), (BX+272, 72)]
for i, (x, w) in enumerate(afr_x_w):
    mode = i + 6
    boxes.append(msg(f"obj-arp-{mode}", f"arp_mode {mode}", [x, ARP_Y+68, w, 22.0]))
    arp_msg_ids.append(f"obj-arp-{mode}")

# Row 3: More African/diaspora patterns (11-14)
boxes.append(comment("obj-afr2-labels", "Gahu    Son Clave  Fume Fume   Kassa", [BX, ARP_Y+93, 350.0, 16.0], fontsize=10.0))
afr2_x_w = [(BX, 55), (BX+60, 75), (BX+140, 72), (BX+217, 55)]
for i, (x, w) in enumerate(afr2_x_w):
    mode = i + 11
    boxes.append(msg(f"obj-arp-{mode}", f"arp_mode {mode}", [x, ARP_Y+111, w, 22.0]))
    arp_msg_ids.append(f"obj-arp-{mode}")

# Row 4: Lusophone / Diaspora patterns (15-18)
boxes.append(comment("obj-luso-labels", "Kuduro   Semba    Kizomba  Marrabenta", [BX, ARP_Y+133, 350.0, 16.0], fontsize=10.0))
luso_x_w = [(BX, 58), (BX+63, 55), (BX+123, 62), (BX+190, 72)]
for i, (x, w) in enumerate(luso_x_w):
    mode = i + 15
    boxes.append(msg(f"obj-arp-{mode}", f"arp_mode {mode}", [x, ARP_Y+151, w, 22.0]))
    arp_msg_ids.append(f"obj-arp-{mode}")

# Row 5: Euclidean rhythm (mode 19) + controls
boxes.append(msg("obj-arp-19", "arp_mode 19", [BX+270, ARP_Y+151, 72.0, 22.0]))
boxes.append(comment("obj-eucl-hint", "Euclidean", [BX+270, ARP_Y+133, 70.0, 16.0], fontsize=10.0))
arp_msg_ids.append("obj-arp-19")
boxes.append(comment("obj-ep-l", "pulses", [BX+350, ARP_Y+133, 42.0, 16.0], fontsize=10.0))
boxes.append(intnum("obj-ep-n", [BX+350, ARP_Y+151, 35.0, 22.0], 0, 16))
boxes.append(msg("obj-ep-m", "eucl_pulses $1", [BX+270, ARP_Y+176, 85.0, 22.0]))
lines.append(line("obj-ep-n", 0, "obj-ep-m", 0))
arp_msg_ids.append("obj-ep-m")
boxes.append(comment("obj-es-l", "steps", [BX+395, ARP_Y+133, 35.0, 16.0], fontsize=10.0))
boxes.append(intnum("obj-es-n", [BX+395, ARP_Y+151, 35.0, 22.0], 1, 16))
boxes.append(msg("obj-es-m", "eucl_steps $1", [BX+360, ARP_Y+176, 78.0, 22.0]))
lines.append(line("obj-es-n", 0, "obj-es-m", 0))
arp_msg_ids.append("obj-es-m")

# Row 6: ARP RATE — division buttons
boxes.append(comment("obj-div-label", "\u2014\u2014 ARP RATE \u2014\u2014", [BX, ARP_Y+201, 120.0, 20.0], fontface=1))
boxes.append(comment("obj-div-hint", "0=free 1=1/4 2=1/8 3=trip 4=1/16", [BX+125, ARP_Y+201, 230.0, 20.0], fontsize=10.0))
div_vals = [0, 1, 2, 3, 4, 1.333]
div_x = [BX, BX+65, BX+130, BX+195, BX+260, BX+325]
div_w = [60, 60, 60, 60, 60, 78]
for i, (val, x, w) in enumerate(zip(div_vals, div_x, div_w)):
    boxes.append(msg(f"obj-div-{i}", f"arp_div {val}", [x, ARP_Y+221, w, 22.0]))
    arp_msg_ids.append(f"obj-div-{i}")

# BPM flonum (manual override / no-MIDI mode)
boxes.append(comment("obj-bpm-l", "bpm", [BX, ARP_Y+248, 30.0, 20.0], fontface=1))
boxes.append(flonum("obj-bpm-n", [BX+35, ARP_Y+248, 50.0, 22.0], 20, 300))
boxes.append(msg("obj-bpm-m", "arp_bpm $1", [BX+35, ARP_Y+273, 72.0, 22.0]))
lines.append(line("obj-bpm-n", 0, "obj-bpm-m", 0))
arp_msg_ids.append("obj-bpm-m")

# Free Hz flonum
boxes.append(comment("obj-arpr-l", "free Hz", [BX+130, ARP_Y+248, 50.0, 20.0], fontface=1))
boxes.append(flonum("obj-arpr-n", [BX+185, ARP_Y+248, 50.0, 22.0], 0.1, 50.0))
boxes.append(msg("obj-arpr-m", "arp_rate $1", [BX+185, ARP_Y+273, 68.0, 22.0]))
lines.append(line("obj-arpr-n", 0, "obj-arpr-m", 0))
arp_msg_ids.append("obj-arpr-m")

# Arpeggiator section sender
boxes.append(newobj("obj-s-arp", "s toGen", [BX+200, ARP_Y+300, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in arp_msg_ids:
    lines.append(line(mid, 0, "obj-s-arp", 0))

# --- USER PATTERN GRID (y=ARP_Y+270) ---
GRID_Y = ARP_Y + 330
boxes.append(comment("obj-ugrid-label", "\u2014\u2014 USER PATTERN (mode 20) \u2014\u2014", [BX, GRID_Y, 250.0, 20.0], fontface=1))
boxes.append(comment("obj-ugrid-voices", "v1 v2 v3 v4 v5 v6", [BX+2, GRID_Y+20, 200.0, 14.0], fontsize=9.0))
# matrixctrl: 16 columns (steps) × 6 rows (voices), each cell = toggle
boxes.append({"box": {"id": "obj-ugrid", "maxclass": "matrixctrl", "numinlets": 1, "numoutlets": 2,
              "outlettype": ["list", ""], "parameter_enable": 0,
              "patching_rect": [BX, GRID_Y+35, 320.0, 120.0],
              "columns": 16, "rows": 6}})
# JS-free bitmask converter subpatcher: matrixctrl → [p grid_to_bitmask] → us0-us15 msgs → s toGen
# Subpatcher receives "col row state" lists, maintains internal state, outputs "usN bitmask" messages
grid_boxes = [
    {"box": {"id": "g-in1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 15.0, 30.0, 22.0],
             "comment": "col row state from matrixctrl"}},
    {"box": {"id": "g-unpack", "maxclass": "newobj", "text": "unpack i i i", "numinlets": 1, "numoutlets": 3,
             "outlettype": ["int", "int", "int"], "patching_rect": [30.0, 50.0, 70.0, 22.0]}},
    # col=step (0-15), row=voice (0-5, top=v1), state=0/1
    # bitmask: voice_bit = (1 << row) * state, added/subtracted from step's current mask
    # We use a coll to store 16 bitmask values, keyed 0-15
    {"box": {"id": "g-coll", "maxclass": "newobj", "text": "coll grid_masks", "numinlets": 1, "numoutlets": 4,
             "outlettype": ["", "", "", ""], "patching_rect": [30.0, 180.0, 100.0, 22.0]}},
    # Pack col and output for retrieval
    {"box": {"id": "g-getmsg", "maxclass": "newobj", "text": "prepend refer", "numinlets": 1, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [200.0, 50.0, 78.0, 22.0]}},
    # JavaScript for bitmask computation (simplest reliable approach)
    {"box": {"id": "g-js", "maxclass": "newobj", "text": "js grid_bitmask.js", "numinlets": 1, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [30.0, 85.0, 110.0, 22.0]}},
    {"box": {"id": "g-out1", "maxclass": "newobj", "text": "out 1", "numinlets": 1, "numoutlets": 0,
             "patching_rect": [30.0, 120.0, 35.0, 22.0]}},
    {"box": {"id": "g-label", "maxclass": "comment",
             "text": "Converts matrixctrl col/row/state to usN bitmask messages",
             "numinlets": 1, "numoutlets": 0, "patching_rect": [30.0, 150.0, 280.0, 20.0], "fontsize": 10.0}},
]
grid_lines = [
    line("g-in1", 0, "g-js", 0),
    line("g-js", 0, "g-out1", 0),
]
grid_patcher = {
    "fileversion": 1,
    "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
    "rect": [300, 200, 350, 200],
    "editing_bgcolor": [0.65, 0.65, 0.65, 1.0],
    "bglocked": 0, "openinpresentation": 0,
    "default_fontsize": 12.0, "default_fontname": "Arial",
    "gridonopen": 1, "gridsize": [15.0, 15.0],
    "gridsnaponopen": 1, "toolbarvisible": 1,
    "boxes": grid_boxes,
    "lines": grid_lines
}
boxes.append({"box": {"id": "obj-grid-p", "maxclass": "newobj", "text": "p grid_to_bitmask",
              "numinlets": 1, "numoutlets": 1, "outlettype": [""],
              "patching_rect": [BX, GRID_Y+160, 110.0, 22.0], "patcher": grid_patcher}})
boxes.append(newobj("obj-s-grid", "s toGen", [BX, GRID_Y+185, 52.0, 22.0], numinlets=1, numoutlets=0))
# Activate user pattern mode button
boxes.append(msg("obj-ugrid-act", "arp_mode 20", [BX+135, GRID_Y+160, 75.0, 22.0]))
boxes.append(comment("obj-ugrid-hint", "\u2190 activate", [BX+215, GRID_Y+162, 60.0, 16.0], fontsize=10.0))
# Pattern length
boxes.append(comment("obj-upl-l", "steps:", [BX+135, GRID_Y+185, 40.0, 16.0], fontsize=10.0))
boxes.append(intnum("obj-upl-n", [BX+178, GRID_Y+185, 35.0, 22.0], 1, 16))
boxes.append(msg("obj-upl-m", "user_pat_len $1", [BX+218, GRID_Y+185, 100.0, 22.0]))
lines.append(line("obj-upl-n", 0, "obj-upl-m", 0))

lines.append(line("obj-ugrid", 0, "obj-grid-p", 0))
lines.append(line("obj-grid-p", 0, "obj-s-grid", 0))
lines.append(line("obj-ugrid-act", 0, "obj-s-grid", 0))
lines.append(line("obj-upl-m", 0, "obj-s-grid", 0))

# --- ADSR ENVELOPE (y=GRID_Y+215) ---
ADSR_Y = GRID_Y + 215
adsr_msg_ids = []
boxes.append(comment("obj-adsr-label", "\u2014\u2014 ADSR ENVELOPE \u2014\u2014", [BX, ADSR_Y, 180.0, 20.0], fontface=1))
adsr_params = [
    ("atk", BX, 0.001, 2.0, "env_attack $1", 85, "attack"),
    ("dec", BX+95, 0.001, 2.0, "env_decay $1", 80, "decay"),
    ("sus", BX+185, 0.0, 1.0, "env_sustain $1", 92, "sustain"),
    ("rel", BX+287, 0.001, 5.0, "env_release $1", 90, "release"),
]
for name, x, mn, mx, mtxt, mw, label in adsr_params:
    boxes.append(comment(f"obj-{name}-l", label, [x, ADSR_Y+22, 60.0, 20.0], fontface=1))
    boxes.append(flonum(f"obj-{name}-n", [x, ADSR_Y+42, 55.0, 22.0], mn, mx))
    boxes.append(msg(f"obj-{name}-m", mtxt, [x, ADSR_Y+67, mw, 22.0]))
    lines.append(line(f"obj-{name}-n", 0, f"obj-{name}-m", 0))
    adsr_msg_ids.append(f"obj-{name}-m")

# ADSR section sender
boxes.append(newobj("obj-s-adsr", "s toGen", [BX, ADSR_Y+94, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in adsr_msg_ids:
    lines.append(line(mid, 0, "obj-s-adsr", 0))

# ==============================================================================
# GEN~ + AUDIO CHAIN
# ==============================================================================
GEN_SHIFT = ADSR_Y + 110

gen_patcher = {
    "fileversion": 1,
    "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
    "rect": [100, 100, 950, 750],
    "editing_bgcolor": [0.65, 0.65, 0.65, 1.0],
    "bglocked": 0, "openinpresentation": 0,
    "default_fontsize": 12.0, "default_fontname": "Arial",
    "gridonopen": 1, "gridsize": [15.0, 15.0],
    "gridsnaponopen": 1, "toolbarvisible": 1,
    "boxes": [
        {"box": {"id": "obj-gin1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
                 "outlettype": [""], "patching_rect": [50.0, 15.0, 30.0, 22.0]}},
        {"box": {"id": "obj-gin2", "maxclass": "newobj", "text": "in 2", "numinlets": 0, "numoutlets": 1,
                 "outlettype": [""], "patching_rect": [150.0, 15.0, 30.0, 22.0]}},
        {"box": {"id": "obj-gcb", "maxclass": "codebox", "numinlets": 2, "numoutlets": 5,
                 "outlettype": ["", "", "", "", ""], "patching_rect": [50.0, 55.0, 800.0, 600.0], "code": code}},
        {"box": {"id": "obj-gout1", "maxclass": "newobj", "text": "out 1", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [50.0, 675.0, 35.0, 22.0]}},
        {"box": {"id": "obj-gout2", "maxclass": "newobj", "text": "out 2", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [250.0, 675.0, 35.0, 22.0]}},
        {"box": {"id": "obj-gout3", "maxclass": "newobj", "text": "out 3", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [450.0, 675.0, 35.0, 22.0]}},
        {"box": {"id": "obj-gout4", "maxclass": "newobj", "text": "out 4", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [550.0, 675.0, 35.0, 22.0]}},
        {"box": {"id": "obj-gout5", "maxclass": "newobj", "text": "out 5", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [650.0, 675.0, 35.0, 22.0]}}
    ],
    "lines": [
        line("obj-gin1", 0, "obj-gcb", 0),
        line("obj-gin2", 0, "obj-gcb", 1),
        line("obj-gcb", 0, "obj-gout1", 0),
        line("obj-gcb", 1, "obj-gout2", 0),
        line("obj-gcb", 2, "obj-gout3", 0),
        line("obj-gcb", 3, "obj-gout4", 0),
        line("obj-gcb", 4, "obj-gout5", 0)
    ]
}
boxes.append({"box": {"id": "obj-gen", "maxclass": "newobj", "text": "gen~", "numinlets": 2, "numoutlets": 5,
              "patching_rect": [100.0, 530.0+GEN_SHIFT, 200.0, 22.0], "outlettype": ["signal", "signal", "signal", "signal", "signal"], "patcher": gen_patcher}})

# Receive for presets
boxes.append(newobj("obj-r-toGen", "r toGen", [100.0, 507.0+GEN_SHIFT, 52.0, 22.0], numinlets=0, numoutlets=1, outlettype=[""]))
lines.append(line("obj-r-toGen", 0, "obj-gen", 0))

# Analog clock input (audio-rate pulse from hardware)
boxes.append(newobj("obj-adc-clk", "adc~ 3", [310.0, 507.0+GEN_SHIFT, 50.0, 22.0], numinlets=1, numoutlets=1, outlettype=["signal"]))
lines.append(line("obj-adc-clk", 0, "obj-gen", 1))
# Clock enable toggle + message
boxes.append({"box": {"id": "obj-clk-tog", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["int"], "parameter_enable": 0, "patching_rect": [370.0, 507.0+GEN_SHIFT, 20.0, 20.0]}})
boxes.append(msg("obj-clk-m", "clk_enable $1", [395.0, 507.0+GEN_SHIFT, 85.0, 22.0]))
boxes.append(comment("obj-clk-hint", "ANALOG CLK\n(adc~ 3 in)", [370.0, 488.0+GEN_SHIFT, 80.0, 28.0], fontsize=9.0, linecount=2))
boxes.append(newobj("obj-s-clk", "s toGen", [395.0, 532.0+GEN_SHIFT, 52.0, 22.0], numinlets=1, numoutlets=0))
lines.append(line("obj-clk-tog", 0, "obj-clk-m", 0))
lines.append(line("obj-clk-m", 0, "obj-s-clk", 0))

# Audio chain
boxes.append(newobj("obj-gain-l", "*~ 0.8", [100.0, 560.0+GEN_SHIFT, 42.0, 22.0], numinlets=2, outlettype=["signal"]))
boxes.append(newobj("obj-gain-r", "*~ 0.8", [180.0, 560.0+GEN_SHIFT, 42.0, 22.0], numinlets=2, outlettype=["signal"]))
boxes.append(newobj("obj-dac", "dac~", [100.0, 640.0+GEN_SHIFT, 100.0, 22.0], numinlets=2, numoutlets=0))
lines.append(line("obj-gen", 0, "obj-gain-l", 0))
lines.append(line("obj-gen", 1, "obj-gain-r", 0))
lines.append(line("obj-gain-l", 0, "obj-dac", 0))
lines.append(line("obj-gain-r", 0, "obj-dac", 1))

# Scopes & meters
boxes.append(box("obj-scope-l", "scope~", numinlets=2, numoutlets=0, patching_rect=[310.0, 530.0+GEN_SHIFT, 160.0, 50.0]))
boxes.append(box("obj-scope-r", "scope~", numinlets=2, numoutlets=0, patching_rect=[310.0, 585.0+GEN_SHIFT, 160.0, 50.0]))
boxes.append(comment("obj-sl", "L", [475.0, 530.0+GEN_SHIFT, 20.0, 20.0], fontface=1))
boxes.append(comment("obj-sr", "R", [475.0, 585.0+GEN_SHIFT, 20.0, 20.0], fontface=1))
boxes.append({"box": {"id": "obj-meter-l", "maxclass": "meter~", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["float"], "patching_rect": [310.0, 640.0+GEN_SHIFT, 160.0, 16.0]}})
boxes.append({"box": {"id": "obj-meter-r", "maxclass": "meter~", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["float"], "patching_rect": [310.0, 660.0+GEN_SHIFT, 160.0, 16.0]}})
lines.append(line("obj-gen", 0, "obj-scope-l", 0))
lines.append(line("obj-gen", 1, "obj-scope-r", 0))
lines.append(line("obj-gain-l", 0, "obj-meter-l", 0))
lines.append(line("obj-gain-r", 0, "obj-meter-r", 0))

# Chaos attractor outputs (for visual sync via send~)
boxes.append(newobj("obj-chaos-sx", "send~ chaos_x", [500.0, 530.0+GEN_SHIFT, 100.0, 22.0], numinlets=1, numoutlets=0))
boxes.append(newobj("obj-chaos-sy", "send~ chaos_y", [500.0, 555.0+GEN_SHIFT, 100.0, 22.0], numinlets=1, numoutlets=0))
boxes.append(newobj("obj-chaos-sz", "send~ chaos_z", [500.0, 580.0+GEN_SHIFT, 100.0, 22.0], numinlets=1, numoutlets=0))
boxes.append(comment("obj-chaos-hint", "chaos XYZ\n(receive~ in\nvisual patches)", [605.0, 540.0+GEN_SHIFT, 100.0, 48.0], fontsize=10.0, linecount=3))
lines.append(line("obj-gen", 2, "obj-chaos-sx", 0))
lines.append(line("obj-gen", 3, "obj-chaos-sy", 0))
lines.append(line("obj-gen", 4, "obj-chaos-sz", 0))

# Record — one-click with auto-timestamped filenames
# Subpatcher: toggle ON → date → sprintf filename → open → delay → start
#             toggle OFF → stop
rec_boxes = [
    {"box": {"id": "r-in1", "maxclass": "newobj", "text": "in~ 1", "numinlets": 0, "numoutlets": 1,
             "outlettype": ["signal"], "patching_rect": [30.0, 30.0, 35.0, 22.0],
             "comment": "signal L"}},
    {"box": {"id": "r-in2", "maxclass": "newobj", "text": "in~ 2", "numinlets": 0, "numoutlets": 1,
             "outlettype": ["signal"], "patching_rect": [100.0, 30.0, 35.0, 22.0],
             "comment": "signal R"}},
    {"box": {"id": "r-in3", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [250.0, 30.0, 30.0, 22.0],
             "comment": "toggle 0/1"}},
    # Split on/off
    {"box": {"id": "r-sel", "maxclass": "newobj", "text": "sel 1 0", "numinlets": 1, "numoutlets": 3,
             "outlettype": ["bang", "bang", ""], "patching_rect": [250.0, 65.0, 50.0, 22.0]}},
    # ON path: trigger (right fires first → date, left fires last → delayed start)
    {"box": {"id": "r-trig", "maxclass": "newobj", "text": "t b b", "numinlets": 1, "numoutlets": 2,
             "outlettype": ["bang", "bang"], "patching_rect": [250.0, 100.0, 33.0, 22.0]}},
    # Date → filename
    {"box": {"id": "r-date", "maxclass": "newobj", "text": "date", "numinlets": 1, "numoutlets": 6,
             "outlettype": ["int", "int", "int", "int", "int", "int"],
             "patching_rect": [310.0, 100.0, 80.0, 22.0]}},
    {"box": {"id": "r-sprintf", "maxclass": "newobj",
             "text": "sprintf chaos_%04d%02d%02d_%02d%02d%02d.wav",
             "numinlets": 6, "numoutlets": 1, "outlettype": [""],
             "patching_rect": [310.0, 140.0, 260.0, 22.0]}},
    {"box": {"id": "r-prepend", "maxclass": "newobj", "text": "prepend open", "numinlets": 1, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [310.0, 175.0, 78.0, 22.0]}},
    # Delayed start (wait for file to open)
    {"box": {"id": "r-del", "maxclass": "newobj", "text": "delay 150", "numinlets": 2, "numoutlets": 1,
             "outlettype": ["bang"], "patching_rect": [250.0, 140.0, 52.0, 22.0]}},
    {"box": {"id": "r-start", "maxclass": "message", "text": "1", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [250.0, 175.0, 22.0, 22.0]}},
    # OFF path
    {"box": {"id": "r-stop", "maxclass": "message", "text": "0", "numinlets": 2, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [420.0, 65.0, 22.0, 22.0]}},
    # Recorder
    {"box": {"id": "r-sf", "maxclass": "newobj", "text": "sfrecord~ 2", "numinlets": 2, "numoutlets": 1,
             "outlettype": ["signal"], "patching_rect": [30.0, 220.0, 80.0, 22.0]}},
    # Output: filename for display
    {"box": {"id": "r-out1", "maxclass": "newobj", "text": "out 1", "numinlets": 1, "numoutlets": 0,
             "patching_rect": [310.0, 220.0, 35.0, 22.0]}},
    # Label
    {"box": {"id": "r-label", "maxclass": "comment", "text": "One-click record\nToggle ON = auto-name + start\nToggle OFF = stop\nFiles save next to patch",
             "numinlets": 1, "numoutlets": 0, "patching_rect": [30.0, 260.0, 200.0, 60.0], "fontsize": 10.0, "linecount": 4}},
]

rec_lines = [
    # Signal routing (sfrecord~ 2: inlet 0 = messages + signal L, inlet 1 = signal R)
    line("r-in1", 0, "r-sf", 0),    # signal L → inlet 0
    line("r-in2", 0, "r-sf", 1),    # signal R → inlet 1
    # Control
    line("r-in3", 0, "r-sel", 0),
    line("r-sel", 0, "r-trig", 0),  # ON
    line("r-sel", 1, "r-stop", 0),  # OFF
    line("r-stop", 0, "r-sf", 0),
    # ON: right outlet fires first → date → filename → open
    line("r-trig", 1, "r-date", 0),
    line("r-date", 0, "r-sprintf", 0),  # year (fires last = triggers sprintf)
    line("r-date", 1, "r-sprintf", 1),  # month
    line("r-date", 2, "r-sprintf", 2),  # day
    line("r-date", 3, "r-sprintf", 3),  # hour
    line("r-date", 4, "r-sprintf", 4),  # minute
    line("r-date", 5, "r-sprintf", 5),  # second
    line("r-sprintf", 0, "r-prepend", 0),
    line("r-prepend", 0, "r-sf", 0),    # "open filename.wav" → sfrecord~
    # ON: left outlet fires last → delayed start
    line("r-trig", 0, "r-del", 0),
    line("r-del", 0, "r-start", 0),
    line("r-start", 0, "r-sf", 0),
    # Filename display
    line("r-sprintf", 0, "r-out1", 0),
]

rec_patcher = {
    "fileversion": 1,
    "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
    "rect": [200, 200, 620, 360],
    "editing_bgcolor": [0.65, 0.65, 0.65, 1.0],
    "bglocked": 0, "openinpresentation": 0,
    "default_fontsize": 12.0, "default_fontname": "Arial",
    "gridonopen": 1, "gridsize": [15.0, 15.0],
    "gridsnaponopen": 1, "toolbarvisible": 1,
    "boxes": rec_boxes,
    "lines": rec_lines
}

boxes.append(comment("obj-rec-label", "\u2014\u2014 RECORD \u2014\u2014", [100.0, 675.0+GEN_SHIFT, 120.0, 20.0], fontface=1))
boxes.append({"box": {"id": "obj-rec-tog", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1,
              "outlettype": ["int"], "parameter_enable": 0, "patching_rect": [100.0, 695.0+GEN_SHIFT, 24.0, 24.0]}})
boxes.append(comment("obj-rec-hint", "REC", [128.0, 698.0+GEN_SHIFT, 30.0, 20.0], fontface=1))
boxes.append(comment("obj-rec-path", "saves next to patch", [160.0, 698.0+GEN_SHIFT, 140.0, 20.0], fontsize=10.0))
boxes.append({"box": {"id": "obj-recorder", "maxclass": "newobj", "text": "p recorder",
              "numinlets": 3, "numoutlets": 1, "outlettype": [""],
              "patching_rect": [100.0, 725.0+GEN_SHIFT, 72.0, 22.0], "patcher": rec_patcher}})
boxes.append(msg("obj-rec-name", "", [180.0, 725.0+GEN_SHIFT, 200.0, 22.0]))
lines.append(line("obj-gain-l", 0, "obj-recorder", 0))
lines.append(line("obj-gain-r", 0, "obj-recorder", 1))
lines.append(line("obj-rec-tog", 0, "obj-recorder", 2))
lines.append(line("obj-recorder", 0, "obj-rec-name", 0))

# --- RENDER 8 BARS button ---
# Subpatcher: bang → calc 8 bars ms from BPM → toggle on → delay → toggle off
render_patcher = {
    "fileversion": 1, "appversion": {"major": 8, "minor": 6, "revision": 5},
    "rect": [0, 0, 400, 300], "editing_bgcolor": [0.9, 0.9, 0.9, 1.0],
    "boxes": [
        {"box": {"id": "rn-in1", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
                 "outlettype": ["bang"], "patching_rect": [30, 20, 30, 30], "comment": "bang to render"}},
        {"box": {"id": "rn-in2", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
                 "outlettype": ["float"], "patching_rect": [130, 20, 30, 30], "comment": "BPM"}},
        # Store BPM
        {"box": {"id": "rn-f", "maxclass": "newobj", "text": "float 120",
                 "numinlets": 2, "numoutlets": 1, "outlettype": ["float"],
                 "patching_rect": [30, 60, 60, 22]}},
        # Calculate ms: 8 bars * 4 beats / bpm * 60000
        {"box": {"id": "rn-expr", "maxclass": "newobj", "text": "expr 8. * 4. * 60000. / max($f1\\, 20.)",
                 "numinlets": 1, "numoutlets": 1, "outlettype": ["float"],
                 "patching_rect": [30, 90, 230, 22]}},
        # t b f: bang first (start rec), then float (delay time)
        {"box": {"id": "rn-t", "maxclass": "newobj", "text": "t b f",
                 "numinlets": 1, "numoutlets": 2, "outlettype": ["bang", "float"],
                 "patching_rect": [30, 120, 60, 22]}},
        # Start: send 1 to toggle
        {"box": {"id": "rn-one", "maxclass": "newobj", "text": "i 1",
                 "numinlets": 2, "numoutlets": 1, "outlettype": ["int"],
                 "patching_rect": [30, 150, 30, 22]}},
        # Delay for 8 bars
        {"box": {"id": "rn-del", "maxclass": "newobj", "text": "delay 16000",
                 "numinlets": 2, "numoutlets": 1, "outlettype": ["bang"],
                 "patching_rect": [100, 150, 80, 22]}},
        # Stop: send 0 to toggle
        {"box": {"id": "rn-zero", "maxclass": "newobj", "text": "i 0",
                 "numinlets": 2, "numoutlets": 1, "outlettype": ["int"],
                 "patching_rect": [100, 180, 30, 22]}},
        # Output: goes to toggle
        {"box": {"id": "rn-out", "maxclass": "outlet", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [60, 220, 30, 30], "comment": "to rec toggle"}}
    ],
    "lines": [
        {"patchline": {"source": ["rn-in1", 0], "destination": ["rn-f", 0]}},
        {"patchline": {"source": ["rn-in2", 0], "destination": ["rn-f", 1]}},
        {"patchline": {"source": ["rn-f", 0], "destination": ["rn-expr", 0]}},
        {"patchline": {"source": ["rn-expr", 0], "destination": ["rn-t", 0]}},
        {"patchline": {"source": ["rn-t", 0], "destination": ["rn-one", 0]}},
        {"patchline": {"source": ["rn-t", 1], "destination": ["rn-del", 0]}},
        {"patchline": {"source": ["rn-del", 0], "destination": ["rn-zero", 0]}},
        {"patchline": {"source": ["rn-one", 0], "destination": ["rn-out", 0]}},
        {"patchline": {"source": ["rn-zero", 0], "destination": ["rn-out", 0]}}
    ]
}

# Render button + BPM input
boxes.append(box("obj-render-btn", "button", numinlets=1, numoutlets=1, patching_rect=[100.0, 755.0+GEN_SHIFT, 24.0, 24.0]))
boxes.append(comment("obj-render-hint", "RENDER 8 BARS", [128.0, 758.0+GEN_SHIFT, 100.0, 20.0], fontface=1))
boxes.append({"box": {"id": "obj-render-p", "maxclass": "newobj", "text": "p render_8bars",
              "numinlets": 2, "numoutlets": 1, "outlettype": ["int"],
              "patching_rect": [100.0, 785.0+GEN_SHIFT, 95.0, 22.0], "patcher": render_patcher}})
# BPM flonum feeds render subpatcher inlet 2
lines.append(line("obj-render-btn", 0, "obj-render-p", 0))
lines.append(line("obj-bpm-n", 0, "obj-render-p", 1))
# Output → rec toggle
lines.append(line("obj-render-p", 0, "obj-rec-tog", 0))

# ==============================================================================
# ZONE C (x=700-1080): Presets
# ==============================================================================
RX = 850

def add_preset_group(label, presets, start_y, label_id):
    boxes.append(comment(label_id, label, [RX, start_y, 200.0, 20.0], fontface=1))
    y = start_y + 22
    send_ids = []
    for pid, mtxt, desc in presets:
        mw = min(len(mtxt) * 7 + 10, 600)
        boxes.append(msg(pid, mtxt, [RX, y, mw, 22.0]))
        if desc:
            boxes.append(comment(f"{pid}-l", desc, [RX + mw + 5, y, 250.0, 20.0]))
        send_ids.append(pid)
        y += 24
    sid = f"{label_id}-send"
    boxes.append(newobj(sid, "s toGen", [RX, y, 52.0, 22.0], numinlets=1, numoutlets=0))
    for pid in send_ids:
        lines.append(line(pid, 0, sid, 0))
    return y + 28

y = 15
y = add_preset_group("\u2014\u2014 RHO PRESETS \u2014\u2014", [
    ("obj-rp1", "rho 20", "converging (quiet)"),
    ("obj-rp2", "rho 24.74", "onset of chaos (edge)"),
    ("obj-rp3", "rho 28", "classic chaos"),
    ("obj-rp4", "rho 100", "periodic orbit (pitched!)"),
    ("obj-rp5", "rho 166", "stable periodic"),
    ("obj-rp6", "rho 50", "intermittent bursts"),
], y, "obj-rp-label")

y = add_preset_group("\u2014\u2014 CHAOS GAIN \u2014\u2014", [
    ("obj-cgp1", "chaos_gain 0.002", "whisper"),
    ("obj-cgp2", "chaos_gain 0.005", "gentle"),
    ("obj-cgp3", "chaos_gain 0.01", "balanced (default)"),
    ("obj-cgp4", "chaos_gain 0.03", "aggressive"),
    ("obj-cgp5", "chaos_gain 0.1", "full distortion"),
], y, "obj-cgp-label")

y = add_preset_group("\u2014\u2014 GLIDE \u2014\u2014", [
    ("obj-gp1", "glide 0.0002", "slow (portamento)"),
    ("obj-gp2", "glide 0.001", "default (~22ms)"),
    ("obj-gp3", "glide 0.01", "fast (snap)"),
], y, "obj-gp-label")

y = add_preset_group("\u2014\u2014 ADSR PRESETS \u2014\u2014", [
    ("obj-ep1", "env_attack 0.001, env_decay 0.08, env_sustain 0.0, env_release 0.05", "Pluck"),
    ("obj-ep2", "env_attack 0.3, env_decay 0.2, env_sustain 0.9, env_release 1.0", "Pad"),
    ("obj-ep3", "env_attack 1.0, env_decay 0.5, env_sustain 0.7, env_release 2.0", "Swell"),
    ("obj-ep4", "env_attack 0.001, env_decay 0.02, env_sustain 0.0, env_release 0.01", "Staccato"),
    ("obj-ep5", "env_attack 0.005, env_decay 0.05, env_sustain 0.8, env_release 0.1", "Default"),
], y, "obj-ep-label")

y = add_preset_group("\u2014\u2014 AFRICAN ROOTS \u2014\u2014", [
    ("obj-ar0", "root 61", "Dundun Low (Akinbo 2019: 61.4 Hz)"),
    ("obj-ar1", "root 82", "Iya Ilu \u2014 bata mother drum"),
    ("obj-ar2", "root 125", "Dundun Mid (Akinbo 2019: 124.8 Hz)"),
    ("obj-ar3", "root 172", "Dundun High (Akinbo 2019: 172.3 Hz)"),
    ("obj-ar4", "root 220", "Balafon \u2014 West African xylophone"),
    ("obj-ar5", "root 350", "Agogo \u2014 Yoruba double bell"),
], y, "obj-ar-label")

y = add_preset_group("\u2014\u2014 CHORD PRESETS \u2014\u2014", [
    ("obj-cp1", "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -1, oct6 1", "Yoruba Spread"),
    ("obj-cp2", "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -2, oct6 1", "Root Cluster"),
    ("obj-cp3", "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 1", "Open Fifths"),
    ("obj-cp4", "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -2, oct2 -2, oct3 -1, oct4 -1, oct5 -2, oct6 -1", "Sub Drone"),
], y, "obj-cp-label")

y = add_preset_group("\u2014\u2014 DRONE PRESETS \u2014\u2014", [
    ("obj-dr1", "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5", "Root Drone"),
    ("obj-dr2", "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5", "Fifth Drone"),
], y, "obj-dr-label")

y = add_preset_group("\u2014\u2014 ATTRACTOR COMBOS \u2014\u2014", [
    ("obj-ac1", "att_sel 0, att_b_sel -1", "Lorenz Solo (default)"),
    ("obj-ac2", "att_sel 1, att_b_sel -1, ross_c 5.7", "Rossler Solo"),
    ("obj-ac3", "att_sel 2, att_b_sel -1, chua_alpha 15.6", "Chua Solo"),
    ("obj-ac4", "att_sel 3, att_b_sel -1, halv_a 1.89", "Halvorsen Solo"),
    ("obj-ac5", "att_sel 4, att_b_sel -1, aiz_c 0.6, aiz_d 3.5", "Aizawa Solo"),
    ("obj-ac6", "att_sel 0, att_b_sel 1, combine_mode 0, blend_mix 0.5", "Lorenz+Rossler Blend"),
    ("obj-ac7", "att_sel 0, att_b_sel 2, combine_mode 1, mod_depth 0.3", "Lorenz\u00d7Chua Modulate"),
    ("obj-ac8", "att_sel 0, att_b_sel 3, combine_mode 2", "Lorenz|Halvorsen Route"),
    ("obj-ac9", "att_sel 1, att_b_sel 4, combine_mode 1, mod_depth 0.7", "Rossler\u00d7Aizawa Modulate"),
    ("obj-ac10", "att_sel 3, att_b_sel 4, combine_mode 0, blend_mix 0.3", "Halvorsen+Aizawa Blend"),
], y, "obj-ac-label")

y = add_preset_group("\u2014\u2014 PATTERN PRESETS \u2014\u2014", [
    ("obj-pp1", "arp_mode 8, arp_div 3, arp_bpm 120", "Bembe 12/8 triplet feel"),
    ("obj-pp2", "arp_mode 9, arp_div 2, arp_bpm 90", "Shiko slow 1/8"),
    ("obj-pp3", "arp_mode 6, arp_div 4, arp_bpm 130", "Poly 3:2 fast 1/16"),
    ("obj-pp4", "arp_mode 10, arp_div 1, arp_bpm 100", "Call/Resp quarter note"),
    ("obj-pp5", "arp_mode 11, arp_div 2, arp_bpm 110", "Gahu 15-step \u2014 Ewe dance"),
    ("obj-pp6", "arp_mode 12, arp_div 4, arp_bpm 95", "Son Clave 3:2 \u2014 Afro-Cuban"),
    ("obj-pp7", "arp_mode 13, arp_div 3, arp_bpm 120", "Fume Fume \u2014 Ewe ceremony"),
    ("obj-pp8", "arp_mode 14, arp_div 4, arp_bpm 140", "Kassa \u2014 Manding harvest"),
], y, "obj-pp-label")

y = add_preset_group("\u2014\u2014 ROOT SPRING \u2014\u2014", [
    ("obj-rsp1", "root_offset 0, root_mode 0, root_return 0.1", "Tight (fast snap)"),
    ("obj-rsp2", "root_offset 0, root_mode 0, root_return 0.5", "Elastic (default)"),
    ("obj-rsp3", "root_offset 0, root_mode 0, root_return 2.0", "Slow (glacial drift)"),
    ("obj-rsp4", "root_mode 1", "Latch (hold position)"),
], y, "obj-rsp-preset-label")

# Tuning systems
boxes.append(comment("obj-tsp-label", "\u2014\u2014 TUNING SYSTEMS \u2014\u2014", [RX, y, 200.0, 20.0], fontface=1))
ty = y + 22
tuning_groups = [
    ("West African", [
        (0, "Yoruba Pentatonic"), (1, "Dundun 3-Tone"), (2, "Balafon Equi-Penta"),
        (3, "Equi-Heptatonic 7-TET"), (18, "Igbo Pentatonic")]),
    ("Mandinka / Senegambia", [
        (7, "Kora Silaba"), (8, "Kora Sauta")]),
    ("Central African", [
        (4, "BaAka/Pygmy 5-TET")]),
    ("East African", [
        (9, "Tizita Major"), (10, "Tizita Minor"), (11, "Bati"),
        (12, "Ambassel"), (13, "Anchihoye"), (14, "Amadinda"), (17, "Wagogo Ilimba")]),
    ("Southern African", [
        (5, "Shona Nyamaropa"), (6, "Shona Gandanga"),
        (15, "Chopi Timbila"), (16, "San Musical Bow")]),
]
all_tuning_msg_ids = []
for region, systems in tuning_groups:
    boxes.append(comment(f"obj-tsr-{region[:3].lower()}", region, [RX, ty, 180.0, 20.0], fontface=1))
    ty += 20
    for num, name in systems:
        mid = f"obj-tsp-{num}"
        boxes.append(msg(mid, f"tuning_system {num}", [RX, ty, 100.0, 22.0]))
        boxes.append(comment(f"{mid}-l", name, [RX + 105, ty, 170.0, 20.0], fontsize=11.0))
        all_tuning_msg_ids.append(mid)
        ty += 24
    ty += 6
boxes.append(newobj("obj-tsp-send", "s toGen", [RX, ty, 52.0, 22.0], numinlets=1, numoutlets=0))
for mid in all_tuning_msg_ids:
    lines.append(line(mid, 0, "obj-tsp-send", 0))

# ==============================================================================
# PRESENTATION MODE — 8 macro controls for performance
# ==============================================================================
# Helper: find a box by id and add presentation attributes
def add_presentation(box_id, rect):
    for b in boxes:
        if b.get("box", {}).get("id") == box_id:
            b["box"]["presentation"] = 1
            b["box"]["presentation_rect"] = rect
            return
    # If not found, ignore silently

# Presentation layout: 600 x 380 grid
PW = 600  # presentation width
# Row 0: Title + ezdac + STOP (y=10)
# Add a presentation-mode title comment
boxes.append(comment("obj-pres-title", "CHAOS RESONATOR", [0, 0, 200.0, 24.0], fontface=1, fontsize=16.0))
for b in boxes:
    if b.get("box", {}).get("id") == "obj-pres-title":
        b["box"]["presentation"] = 1
        b["box"]["presentation_rect"] = [10, 10, 200, 24]

add_presentation("obj-ezdac", [10, 40, 45, 45])
add_presentation("obj-mute-tog", [65, 48, 30, 30])
add_presentation("obj-mute-label", [100, 53, 45, 20])
add_presentation("obj-rec-tog", [160, 53, 20, 20])
add_presentation("obj-rec-hint", [183, 53, 30, 20])

# Row 1: Main controls (y=100)
# chaos_amount
add_presentation("obj-camac-l", [10, 100, 90, 20])
add_presentation("obj-camac-n", [105, 100, 55, 22])
# root_offset
add_presentation("obj-roff-l", [170, 100, 70, 20])
add_presentation("obj-roff-n", [245, 100, 55, 22])
# tuning_system
add_presentation("obj-ts-l", [310, 100, 90, 20])
add_presentation("obj-ts-n", [405, 100, 45, 22])
# master_gain
add_presentation("obj-mg-l", [460, 100, 50, 20])
add_presentation("obj-mg-n", [515, 100, 55, 22])

# Row 2: Sound shaping (y=140)
# blend_mix
add_presentation("obj-bmix-l", [10, 140, 65, 20])
add_presentation("obj-bmix-n", [80, 140, 48, 22])
# sub_amt
add_presentation("obj-sub-l", [140, 140, 55, 20])
add_presentation("obj-sub-n", [200, 140, 55, 22])
# brightness
add_presentation("obj-brt-l", [270, 140, 50, 20])
add_presentation("obj-brt-n", [325, 140, 55, 22])
# sub_chaos
add_presentation("obj-sch-l", [395, 140, 45, 20])
add_presentation("obj-sch-n", [445, 140, 50, 22])

# Row 3: Tempo/Arp (y=180)
# arp_bpm
add_presentation("obj-bpm-l", [10, 180, 30, 20])
add_presentation("obj-bpm-n", [45, 180, 50, 22])
# arp_rate (free Hz)
add_presentation("obj-arpr-l", [110, 180, 50, 20])
add_presentation("obj-arpr-n", [165, 180, 50, 22])
# flex
add_presentation("obj-flex-l", [230, 180, 40, 20])
add_presentation("obj-flex-n", [275, 180, 55, 22])
# mod_depth
add_presentation("obj-mdep-l", [345, 180, 65, 20])
add_presentation("obj-mdep-n", [415, 180, 48, 22])

# Row 4: Spring root (y=220)
add_presentation("obj-rsp-label", [10, 220, 160, 20])
add_presentation("obj-rmod-l", [170, 220, 40, 20])
boxes_dict = {b["box"]["id"]: b for b in boxes if "box" in b and "id" in b["box"]}
if "obj-rmod-tog" in boxes_dict:
    add_presentation("obj-rmod-tog", [215, 220, 20, 20])
add_presentation("obj-rmod-hint", [240, 220, 110, 16])
add_presentation("obj-rret-l", [360, 220, 70, 20])
add_presentation("obj-rret-n", [435, 220, 55, 22])

# Row 5: MIDI learn hint (y=260)
add_presentation("obj-ml-label", [10, 260, 160, 20])
add_presentation("obj-ml-tog", [10, 285, 20, 20])
add_presentation("obj-ml-tog-l", [33, 285, 45, 20])
add_presentation("obj-ml-menu", [85, 285, 120, 22])
add_presentation("obj-ml-hint", [10, 310, 280, 14])

# ==============================================================================
# BUILD
# ==============================================================================
patch = {
    "patcher": {
        "fileversion": 1,
        "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [34, 76, 1469, 2340],
        "bglocked": 0, "openinpresentation": 1,
        "default_fontsize": 12.0, "default_fontface": 0, "default_fontname": "Arial",
        "gridonopen": 1, "gridsize": [15.0, 15.0],
        "gridsnaponopen": 1, "objectsnaponopen": 1,
        "statusbarvisible": 2, "toolbarvisible": 1,
        "boxes": boxes,
        "lines": lines
    }
}

os.makedirs("/home/sphinxy/Feedback/max/recordings", exist_ok=True)

with open("/home/sphinxy/Feedback/max/step6_chaos_resonator.maxpat", "w") as f:
    json.dump(patch, f, indent="\t", ensure_ascii=False)

print(f"Done! {len(boxes)} boxes, {len(lines)} lines")
print(f"Window: 1469x2340")
print()
print("=== CHAOS RESONATOR v4.1 — FIXED + CLEAN ===")
print("FIXES:")
print("  - Chua: beta fixed (-28.0), dt=0.0012, wider clamps, correct scaling")
print("  - Independent dt per attractor (Lorenz dt knob only controls Lorenz)")
print("  - Rossler dt=0.006, Halvorsen dt=0.005, Aizawa dt=0.006")
print("  - Sub-bass transpose: sub_oct param (default -1 = octave below)")
print()
print("CLEANUP:")
print("  - All param wires use [s toGen] / [r toGen] (no long cables)")
print("  - Simplified labels: Main/Layer instead of Attractor A/B")
print("  - Combine mode hints inline")
print("  - Layout matches user's D: drive arrangement (x=381, presets x=850)")
print()
print("MIDI SYNC:")
print("  - midiin → 24ppqn clock detection → BPM")
print("  - MIDI Start → unmute + phase reset, MIDI Stop → mute")
print()
print("ROOT SPRING:")
print("  - Asymmetric spring model in gen~ DSP (fast attack, slow release)")
print("  - root_offset: semitones (-24 to +24), root_mode: 0=Spring 1=Latch")
print("  - root_return: spring return time in seconds (0.05 to 3.0)")
print("  - MIDI CC → root_offset via [ctlin] → [scale 0 127 -24 24]")
print("  - Old delay-based root_snap simplified to display-only")
print()
print("ICP FEATURES (v4.2):")
print("  - Root default 55 Hz (club-ready), sub_amt uncapped to 1.5")
print("  - Chaos attractor XYZ outputs (out3-5, send~ chaos_x/y/z for visuals)")
print("  - Analog clock input (adc~ 3 → edge detect → BPM, clk_enable toggle)")
print("  - User pattern grid: 16x6 matrixctrl → bitmask → arp_mode 15")
print("  - Arp rate max raised to 50 Hz (footwork-ready)")
print("  - grid_bitmask.js converts matrixctrl clicks to us0-us15 params")
