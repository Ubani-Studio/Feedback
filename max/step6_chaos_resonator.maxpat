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
			34,
			76,
			1469,
			2050
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
					"numinlets": 1,
					"numoutlets": 0,
					"text": "CHAOS RESONATOR v4\n\n5 attractors → 6 waveguide resonators.\nBlend / Modulate / Route combining.\n19 African tuning systems. Arpeggiator.\nADSR. African patterns. BPM sync.\nMIDI clock. Scale-degree transpose.\n\n1. Turn on ezdac\n2. Choose attractor(s) + combine mode\n3. Connect MIDI clock (RYTM etc)\n4. STOP = click-free mute",
					"patching_rect": [
						15.0,
						15.0,
						280.0,
						195.0
					],
					"fontsize": 12.0,
					"linecount": 11
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
						210.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mute-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						75.0,
						215.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mute-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "STOP",
					"patching_rect": [
						110.0,
						220.0,
						45.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-mute-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "mute $1",
					"patching_rect": [
						75.0,
						250.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-mute",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						140.0,
						250.0,
						52.0,
						22.0
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
					"patching_rect": [
						15.0,
						280.0,
						30.0,
						30.0
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-reset-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "RESET",
					"patching_rect": [
						50.0,
						285.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-reset-on",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "reset 1",
					"patching_rect": [
						15.0,
						318.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-del",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "delay 100",
					"patching_rect": [
						75.0,
						318.0,
						65.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reset-off",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "reset 0",
					"patching_rect": [
						75.0,
						345.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-reset",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						15.0,
						370.0,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sm-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "smooth:",
					"patching_rect": [
						15.0,
						398.0,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sm-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "smooth_speed 0",
					"patching_rect": [
						70,
						398.0,
						32,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sm-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "smooth_speed 1",
					"patching_rect": [
						106,
						398.0,
						38,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sm-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "smooth_speed 2",
					"patching_rect": [
						148,
						398.0,
						36,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sm-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "smooth_speed 3",
					"patching_rect": [
						188,
						398.0,
						38,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-smooth",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						70.0,
						423.0,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-voices",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "VOICES (Main/Layer):\n1 Sub Bass (iya ilu) ← X\n2 Body (omele) ← Y\n3 Metallic (ogene) ← Z\n4 Transient (gudugudu) ← X (route)\n5 Drone ← Y (route)\n6 Crystalline (shekere) ← Z (route)",
					"patching_rect": [
						15.0,
						450.0,
						260.0,
						105.0
					],
					"fontsize": 11.0,
					"linecount": 7
				}
			},
			{
				"box": {
					"id": "obj-midi-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— LIVE / MIDI ——",
					"patching_rect": [
						15.0,
						565.0,
						160.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-midi",
					"maxclass": "newobj",
					"text": "p midi_sync",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						15.0,
						588.0,
						80.0,
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
							200,
							200,
							450,
							420
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
									"id": "m-in",
									"maxclass": "newobj",
									"text": "midiin",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										30.0,
										30.0,
										42.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-sel",
									"maxclass": "newobj",
									"text": "select 248 250 252",
									"numinlets": 1,
									"numoutlets": 4,
									"outlettype": [
										"bang",
										"bang",
										"bang",
										""
									],
									"patching_rect": [
										30.0,
										60.0,
										110.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-ctr",
									"maxclass": "newobj",
									"text": "counter 0 5",
									"numinlets": 5,
									"numoutlets": 3,
									"outlettype": [
										"int",
										"bang",
										"bang"
									],
									"patching_rect": [
										30.0,
										95.0,
										68.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-tmr",
									"maxclass": "newobj",
									"text": "timer",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"float"
									],
									"patching_rect": [
										30.0,
										125.0,
										38.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-bpm",
									"maxclass": "newobj",
									"text": "!/ 15000.",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"float"
									],
									"patching_rect": [
										30.0,
										155.0,
										62.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-clip",
									"maxclass": "newobj",
									"text": "clip 30. 300.",
									"numinlets": 3,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										185.0,
										75.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-slide",
									"maxclass": "newobj",
									"text": "slide 5 5",
									"numinlets": 3,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										215.0,
										55.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-chg",
									"maxclass": "newobj",
									"text": "change",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										"bang"
									],
									"patching_rect": [
										30.0,
										245.0,
										48.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-bpm-msg",
									"maxclass": "message",
									"text": "arp_bpm $1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										275.0,
										68.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-trig",
									"maxclass": "newobj",
									"text": "t b b",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										175.0,
										95.0,
										33.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-unmute",
									"maxclass": "message",
									"text": "mute 0",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										175.0,
										125.0,
										42.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-rst-on",
									"maxclass": "message",
									"text": "arp_reset 1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										230.0,
										125.0,
										70.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-rst-del",
									"maxclass": "newobj",
									"text": "delay 50",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										230.0,
										155.0,
										52.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-rst-off",
									"maxclass": "message",
									"text": "arp_reset 0",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										230.0,
										185.0,
										70.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-stop",
									"maxclass": "message",
									"text": "mute 1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										330.0,
										95.0,
										42.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-send",
									"maxclass": "newobj",
									"text": "s toGen",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										310.0,
										50.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-out1",
									"maxclass": "newobj",
									"text": "out 1",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										120.0,
										310.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "m-label1",
									"maxclass": "comment",
									"text": "MIDI Clock → BPM sync\nStart = unmute + phase reset\nStop = mute",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										340.0,
										200.0,
										50.0
									],
									"fontsize": 10.0,
									"linecount": 3
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"source": [
										"m-in",
										0
									],
									"destination": [
										"m-sel",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-sel",
										0
									],
									"destination": [
										"m-ctr",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-ctr",
										1
									],
									"destination": [
										"m-tmr",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-tmr",
										0
									],
									"destination": [
										"m-bpm",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-bpm",
										0
									],
									"destination": [
										"m-clip",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-clip",
										0
									],
									"destination": [
										"m-slide",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-slide",
										0
									],
									"destination": [
										"m-chg",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-chg",
										0
									],
									"destination": [
										"m-bpm-msg",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-bpm-msg",
										0
									],
									"destination": [
										"m-send",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-chg",
										0
									],
									"destination": [
										"m-out1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-sel",
										1
									],
									"destination": [
										"m-trig",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-trig",
										0
									],
									"destination": [
										"m-unmute",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-trig",
										1
									],
									"destination": [
										"m-rst-on",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-unmute",
										0
									],
									"destination": [
										"m-send",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-rst-on",
										0
									],
									"destination": [
										"m-send",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-rst-on",
										0
									],
									"destination": [
										"m-rst-del",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-rst-del",
										0
									],
									"destination": [
										"m-rst-off",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-rst-off",
										0
									],
									"destination": [
										"m-send",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-sel",
										2
									],
									"destination": [
										"m-stop",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"m-stop",
										0
									],
									"destination": [
										"m-send",
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
					"id": "obj-bpm-disp",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						100.0,
						588.0,
						50.0,
						22.0
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-bpm-disp-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "BPM",
					"patching_rect": [
						155.0,
						591.0,
						30.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-lc-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— LORENZ ——",
					"patching_rect": [
						381,
						24.0,
						160.0,
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
					"numinlets": 1,
					"numoutlets": 0,
					"text": "sigma",
					"patching_rect": [
						381,
						44.0,
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
					"patching_rect": [
						381,
						64.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 50
				}
			},
			{
				"box": {
					"id": "obj-sigma-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "sigma $1",
					"patching_rect": [
						381,
						89.0,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rho-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "rho",
					"patching_rect": [
						446,
						44.0,
						50.0,
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
					"patching_rect": [
						446,
						64.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 200
				}
			},
			{
				"box": {
					"id": "obj-rho-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho $1",
					"patching_rect": [
						446,
						89.0,
						45,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-beta-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "beta",
					"patching_rect": [
						501,
						44.0,
						50.0,
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
					"patching_rect": [
						501,
						64.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 20
				}
			},
			{
				"box": {
					"id": "obj-beta-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "beta $1",
					"patching_rect": [
						501,
						89.0,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dt-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "dt",
					"patching_rect": [
						566,
						44.0,
						50.0,
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
					"patching_rect": [
						566,
						64.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0003,
					"maximum": 0.004
				}
			},
			{
				"box": {
					"id": "obj-dt-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "lorenz_dt $1",
					"patching_rect": [
						566,
						89.0,
						78,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cg-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "chaos",
					"patching_rect": [
						656,
						44.0,
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
					"patching_rect": [
						656,
						64.0,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 0.5
				}
			},
			{
				"box": {
					"id": "obj-cg-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain $1",
					"patching_rect": [
						656,
						89.0,
						85,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-lor",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						581,
						114.0,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ATTRACTOR ——",
					"patching_rect": [
						381,
						124,
						160.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-att-a-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Main:",
					"patching_rect": [
						381,
						149,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-att-a-lbl-lor",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Lorenz",
					"patching_rect": [
						444,
						149,
						55.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-a-lbl-ros",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Rossler",
					"patching_rect": [
						507,
						149,
						55.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-a-lbl-chu",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Chua",
					"patching_rect": [
						570,
						149,
						55.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-a-lbl-hal",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Halv",
					"patching_rect": [
						633,
						149,
						55.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-a-lbl-aiz",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Aizawa",
					"patching_rect": [
						719,
						149,
						55.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-a-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 0",
					"patching_rect": [
						444,
						167,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-a-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 1",
					"patching_rect": [
						507,
						167,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-a-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 2",
					"patching_rect": [
						570,
						167,
						45,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-a-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 3",
					"patching_rect": [
						633,
						167,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-a-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 4",
					"patching_rect": [
						719,
						167,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-b-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Layer:",
					"patching_rect": [
						381,
						199,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-att-b-lbl-off",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Off",
					"patching_rect": [
						444,
						199,
						42.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-b-lbl-lor",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Lor",
					"patching_rect": [
						486,
						199,
						42.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-b-lbl-ros",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Ross",
					"patching_rect": [
						539,
						199,
						42.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-b-lbl-chu",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Chua",
					"patching_rect": [
						592,
						199,
						42.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-b-lbl-hal",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Halv",
					"patching_rect": [
						639,
						199,
						42.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-b-lbl-aiz",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Aiz",
					"patching_rect": [
						719,
						199,
						42.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-att-b--1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_b_sel -1",
					"patching_rect": [
						444,
						217,
						38,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-b-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_b_sel 0",
					"patching_rect": [
						486,
						217,
						48,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-b-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_b_sel 1",
					"patching_rect": [
						539,
						217,
						48,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-b-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_b_sel 2",
					"patching_rect": [
						592,
						217,
						42,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-b-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_b_sel 3",
					"patching_rect": [
						639,
						217,
						48,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-att-b-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_b_sel 4",
					"patching_rect": [
						719,
						217,
						45,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cm-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Combine:",
					"patching_rect": [
						381,
						249,
						65.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cm-lbl-ble",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Blend",
					"patching_rect": [
						444,
						249,
						60.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-cm-lbl-mod",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Modulate",
					"patching_rect": [
						529,
						249,
						60.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-cm-lbl-rou",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Route",
					"patching_rect": [
						633,
						249,
						60.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-cm-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "combine_mode 0",
					"patching_rect": [
						444,
						267,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cm-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "combine_mode 1",
					"patching_rect": [
						529,
						267,
						75,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cm-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "combine_mode 2",
					"patching_rect": [
						633,
						267,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cm-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Blend=crossfade  Modulate=AM  Route=split voices",
					"patching_rect": [
						444,
						292,
						320.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-bmix-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "blend mix:",
					"patching_rect": [
						381,
						312,
						65.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-bmix-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						451,
						312,
						48.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-bmix-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "blend_mix $1",
					"patching_rect": [
						451,
						337,
						78.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mdep-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "mod depth:",
					"patching_rect": [
						551,
						312,
						65.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-mdep-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						621,
						312,
						48.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 2.0
				}
			},
			{
				"box": {
					"id": "obj-mdep-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "mod_depth $1",
					"patching_rect": [
						621,
						337,
						78.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-atp-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Character:",
					"patching_rect": [
						381,
						372,
						75.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-atp-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "per-attractor tuning",
					"patching_rect": [
						461,
						372,
						150.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-ross_c-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "ross c",
					"patching_rect": [
						400,
						392,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ross_c-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						400,
						412,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 1,
					"maximum": 20
				}
			},
			{
				"box": {
					"id": "obj-ross_c-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "ross_c $1",
					"patching_rect": [
						400,
						437,
						62,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-chua_a-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "chua α",
					"patching_rect": [
						485,
						392,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-chua_a-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						485,
						412,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 5,
					"maximum": 30
				}
			},
			{
				"box": {
					"id": "obj-chua_a-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chua_alpha $1",
					"patching_rect": [
						485,
						437,
						82,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-halv_a-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "halv a",
					"patching_rect": [
						585,
						392,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-halv_a-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						585,
						412,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.5,
					"maximum": 5
				}
			},
			{
				"box": {
					"id": "obj-halv_a-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "halv_a $1",
					"patching_rect": [
						585,
						437,
						62,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-aizc-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "aiz c",
					"patching_rect": [
						400,
						467,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-aizc-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						400,
						487,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.1,
					"maximum": 2
				}
			},
			{
				"box": {
					"id": "obj-aizc-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "aiz_c $1",
					"patching_rect": [
						400,
						512,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-aizd-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "aiz d",
					"patching_rect": [
						485,
						467,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-aizd-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						485,
						487,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 1,
					"maximum": 10
				}
			},
			{
				"box": {
					"id": "obj-aizd-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "aiz_d $1",
					"patching_rect": [
						485,
						512,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-att",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						581,
						544,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rc-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— RESONATORS ——",
					"patching_rect": [
						381,
						560,
						150.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-flex-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "flex",
					"patching_rect": [
						476,
						582,
						55.0,
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
					"patching_rect": [
						476,
						602,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 1
				}
			},
			{
				"box": {
					"id": "obj-flex-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "flex $1",
					"patching_rect": [
						476,
						627,
						48,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mg-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "master",
					"patching_rect": [
						551,
						582,
						55.0,
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
					"patching_rect": [
						551,
						602,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 1.5
				}
			},
			{
				"box": {
					"id": "obj-mg-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "master_gain $1",
					"patching_rect": [
						551,
						627,
						95,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-glide-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "glide",
					"patching_rect": [
						651,
						582,
						55.0,
						20.0
					],
					"fontsize": 12.0,
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
					"patching_rect": [
						651,
						602,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0001,
					"maximum": 0.05
				}
			},
			{
				"box": {
					"id": "obj-glide-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide $1",
					"patching_rect": [
						651,
						627,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-root-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "root",
					"patching_rect": [
						381,
						582,
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
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						381,
						602,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 20,
					"maximum": 500
				}
			},
			{
				"box": {
					"id": "obj-root-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root $1",
					"patching_rect": [
						381,
						627,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-root-snap",
					"maxclass": "newobj",
					"text": "p root_snap",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						15.0,
						620.0,
						78.0,
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
							300,
							200,
							450,
							320
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
									"id": "rs-in1",
									"maxclass": "newobj",
									"text": "in 1",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										200.0,
										15.0,
										30.0,
										22.0
									],
									"comment": "value from intnum (every change)"
								}
							},
							{
								"box": {
									"id": "rs-in2",
									"maxclass": "newobj",
									"text": "in 2",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										350.0,
										15.0,
										30.0,
										22.0
									],
									"comment": "snap toggle 0/1"
								}
							},
							{
								"box": {
									"id": "rs-recv",
									"maxclass": "newobj",
									"text": "r toGen",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										15.0,
										50.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-route",
									"maxclass": "newobj",
									"text": "route root",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										30.0,
										50.0,
										68.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-t1",
									"maxclass": "newobj",
									"text": "t i i",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"int",
										"int"
									],
									"patching_rect": [
										30.0,
										85.0,
										33.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-home",
									"maxclass": "newobj",
									"text": "i 110",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										140.0,
										120.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-set",
									"maxclass": "newobj",
									"text": "prepend set",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										155.0,
										72.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-out1",
									"maxclass": "newobj",
									"text": "out 1",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										190.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-tbi",
									"maxclass": "newobj",
									"text": "t b i",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"int"
									],
									"patching_rect": [
										200.0,
										55.0,
										33.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-inv",
									"maxclass": "newobj",
									"text": "!- 1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										350.0,
										55.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-hgate",
									"maxclass": "newobj",
									"text": "gate 1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										200.0,
										90.0,
										42.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-del",
									"maxclass": "newobj",
									"text": "delay 400",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										270.0,
										90.0,
										55.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-gate",
									"maxclass": "newobj",
									"text": "gate 1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										350.0,
										90.0,
										42.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-t2",
									"maxclass": "newobj",
									"text": "t i i",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"int",
										"int"
									],
									"patching_rect": [
										200.0,
										155.0,
										33.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-rootmsg",
									"maxclass": "newobj",
									"text": "prepend root",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										200.0,
										190.0,
										78.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-send",
									"maxclass": "newobj",
									"text": "s toGen",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										200.0,
										225.0,
										50.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "rs-label",
									"maxclass": "comment",
									"text": "Root snap-back v2\nSnap OFF: values update home\nSnap ON: 400ms after release → snap to home\nPresets always update home",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										250.0,
										250.0,
										60.0
									],
									"fontsize": 10.0,
									"linecount": 4
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"source": [
										"rs-recv",
										0
									],
									"destination": [
										"rs-route",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-route",
										0
									],
									"destination": [
										"rs-t1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-t1",
										1
									],
									"destination": [
										"rs-home",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-t1",
										0
									],
									"destination": [
										"rs-set",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-set",
										0
									],
									"destination": [
										"rs-out1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-in2",
										0
									],
									"destination": [
										"rs-gate",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-in2",
										0
									],
									"destination": [
										"rs-inv",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-inv",
										0
									],
									"destination": [
										"rs-hgate",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-in1",
										0
									],
									"destination": [
										"rs-tbi",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-tbi",
										1
									],
									"destination": [
										"rs-hgate",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-hgate",
										0
									],
									"destination": [
										"rs-home",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-tbi",
										0
									],
									"destination": [
										"rs-del",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-del",
										0
									],
									"destination": [
										"rs-gate",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-gate",
										0
									],
									"destination": [
										"rs-home",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-home",
										0
									],
									"destination": [
										"rs-t2",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-t2",
										1
									],
									"destination": [
										"rs-set",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-t2",
										0
									],
									"destination": [
										"rs-rootmsg",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"rs-rootmsg",
										0
									],
									"destination": [
										"rs-send",
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
					"id": "obj-snap-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						180.0,
						215.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-snap-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "ROOT SNAP",
					"patching_rect": [
						208.0,
						220.0,
						75.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-brt-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "bright",
					"patching_rect": [
						741,
						582,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-brt-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						741,
						602,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": -1.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-brt-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "brightness $1",
					"patching_rect": [
						741,
						627,
						85.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-res-def-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "defaults:",
					"patching_rect": [
						381,
						654,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-res-def",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 110, flex 0.5, master_gain 0.7, glide 0.001, brightness 0, sub_amt 0.5, sub_drive 0, sub_drone 1, sub_oct -1",
					"patching_rect": [
						441,
						654,
						400.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-res",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						581,
						680,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sub-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— SUB-BASS ——",
					"patching_rect": [
						381,
						690,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sub-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "sub amt",
					"patching_rect": [
						381,
						712,
						55.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sub-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						381,
						732,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-sub-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "sub_amt $1",
					"patching_rect": [
						381,
						757,
						70.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-drv-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "drive",
					"patching_rect": [
						476,
						712,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-drv-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						476,
						732,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 5.0
				}
			},
			{
				"box": {
					"id": "obj-drv-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "sub_drive $1",
					"patching_rect": [
						476,
						757,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sdr-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "drone",
					"patching_rect": [
						581,
						712,
						45.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sdr-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						581,
						732,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sdr-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "sub_drone $1",
					"patching_rect": [
						581,
						757,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sdr-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "ON=const OFF=follow",
					"patching_rect": [
						581,
						780,
						120.0,
						14.0
					],
					"fontsize": 9.0
				}
			},
			{
				"box": {
					"id": "obj-soct-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "sub oct",
					"patching_rect": [
						661,
						712,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-soct-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						661,
						732,
						50.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": -3.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-soct-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "sub_oct $1",
					"patching_rect": [
						661,
						757,
						68.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-soct-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "-1=oct below\n0=unison",
					"patching_rect": [
						713,
						730,
						70.0,
						28.0
					],
					"fontsize": 9.0,
					"linecount": 2
				}
			},
			{
				"box": {
					"id": "obj-s-sub",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						381,
						784,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ts-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— TUNING ——",
					"patching_rect": [
						381,
						810,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ts-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "system (0-18)",
					"patching_rect": [
						381,
						830,
						90.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ts-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						381,
						850,
						45.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 18
				}
			},
			{
				"box": {
					"id": "obj-ts-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system $1",
					"patching_rect": [
						381,
						875,
						105.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-inv-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "inversion",
					"patching_rect": [
						501,
						830,
						70.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-inv-n",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						501,
						850,
						40.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": -2,
					"maximum": 2
				}
			},
			{
				"box": {
					"id": "obj-inv-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "inversion $1",
					"patching_rect": [
						501,
						875,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-trn-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "transpose",
					"patching_rect": [
						616,
						830,
						65.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-trn-n",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						616,
						850,
						40.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": -12,
					"maximum": 12
				}
			},
			{
				"box": {
					"id": "obj-trn-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "transpose $1",
					"patching_rect": [
						616,
						875,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-reg-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "register",
					"patching_rect": [
						381,
						900,
						65.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-reg-n",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						381,
						920,
						40.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": -3,
					"maximum": 3
				}
			},
			{
				"box": {
					"id": "obj-reg-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "register $1",
					"patching_rect": [
						381,
						945,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-boct-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "bass oct",
					"patching_rect": [
						501,
						900,
						65.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-boct-n",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						501,
						920,
						40.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": -2,
					"maximum": 2
				}
			},
			{
				"box": {
					"id": "obj-boct-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "bass_oct $1",
					"patching_rect": [
						501,
						945,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-toct-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "treble oct",
					"patching_rect": [
						616,
						900,
						70.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-toct-n",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						616,
						920,
						40.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0,
					"maximum": 4
				}
			},
			{
				"box": {
					"id": "obj-toct-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "treble_oct $1",
					"patching_rect": [
						616,
						945,
						78.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-tun",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						381,
						970,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ARPEGGIATOR ——",
					"patching_rect": [
						381,
						1000,
						160.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-arp-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 0",
					"patching_rect": [
						381,
						1022,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 1",
					"patching_rect": [
						436,
						1022,
						40,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 2",
					"patching_rect": [
						481,
						1022,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 3",
					"patching_rect": [
						541,
						1022,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 4",
					"patching_rect": [
						606,
						1022,
						50,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 5",
					"patching_rect": [
						661,
						1022,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-afr-labels",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Poly3:2   Triplet    Bembe     Shiko    Call/Rsp",
					"patching_rect": [
						381,
						1050,
						350.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-arp-6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 6",
					"patching_rect": [
						381,
						1068,
						68,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-7",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 7",
					"patching_rect": [
						454,
						1068,
						64,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-8",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 8",
					"patching_rect": [
						523,
						1068,
						62,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-9",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 9",
					"patching_rect": [
						590,
						1068,
						58,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-10",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 10",
					"patching_rect": [
						653,
						1068,
						72,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-afr2-labels",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Gahu    Son Clave  Fume Fume   Kassa",
					"patching_rect": [
						381,
						1093,
						350.0,
						16.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-arp-11",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 11",
					"patching_rect": [
						381,
						1111,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-12",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 12",
					"patching_rect": [
						441,
						1111,
						75,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-13",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 13",
					"patching_rect": [
						521,
						1111,
						72,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arp-14",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 14",
					"patching_rect": [
						598,
						1111,
						55,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-div-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ARP RATE ——",
					"patching_rect": [
						381,
						1141,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-div-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "0=free 1=1/4 2=1/8 3=trip 4=1/16",
					"patching_rect": [
						506,
						1141,
						230.0,
						20.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-div-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_div 0",
					"patching_rect": [
						381,
						1161,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-div-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_div 1",
					"patching_rect": [
						446,
						1161,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-div-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_div 2",
					"patching_rect": [
						511,
						1161,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-div-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_div 3",
					"patching_rect": [
						576,
						1161,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-div-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_div 4",
					"patching_rect": [
						641,
						1161,
						60,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-div-5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_div 1.333",
					"patching_rect": [
						706,
						1161,
						78,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-bpm-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "bpm",
					"patching_rect": [
						381,
						1188,
						30.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-bpm-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						416,
						1188,
						50.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 20,
					"maximum": 300
				}
			},
			{
				"box": {
					"id": "obj-bpm-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_bpm $1",
					"patching_rect": [
						416,
						1213,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-arpr-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "free Hz",
					"patching_rect": [
						511,
						1188,
						50.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-arpr-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						566,
						1188,
						50.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.1,
					"maximum": 20.0
				}
			},
			{
				"box": {
					"id": "obj-arpr-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_rate $1",
					"patching_rect": [
						566,
						1213,
						68.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-arp",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						581,
						1240,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-adsr-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ADSR ENVELOPE ——",
					"patching_rect": [
						381,
						1260,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-atk-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "attack",
					"patching_rect": [
						381,
						1282,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-atk-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						381,
						1302,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.001,
					"maximum": 2.0
				}
			},
			{
				"box": {
					"id": "obj-atk-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack $1",
					"patching_rect": [
						381,
						1327,
						85,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dec-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "decay",
					"patching_rect": [
						476,
						1282,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dec-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						476,
						1302,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.001,
					"maximum": 2.0
				}
			},
			{
				"box": {
					"id": "obj-dec-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_decay $1",
					"patching_rect": [
						476,
						1327,
						80,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sus-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "sustain",
					"patching_rect": [
						566,
						1282,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sus-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						566,
						1302,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-sus-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_sustain $1",
					"patching_rect": [
						566,
						1327,
						92,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rel-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "release",
					"patching_rect": [
						668,
						1282,
						60.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rel-n",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"patching_rect": [
						668,
						1302,
						55.0,
						22.0
					],
					"parameter_enable": 0,
					"minimum": 0.001,
					"maximum": 5.0
				}
			},
			{
				"box": {
					"id": "obj-rel-m",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_release $1",
					"patching_rect": [
						668,
						1327,
						90,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-s-adsr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						381,
						1354,
						52.0,
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
						1900.0,
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
							950,
							750
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
										800.0,
										600.0
									],
									"code": "// CHAOS RESONATOR — 5 Attractors -> 6 Waveguide Resonators\n// Lorenz, Rossler, Chua, Halvorsen, Aizawa.\n// 3 combine modes: Blend, Modulate, Route.\n// 19 African tuning systems. Arpeggiator. ADSR envelope.\n// BPM-synced arp. African rhythm patterns. Mute.\n// Scale-degree transpose. MIDI sync reset.\n// tanh() in feedback = self-limiting.\n\n// === Declarations ===\nParam sigma(10);\nParam rho(28);\nParam beta(2.667);\nParam lorenz_dt(0.0012);\nParam chaos_gain(0.01);\nParam root(110);\nParam flex(0.5);\nParam tuning_system(0);\nParam master_gain(0.7);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);\nParam deg4(4);\nParam deg5(0);\nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam glide(0.001);\nParam reset(0);\nParam arp_mode(0);\nParam arp_rate(2);\nParam arp_bpm(120);\nParam arp_div(0);\nParam inversion(0);\nParam env_attack(0.005);\nParam env_decay(0.05);\nParam env_sustain(0.8);\nParam env_release(0.1);\nParam mute(0);\nParam transpose(0);\nParam arp_reset(0);\nParam brightness(0);\nParam register(0);\nParam bass_oct(0);\nParam treble_oct(0);\nParam smooth_speed(2);\nParam sub_amt(0.5);\nParam sub_drive(0.0);\nParam sub_drone(1);\nParam sub_oct(-1);\nParam att_sel(0);\nParam att_b_sel(-1);\nParam combine_mode(0);\nParam blend_mix(0.5);\nParam mod_depth(0.5);\nParam ross_c(5.7);\nParam chua_alpha(15.6);\nParam halv_a(1.89);\nParam aiz_c(0.6);\nParam aiz_d(3.5);\nData tuning_table(190);\nData arp_pat_data(160);\nHistory init_done(0);\nHistory s_sigma(10);\nHistory s_rho(28);\nHistory s_beta(2.667);\nHistory s_dt(0.0012);\nHistory s_cg(0.01);\nHistory lx(0.1);\nHistory ly(0);\nHistory lz(0);\nHistory r1_pd(0);\nHistory r2_pd(0);\nHistory r3_pd(0);\nHistory r4_pd(0);\nHistory r5_pd(0);\nHistory r6_pd(0);\nHistory r1_sdl(0);\nHistory r2_sdl(0);\nHistory r3_sdl(0);\nHistory r4_sdl(0);\nHistory r5_sdl(0);\nHistory r6_sdl(0);\nHistory arp_phase(0);\nHistory arp_step(0);\nHistory arp_dir(1);\nHistory v_amp1(0);\nHistory v_amp2(0);\nHistory v_amp3(0);\nHistory v_amp4(0);\nHistory v_amp5(0);\nHistory v_amp6(0);\nHistory pk1(0);\nHistory pk2(0);\nHistory pk3(0);\nHistory pk4(0);\nHistory pk5(0);\nHistory pk6(0);\nHistory mute_s(0);\nHistory r_sub_pd(0);\nHistory r_sub_sdl(0);\nHistory sub_env_h(0);\nHistory rx(1); History ry(0); History rz(0);\nHistory chx(0.1); History chy(0); History chz(0);\nHistory hx(1); History hy(0); History hz(0);\nHistory aix(0.1); History aiy(0); History aiz_h(0);\nHistory bx_h(0); History by_h(0); History bz_h(0);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\nDelay r_sub(48000);\n\n// === INIT (tuning tables + rhythm patterns, runs once) ===\nif (init_done < 0.5) {\n    // 0: Yoruba Pentatonic (Pythagorean base, flex at runtime)\n    poke(tuning_table, 5, 0, 0);\n    poke(tuning_table, 1.0, 1, 0);\n    poke(tuning_table, 1.125, 2, 0);\n    poke(tuning_table, 1.265625, 3, 0);\n    poke(tuning_table, 1.5, 4, 0);\n    poke(tuning_table, 1.6875, 5, 0);\n    // 1: Dundun 3-Tone (0, 200, 400c)\n    poke(tuning_table, 3, 10, 0);\n    poke(tuning_table, 1.0, 11, 0);\n    poke(tuning_table, 1.12246, 12, 0);\n    poke(tuning_table, 1.25992, 13, 0);\n    // 2: Balafon Equi-Pentatonic (0, 220, 460, 690, 930c)\n    poke(tuning_table, 5, 20, 0);\n    poke(tuning_table, 1.0, 21, 0);\n    poke(tuning_table, 1.13534, 22, 0);\n    poke(tuning_table, 1.30486, 23, 0);\n    poke(tuning_table, 1.49180, 24, 0);\n    poke(tuning_table, 1.71002, 25, 0);\n    // 3: Equi-Heptatonic 7-TET\n    poke(tuning_table, 7, 30, 0);\n    poke(tuning_table, 1.0, 31, 0);\n    poke(tuning_table, 1.10409, 32, 0);\n    poke(tuning_table, 1.21901, 33, 0);\n    poke(tuning_table, 1.34590, 34, 0);\n    poke(tuning_table, 1.48599, 35, 0);\n    poke(tuning_table, 1.64059, 36, 0);\n    poke(tuning_table, 1.81145, 37, 0);\n    // 4: BaAka/Pygmy 5-TET (0, 240, 480, 720, 960c)\n    poke(tuning_table, 5, 40, 0);\n    poke(tuning_table, 1.0, 41, 0);\n    poke(tuning_table, 1.14870, 42, 0);\n    poke(tuning_table, 1.31951, 43, 0);\n    poke(tuning_table, 1.51572, 44, 0);\n    poke(tuning_table, 1.74110, 45, 0);\n    // 5: Shona Nyamaropa (0, 180, 380, 500, 700, 880, 1080c)\n    poke(tuning_table, 7, 50, 0);\n    poke(tuning_table, 1.0, 51, 0);\n    poke(tuning_table, 1.10957, 52, 0);\n    poke(tuning_table, 1.24574, 53, 0);\n    poke(tuning_table, 1.33484, 54, 0);\n    poke(tuning_table, 1.49831, 55, 0);\n    poke(tuning_table, 1.65948, 56, 0);\n    poke(tuning_table, 1.86121, 57, 0);\n    // 6: Shona Gandanga (0, 100, 300, 500, 700, 800, 1000c)\n    poke(tuning_table, 7, 60, 0);\n    poke(tuning_table, 1.0, 61, 0);\n    poke(tuning_table, 1.05946, 62, 0);\n    poke(tuning_table, 1.18921, 63, 0);\n    poke(tuning_table, 1.33484, 64, 0);\n    poke(tuning_table, 1.49831, 65, 0);\n    poke(tuning_table, 1.58740, 66, 0);\n    poke(tuning_table, 1.78180, 67, 0);\n    // 7: Kora Silaba (0, 200, 385, 500, 700, 900, 1085c)\n    poke(tuning_table, 7, 70, 0);\n    poke(tuning_table, 1.0, 71, 0);\n    poke(tuning_table, 1.12246, 72, 0);\n    poke(tuning_table, 1.24915, 73, 0);\n    poke(tuning_table, 1.33484, 74, 0);\n    poke(tuning_table, 1.49831, 75, 0);\n    poke(tuning_table, 1.68179, 76, 0);\n    poke(tuning_table, 1.86459, 77, 0);\n    // 8: Kora Sauta (0, 185, 405, 605, 700, 885, 1105c)\n    poke(tuning_table, 7, 80, 0);\n    poke(tuning_table, 1.0, 81, 0);\n    poke(tuning_table, 1.11278, 82, 0);\n    poke(tuning_table, 1.26330, 83, 0);\n    poke(tuning_table, 1.41747, 84, 0);\n    poke(tuning_table, 1.49831, 85, 0);\n    poke(tuning_table, 1.66230, 86, 0);\n    poke(tuning_table, 1.88800, 87, 0);\n    // 9: Ethiopian Tizita Major (0, 200, 400, 700, 900c)\n    poke(tuning_table, 5, 90, 0);\n    poke(tuning_table, 1.0, 91, 0);\n    poke(tuning_table, 1.12246, 92, 0);\n    poke(tuning_table, 1.25992, 93, 0);\n    poke(tuning_table, 1.49831, 94, 0);\n    poke(tuning_table, 1.68179, 95, 0);\n    // 10: Ethiopian Tizita Minor (0, 200, 300, 700, 800c)\n    poke(tuning_table, 5, 100, 0);\n    poke(tuning_table, 1.0, 101, 0);\n    poke(tuning_table, 1.12246, 102, 0);\n    poke(tuning_table, 1.18921, 103, 0);\n    poke(tuning_table, 1.49831, 104, 0);\n    poke(tuning_table, 1.58740, 105, 0);\n    // 11: Ethiopian Bati (0, 200, 500, 700, 900c)\n    poke(tuning_table, 5, 110, 0);\n    poke(tuning_table, 1.0, 111, 0);\n    poke(tuning_table, 1.12246, 112, 0);\n    poke(tuning_table, 1.33484, 113, 0);\n    poke(tuning_table, 1.49831, 114, 0);\n    poke(tuning_table, 1.68179, 115, 0);\n    // 12: Ethiopian Ambassel (0, 200, 400, 700, 800c)\n    poke(tuning_table, 5, 120, 0);\n    poke(tuning_table, 1.0, 121, 0);\n    poke(tuning_table, 1.12246, 122, 0);\n    poke(tuning_table, 1.25992, 123, 0);\n    poke(tuning_table, 1.49831, 124, 0);\n    poke(tuning_table, 1.58740, 125, 0);\n    // 13: Ethiopian Anchihoye (0, 100, 500, 600, 900c)\n    poke(tuning_table, 5, 130, 0);\n    poke(tuning_table, 1.0, 131, 0);\n    poke(tuning_table, 1.05946, 132, 0);\n    poke(tuning_table, 1.33484, 133, 0);\n    poke(tuning_table, 1.41421, 134, 0);\n    poke(tuning_table, 1.68179, 135, 0);\n    // 14: Bugandan Amadinda (0, 240, 480, 720, 960c)\n    poke(tuning_table, 5, 140, 0);\n    poke(tuning_table, 1.0, 141, 0);\n    poke(tuning_table, 1.14870, 142, 0);\n    poke(tuning_table, 1.31951, 143, 0);\n    poke(tuning_table, 1.51572, 144, 0);\n    poke(tuning_table, 1.74110, 145, 0);\n    // 15: Chopi Timbila (0, 175, 346, 519, 681, 854, 1025c)\n    poke(tuning_table, 7, 150, 0);\n    poke(tuning_table, 1.0, 151, 0);\n    poke(tuning_table, 1.10653, 152, 0);\n    poke(tuning_table, 1.22082, 153, 0);\n    poke(tuning_table, 1.34890, 154, 0);\n    poke(tuning_table, 1.48160, 155, 0);\n    poke(tuning_table, 1.63720, 156, 0);\n    poke(tuning_table, 1.80699, 157, 0);\n    // 16: San Musical Bow (0, 200, 386, 498, 702, 884c)\n    poke(tuning_table, 6, 160, 0);\n    poke(tuning_table, 1.0, 161, 0);\n    poke(tuning_table, 1.12246, 162, 0);\n    poke(tuning_table, 1.24984, 163, 0);\n    poke(tuning_table, 1.33322, 164, 0);\n    poke(tuning_table, 1.50000, 165, 0);\n    poke(tuning_table, 1.66212, 166, 0);\n    // 17: Wagogo Ilimba — harmonics 4-9\n    poke(tuning_table, 6, 170, 0);\n    poke(tuning_table, 1.0, 171, 0);\n    poke(tuning_table, 1.25, 172, 0);\n    poke(tuning_table, 1.5, 173, 0);\n    poke(tuning_table, 1.75, 174, 0);\n    poke(tuning_table, 2.0, 175, 0);\n    poke(tuning_table, 2.25, 176, 0);\n    // 18: Igbo Pentatonic (0, 200, 386, 702, 884c)\n    poke(tuning_table, 5, 180, 0);\n    poke(tuning_table, 1.0, 181, 0);\n    poke(tuning_table, 1.12246, 182, 0);\n    poke(tuning_table, 1.24984, 183, 0);\n    poke(tuning_table, 1.50000, 184, 0);\n    poke(tuning_table, 1.66212, 185, 0);\n\n    // === RHYTHM PATTERN DATA ===\n    // Each pattern: [length, mask0, mask1, ...] at offset = patIdx * 16\n    // Voice bitmask: v1=1, v2=2, v3=4, v4=8, v5=16, v6=32\n\n    // Pattern 0 — Polyrhythm 3:2 (arp_mode 6, offset 0)\n    poke(arp_pat_data, 6, 0, 0);\n    poke(arp_pat_data, 63, 1, 0);\n    poke(arp_pat_data, 0, 2, 0);\n    poke(arp_pat_data, 21, 3, 0);\n    poke(arp_pat_data, 42, 4, 0);\n    poke(arp_pat_data, 21, 5, 0);\n    poke(arp_pat_data, 0, 6, 0);\n\n    // Pattern 1 — Triplet (arp_mode 7, offset 16)\n    poke(arp_pat_data, 3, 16, 0);\n    poke(arp_pat_data, 3, 17, 0);\n    poke(arp_pat_data, 12, 18, 0);\n    poke(arp_pat_data, 48, 19, 0);\n\n    // Pattern 2 — Bembe 12/8 bell (arp_mode 8, offset 32)\n    poke(arp_pat_data, 12, 32, 0);\n    poke(arp_pat_data, 1, 33, 0);\n    poke(arp_pat_data, 0, 34, 0);\n    poke(arp_pat_data, 4, 35, 0);\n    poke(arp_pat_data, 0, 36, 0);\n    poke(arp_pat_data, 2, 37, 0);\n    poke(arp_pat_data, 8, 38, 0);\n    poke(arp_pat_data, 0, 39, 0);\n    poke(arp_pat_data, 16, 40, 0);\n    poke(arp_pat_data, 0, 41, 0);\n    poke(arp_pat_data, 32, 42, 0);\n    poke(arp_pat_data, 0, 43, 0);\n    poke(arp_pat_data, 4, 44, 0);\n\n    // Pattern 3 — Shiko (arp_mode 9, offset 48)\n    poke(arp_pat_data, 12, 48, 0);\n    poke(arp_pat_data, 17, 49, 0);\n    poke(arp_pat_data, 0, 50, 0);\n    poke(arp_pat_data, 0, 51, 0);\n    poke(arp_pat_data, 8, 52, 0);\n    poke(arp_pat_data, 0, 53, 0);\n    poke(arp_pat_data, 0, 54, 0);\n    poke(arp_pat_data, 6, 55, 0);\n    poke(arp_pat_data, 0, 56, 0);\n    poke(arp_pat_data, 0, 57, 0);\n    poke(arp_pat_data, 0, 58, 0);\n    poke(arp_pat_data, 32, 59, 0);\n    poke(arp_pat_data, 0, 60, 0);\n\n    // Pattern 4 — Call & Response (arp_mode 10, offset 64)\n    poke(arp_pat_data, 8, 64, 0);\n    poke(arp_pat_data, 19, 65, 0);\n    poke(arp_pat_data, 19, 66, 0);\n    poke(arp_pat_data, 0, 67, 0);\n    poke(arp_pat_data, 0, 68, 0);\n    poke(arp_pat_data, 44, 69, 0);\n    poke(arp_pat_data, 44, 70, 0);\n    poke(arp_pat_data, 0, 71, 0);\n    poke(arp_pat_data, 0, 72, 0);\n\n    // Pattern 5 — Gahu (arp_mode 11, offset 80, length 15)\n    // Ewe social dance bell: x..x..x.x..x..x (15 steps)\n    poke(arp_pat_data, 15, 80, 0);\n    poke(arp_pat_data, 17, 81, 0);   // step 0: v1+v5 bass+metallic\n    poke(arp_pat_data, 0, 82, 0);\n    poke(arp_pat_data, 0, 83, 0);\n    poke(arp_pat_data, 4, 84, 0);    // step 3: v3 mid\n    poke(arp_pat_data, 0, 85, 0);\n    poke(arp_pat_data, 0, 86, 0);\n    poke(arp_pat_data, 10, 87, 0);   // step 6: v2+v4 low-mid+mid-high\n    poke(arp_pat_data, 0, 88, 0);\n    poke(arp_pat_data, 32, 89, 0);   // step 8: v6 crystal\n    poke(arp_pat_data, 0, 90, 0);\n    poke(arp_pat_data, 0, 91, 0);\n    poke(arp_pat_data, 5, 92, 0);    // step 11: v1+v3 bass+mid\n    poke(arp_pat_data, 0, 93, 0);\n    poke(arp_pat_data, 0, 94, 0);\n    poke(arp_pat_data, 48, 95, 0);   // step 14: v5+v6 metallic+crystal\n\n    // Pattern 6 — Son Clave 3:2 (arp_mode 12, offset 96, length 15)\n    // Foundational Afro-Cuban rhythm: x..x..x...x.x.. (15 steps)\n    poke(arp_pat_data, 15, 96, 0);\n    poke(arp_pat_data, 19, 97, 0);   // step 0: v1+v2+v5 low body\n    poke(arp_pat_data, 0, 98, 0);\n    poke(arp_pat_data, 0, 99, 0);\n    poke(arp_pat_data, 12, 100, 0);  // step 3: v3+v4 mid crack\n    poke(arp_pat_data, 0, 101, 0);\n    poke(arp_pat_data, 0, 102, 0);\n    poke(arp_pat_data, 32, 103, 0);  // step 6: v6 crystal\n    poke(arp_pat_data, 0, 104, 0);\n    poke(arp_pat_data, 0, 105, 0);\n    poke(arp_pat_data, 0, 106, 0);\n    poke(arp_pat_data, 5, 107, 0);   // step 10: v1+v3 bass+mid\n    poke(arp_pat_data, 0, 108, 0);\n    poke(arp_pat_data, 42, 109, 0);  // step 12: v2+v4+v6 full spread\n    poke(arp_pat_data, 0, 110, 0);\n    poke(arp_pat_data, 0, 111, 0);\n\n    // Pattern 7 — Fume Fume (arp_mode 13, offset 112, length 12)\n    // Ewe ceremonial bell: x.x..x.x..x. (12 steps)\n    poke(arp_pat_data, 12, 112, 0);\n    poke(arp_pat_data, 3, 113, 0);   // step 0: v1+v2 bass pair\n    poke(arp_pat_data, 0, 114, 0);\n    poke(arp_pat_data, 24, 115, 0);  // step 2: v4+v5 mid-high pair\n    poke(arp_pat_data, 0, 116, 0);\n    poke(arp_pat_data, 0, 117, 0);\n    poke(arp_pat_data, 36, 118, 0);  // step 5: v3+v6 mid+crystal\n    poke(arp_pat_data, 0, 119, 0);\n    poke(arp_pat_data, 17, 120, 0);  // step 7: v1+v5 bass+metallic\n    poke(arp_pat_data, 0, 121, 0);\n    poke(arp_pat_data, 0, 122, 0);\n    poke(arp_pat_data, 14, 123, 0);  // step 10: v2+v3+v4 mid spread\n    poke(arp_pat_data, 0, 124, 0);\n\n    // Pattern 8 — Kassa (arp_mode 14, offset 128, length 12)\n    // Manding harvest dance: xx.x.xx.x.x. (12 steps) — dense, energetic\n    poke(arp_pat_data, 12, 128, 0);\n    poke(arp_pat_data, 17, 129, 0);  // step 0: v1+v5 bass+metallic\n    poke(arp_pat_data, 4, 130, 0);   // step 1: v3 mid\n    poke(arp_pat_data, 0, 131, 0);\n    poke(arp_pat_data, 34, 132, 0);  // step 3: v2+v6 low-mid+crystal\n    poke(arp_pat_data, 0, 133, 0);\n    poke(arp_pat_data, 8, 134, 0);   // step 5: v4 mid-high\n    poke(arp_pat_data, 5, 135, 0);   // step 6: v1+v3 bass+mid\n    poke(arp_pat_data, 0, 136, 0);\n    poke(arp_pat_data, 48, 137, 0);  // step 8: v5+v6 metallic+crystal\n    poke(arp_pat_data, 0, 138, 0);\n    poke(arp_pat_data, 10, 139, 0);  // step 10: v2+v4 low-mid+mid-high\n    poke(arp_pat_data, 0, 140, 0);\n\n    init_done = 1;\n}\n\n// === TUNING SETUP ===\nts = clamp(floor(tuning_system), 0, 18);\nts_base = ts * 10;\nts_size = max(peek(tuning_table, ts_base, 0), 1);\nj0 = 1.0; j1 = 1.111111; j2 = 1.25; j3 = 1.5; j4 = 1.666667;\n\n// === INVERSION (-2 to +2) ===\ninv_off = floor(clamp(inversion, -2, 2));\ninv_up = (inv_off > 0.5) ? inv_off : 0;\ninv_dn = (inv_off < -0.5) ? inv_off : 0;\nreg = floor(clamp(register, -3, 3));\nboct = floor(clamp(bass_oct, -2, 2));\ntoct = floor(clamp(treble_oct, 0, 4));\n\n// === LORENZ PARAM SMOOTHING ===\n// 0=off (instant), 1=slow (~500ms), 2=medium (~50ms), 3=fast (~5ms)\nsm = floor(clamp(smooth_speed, 0, 3));\nsm_coeff = (sm < 0.5) ? 1.0 : (sm < 1.5) ? (1.0 - exp(-1.0 / (0.5 * samplerate))) : (sm < 2.5) ? (1.0 - exp(-1.0 / (0.05 * samplerate))) : (1.0 - exp(-1.0 / (0.005 * samplerate)));\ns_sigma = s_sigma + (sigma - s_sigma) * sm_coeff;\ns_rho = s_rho + (rho - s_rho) * sm_coeff;\ns_beta = s_beta + (beta - s_beta) * sm_coeff;\ns_dt = s_dt + (lorenz_dt - s_dt) * sm_coeff;\ns_cg = s_cg + (chaos_gain - s_cg) * sm_coeff;\n\n// === CHAOS ATTRACTOR SYSTEM ===\n\n// --- LORENZ (4x unrolled Euler) ---\nrho_mod = s_rho + in1;\ntx = lx; ty = ly; tz = lz;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\ndx = s_sigma * (ty - tx); dy = tx * (rho_mod - tz) - ty; dz = tx * ty - s_beta * tz;\ntx += dx * s_dt; ty += dy * s_dt; tz += dz * s_dt;\nlx = (reset > 0.5) ? 0.1 : clamp(tx, -100, 100) + noise() * 0.01;\nly = (reset > 0.5) ? 0.0 : clamp(ty, -100, 100) + noise() * 0.01;\nlz = (reset > 0.5) ? 0.0 : clamp(tz, -100, 100) + noise() * 0.01;\nlor_x = lx * 0.05; lor_y = ly * 0.04; lor_z = (lz - 25) * 0.04;\n\n// --- ROSSLER (4x unrolled Euler) ---\ndt_r = 0.006;\nrtx = rx; rty = ry; rtz = rz;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrdx = -(rty + rtz); rdy = rtx + 0.2 * rty; rdz = 0.2 + rtz * (rtx - ross_c);\nrtx += rdx*dt_r; rty += rdy*dt_r; rtz += rdz*dt_r;\nrx = (reset > 0.5) ? 1.0 : clamp(rtx, -100, 100) + noise() * 0.01;\nry = (reset > 0.5) ? 0.0 : clamp(rty, -100, 100) + noise() * 0.01;\nrz = (reset > 0.5) ? 0.0 : clamp(rtz, -100, 100) + noise() * 0.01;\nros_x = rx * 0.08; ros_y = ry * 0.08; ros_z = (rz - 12) * 0.08;\n\n// --- CHUA (4x unrolled Euler) ---\ndt_c = 0.0012;\nctx = chx; cty = chy; ctz = chz;\nch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nch_h = -1.143 * ctx + 0.5 * (-0.714 + 1.143) * (abs(ctx + 1) - abs(ctx - 1));\ncdx = chua_alpha * (cty - ctx - ch_h); cdy = ctx - cty + ctz; cdz = -28.0 * cty;\nctx += cdx*dt_c; cty += cdy*dt_c; ctz += cdz*dt_c;\nchx = (reset > 0.5) ? 0.1 : clamp(ctx, -10, 10) + noise() * 0.001;\nchy = (reset > 0.5) ? 0.0 : clamp(cty, -3, 3) + noise() * 0.001;\nchz = (reset > 0.5) ? 0.0 : clamp(ctz, -20, 20) + noise() * 0.001;\nchu_x = chx * 0.25; chu_y = chy * 0.8; chu_z = chz * 0.1;\n\n// --- HALVORSEN (4x unrolled Euler) ---\ndt_h = 0.005;\nhtx = hx; hty = hy; htz = hz;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhdx = -halv_a*htx - 4*hty - 4*htz - hty*hty;\nhdy = -halv_a*hty - 4*htz - 4*htx - htz*htz;\nhdz = -halv_a*htz - 4*htx - 4*hty - htx*htx;\nhtx += hdx*dt_h; hty += hdy*dt_h; htz += hdz*dt_h;\nhx = (reset > 0.5) ? 1.0 : clamp(htx, -20, 20) + noise() * 0.01;\nhy = (reset > 0.5) ? 0.0 : clamp(hty, -20, 20) + noise() * 0.01;\nhz = (reset > 0.5) ? 0.0 : clamp(htz, -20, 20) + noise() * 0.01;\nhal_x = hx * 0.1; hal_y = hy * 0.1; hal_z = hz * 0.1;\n\n// --- AIZAWA (4x unrolled Euler) ---\ndt_a = 0.006;\natx = aix; aty = aiy; atz = aiz_h;\nadx = (atz - 0.7) * atx - 3.5 * aty;\nady = 3.5 * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\nadx = (atz - 0.7) * atx - 3.5 * aty;\nady = 3.5 * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\nadx = (atz - 0.7) * atx - 3.5 * aty;\nady = 3.5 * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\nadx = (atz - 0.7) * atx - 3.5 * aty;\nady = 3.5 * atx + (atz - 0.7) * aty;\nar2 = atx*atx + aty*aty;\nadz = aiz_c + 0.25 * atz - atz*atz*atz / 3.0 - ar2 * (1.0 + 0.1 * atz) + aiz_d * atz * atx * atx * atx;\natx += adx*dt_a; aty += ady*dt_a; atz += adz*dt_a;\naix = (reset > 0.5) ? 0.1 : clamp(atx, -3, 3) + noise() * 0.001;\naiy = (reset > 0.5) ? 0.0 : clamp(aty, -3, 3) + noise() * 0.001;\naiz_h = (reset > 0.5) ? 0.0 : clamp(atz, -3, 3) + noise() * 0.001;\naiz_x = aix * 0.7; aiz_y = aiy * 0.7; aiz_z = (aiz_h - 0.5) * 1.0;\n\n// --- SELECT ATTRACTOR A ---\nas = floor(clamp(att_sel, 0, 4));\nax = (as < 0.5) ? lor_x : (as < 1.5) ? ros_x : (as < 2.5) ? chu_x : (as < 3.5) ? hal_x : aiz_x;\nay = (as < 0.5) ? lor_y : (as < 1.5) ? ros_y : (as < 2.5) ? chu_y : (as < 3.5) ? hal_y : aiz_y;\naz = (as < 0.5) ? lor_z : (as < 1.5) ? ros_z : (as < 2.5) ? chu_z : (as < 3.5) ? hal_z : aiz_z;\n\n// --- SELECT ATTRACTOR B ---\nbs = floor(clamp(att_b_sel, -1, 4));\nb_active = (bs > -0.5);\nbx_raw = (bs < 0.5) ? lor_x : (bs < 1.5) ? ros_x : (bs < 2.5) ? chu_x : (bs < 3.5) ? hal_x : aiz_x;\nby_raw = (bs < 0.5) ? lor_y : (bs < 1.5) ? ros_y : (bs < 2.5) ? chu_y : (bs < 3.5) ? hal_y : aiz_y;\nbz_raw = (bs < 0.5) ? lor_z : (bs < 1.5) ? ros_z : (bs < 2.5) ? chu_z : (bs < 3.5) ? hal_z : aiz_z;\n\n// --- COMBINING MODES ---\ncm = floor(clamp(combine_mode, 0, 2));\n\n// Mode 0: BLEND — linear crossfade\nbl_x = ax * (1.0 - blend_mix) + bx_raw * blend_mix;\nbl_y = ay * (1.0 - blend_mix) + by_raw * blend_mix;\nbl_z = az * (1.0 - blend_mix) + bz_raw * blend_mix;\n\n// Mode 1: MODULATE — B modulates A amplitude (one-sample delay)\nmd_x = ax * (1.0 + bx_h * mod_depth);\nmd_y = ay * (1.0 + by_h * mod_depth);\nmd_z = az * (1.0 + bz_h * mod_depth);\nbx_h = bx_raw; by_h = by_raw; bz_h = bz_raw;\n\n// Mode 2: ROUTE — A drives voices 1-3, B drives voices 4-6 (handled at excitation)\n\n// Final combined output for voices 1-3\ncx = b_active ? ((cm < 0.5) ? bl_x : (cm < 1.5) ? md_x : ax) : ax;\ncy = b_active ? ((cm < 0.5) ? bl_y : (cm < 1.5) ? md_y : ay) : ay;\ncz = b_active ? ((cm < 0.5) ? bl_z : (cm < 1.5) ? md_z : az) : az;\n\n// Route mode: separate chaos for voices 4-6\ncx_456 = (b_active && cm > 1.5) ? bx_raw : cx;\ncy_456 = (b_active && cm > 1.5) ? by_raw : cy;\ncz_456 = (b_active && cm > 1.5) ? bz_raw : cz;\n\n// === ARPEGGIATOR (BPM sync + patterns + MIDI reset) ===\neff_rate = (arp_div > 0.01) ? (arp_bpm / 60.0 * arp_div) : arp_rate;\narp_ph_new = arp_phase + eff_rate / samplerate;\narp_trig_flag = (arp_ph_new >= 1.0);\narp_phase = arp_ph_new - floor(arp_ph_new);\n\n// Pattern detection\nis_pattern = (arp_mode > 5.5);\npat_idx = clamp(floor(arp_mode - 6), 0, 8);\npat_base = pat_idx * 16;\npat_len = is_pattern ? max(peek(arp_pat_data, pat_base, 0), 1) : 6;\n\n// Standard mode stepping\nup_s = mod(arp_step + 1, 6);\ndn_s = mod(arp_step + 5, 6);\npp_next = arp_step + arp_dir;\npp_rev_hi = (pp_next > 5);\npp_rev_lo = (pp_next < 0);\npp_new_dir = pp_rev_hi ? -1 : (pp_rev_lo ? 1 : arp_dir);\npp_s = pp_rev_hi ? 4 : (pp_rev_lo ? 1 : clamp(pp_next, 0, 5));\nrnd_s = clamp(floor(abs(noise()) * 6), 0, 5);\nstd_new_s = (arp_mode > 3.5) ? rnd_s : (arp_mode > 2.5) ? pp_s : (arp_mode > 1.5) ? dn_s : (arp_mode > 0.5) ? up_s : arp_step;\n\n// Pattern mode: sequential stepping, wraps at pat_len\npat_next_s = mod(arp_step + 1, pat_len);\n\n// Select step\nnew_s = is_pattern ? pat_next_s : std_new_s;\nnew_d = (arp_mode > 2.5 && arp_mode < 3.5) ? pp_new_dir : arp_dir;\narp_step = arp_trig_flag ? new_s : arp_step;\narp_dir = arp_trig_flag ? new_d : arp_dir;\n\n// Phase reset (MIDI sync — snaps pattern to downbeat)\narp_step = (arp_reset > 0.5) ? 0 : arp_step;\narp_phase = (arp_reset > 0.5) ? 0 : arp_phase;\n\ncur = floor(arp_step);\n\n// Standard voice activation (modes 0-5)\narp_active = (arp_mode > 0.5 && arp_mode < 4.5);\nst1 = arp_active ? (abs(cur) < 0.5 ? 1.0 : 0.0) : 1.0;\nst2 = arp_active ? (abs(cur - 1) < 0.5 ? 1.0 : 0.0) : 1.0;\nst3 = arp_active ? (abs(cur - 2) < 0.5 ? 1.0 : 0.0) : 1.0;\nst4 = arp_active ? (abs(cur - 3) < 0.5 ? 1.0 : 0.0) : 1.0;\nst5 = arp_active ? (abs(cur - 4) < 0.5 ? 1.0 : 0.0) : 1.0;\nst6 = arp_active ? (abs(cur - 5) < 0.5 ? 1.0 : 0.0) : 1.0;\n\n// Pattern voice activation (bitmask decode)\nmask = peek(arp_pat_data, pat_base + 1 + clamp(cur, 0, 15), 0);\nm = floor(mask);\npt1 = mod(m, 2) > 0.5;\npt2 = mod(floor(m / 2), 2) > 0.5;\npt3 = mod(floor(m / 4), 2) > 0.5;\npt4 = mod(floor(m / 8), 2) > 0.5;\npt5 = mod(floor(m / 16), 2) > 0.5;\npt6 = mod(floor(m / 32), 2) > 0.5;\n\n// Select voice activation path\nt1 = is_pattern ? pt1 : st1;\nt2 = is_pattern ? pt2 : st2;\nt3 = is_pattern ? pt3 : st3;\nt4 = is_pattern ? pt4 : st4;\nt5 = is_pattern ? pt5 : st5;\nt6 = is_pattern ? pt6 : st6;\n\n// === ADSR ENVELOPE ===\na_rate = 1.0 / max(env_attack * samplerate, 1);\nd_coeff = 1.0 - exp(-4.0 / max(env_decay * samplerate, 1));\nr_coeff = 1.0 - exp(-4.0 / max(env_release * samplerate, 1));\n\ngate1 = t1 > 0.5;\natk_ph1 = gate1 * (1.0 - pk1);\npk1 = gate1 ? min(pk1 + (v_amp1 >= 0.999), 1.0) : 0.0;\nv_amp1 = atk_ph1 ? min(v_amp1 + a_rate, 1.0) : (gate1 ? (v_amp1 + (env_sustain - v_amp1) * d_coeff) : (v_amp1 + (0.0 - v_amp1) * r_coeff));\n\ngate2 = t2 > 0.5;\natk_ph2 = gate2 * (1.0 - pk2);\npk2 = gate2 ? min(pk2 + (v_amp2 >= 0.999), 1.0) : 0.0;\nv_amp2 = atk_ph2 ? min(v_amp2 + a_rate, 1.0) : (gate2 ? (v_amp2 + (env_sustain - v_amp2) * d_coeff) : (v_amp2 + (0.0 - v_amp2) * r_coeff));\n\ngate3 = t3 > 0.5;\natk_ph3 = gate3 * (1.0 - pk3);\npk3 = gate3 ? min(pk3 + (v_amp3 >= 0.999), 1.0) : 0.0;\nv_amp3 = atk_ph3 ? min(v_amp3 + a_rate, 1.0) : (gate3 ? (v_amp3 + (env_sustain - v_amp3) * d_coeff) : (v_amp3 + (0.0 - v_amp3) * r_coeff));\n\ngate4 = t4 > 0.5;\natk_ph4 = gate4 * (1.0 - pk4);\npk4 = gate4 ? min(pk4 + (v_amp4 >= 0.999), 1.0) : 0.0;\nv_amp4 = atk_ph4 ? min(v_amp4 + a_rate, 1.0) : (gate4 ? (v_amp4 + (env_sustain - v_amp4) * d_coeff) : (v_amp4 + (0.0 - v_amp4) * r_coeff));\n\ngate5 = t5 > 0.5;\natk_ph5 = gate5 * (1.0 - pk5);\npk5 = gate5 ? min(pk5 + (v_amp5 >= 0.999), 1.0) : 0.0;\nv_amp5 = atk_ph5 ? min(v_amp5 + a_rate, 1.0) : (gate5 ? (v_amp5 + (env_sustain - v_amp5) * d_coeff) : (v_amp5 + (0.0 - v_amp5) * r_coeff));\n\ngate6 = t6 > 0.5;\natk_ph6 = gate6 * (1.0 - pk6);\npk6 = gate6 ? min(pk6 + (v_amp6 >= 0.999), 1.0) : 0.0;\nv_amp6 = atk_ph6 ? min(v_amp6 + a_rate, 1.0) : (gate6 ? (v_amp6 + (env_sustain - v_amp6) * d_coeff) : (v_amp6 + (0.0 - v_amp6) * r_coeff));\n\n// === MUTE (click-free ~5ms fade) ===\nmute_coeff = 1.0 - exp(-1.0 / (0.005 * samplerate));\nmute_s = mute_s + (mute - mute_s) * mute_coeff;\nunmute = 1.0 - mute_s;\n\n// === Voice 1: Sub Bass (iya ilu) ===\ninv_adj1 = (oct1 < -0.5) * inv_up + (oct1 > 0.5) * inv_dn;\neff_oct1 = oct1 + inv_adj1 + reg + (oct1 < -0.5) * boct + (oct1 > 0.5) * toct;\ndeg1_eff = deg1 + transpose;\ndeg1_w = mod(floor(deg1_eff) + ts_size * 20, ts_size);\noct1_x = floor(deg1_eff / ts_size);\nr1_rat = peek(tuning_table, ts_base + 1 + deg1_w, 0);\nr1_jrat = (deg1_w<0.5)?j0:(deg1_w<1.5)?j1:(deg1_w<2.5)?j2:(deg1_w<3.5)?j3:j4;\nr1_rat = (ts < 0.5) ? (r1_rat * (1.0-flex) + r1_jrat * flex) : r1_rat;\nr1_freq = root * r1_rat * pow(2.0, eff_oct1 + oct1_x);\nr1_target = samplerate / max(r1_freq, 20);\nr1_sdl = (r1_sdl < 1) ? r1_target : r1_sdl + (r1_target - r1_sdl) * glide;\nexc1 = cx * s_cg * v_amp1 * unmute;\nr1_del = r1_d.read(r1_sdl);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_b = clamp(0.2 + brightness, 0, 1);\nr1_filt = r1_del * r1_b + r1_avg * (1.0 - r1_b);\nr1_out = tanh(r1_filt) * 0.9995;\nr1_d.write(exc1 + r1_out);\n\n// === SUB-BASS WAVEGUIDE (tracks voice 1 at -1 octave) ===\n// sub_drone=1: always resonates (gqom/dance bass bed)\n// sub_drone=0: follows voice 1 with 50ms attack / 2s release (pattern pulse)\nsub_tgt = (sub_drone > 0.5) ? 1.0 : v_amp1;\nsub_up = (sub_tgt > sub_env_h);\nsub_coeff = sub_up ? (1.0 - exp(-1.0 / (0.05 * samplerate))) : (1.0 - exp(-1.0 / (2.0 * samplerate)));\nsub_env_h = sub_env_h + (sub_tgt - sub_env_h) * sub_coeff;\nsub_freq = r1_freq * pow(2.0, sub_oct);\nsub_target = samplerate / max(sub_freq, 15);\nr_sub_sdl = (r_sub_sdl < 1) ? sub_target : r_sub_sdl + (sub_target - r_sub_sdl) * glide;\nexc_sub = cx * s_cg * sub_env_h * unmute * 1.5;\nsub_del = r_sub.read(r_sub_sdl);\nsub_avg = (sub_del + r_sub_pd) * 0.5;\nr_sub_pd = sub_del;\nsub_filt = sub_del * 0.1 + sub_avg * 0.9;\nsub_out = tanh(sub_filt) * 0.99995;\nr_sub.write(exc_sub + sub_out);\n\n// === Voice 2: Body (omele) ===\ninv_adj2 = (oct2 < -0.5) * inv_up + (oct2 > 0.5) * inv_dn;\neff_oct2 = oct2 + inv_adj2 + reg + (oct2 < -0.5) * boct + (oct2 > 0.5) * toct;\ndeg2_eff = deg2 + transpose;\ndeg2_w = mod(floor(deg2_eff) + ts_size * 20, ts_size);\noct2_x = floor(deg2_eff / ts_size);\nr2_rat = peek(tuning_table, ts_base + 1 + deg2_w, 0);\nr2_jrat = (deg2_w<0.5)?j0:(deg2_w<1.5)?j1:(deg2_w<2.5)?j2:(deg2_w<3.5)?j3:j4;\nr2_rat = (ts < 0.5) ? (r2_rat * (1.0-flex) + r2_jrat * flex) : r2_rat;\nr2_freq = root * r2_rat * pow(2.0, eff_oct2 + oct2_x);\nr2_target = samplerate / max(r2_freq, 20);\nr2_sdl = (r2_sdl < 1) ? r2_target : r2_sdl + (r2_target - r2_sdl) * glide;\nexc2 = cy * s_cg * v_amp2 * unmute;\nr2_del = r2_d.read(r2_sdl);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_b = clamp(0.4 + brightness, 0, 1);\nr2_filt = r2_del * r2_b + r2_avg * (1.0 - r2_b);\nr2_out = tanh(r2_filt) * 0.998;\nr2_d.write(exc2 + r2_out);\n\n// === Voice 3: Metallic (ogene) ===\ninv_adj3 = (oct3 < -0.5) * inv_up + (oct3 > 0.5) * inv_dn;\neff_oct3 = oct3 + inv_adj3 + reg + (oct3 < -0.5) * boct + (oct3 > 0.5) * toct;\ndeg3_eff = deg3 + transpose;\ndeg3_w = mod(floor(deg3_eff) + ts_size * 20, ts_size);\noct3_x = floor(deg3_eff / ts_size);\nr3_rat = peek(tuning_table, ts_base + 1 + deg3_w, 0);\nr3_jrat = (deg3_w<0.5)?j0:(deg3_w<1.5)?j1:(deg3_w<2.5)?j2:(deg3_w<3.5)?j3:j4;\nr3_rat = (ts < 0.5) ? (r3_rat * (1.0-flex) + r3_jrat * flex) : r3_rat;\nr3_freq = root * r3_rat * pow(2.0, eff_oct3 + oct3_x);\nr3_target = samplerate / max(r3_freq, 20);\nr3_sdl = (r3_sdl < 1) ? r3_target : r3_sdl + (r3_target - r3_sdl) * glide;\nexc3 = cz * s_cg * v_amp3 * unmute;\nr3_del = r3_d.read(r3_sdl);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_b = clamp(0.85 + brightness, 0, 1);\nr3_filt = r3_del * r3_b + r3_avg * (1.0 - r3_b);\nr3_out = tanh(r3_filt) * 0.996;\nr3_d.write(exc3 + r3_out);\n\n// === Voice 4: Transient (gudugudu) ===\ninv_adj4 = (oct4 < -0.5) * inv_up + (oct4 > 0.5) * inv_dn;\neff_oct4 = oct4 + inv_adj4 + reg + (oct4 < -0.5) * boct + (oct4 > 0.5) * toct;\ndeg4_eff = deg4 + transpose;\ndeg4_w = mod(floor(deg4_eff) + ts_size * 20, ts_size);\noct4_x = floor(deg4_eff / ts_size);\nr4_rat = peek(tuning_table, ts_base + 1 + deg4_w, 0);\nr4_jrat = (deg4_w<0.5)?j0:(deg4_w<1.5)?j1:(deg4_w<2.5)?j2:(deg4_w<3.5)?j3:j4;\nr4_rat = (ts < 0.5) ? (r4_rat * (1.0-flex) + r4_jrat * flex) : r4_rat;\nr4_freq = root * r4_rat * pow(2.0, eff_oct4 + oct4_x);\nr4_target = samplerate / max(r4_freq, 20);\nr4_sdl = (r4_sdl < 1) ? r4_target : r4_sdl + (r4_target - r4_sdl) * glide;\nexc4 = cx_456 * s_cg * v_amp4 * unmute;\nr4_del = r4_d.read(r4_sdl);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_b = clamp(0.9 + brightness, 0, 1);\nr4_filt = r4_del * r4_b + r4_avg * (1.0 - r4_b);\nr4_out = tanh(r4_filt) * 0.97;\nr4_d.write(exc4 + r4_out);\n\n// === Voice 5: Drone ===\ninv_adj5 = (oct5 < -0.5) * inv_up + (oct5 > 0.5) * inv_dn;\neff_oct5 = oct5 + inv_adj5 + reg + (oct5 < -0.5) * boct + (oct5 > 0.5) * toct;\ndeg5_eff = deg5 + transpose;\ndeg5_w = mod(floor(deg5_eff) + ts_size * 20, ts_size);\noct5_x = floor(deg5_eff / ts_size);\nr5_rat = peek(tuning_table, ts_base + 1 + deg5_w, 0);\nr5_jrat = (deg5_w<0.5)?j0:(deg5_w<1.5)?j1:(deg5_w<2.5)?j2:(deg5_w<3.5)?j3:j4;\nr5_rat = (ts < 0.5) ? (r5_rat * (1.0-flex) + r5_jrat * flex) : r5_rat;\nr5_freq = root * r5_rat * pow(2.0, eff_oct5 + oct5_x);\nr5_target = samplerate / max(r5_freq, 20);\nr5_sdl = (r5_sdl < 1) ? r5_target : r5_sdl + (r5_target - r5_sdl) * glide;\nexc5 = cy_456 * s_cg * v_amp5 * unmute;\nr5_del = r5_d.read(r5_sdl);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_b = clamp(0.3 + brightness, 0, 1);\nr5_filt = r5_del * r5_b + r5_avg * (1.0 - r5_b);\nr5_out = tanh(r5_filt) * 0.9998;\nr5_d.write(exc5 + r5_out);\n\n// === Voice 6: Crystalline (shekere) ===\ninv_adj6 = (oct6 < -0.5) * inv_up + (oct6 > 0.5) * inv_dn;\neff_oct6 = oct6 + inv_adj6 + reg + (oct6 < -0.5) * boct + (oct6 > 0.5) * toct;\ndeg6_eff = deg6 + transpose;\ndeg6_w = mod(floor(deg6_eff) + ts_size * 20, ts_size);\noct6_x = floor(deg6_eff / ts_size);\nr6_rat = peek(tuning_table, ts_base + 1 + deg6_w, 0);\nr6_jrat = (deg6_w<0.5)?j0:(deg6_w<1.5)?j1:(deg6_w<2.5)?j2:(deg6_w<3.5)?j3:j4;\nr6_rat = (ts < 0.5) ? (r6_rat * (1.0-flex) + r6_jrat * flex) : r6_rat;\nr6_freq = root * r6_rat * pow(2.0, eff_oct6 + oct6_x);\nr6_target = samplerate / max(r6_freq, 20);\nr6_sdl = (r6_sdl < 1) ? r6_target : r6_sdl + (r6_target - r6_sdl) * glide;\nexc6 = cz_456 * s_cg * v_amp6 * unmute;\nr6_del = r6_d.read(r6_sdl);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_b = clamp(0.95 + brightness, 0, 1);\nr6_filt = r6_del * r6_b + r6_avg * (1.0 - r6_b);\nr6_out = tanh(r6_filt) * 0.994;\nr6_d.write(exc6 + r6_out);\n\n// === STEREO MIX (with sub-bass + drive saturation) ===\nsub_g = sub_amt * 0.8;\nleft = r1_out*v_amp1*0.7 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.2 + r4_out*v_amp4*0.4 + r5_out*v_amp5*0.6 + r6_out*v_amp6*0.3 + sub_out*sub_g;\nright = r1_out*v_amp1*0.3 + r2_out*v_amp2*0.5 + r3_out*v_amp3*0.8 + r4_out*v_amp4*0.6 + r5_out*v_amp5*0.4 + r6_out*v_amp6*0.7 + sub_out*sub_g;\ndrv = max(1.0 + sub_drive, 1.0);\nout1 = tanh(left * drv) * master_gain * unmute;\nout2 = tanh(right * drv) * master_gain * unmute;"
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
										675.0,
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
										675.0,
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
					"id": "obj-r-toGen",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "r toGen",
					"patching_rect": [
						100.0,
						1877.0,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-l",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.8",
					"patching_rect": [
						100.0,
						1930.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-r",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.8",
					"patching_rect": [
						180.0,
						1930.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dac",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"text": "dac~",
					"patching_rect": [
						100.0,
						2010.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-scope-l",
					"maxclass": "scope~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						310.0,
						1900.0,
						160.0,
						50.0
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
						310.0,
						1955.0,
						160.0,
						50.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "L",
					"patching_rect": [
						475.0,
						1900.0,
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
					"numinlets": 1,
					"numoutlets": 0,
					"text": "R",
					"patching_rect": [
						475.0,
						1955.0,
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
						310.0,
						2010.0,
						160.0,
						16.0
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
						310.0,
						2030.0,
						160.0,
						16.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— RECORD ——",
					"patching_rect": [
						100.0,
						2045.0,
						120.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
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
						100.0,
						2065.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-hint",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "REC",
					"patching_rect": [
						128.0,
						2068.0,
						30.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-rec-path",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "saves to: recordings/ folder",
					"patching_rect": [
						160.0,
						2068.0,
						180.0,
						20.0
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-recorder",
					"maxclass": "newobj",
					"text": "p recorder",
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						100.0,
						2095.0,
						72.0,
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
							200,
							200,
							620,
							360
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
									"id": "r-in1",
									"maxclass": "newobj",
									"text": "in 1",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										"signal"
									],
									"patching_rect": [
										30.0,
										30.0,
										30.0,
										22.0
									],
									"comment": "signal L"
								}
							},
							{
								"box": {
									"id": "r-in2",
									"maxclass": "newobj",
									"text": "in 2",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										"signal"
									],
									"patching_rect": [
										100.0,
										30.0,
										30.0,
										22.0
									],
									"comment": "signal R"
								}
							},
							{
								"box": {
									"id": "r-in3",
									"maxclass": "newobj",
									"text": "in 3",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										250.0,
										30.0,
										30.0,
										22.0
									],
									"comment": "toggle 0/1"
								}
							},
							{
								"box": {
									"id": "r-sel",
									"maxclass": "newobj",
									"text": "sel 1 0",
									"numinlets": 1,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										""
									],
									"patching_rect": [
										250.0,
										65.0,
										50.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-trig",
									"maxclass": "newobj",
									"text": "t b b",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										250.0,
										100.0,
										33.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-date",
									"maxclass": "newobj",
									"text": "date",
									"numinlets": 1,
									"numoutlets": 6,
									"outlettype": [
										"int",
										"int",
										"int",
										"int",
										"int",
										"int"
									],
									"patching_rect": [
										310.0,
										100.0,
										80.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-sprintf",
									"maxclass": "newobj",
									"text": "sprintf recordings/chaos_%04d%02d%02d_%02d%02d%02d.wav",
									"numinlets": 6,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										310.0,
										140.0,
										260.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-prepend",
									"maxclass": "newobj",
									"text": "prepend open",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										310.0,
										175.0,
										78.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-del",
									"maxclass": "newobj",
									"text": "delay 150",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										250.0,
										140.0,
										52.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-start",
									"maxclass": "message",
									"text": "1",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										250.0,
										175.0,
										22.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-stop",
									"maxclass": "message",
									"text": "0",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										420.0,
										65.0,
										22.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-sf",
									"maxclass": "newobj",
									"text": "sfrecord~ 2",
									"numinlets": 3,
									"numoutlets": 1,
									"outlettype": [
										"signal"
									],
									"patching_rect": [
										30.0,
										220.0,
										80.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-out1",
									"maxclass": "newobj",
									"text": "out 1",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										310.0,
										220.0,
										35.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "r-label",
									"maxclass": "comment",
									"text": "One-click record\nToggle ON = auto-name + start\nToggle OFF = stop\nFiles save next to patch",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										260.0,
										200.0,
										60.0
									],
									"fontsize": 10.0,
									"linecount": 4
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"source": [
										"r-in1",
										0
									],
									"destination": [
										"r-sf",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-in2",
										0
									],
									"destination": [
										"r-sf",
										2
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-in3",
										0
									],
									"destination": [
										"r-sel",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-sel",
										0
									],
									"destination": [
										"r-trig",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-sel",
										1
									],
									"destination": [
										"r-stop",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-stop",
										0
									],
									"destination": [
										"r-sf",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-trig",
										1
									],
									"destination": [
										"r-date",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-date",
										0
									],
									"destination": [
										"r-sprintf",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-date",
										1
									],
									"destination": [
										"r-sprintf",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-date",
										2
									],
									"destination": [
										"r-sprintf",
										2
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-date",
										3
									],
									"destination": [
										"r-sprintf",
										3
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-date",
										4
									],
									"destination": [
										"r-sprintf",
										4
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-date",
										5
									],
									"destination": [
										"r-sprintf",
										5
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-sprintf",
										0
									],
									"destination": [
										"r-prepend",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-prepend",
										0
									],
									"destination": [
										"r-sf",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-trig",
										0
									],
									"destination": [
										"r-del",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-del",
										0
									],
									"destination": [
										"r-start",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-start",
										0
									],
									"destination": [
										"r-sf",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"r-sprintf",
										0
									],
									"destination": [
										"r-out1",
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
					"id": "obj-rec-name",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "",
					"patching_rect": [
						180.0,
						2095.0,
						200.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— RHO PRESETS ——",
					"patching_rect": [
						850,
						15,
						200.0,
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
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 20",
					"patching_rect": [
						850,
						37,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "converging (quiet)",
					"patching_rect": [
						907,
						37,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 24.74",
					"patching_rect": [
						850,
						61,
						73,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "onset of chaos (edge)",
					"patching_rect": [
						928,
						61,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 28",
					"patching_rect": [
						850,
						85,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "classic chaos",
					"patching_rect": [
						907,
						85,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 100",
					"patching_rect": [
						850,
						109,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "periodic orbit (pitched!)",
					"patching_rect": [
						914,
						109,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 166",
					"patching_rect": [
						850,
						133,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "stable periodic",
					"patching_rect": [
						914,
						133,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "rho 50",
					"patching_rect": [
						850,
						157,
						52,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rp6-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "intermittent bursts",
					"patching_rect": [
						907,
						157,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-rp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						181,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— CHAOS GAIN ——",
					"patching_rect": [
						850,
						209,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-cgp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.002",
					"patching_rect": [
						850,
						231,
						122,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "whisper",
					"patching_rect": [
						977,
						231,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.005",
					"patching_rect": [
						850,
						255,
						122,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "gentle",
					"patching_rect": [
						977,
						255,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.01",
					"patching_rect": [
						850,
						279,
						115,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "balanced (default)",
					"patching_rect": [
						970,
						279,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.03",
					"patching_rect": [
						850,
						303,
						115,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "aggressive",
					"patching_rect": [
						970,
						303,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "chaos_gain 0.1",
					"patching_rect": [
						850,
						327,
						108,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cgp5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "full distortion",
					"patching_rect": [
						963,
						327,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cgp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						351,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— GLIDE ——",
					"patching_rect": [
						850,
						379,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-gp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide 0.0002",
					"patching_rect": [
						850,
						401,
						94,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "slow (portamento)",
					"patching_rect": [
						949,
						401,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-gp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide 0.001",
					"patching_rect": [
						850,
						425,
						87,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "default (~22ms)",
					"patching_rect": [
						942,
						425,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-gp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "glide 0.01",
					"patching_rect": [
						850,
						449,
						80,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "fast (snap)",
					"patching_rect": [
						935,
						449,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-gp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						473,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ADSR PRESETS ——",
					"patching_rect": [
						850,
						501,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ep1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.001, env_decay 0.08, env_sustain 0.0, env_release 0.05",
					"patching_rect": [
						850,
						523,
						479,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Pluck",
					"patching_rect": [
						1334,
						523,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.3, env_decay 0.2, env_sustain 0.9, env_release 1.0",
					"patching_rect": [
						850,
						547,
						451,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Pad",
					"patching_rect": [
						1306,
						547,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 1.0, env_decay 0.5, env_sustain 0.7, env_release 2.0",
					"patching_rect": [
						850,
						571,
						451,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Swell",
					"patching_rect": [
						1306,
						571,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.001, env_decay 0.02, env_sustain 0.0, env_release 0.01",
					"patching_rect": [
						850,
						595,
						479,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Staccato",
					"patching_rect": [
						1334,
						595,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "env_attack 0.005, env_decay 0.05, env_sustain 0.8, env_release 0.1",
					"patching_rect": [
						850,
						619,
						472,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ep5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Default",
					"patching_rect": [
						1327,
						619,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ep-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						643,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— AFRICAN ROOTS ——",
					"patching_rect": [
						850,
						671,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ar0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 61",
					"patching_rect": [
						850,
						693,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar0-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun Low (Akinbo 2019: 61.4 Hz)",
					"patching_rect": [
						914,
						693,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 82",
					"patching_rect": [
						850,
						717,
						59,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Iya Ilu — bata mother drum",
					"patching_rect": [
						914,
						717,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 125",
					"patching_rect": [
						850,
						741,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun Mid (Akinbo 2019: 124.8 Hz)",
					"patching_rect": [
						921,
						741,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 172",
					"patching_rect": [
						850,
						765,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun High (Akinbo 2019: 172.3 Hz)",
					"patching_rect": [
						921,
						765,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 220",
					"patching_rect": [
						850,
						789,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Balafon — West African xylophone",
					"patching_rect": [
						921,
						789,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "root 350",
					"patching_rect": [
						850,
						813,
						66,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ar5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Agogo — Yoruba double bell",
					"patching_rect": [
						921,
						813,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ar-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						837,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— CHORD PRESETS ——",
					"patching_rect": [
						850,
						865,
						200.0,
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
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -1, oct6 1",
					"patching_rect": [
						850,
						887,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Yoruba Spread",
					"patching_rect": [
						1455,
						887,
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
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -2, oct6 1",
					"patching_rect": [
						850,
						911,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Root Cluster",
					"patching_rect": [
						1455,
						911,
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
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 1",
					"patching_rect": [
						850,
						935,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Open Fifths",
					"patching_rect": [
						1455,
						935,
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
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -2, oct2 -2, oct3 -1, oct4 -1, oct5 -2, oct6 -1",
					"patching_rect": [
						850,
						959,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-cp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Sub Drone",
					"patching_rect": [
						1455,
						959,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-cp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						983,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dr-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— DRONE PRESETS ——",
					"patching_rect": [
						850,
						1011,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-dr1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5",
					"patching_rect": [
						850,
						1033,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dr1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Root Drone",
					"patching_rect": [
						1455,
						1033,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-dr2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 0, oct4 0, oct5 1, oct6 1, arp_mode 5",
					"patching_rect": [
						850,
						1057,
						600,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dr2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Fifth Drone",
					"patching_rect": [
						1455,
						1057,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-dr-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						1081,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— ATTRACTOR COMBOS ——",
					"patching_rect": [
						850,
						1109,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-ac1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 0, att_b_sel -1",
					"patching_rect": [
						850,
						1131,
						171,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Lorenz Solo (default)",
					"patching_rect": [
						1026,
						1131,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 1, att_b_sel -1, ross_c 5.7",
					"patching_rect": [
						850,
						1155,
						255,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Rossler Solo",
					"patching_rect": [
						1110,
						1155,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 2, att_b_sel -1, chua_alpha 15.6",
					"patching_rect": [
						850,
						1179,
						290,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Chua Solo",
					"patching_rect": [
						1145,
						1179,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 3, att_b_sel -1, halv_a 1.89",
					"patching_rect": [
						850,
						1203,
						262,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Halvorsen Solo",
					"patching_rect": [
						1117,
						1203,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 4, att_b_sel -1, aiz_c 0.6, aiz_d 3.5",
					"patching_rect": [
						850,
						1227,
						325,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Aizawa Solo",
					"patching_rect": [
						1180,
						1227,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 0, att_b_sel 1, combine_mode 0, blend_mix 0.5",
					"patching_rect": [
						850,
						1251,
						381,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac6-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Lorenz+Rossler Blend",
					"patching_rect": [
						1236,
						1251,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac7",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 0, att_b_sel 2, combine_mode 1, mod_depth 0.3",
					"patching_rect": [
						850,
						1275,
						381,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac7-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Lorenz×Chua Modulate",
					"patching_rect": [
						1236,
						1275,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac8",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 0, att_b_sel 3, combine_mode 2",
					"patching_rect": [
						850,
						1299,
						276,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac8-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Lorenz|Halvorsen Route",
					"patching_rect": [
						1131,
						1299,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac9",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 1, att_b_sel 4, combine_mode 1, mod_depth 0.7",
					"patching_rect": [
						850,
						1323,
						381,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac9-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Rossler×Aizawa Modulate",
					"patching_rect": [
						1236,
						1323,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac10",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "att_sel 3, att_b_sel 4, combine_mode 0, blend_mix 0.3",
					"patching_rect": [
						850,
						1347,
						381,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ac10-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Halvorsen+Aizawa Blend",
					"patching_rect": [
						1236,
						1347,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-ac-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						1371,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— PATTERN PRESETS ——",
					"patching_rect": [
						850,
						1399,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-pp1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 8, arp_div 3, arp_bpm 120",
					"patching_rect": [
						850,
						1421,
						248,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Bembe 12/8 triplet feel",
					"patching_rect": [
						1103,
						1421,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 9, arp_div 2, arp_bpm 90",
					"patching_rect": [
						850,
						1445,
						241,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Shiko slow 1/8",
					"patching_rect": [
						1096,
						1445,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 6, arp_div 4, arp_bpm 130",
					"patching_rect": [
						850,
						1469,
						248,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Poly 3:2 fast 1/16",
					"patching_rect": [
						1103,
						1469,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 10, arp_div 1, arp_bpm 100",
					"patching_rect": [
						850,
						1493,
						255,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Call/Resp quarter note",
					"patching_rect": [
						1110,
						1493,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 11, arp_div 2, arp_bpm 110",
					"patching_rect": [
						850,
						1517,
						255,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Gahu 15-step — Ewe dance",
					"patching_rect": [
						1110,
						1517,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 12, arp_div 4, arp_bpm 95",
					"patching_rect": [
						850,
						1541,
						248,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp6-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Son Clave 3:2 — Afro-Cuban",
					"patching_rect": [
						1103,
						1541,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp7",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 13, arp_div 3, arp_bpm 120",
					"patching_rect": [
						850,
						1565,
						255,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp7-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Fume Fume — Ewe ceremony",
					"patching_rect": [
						1110,
						1565,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp8",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "arp_mode 14, arp_div 4, arp_bpm 140",
					"patching_rect": [
						850,
						1589,
						255,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-pp8-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Kassa — Manding harvest",
					"patching_rect": [
						1110,
						1589,
						250.0,
						20.0
					],
					"fontsize": 12.0
				}
			},
			{
				"box": {
					"id": "obj-pp-label-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						1613,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "—— TUNING SYSTEMS ——",
					"patching_rect": [
						850,
						1641,
						200.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsr-wes",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "West African",
					"patching_rect": [
						850,
						1663,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 0",
					"patching_rect": [
						850,
						1683,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-0-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Yoruba Pentatonic",
					"patching_rect": [
						955,
						1683,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 1",
					"patching_rect": [
						850,
						1707,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-1-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Dundun 3-Tone",
					"patching_rect": [
						955,
						1707,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 2",
					"patching_rect": [
						850,
						1731,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-2-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Balafon Equi-Penta",
					"patching_rect": [
						955,
						1731,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-3",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 3",
					"patching_rect": [
						850,
						1755,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-3-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Equi-Heptatonic 7-TET",
					"patching_rect": [
						955,
						1755,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-18",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 18",
					"patching_rect": [
						850,
						1779,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-18-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Igbo Pentatonic",
					"patching_rect": [
						955,
						1779,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-man",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Mandinka / Senegambia",
					"patching_rect": [
						850,
						1809,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-7",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 7",
					"patching_rect": [
						850,
						1829,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-7-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Kora Silaba",
					"patching_rect": [
						955,
						1829,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-8",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 8",
					"patching_rect": [
						850,
						1853,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-8-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Kora Sauta",
					"patching_rect": [
						955,
						1853,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-cen",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Central African",
					"patching_rect": [
						850,
						1883,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-4",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 4",
					"patching_rect": [
						850,
						1903,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-4-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "BaAka/Pygmy 5-TET",
					"patching_rect": [
						955,
						1903,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-eas",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "East African",
					"patching_rect": [
						850,
						1933,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-9",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 9",
					"patching_rect": [
						850,
						1953,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-9-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Tizita Major",
					"patching_rect": [
						955,
						1953,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-10",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 10",
					"patching_rect": [
						850,
						1977,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-10-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Tizita Minor",
					"patching_rect": [
						955,
						1977,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-11",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 11",
					"patching_rect": [
						850,
						2001,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-11-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Bati",
					"patching_rect": [
						955,
						2001,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-12",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 12",
					"patching_rect": [
						850,
						2025,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-12-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Ambassel",
					"patching_rect": [
						955,
						2025,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-13",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 13",
					"patching_rect": [
						850,
						2049,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-13-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Anchihoye",
					"patching_rect": [
						955,
						2049,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-14",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 14",
					"patching_rect": [
						850,
						2073,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-14-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Amadinda",
					"patching_rect": [
						955,
						2073,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-17",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 17",
					"patching_rect": [
						850,
						2097,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-17-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Wagogo Ilimba",
					"patching_rect": [
						955,
						2097,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsr-sou",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Southern African",
					"patching_rect": [
						850,
						2127,
						180.0,
						20.0
					],
					"fontsize": 12.0,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-tsp-5",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 5",
					"patching_rect": [
						850,
						2147,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-5-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Shona Nyamaropa",
					"patching_rect": [
						955,
						2147,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 6",
					"patching_rect": [
						850,
						2171,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-6-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Shona Gandanga",
					"patching_rect": [
						955,
						2171,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-15",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 15",
					"patching_rect": [
						850,
						2195,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-15-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "Chopi Timbila",
					"patching_rect": [
						955,
						2195,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-16",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "tuning_system 16",
					"patching_rect": [
						850,
						2219,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tsp-16-l",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "San Musical Bow",
					"patching_rect": [
						955,
						2219,
						170.0,
						20.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-tsp-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "s toGen",
					"patching_rect": [
						850,
						2249,
						52.0,
						22.0
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-mute-tog",
						0
					],
					"destination": [
						"obj-mute-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mute-m",
						0
					],
					"destination": [
						"obj-s-mute",
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
						"obj-s-reset",
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
						"obj-s-reset",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sm-0",
						0
					],
					"destination": [
						"obj-s-smooth",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sm-1",
						0
					],
					"destination": [
						"obj-s-smooth",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sm-2",
						0
					],
					"destination": [
						"obj-s-smooth",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sm-3",
						0
					],
					"destination": [
						"obj-s-smooth",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-midi",
						0
					],
					"destination": [
						"obj-bpm-disp",
						0
					]
				}
			},
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
						"obj-sigma-m",
						0
					],
					"destination": [
						"obj-s-lor",
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
						"obj-s-lor",
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
						"obj-s-lor",
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
						"obj-s-lor",
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
						"obj-s-lor",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-bmix-n",
						0
					],
					"destination": [
						"obj-bmix-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mdep-n",
						0
					],
					"destination": [
						"obj-mdep-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ross_c-n",
						0
					],
					"destination": [
						"obj-ross_c-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-chua_a-n",
						0
					],
					"destination": [
						"obj-chua_a-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-halv_a-n",
						0
					],
					"destination": [
						"obj-halv_a-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-aizc-n",
						0
					],
					"destination": [
						"obj-aizc-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-aizd-n",
						0
					],
					"destination": [
						"obj-aizd-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-a-0",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-a-1",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-a-2",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-a-3",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-a-4",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-b--1",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-b-0",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-b-1",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-b-2",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-b-3",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-att-b-4",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cm-0",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cm-1",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cm-2",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-bmix-m",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mdep-m",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ross_c-m",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-chua_a-m",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-halv_a-m",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-aizc-m",
						0
					],
					"destination": [
						"obj-s-att",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-aizd-m",
						0
					],
					"destination": [
						"obj-s-att",
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
						"obj-root-n",
						0
					],
					"destination": [
						"obj-root-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-snap-tog",
						0
					],
					"destination": [
						"obj-root-snap",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-snap",
						0
					],
					"destination": [
						"obj-root-n",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-brt-n",
						0
					],
					"destination": [
						"obj-brt-m",
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
						"obj-s-res",
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
						"obj-s-res",
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
						"obj-s-res",
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
						"obj-s-res",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-brt-m",
						0
					],
					"destination": [
						"obj-s-res",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-res-def",
						0
					],
					"destination": [
						"obj-s-res",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sub-n",
						0
					],
					"destination": [
						"obj-sub-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drv-n",
						0
					],
					"destination": [
						"obj-drv-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sdr-tog",
						0
					],
					"destination": [
						"obj-sdr-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-soct-n",
						0
					],
					"destination": [
						"obj-soct-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sub-m",
						0
					],
					"destination": [
						"obj-s-sub",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drv-m",
						0
					],
					"destination": [
						"obj-s-sub",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sdr-m",
						0
					],
					"destination": [
						"obj-s-sub",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-soct-m",
						0
					],
					"destination": [
						"obj-s-sub",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ts-n",
						0
					],
					"destination": [
						"obj-ts-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-inv-n",
						0
					],
					"destination": [
						"obj-inv-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trn-n",
						0
					],
					"destination": [
						"obj-trn-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reg-n",
						0
					],
					"destination": [
						"obj-reg-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-boct-n",
						0
					],
					"destination": [
						"obj-boct-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-toct-n",
						0
					],
					"destination": [
						"obj-toct-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ts-m",
						0
					],
					"destination": [
						"obj-s-tun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-inv-m",
						0
					],
					"destination": [
						"obj-s-tun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trn-m",
						0
					],
					"destination": [
						"obj-s-tun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-reg-m",
						0
					],
					"destination": [
						"obj-s-tun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-boct-m",
						0
					],
					"destination": [
						"obj-s-tun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-toct-m",
						0
					],
					"destination": [
						"obj-s-tun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-bpm-n",
						0
					],
					"destination": [
						"obj-bpm-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arpr-n",
						0
					],
					"destination": [
						"obj-arpr-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-0",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-1",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-2",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-3",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-4",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-5",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-6",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-7",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-8",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-9",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-10",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-11",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-12",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-13",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arp-14",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-div-0",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-div-1",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-div-2",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-div-3",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-div-4",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-div-5",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-bpm-m",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-arpr-m",
						0
					],
					"destination": [
						"obj-s-arp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-atk-n",
						0
					],
					"destination": [
						"obj-atk-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dec-n",
						0
					],
					"destination": [
						"obj-dec-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sus-n",
						0
					],
					"destination": [
						"obj-sus-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rel-n",
						0
					],
					"destination": [
						"obj-rel-m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-atk-m",
						0
					],
					"destination": [
						"obj-s-adsr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dec-m",
						0
					],
					"destination": [
						"obj-s-adsr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sus-m",
						0
					],
					"destination": [
						"obj-s-adsr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-rel-m",
						0
					],
					"destination": [
						"obj-s-adsr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-toGen",
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
						"obj-gain-l",
						0
					],
					"destination": [
						"obj-recorder",
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
						"obj-recorder",
						1
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
						"obj-recorder",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-recorder",
						0
					],
					"destination": [
						"obj-rec-name",
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
						"obj-rp-label-send",
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
						"obj-rp-label-send",
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
						"obj-rp-label-send",
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
						"obj-rp-label-send",
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
						"obj-rp-label-send",
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
						"obj-rp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp1",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp2",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp3",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp4",
						0
					],
					"destination": [
						"obj-cgp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-cgp5",
						0
					],
					"destination": [
						"obj-cgp-label-send",
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
						"obj-gp-label-send",
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
						"obj-gp-label-send",
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
						"obj-gp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep1",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep2",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep3",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep4",
						0
					],
					"destination": [
						"obj-ep-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ep5",
						0
					],
					"destination": [
						"obj-ep-label-send",
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
						"obj-ar-label-send",
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
						"obj-ar-label-send",
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
						"obj-ar-label-send",
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
						"obj-ar-label-send",
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
						"obj-ar-label-send",
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
						"obj-ar-label-send",
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
						"obj-cp-label-send",
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
						"obj-cp-label-send",
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
						"obj-cp-label-send",
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
						"obj-cp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dr1",
						0
					],
					"destination": [
						"obj-dr-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-dr2",
						0
					],
					"destination": [
						"obj-dr-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac1",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac2",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac3",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac4",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac5",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac6",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac7",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac8",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac9",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ac10",
						0
					],
					"destination": [
						"obj-ac-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp1",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp2",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp3",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp4",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp5",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp6",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp7",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-pp8",
						0
					],
					"destination": [
						"obj-pp-label-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-0",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-1",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-2",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-3",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-18",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-7",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-8",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-4",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-9",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-10",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-11",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-12",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-13",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-14",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-17",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-5",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-6",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-15",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tsp-16",
						0
					],
					"destination": [
						"obj-tsp-send",
						0
					]
				}
			}
		]
	}
}