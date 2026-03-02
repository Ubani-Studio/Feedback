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
			50,
			80,
			1100,
			700
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
					"text": "STEP 2.1: LORENZ CHAOS ATTRACTOR\n\nDeterministic chaos at audio rate.\nX=left, Y=right. Sweep rho to find\nperiodic orbits (pitched) vs chaos (noise).\n\n1. Turn on ezdac \u2014 sound starts immediately\n2. Sweep rho: the main timbral control",
					"linecount": 7,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						15.0,
						280.0,
						105.0
					],
					"fontsize": 12.0
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
						140.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ctrl-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 LORENZ PARAMS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						15.0,
						170.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sigma-label",
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
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sigma-num",
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
					"id": "obj-sigma-msg",
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
					"id": "obj-rho-label",
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
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rho-num",
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
					"id": "obj-rho-msg",
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
					"id": "obj-beta-label",
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
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-beta-num",
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
					"id": "obj-beta-msg",
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
					"id": "obj-dt-label",
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
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dt-num",
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
					"id": "obj-dt-msg",
					"maxclass": "message",
					"text": "dt $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						560.0,
						88.0,
						40.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-label",
					"maxclass": "comment",
					"text": "gain",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						640.0,
						38.0,
						40.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-gain-num",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						640.0,
						58.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 3.0
				}
			},
			{
				"box": {
					"id": "obj-gain-msg",
					"maxclass": "message",
					"text": "gain $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						640.0,
						88.0,
						50.0,
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
					"numoutlets": 3,
					"outlettype": [
						"signal",
						"signal",
						"signal"
					],
					"patching_rect": [
						100.0,
						180.0,
						200.0,
						22.0
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
							700,
							500
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
									"numoutlets": 3,
									"outlettype": [
										"",
										"",
										""
									],
									"patching_rect": [
										50.0,
										55.0,
										600.0,
										350.0
									],
									"code": "// LORENZ ATTRACTOR \u2014 audio-rate chaos\n// 4 unrolled Euler steps per sample (no for-loop for compatibility)\n// Noise perturbation prevents fixed-point convergence\n\nParam sigma(10);\nParam rho(28);\nParam beta(2.667);\nParam dt(0.0012);\nParam gain(1.0);\nHistory hx(0.1);\nHistory hy(0);\nHistory hz(0);\n\nrho_mod = rho + in1;\n\n// 4 integration steps per sample (unrolled)\n// effective speed = dt * 4 * samplerate LTU/sec\n// dt=0.0012 -> ~212 LTU/s (audible chaos)\ntx = hx; ty = hy; tz = hz;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * dt; ty += dy * dt; tz += dz * dt;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * dt; ty += dy * dt; tz += dz * dt;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * dt; ty += dy * dt; tz += dz * dt;\n\ndx = sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - beta * tz;\ntx += dx * dt; ty += dy * dt; tz += dz * dt;\n\n// Clamp + noise prevents convergence on fixed points\n// noise() * 0.01 escapes any basin in ~0.2 sec\n// Inaudible: contributes < 0.001 to audio output\nhx = clamp(tx, -100, 100) + noise() * 0.01;\nhy = clamp(ty, -100, 100) + noise() * 0.01;\nhz = clamp(tz, -100, 100) + noise() * 0.01;\n\n// Normalize + soft-limit\n// x ~ +-15 at rho=28, +-55 at rho=166\nout1 = tanh(hx * 0.04 * gain);\nout2 = tanh(hy * 0.03 * gain);\nout3 = tanh(hz * 0.025 * gain);"
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
										430.0,
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
										200.0,
										430.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gout3",
									"maxclass": "newobj",
									"text": "out 3",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										350.0,
										430.0,
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
							},
							{
								"patchline": {
									"source": [
										"obj-gcb",
										2
									],
									"destination": [
										"obj-gout3",
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
					"id": "obj-vol-l",
					"maxclass": "newobj",
					"text": "*~ 0.7",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						100.0,
						240.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-vol-r",
					"maxclass": "newobj",
					"text": "*~ 0.7",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						180.0,
						240.0,
						42.0,
						22.0
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
						300.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-x",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						140.0,
						200.0,
						80.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-x-label",
					"maxclass": "comment",
					"text": "X (chaotic)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						555.0,
						140.0,
						80.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-y",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						230.0,
						200.0,
						80.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-y-label",
					"maxclass": "comment",
					"text": "Y (smoother)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						555.0,
						230.0,
						90.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-z",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						320.0,
						200.0,
						80.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-z-label",
					"maxclass": "comment",
					"text": "Z (slowest)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						555.0,
						320.0,
						80.0,
						20.0
					]
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
						100.0,
						340.0,
						100.0,
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
						100.0,
						365.0,
						100.0,
						18.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-presets",
					"maxclass": "comment",
					"text": "\u2014\u2014 RHO PRESETS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						750.0,
						15.0,
						150.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rho-p1",
					"maxclass": "message",
					"text": "rho 20",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						750.0,
						40.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p1-label",
					"maxclass": "comment",
					"text": "converging (quiet)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						810.0,
						40.0,
						130.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p2",
					"maxclass": "message",
					"text": "rho 24.74",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						750.0,
						68.0,
						65.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p2-label",
					"maxclass": "comment",
					"text": "onset of chaos (edge)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						825.0,
						68.0,
						150.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p3",
					"maxclass": "message",
					"text": "rho 28",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						750.0,
						96.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p3-label",
					"maxclass": "comment",
					"text": "classic chaos",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						810.0,
						96.0,
						100.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p4",
					"maxclass": "message",
					"text": "rho 100",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						750.0,
						124.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p4-label",
					"maxclass": "comment",
					"text": "periodic orbit (pitched!)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						815.0,
						124.0,
						155.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p5",
					"maxclass": "message",
					"text": "rho 166",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						750.0,
						152.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-p5-label",
					"maxclass": "comment",
					"text": "stable periodic (strong pitch)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						815.0,
						152.0,
						180.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-audio-label",
					"maxclass": "comment",
					"text": "L=X  R=Y",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						100.0,
						265.0,
						80.0,
						20.0
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-sigma-num",
						0
					],
					"destination": [
						"obj-sigma-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sigma-msg",
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
						"obj-rho-num",
						0
					],
					"destination": [
						"obj-rho-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rho-msg",
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
						"obj-beta-num",
						0
					],
					"destination": [
						"obj-beta-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-beta-msg",
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
						"obj-dt-num",
						0
					],
					"destination": [
						"obj-dt-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dt-msg",
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
						"obj-gain-num",
						0
					],
					"destination": [
						"obj-gain-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gain-msg",
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
						"obj-vol-l",
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
						"obj-vol-r",
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
						"obj-scope-x",
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
						"obj-scope-y",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gen",
						2
					],
					"destination": [
						"obj-scope-z",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-vol-l",
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
						"obj-vol-r",
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
						"obj-vol-l",
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
						"obj-vol-r",
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
						"obj-rho-p1",
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
						"obj-rho-p2",
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
						"obj-rho-p3",
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
						"obj-rho-p4",
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
						"obj-rho-p5",
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