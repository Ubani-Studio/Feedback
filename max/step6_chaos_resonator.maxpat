{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 8,
			"minor": 6,
			"revision": 0,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			30,
			50,
			1400,
			750
		],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15.0,
			15.0
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"boxes": [
			{
				"box": {
					"id": "obj-title",
					"maxclass": "comment",
					"text": "STEP 2.2: CHAOS RESONATOR\n\nLorenz attractor \u2192 6 waveguide resonators.\nContinuous chaos excitation. No triggers.\nThe attractor IS the energy source.\n\n1. Turn on ezdac \u2014 sound starts immediately\n2. Sweep rho: periodic orbits \u2194 chaos\n3. chaos_gain: energy into resonators\n4. Record with sfrecord~",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						15.0,
						290.0,
						155.0
					],
					"fontsize": 12.0,
					"linecount": 10
				}
			},
			{
				"box": {
					"id": "obj-ezdac",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						185.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "obj-lc-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 LORENZ \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						15.0,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sigma-l",
					"maxclass": "comment",
					"text": "sigma",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						38.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sigma-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						350.0,
						58.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 50.0
				}
			},
			{
				"box": {
					"id": "obj-sigma-m",
					"maxclass": "message",
					"text": "sigma $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						350.0,
						88.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-l",
					"maxclass": "comment",
					"text": "rho",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						420.0,
						38.0,
						40.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rho-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						420.0,
						58.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 200.0
				}
			},
			{
				"box": {
					"id": "obj-rho-m",
					"maxclass": "message",
					"text": "rho $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						420.0,
						88.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-beta-l",
					"maxclass": "comment",
					"text": "beta",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						490.0,
						38.0,
						40.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-beta-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						490.0,
						58.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 20.0
				}
			},
			{
				"box": {
					"id": "obj-beta-m",
					"maxclass": "message",
					"text": "beta $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						490.0,
						88.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dt-l",
					"maxclass": "comment",
					"text": "dt",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						560.0,
						38.0,
						30.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dt-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						560.0,
						58.0,
						65.0,
						22.0
					],
					"minimum": 0.0003,
					"maximum": 0.004
				}
			},
			{
				"box": {
					"id": "obj-dt-m",
					"maxclass": "message",
					"text": "lorenz_dt $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						560.0,
						88.0,
						75.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg-l",
					"maxclass": "comment",
					"text": "chaos",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						645.0,
						38.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cg-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						645.0,
						58.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 0.5
				}
			},
			{
				"box": {
					"id": "obj-cg-m",
					"maxclass": "message",
					"text": "chaos_gain $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						645.0,
						88.0,
						85.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rc-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 RESONATORS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						130.0,
						150.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-root-l",
					"maxclass": "comment",
					"text": "root Hz",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						153.0,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-root-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						350.0,
						173.0,
						60.0,
						22.0
					],
					"minimum": 20.0,
					"maximum": 880.0
				}
			},
			{
				"box": {
					"id": "obj-root-m",
					"maxclass": "message",
					"text": "root $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						350.0,
						203.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-flex-l",
					"maxclass": "comment",
					"text": "flex",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						420.0,
						153.0,
						40.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-flex-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						420.0,
						173.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-flex-m",
					"maxclass": "message",
					"text": "flex $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						420.0,
						203.0,
						48.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mg-l",
					"maxclass": "comment",
					"text": "master",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						490.0,
						153.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-mg-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						490.0,
						173.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 1.5
				}
			},
			{
				"box": {
					"id": "obj-mg-m",
					"maxclass": "message",
					"text": "master_gain $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						490.0,
						203.0,
						90.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gen",
					"maxclass": "newobj",
					"text": "gen~",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						100.0,
						300.0,
						200.0,
						22.0
					],
					"outlettype": [
						"signal",
						"signal"
					],
					"patcher": {
						"fileversion": 1,
						"appversion": {
							"major": 8,
							"minor": 6,
							"revision": 0,
							"architecture": "x64",
							"modernui": 1
						},
						"rect": [
							100,
							100,
							900,
							700
						],
						"editing_bgcolor": [
							0.65,
							0.65,
							0.65,
							1.0
						],
						"bglocked": 0,
						"openinpresentation": 0,
						"default_fontsize": 12.0,
						"default_fontname": "Arial",
						"gridonopen": 1,
						"gridsize": [
							15.0,
							15.0
						],
						"gridsnaponopen": 1,
						"toolbarvisible": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-gin1",
									"maxclass": "newobj",
									"text": "in 1",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										50.0,
										15.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gcb",
									"maxclass": "codebox",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										50.0,
										55.0,
										750.0,
										550.0
									],
									"code": "// CHAOS RESONATOR \u2014 Lorenz -> 6 Waveguide Resonators\n// Project 1: Feedback Instrument (core)\n//\n// Smooth pitch glides between presets.\n// tanh() in feedback = self-limiting.\n// Noise perturbation prevents convergence.\n// Reset button reinitializes system.\n\n// === Declarations ===\nParam sigma(10);\nParam rho(28);\nParam beta(2.667);\nParam lorenz_dt(0.0012);\nParam chaos_gain(0.01);\nParam root(110);\nParam flex(0.5);\nParam master_gain(0.7);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);\nParam deg4(4);\nParam deg5(0);\nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam glide(0.001);\nParam reset(0);\nHistory lx(0.1);\nHistory ly(0);\nHistory lz(0);\nHistory r1_pd(0);\nHistory r2_pd(0);\nHistory r3_pd(0);\nHistory r4_pd(0);\nHistory r5_pd(0);\nHistory r6_pd(0);\nHistory r1_sdl(0);\nHistory r2_sdl(0);\nHistory r3_sdl(0);\nHistory r4_sdl(0);\nHistory r5_sdl(0);\nHistory r6_sdl(0);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\n\n// === RESET ===\n// While reset=1, state held at initial conditions\n// Button sends reset 1, delay 100ms, reset 0\n\n// === LORENZ ATTRACTOR (4 unrolled steps) ===\nrho_mod = rho + in1;\ntx = lx; ty = ly; tz = lz;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * lorenz_dt; ty += dy * lorenz_dt; tz += dz * lorenz_dt;\n\n// Clamp + noise or reset\nlx = (reset > 0.5) ? 0.1 : clamp(tx, -100, 100) + noise() * 0.01;\nly = (reset > 0.5) ? 0.0 : clamp(ty, -100, 100) + noise() * 0.01;\nlz = (reset > 0.5) ? 0.0 : clamp(tz, -100, 100) + noise() * 0.01;\n\n// Normalize chaos to ~+-1\ncx = lx * 0.05;\ncy = ly * 0.04;\ncz = (lz - 25) * 0.04;\n\n// Chaos -> excitation\nexc1 = cx * chaos_gain;\nexc2 = cy * chaos_gain;\nexc3 = cz * chaos_gain;\nexc4 = cx * chaos_gain;\nexc5 = cy * chaos_gain;\nexc6 = cz * chaos_gain;\n\n// === YORUBA TUNING ===\npyth_0 = 1.0; pyth_1 = 1.125; pyth_2 = 1.265625; pyth_3 = 1.5; pyth_4 = 1.6875;\njust_0 = 1.0; just_1 = 1.111111; just_2 = 1.25; just_3 = 1.5; just_4 = 1.666667;\nyor_0 = 1.0;\nyor_1 = pyth_1 * (1-flex) + just_1 * flex;\nyor_2 = pyth_2 * (1-flex) + just_2 * flex;\nyor_3 = 1.5;\nyor_4 = pyth_4 * (1-flex) + just_4 * flex;\n\n// === Voice 1: Sub Bass (iya ilu) bright=0.2 ===\ndeg1_w = mod(floor(deg1), 5);\noct1_x = floor(deg1 / 5);\nr1_rat = (deg1_w==0)?yor_0:(deg1_w==1)?yor_1:(deg1_w==2)?yor_2:(deg1_w==3)?yor_3:yor_4;\nr1_freq = root * r1_rat * pow(2.0, oct1 + oct1_x);\nr1_target = samplerate / max(r1_freq, 20);\nr1_sdl = (r1_sdl < 1) ? r1_target : r1_sdl + (r1_target - r1_sdl) * glide;\nr1_del = r1_d.read(r1_sdl);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_filt = r1_del * 0.2 + r1_avg * 0.8;\nr1_out = tanh(r1_filt) * 0.9995;\nr1_d.write(exc1 + r1_out);\n\n// === Voice 2: Body (omele) bright=0.4 ===\ndeg2_w = mod(floor(deg2), 5);\noct2_x = floor(deg2 / 5);\nr2_rat = (deg2_w==0)?yor_0:(deg2_w==1)?yor_1:(deg2_w==2)?yor_2:(deg2_w==3)?yor_3:yor_4;\nr2_freq = root * r2_rat * pow(2.0, oct2 + oct2_x);\nr2_target = samplerate / max(r2_freq, 20);\nr2_sdl = (r2_sdl < 1) ? r2_target : r2_sdl + (r2_target - r2_sdl) * glide;\nr2_del = r2_d.read(r2_sdl);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_filt = r2_del * 0.4 + r2_avg * 0.6;\nr2_out = tanh(r2_filt) * 0.998;\nr2_d.write(exc2 + r2_out);\n\n// === Voice 3: Metallic (ogene) bright=0.85 ===\ndeg3_w = mod(floor(deg3), 5);\noct3_x = floor(deg3 / 5);\nr3_rat = (deg3_w==0)?yor_0:(deg3_w==1)?yor_1:(deg3_w==2)?yor_2:(deg3_w==3)?yor_3:yor_4;\nr3_freq = root * r3_rat * pow(2.0, oct3 + oct3_x);\nr3_target = samplerate / max(r3_freq, 20);\nr3_sdl = (r3_sdl < 1) ? r3_target : r3_sdl + (r3_target - r3_sdl) * glide;\nr3_del = r3_d.read(r3_sdl);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_filt = r3_del * 0.85 + r3_avg * 0.15;\nr3_out = tanh(r3_filt) * 0.996;\nr3_d.write(exc3 + r3_out);\n\n// === Voice 4: Transient (gudugudu) bright=0.9 ===\ndeg4_w = mod(floor(deg4), 5);\noct4_x = floor(deg4 / 5);\nr4_rat = (deg4_w==0)?yor_0:(deg4_w==1)?yor_1:(deg4_w==2)?yor_2:(deg4_w==3)?yor_3:yor_4;\nr4_freq = root * r4_rat * pow(2.0, oct4 + oct4_x);\nr4_target = samplerate / max(r4_freq, 20);\nr4_sdl = (r4_sdl < 1) ? r4_target : r4_sdl + (r4_target - r4_sdl) * glide;\nr4_del = r4_d.read(r4_sdl);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_filt = r4_del * 0.9 + r4_avg * 0.1;\nr4_out = tanh(r4_filt) * 0.97;\nr4_d.write(exc4 + r4_out);\n\n// === Voice 5: Drone bright=0.3 ===\ndeg5_w = mod(floor(deg5), 5);\noct5_x = floor(deg5 / 5);\nr5_rat = (deg5_w==0)?yor_0:(deg5_w==1)?yor_1:(deg5_w==2)?yor_2:(deg5_w==3)?yor_3:yor_4;\nr5_freq = root * r5_rat * pow(2.0, oct5 + oct5_x);\nr5_target = samplerate / max(r5_freq, 20);\nr5_sdl = (r5_sdl < 1) ? r5_target : r5_sdl + (r5_target - r5_sdl) * glide;\nr5_del = r5_d.read(r5_sdl);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_filt = r5_del * 0.3 + r5_avg * 0.7;\nr5_out = tanh(r5_filt) * 0.9998;\nr5_d.write(exc5 + r5_out);\n\n// === Voice 6: Crystalline (shekere) bright=0.95 ===\ndeg6_w = mod(floor(deg6), 5);\noct6_x = floor(deg6 / 5);\nr6_rat = (deg6_w==0)?yor_0:(deg6_w==1)?yor_1:(deg6_w==2)?yor_2:(deg6_w==3)?yor_3:yor_4;\nr6_freq = root * r6_rat * pow(2.0, oct6 + oct6_x);\nr6_target = samplerate / max(r6_freq, 20);\nr6_sdl = (r6_sdl < 1) ? r6_target : r6_sdl + (r6_target - r6_sdl) * glide;\nr6_del = r6_d.read(r6_sdl);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_filt = r6_del * 0.95 + r6_avg * 0.05;\nr6_out = tanh(r6_filt) * 0.994;\nr6_d.write(exc6 + r6_out);\n\n// === STEREO MIX ===\nleft = r1_out * 0.7 + r2_out * 0.5 + r3_out * 0.2 + r4_out * 0.4 + r5_out * 0.6 + r6_out * 0.3;\nright = r1_out * 0.3 + r2_out * 0.5 + r3_out * 0.8 + r4_out * 0.6 + r5_out * 0.4 + r6_out * 0.7;\nout1 = tanh(left) * master_gain;\nout2 = tanh(right) * master_gain;"
								}
							},
							{
								"box": {
									"id": "obj-gout1",
									"maxclass": "newobj",
									"text": "out 1",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										50.0,
										625.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gout2",
									"maxclass": "newobj",
									"text": "out 2",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										250.0,
										625.0,
										35.0,
										22.0
									]
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"source": [
										"obj-gin1",
										0
									],
									"destination": [
										"obj-gcb",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gcb",
										0
									],
									"destination": [
										"obj-gout1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gcb",
										1
									],
									"destination": [
										"obj-gout2",
										0
									]
								}
							}
						]
					}
				}
			},
			{
				"box": {
					"id": "obj-gain-l",
					"maxclass": "newobj",
					"text": "*~ 0.8",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						100.0,
						370.0,
						42.0,
						22.0
					],
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-r",
					"maxclass": "newobj",
					"text": "*~ 0.8",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						180.0,
						370.0,
						42.0,
						22.0
					],
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "obj-dac",
					"maxclass": "newobj",
					"text": "dac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						100.0,
						500.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 RECORD \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						100.0,
						540.0,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rec-open",
					"maxclass": "message",
					"text": "open",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						100.0,
						565.0,
						40.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						150.0,
						565.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-hint",
					"maxclass": "comment",
					"text": "record",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						178.0,
						568.0,
						50.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-sfrecord",
					"maxclass": "newobj",
					"text": "sfrecord~ 2",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						100.0,
						600.0,
						80.0,
						22.0
					],
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-tip",
					"maxclass": "comment",
					"text": "Click 'open' to choose WAV file,\nthen toggle record on/off.",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						100.0,
						628.0,
						200.0,
						35.0
					],
					"fontsize": 11.0,
					"linecount": 2
				}
			},
			{
				"box": {
					"id": "obj-scope-l",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						300.0,
						180.0,
						70.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-r",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						380.0,
						180.0,
						70.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sl",
					"maxclass": "comment",
					"text": "L",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						535.0,
						300.0,
						20.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sr",
					"maxclass": "comment",
					"text": "R",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						535.0,
						380.0,
						20.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-meter-l",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						350.0,
						460.0,
						180.0,
						18.0
					]
				}
			},
			{
				"box": {
					"id": "obj-meter-r",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						350.0,
						485.0,
						180.0,
						18.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 RHO PRESETS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						15.0,
						160.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rp1",
					"maxclass": "message",
					"text": "rho 20",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						40.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp1-l",
					"maxclass": "comment",
					"text": "converging (quiet)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						765.0,
						40.0,
						180.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp2",
					"maxclass": "message",
					"text": "rho 24.74",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						68.0,
						73.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp2-l",
					"maxclass": "comment",
					"text": "onset of chaos (edge)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						783.0,
						68.0,
						180.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp3",
					"maxclass": "message",
					"text": "rho 28",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						96.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp3-l",
					"maxclass": "comment",
					"text": "classic chaos",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						765.0,
						96.0,
						180.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp4",
					"maxclass": "message",
					"text": "rho 100",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						124.0,
						59.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp4-l",
					"maxclass": "comment",
					"text": "periodic orbit (pitched!)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						769.0,
						124.0,
						180.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp5",
					"maxclass": "message",
					"text": "rho 166",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						152.0,
						59.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp5-l",
					"maxclass": "comment",
					"text": "stable periodic (strong pitch)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						769.0,
						152.0,
						180.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp6",
					"maxclass": "message",
					"text": "rho 50",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						180.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp6-l",
					"maxclass": "comment",
					"text": "intermittent bursts",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						765.0,
						180.0,
						180.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 CHAOS GAIN \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						220.0,
						160.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cg1",
					"maxclass": "message",
					"text": "chaos_gain 0.002",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						243.0,
						115.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg1-l",
					"maxclass": "comment",
					"text": "whisper (barely breathing)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						825.0,
						243.0,
						200.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cg2",
					"maxclass": "message",
					"text": "chaos_gain 0.005",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						268.0,
						115.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg2-l",
					"maxclass": "comment",
					"text": "gentle (pitched resonance)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						825.0,
						268.0,
						200.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cg3",
					"maxclass": "message",
					"text": "chaos_gain 0.01",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						293.0,
						108.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg3-l",
					"maxclass": "comment",
					"text": "balanced (default)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						818.0,
						293.0,
						200.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cg4",
					"maxclass": "message",
					"text": "chaos_gain 0.03",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						318.0,
						108.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg4-l",
					"maxclass": "comment",
					"text": "aggressive (saturated)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						818.0,
						318.0,
						200.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cg5",
					"maxclass": "message",
					"text": "chaos_gain 0.1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						343.0,
						108.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg5-l",
					"maxclass": "comment",
					"text": "full (heavy distortion)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						818.0,
						343.0,
						200.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 CHORD PRESETS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						385.0,
						170.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cp1",
					"maxclass": "message",
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -1, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						410.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp1-l",
					"maxclass": "comment",
					"text": "Default Yoruba (pentatonic spread)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						432.0,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp2",
					"maxclass": "message",
					"text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -2, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						440.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp2-l",
					"maxclass": "comment",
					"text": "Root Cluster (unison across octaves)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						462.0,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp3",
					"maxclass": "message",
					"text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						470.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp3-l",
					"maxclass": "comment",
					"text": "Open Fifths (root + fifth stacked)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						492.0,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp4",
					"maxclass": "message",
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -2, oct2 -2, oct3 -1, oct4 -1, oct5 -2, oct6 -1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						500.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp4-l",
					"maxclass": "comment",
					"text": "Sub Drone (everything low)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						522.0,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-voices",
					"maxclass": "comment",
					"text": "VOICES (chaos routing):\n1 Sub Bass (iya ilu) \u2190 X axis\n2 Body (omele) \u2190 Y axis\n3 Metallic (ogene) \u2190 Z axis\n4 Transient (gudugudu) \u2190 X axis\n5 Drone \u2190 Y axis\n6 Crystalline (shekere) \u2190 Z axis",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						650.0,
						280.0,
						115.0
					],
					"fontsize": 11.0,
					"linecount": 8
				}
			},
			{
				"box": {
					"id": "obj-ar-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 AFRICAN ROOTS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						570.0,
						170.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ar0",
					"maxclass": "message",
					"text": "root 55",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						593.0,
						59.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar0-l",
					"maxclass": "comment",
					"text": "Sub \u2014 deep ceremonial drum",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						767.0,
						593.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar1",
					"maxclass": "message",
					"text": "root 73",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						621.0,
						59.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar1-l",
					"maxclass": "comment",
					"text": "Bata \u2014 sacred drum register",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						767.0,
						621.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar2",
					"maxclass": "message",
					"text": "root 110",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						649.0,
						66.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar2-l",
					"maxclass": "comment",
					"text": "Dundun \u2014 talking drum (default)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						774.0,
						649.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar3",
					"maxclass": "message",
					"text": "root 131",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						677.0,
						66.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar3-l",
					"maxclass": "comment",
					"text": "Mbira \u2014 thumb piano",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						774.0,
						677.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar4",
					"maxclass": "message",
					"text": "root 165",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						705.0,
						66.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar4-l",
					"maxclass": "comment",
					"text": "Kora \u2014 West African harp",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						774.0,
						705.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar5",
					"maxclass": "message",
					"text": "root 220",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						733.0,
						66.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar5-l",
					"maxclass": "comment",
					"text": "Balafon \u2014 wooden xylophone",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						774.0,
						733.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar6",
					"maxclass": "message",
					"text": "root 330",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						761.0,
						66.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar6-l",
					"maxclass": "comment",
					"text": "Shekere \u2014 bright upper register",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						774.0,
						761.0,
						220.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-glide-l",
					"maxclass": "comment",
					"text": "glide",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						560.0,
						153.0,
						40.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-glide-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						560.0,
						173.0,
						60.0,
						22.0
					],
					"minimum": 0.0001,
					"maximum": 0.05
				}
			},
			{
				"box": {
					"id": "obj-glide-m",
					"maxclass": "message",
					"text": "glide $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						560.0,
						203.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp1",
					"maxclass": "message",
					"text": "glide 0.0002",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						630.0,
						173.0,
						85.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp1-l",
					"maxclass": "comment",
					"text": "slow (portamento)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						173.0,
						120.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp2",
					"maxclass": "message",
					"text": "glide 0.001",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						630.0,
						198.0,
						75.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp2-l",
					"maxclass": "comment",
					"text": "default (~22ms)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710.0,
						198.0,
						110.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp3",
					"maxclass": "message",
					"text": "glide 0.01",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						630.0,
						223.0,
						70.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp3-l",
					"maxclass": "comment",
					"text": "fast (snap)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						705.0,
						223.0,
						100.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-btn",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						15.0,
						250.0,
						35.0,
						35.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-label",
					"maxclass": "comment",
					"text": "RESET",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						55.0,
						257.0,
						50.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-reset-on",
					"maxclass": "message",
					"text": "reset 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						15.0,
						295.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-del",
					"maxclass": "newobj",
					"text": "delay 100",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						75.0,
						295.0,
						65.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-off",
					"maxclass": "message",
					"text": "reset 0",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						75.0,
						320.0,
						50.0,
						22.0
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-sigma-n",
						0
					],
					"destination": [
						"obj-sigma-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sigma-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rho-n",
						0
					],
					"destination": [
						"obj-rho-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rho-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beta-n",
						0
					],
					"destination": [
						"obj-beta-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beta-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dt-n",
						0
					],
					"destination": [
						"obj-dt-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dt-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg-n",
						0
					],
					"destination": [
						"obj-cg-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-n",
						0
					],
					"destination": [
						"obj-root-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-n",
						0
					],
					"destination": [
						"obj-flex-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mg-n",
						0
					],
					"destination": [
						"obj-mg-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mg-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						0
					],
					"destination": [
						"obj-gain-l",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						1
					],
					"destination": [
						"obj-gain-r",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-r",
						0
					],
					"destination": [
						"obj-dac",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-open",
						0
					],
					"destination": [
						"obj-sfrecord",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rec-tog",
						0
					],
					"destination": [
						"obj-sfrecord",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-sfrecord",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-r",
						0
					],
					"destination": [
						"obj-sfrecord",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						0
					],
					"destination": [
						"obj-scope-l",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						1
					],
					"destination": [
						"obj-scope-r",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-meter-l",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-r",
						0
					],
					"destination": [
						"obj-meter-r",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp1",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp2",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp3",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp4",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp5",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rp6",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg1",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg2",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg3",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg4",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cg5",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp1",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp2",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp3",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cp4",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar0",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar1",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar2",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar3",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar4",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar5",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ar6",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-glide-n",
						0
					],
					"destination": [
						"obj-glide-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-glide-m",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gp1",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gp2",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gp3",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-btn",
						0
					],
					"destination": [
						"obj-reset-on",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-btn",
						0
					],
					"destination": [
						"obj-reset-del",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-on",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-del",
						0
					],
					"destination": [
						"obj-reset-off",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reset-off",
						0
					],
					"destination": [
						"obj-gen",
						0
					]
				}
			}
		]
	}
}