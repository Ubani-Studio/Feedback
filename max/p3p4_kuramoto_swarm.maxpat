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
			1600,
			900
		],
		"bglocked": 0,
		"openinpresentation": 1,
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
					"text": "P3+P4 \u2014 KURAMOTO RHYTHM + SWARM POLYPHONY\n\nKuramoto coupled oscillators fire triggers into resonators.\nSwarm agents traverse Yoruba pentatonic space \u2192 note events.\nKuramoto gates the swarm (when groove locks, notes fire).\nAll features \u2192 OSC \u2192 TouchDesigner (port 7000).\nnn~ slot for PERI / RAVE model processing.\n\n1. Turn on ezdac~\n2. Adjust K (coupling) \u2014 sweet spot 0.3-0.7\n3. Swarm preset: callresponse / flock / cluster / swarming",
					"patching_rect": [
						15.0,
						15.0,
						380.0,
						165.0
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
						200.0,
						45.0,
						45.0
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						10,
						45,
						45
					]
				}
			},
			{
				"box": {
					"id": "obj-loadbang",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "loadbang",
					"patching_rect": [
						200.0,
						200.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-startdsp",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "startwindow",
					"patching_rect": [
						200.0,
						230.0,
						75.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-dac-msg",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "dac~",
					"patching_rect": [
						200.0,
						260.0,
						35.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-p3",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 P3: KURAMOTO COUPLED RHYTHM \u2500\u2500",
					"patching_rect": [
						15.0,
						300.0,
						300.0,
						20.0
					],
					"fontface": 1,
					"fontsize": 14.0
				}
			},
			{
				"box": {
					"id": "obj-K",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						15.0,
						340.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "K",
							"parameter_shortname": "K",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 2.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-tempo",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						80.0,
						340.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						70,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Tempo",
							"parameter_shortname": "Tempo",
							"parameter_type": 0,
							"parameter_mmin": 30.0,
							"parameter_mmax": 300.0,
							"parameter_initial": [
								120
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 4
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-trigwidth",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						145.0,
						340.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						130,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "TrigWidth",
							"parameter_shortname": "Trig",
							"parameter_type": 0,
							"parameter_mmin": 0.0001,
							"parameter_mmax": 0.05,
							"parameter_initial": [
								0.001
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-K-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend K",
					"patching_rect": [
						15.0,
						400.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tempo-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend tempo",
					"patching_rect": [
						80.0,
						400.0,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-trig-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend trig_width",
					"patching_rect": [
						145.0,
						400.0,
						105.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-kuramoto",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 13,
					"outlettype": [
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal",
						"signal"
					],
					"text": "gen~ @gen kuramoto",
					"patching_rect": [
						15.0,
						440.0,
						500.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-resonators",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 RESONATOR ENSEMBLE (6 voices, 19 tuning systems) \u2500\u2500",
					"patching_rect": [
						15.0,
						480.0,
						400.0,
						20.0
					],
					"fontface": 1,
					"fontsize": 14.0
				}
			},
			{
				"box": {
					"id": "obj-root",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						15.0,
						510.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						130,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Root",
							"parameter_shortname": "Root",
							"parameter_type": 0,
							"parameter_mmin": 20.0,
							"parameter_mmax": 880.0,
							"parameter_initial": [
								110
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 3
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-flex",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						80.0,
						510.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						70,
						130,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Flex",
							"parameter_shortname": "Flex",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-tuningsys",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						145.0,
						510.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						130,
						130,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Tuning",
							"parameter_shortname": "Tuning",
							"parameter_type": 1,
							"parameter_mmin": 0,
							"parameter_mmax": 18,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-drive",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						210.0,
						510.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						190,
						130,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Drive",
							"parameter_shortname": "Drive",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-root-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend root",
					"patching_rect": [
						15.0,
						570.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-flex-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend flex",
					"patching_rect": [
						80.0,
						570.0,
						68.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-tuning-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend tuning_system",
					"patching_rect": [
						145.0,
						570.0,
						120.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-drive-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend drive",
					"patching_rect": [
						210.0,
						570.0,
						75.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-resonator-ensemble",
					"maxclass": "newobj",
					"numinlets": 6,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"text": "gen~ @gen resonator_ensemble",
					"patching_rect": [
						15.0,
						610.0,
						500.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-p4",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 P4: SWARM POLYPHONY (Reynolds Boids) \u2500\u2500",
					"patching_rect": [
						600.0,
						300.0,
						400.0,
						20.0
					],
					"fontface": 1,
					"fontsize": 14.0
				}
			},
			{
				"box": {
					"id": "obj-metro",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "metro 10",
					"patching_rect": [
						600.0,
						340.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-metro-toggle",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"patching_rect": [
						600.0,
						310.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						300,
						10,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "obj-swarm-preset-menu",
					"maxclass": "umenu",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"int",
						"",
						""
					],
					"patching_rect": [
						700.0,
						310.0,
						120.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						330,
						10,
						120,
						22
					],
					"items": [
						"callresponse",
						"flock",
						"cluster",
						"swarming",
						"drone",
						"scatter"
					]
				}
			},
			{
				"box": {
					"id": "obj-preset-route",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend preset",
					"patching_rect": [
						700.0,
						340.0,
						82.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-sep",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						600.0,
						380.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						300,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Separation",
							"parameter_shortname": "Sep",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 2.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-ali",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						665.0,
						380.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						360,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Alignment",
							"parameter_shortname": "Ali",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 2.0,
							"parameter_initial": [
								0.3
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-coh",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						730.0,
						380.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						420,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Cohesion",
							"parameter_shortname": "Coh",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 2.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-sep-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend separation",
					"patching_rect": [
						600.0,
						440.0,
						105.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ali-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend alignment",
					"patching_rect": [
						665.0,
						440.0,
						95.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-coh-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend cohesion",
					"patching_rect": [
						730.0,
						440.0,
						92.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-swarm",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 4,
					"outlettype": [
						"",
						"",
						"",
						""
					],
					"text": "js swarm.js",
					"patching_rect": [
						600.0,
						480.0,
						300.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-swarm-pos",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "positions",
					"patching_rect": [
						700.0,
						505.0,
						60.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-swarm-met",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "metrics",
					"patching_rect": [
						800.0,
						505.0,
						60.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-poly-swarm",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"signal",
						"signal",
						""
					],
					"text": "poly~ swarm_voice_wrapper 6",
					"patching_rect": [
						600.0,
						600.0,
						200.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-kuramoto-gate",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 KURAMOTO \u2192 SWARM GATE \u2500\u2500\nKuramoto order param r \u2192 swarm gate.\nWhen r > threshold: swarm notes fire.\nGroove emergence gates polyphony.",
					"patching_rect": [
						350.0,
						300.0,
						230.0,
						65.0
					],
					"fontsize": 11.0,
					"linecount": 4
				}
			},
			{
				"box": {
					"id": "obj-gate-threshold",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						400.0,
						380.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						200,
						70,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Gate Thresh",
							"parameter_shortname": "Gate",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.4
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-r-snapshot",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						400.0,
						460.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gate-compare",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"text": "> 0.4",
					"patching_rect": [
						400.0,
						490.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gate-select",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"text": "select 1",
					"patching_rect": [
						400.0,
						520.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-mix",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 OUTPUT MIX \u2500\u2500",
					"patching_rect": [
						15.0,
						650.0,
						200.0,
						20.0
					],
					"fontface": 1,
					"fontsize": 14.0
				}
			},
			{
				"box": {
					"id": "obj-p3-gain",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						15.0,
						680.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						200,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "P3 Vol",
							"parameter_shortname": "P3",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.7
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-p4-gain",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						80.0,
						680.0,
						50.0,
						48.0
					],
					"presentation": 1,
					"presentation_rect": [
						70,
						200,
						50,
						48
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "P4 Vol",
							"parameter_shortname": "P4",
							"parameter_type": 0,
							"parameter_mmin": 0.0,
							"parameter_mmax": 1.0,
							"parameter_initial": [
								0.5
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-p3-gain-L",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.7",
					"patching_rect": [
						15.0,
						740.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p3-gain-R",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.7",
					"patching_rect": [
						115.0,
						740.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p4-gain-L",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.5",
					"patching_rect": [
						215.0,
						740.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p4-gain-R",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "*~ 0.5",
					"patching_rect": [
						315.0,
						740.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mix-L",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "+~",
					"patching_rect": [
						15.0,
						780.0,
						35.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mix-R",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"text": "+~",
					"patching_rect": [
						115.0,
						780.0,
						35.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-output-dac",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"text": "dac~ 1 2",
					"patching_rect": [
						15.0,
						1050.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-comment-osc",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "\u2500\u2500 OSC \u2192 TOUCHDESIGNER (port 7000) \u2500\u2500",
					"patching_rect": [
						1050.0,
						300.0,
						350.0,
						20.0
					],
					"fontface": 1,
					"fontsize": 14.0
				}
			},
			{
				"box": {
					"id": "obj-udpsend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "udpsend localhost 7000",
					"patching_rect": [
						1050.0,
						700.0,
						140.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-r-metro",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"text": "metro 50",
					"patching_rect": [
						1050.0,
						340.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-r-snap",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1050.0,
						370.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-r-osc-msg",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "pak /r 0.",
					"patching_rect": [
						1050.0,
						400.0,
						60.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-snap1",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1050.0,
						440.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-snap2",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1130.0,
						440.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-snap3",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1210.0,
						440.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-snap4",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1290.0,
						440.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-snap5",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1370.0,
						440.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-snap6",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"text": "snapshot~ 50",
					"patching_rect": [
						1450.0,
						440.0,
						72.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-phase-pak",
					"maxclass": "newobj",
					"numinlets": 6,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "pak /phases 0. 0. 0. 0. 0. 0.",
					"patching_rect": [
						1050.0,
						480.0,
						300.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-swarm-pos-osc",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend /swarm/positions",
					"patching_rect": [
						1050.0,
						600.0,
						140.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-swarm-met-osc",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend /swarm/metrics",
					"patching_rect": [
						1200.0,
						600.0,
						130.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-swarm-trig-osc",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend /swarm/trigger",
					"patching_rect": [
						1350.0,
						600.0,
						125.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-osc-funnel",
					"maxclass": "newobj",
					"numinlets": 7,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "funnel 7",
					"patching_rect": [
						1050.0,
						660.0,
						350.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-meter-L",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						15.0,
						1090.0,
						200.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						10,
						320,
						200,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-meter-R",
					"maxclass": "meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						215.0,
						1090.0,
						200.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						220,
						320,
						200,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-gate-mode-toggle",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"patching_rect": [
						460.0,
						380.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						260,
						78,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "obj-gate-mode-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "K Gate",
					"patching_rect": [
						490.0,
						382.0,
						45.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						260,
						102,
						45,
						20
					],
					"fontsize": 10.0
				}
			},
			{
				"box": {
					"id": "obj-gate-mode-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"text": "prepend gate_mode_set",
					"patching_rect": [
						460.0,
						410.0,
						120.0,
						22.0
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-loadbang",
						0
					],
					"destination": [
						"obj-startdsp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-startdsp",
						0
					],
					"destination": [
						"obj-dac-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-loadbang",
						0
					],
					"destination": [
						"obj-metro-toggle",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-K",
						0
					],
					"destination": [
						"obj-K-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tempo",
						0
					],
					"destination": [
						"obj-tempo-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trigwidth",
						0
					],
					"destination": [
						"obj-trig-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-K-prepend",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tempo-prepend",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-trig-prepend",
						0
					],
					"destination": [
						"obj-kuramoto",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						0
					],
					"destination": [
						"obj-resonator-ensemble",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						1
					],
					"destination": [
						"obj-resonator-ensemble",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						2
					],
					"destination": [
						"obj-resonator-ensemble",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						3
					],
					"destination": [
						"obj-resonator-ensemble",
						3
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						4
					],
					"destination": [
						"obj-resonator-ensemble",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						5
					],
					"destination": [
						"obj-resonator-ensemble",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root",
						0
					],
					"destination": [
						"obj-root-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex",
						0
					],
					"destination": [
						"obj-flex-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tuningsys",
						0
					],
					"destination": [
						"obj-tuning-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drive",
						0
					],
					"destination": [
						"obj-drive-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-prepend",
						0
					],
					"destination": [
						"obj-resonator-ensemble",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-prepend",
						0
					],
					"destination": [
						"obj-resonator-ensemble",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-tuning-prepend",
						0
					],
					"destination": [
						"obj-resonator-ensemble",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drive-prepend",
						0
					],
					"destination": [
						"obj-resonator-ensemble",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-metro-toggle",
						0
					],
					"destination": [
						"obj-metro",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-metro",
						0
					],
					"destination": [
						"obj-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm-preset-menu",
						1
					],
					"destination": [
						"obj-preset-route",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-preset-route",
						0
					],
					"destination": [
						"obj-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sep",
						0
					],
					"destination": [
						"obj-sep-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ali",
						0
					],
					"destination": [
						"obj-ali-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-coh",
						0
					],
					"destination": [
						"obj-coh-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-sep-prepend",
						0
					],
					"destination": [
						"obj-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-ali-prepend",
						0
					],
					"destination": [
						"obj-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-coh-prepend",
						0
					],
					"destination": [
						"obj-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						6
					],
					"destination": [
						"obj-r-snapshot",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-snapshot",
						0
					],
					"destination": [
						"obj-gate-compare",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gate-threshold",
						0
					],
					"destination": [
						"obj-gate-compare",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gate-compare",
						0
					],
					"destination": [
						"obj-gate-select",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gate-select",
						0
					],
					"destination": [
						"obj-swarm",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-resonator-ensemble",
						0
					],
					"destination": [
						"obj-p3-gain-L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-resonator-ensemble",
						1
					],
					"destination": [
						"obj-p3-gain-R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-poly-swarm",
						0
					],
					"destination": [
						"obj-p4-gain-L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-poly-swarm",
						1
					],
					"destination": [
						"obj-p4-gain-R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p3-gain-L",
						0
					],
					"destination": [
						"obj-mix-L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p4-gain-L",
						0
					],
					"destination": [
						"obj-mix-L",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p3-gain-R",
						0
					],
					"destination": [
						"obj-mix-R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p4-gain-R",
						0
					],
					"destination": [
						"obj-mix-R",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-loadbang",
						0
					],
					"destination": [
						"obj-r-metro",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						6
					],
					"destination": [
						"obj-r-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-r-snap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-snap",
						0
					],
					"destination": [
						"obj-r-osc-msg",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-osc-msg",
						0
					],
					"destination": [
						"obj-osc-funnel",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						7
					],
					"destination": [
						"obj-phase-snap1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						8
					],
					"destination": [
						"obj-phase-snap2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						9
					],
					"destination": [
						"obj-phase-snap3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						10
					],
					"destination": [
						"obj-phase-snap4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						11
					],
					"destination": [
						"obj-phase-snap5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-kuramoto",
						12
					],
					"destination": [
						"obj-phase-snap6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-phase-snap1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-phase-snap2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-phase-snap3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-phase-snap4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-phase-snap5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-phase-snap6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap1",
						0
					],
					"destination": [
						"obj-phase-pak",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap2",
						0
					],
					"destination": [
						"obj-phase-pak",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap3",
						0
					],
					"destination": [
						"obj-phase-pak",
						3
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap4",
						0
					],
					"destination": [
						"obj-phase-pak",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap5",
						0
					],
					"destination": [
						"obj-phase-pak",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-snap6",
						0
					],
					"destination": [
						"obj-phase-pak",
						6
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-phase-pak",
						0
					],
					"destination": [
						"obj-osc-funnel",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm",
						1
					],
					"destination": [
						"obj-swarm-pos-osc",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm",
						2
					],
					"destination": [
						"obj-swarm-met-osc",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm",
						3
					],
					"destination": [
						"obj-swarm-trig-osc",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm-pos-osc",
						0
					],
					"destination": [
						"obj-osc-funnel",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm-met-osc",
						0
					],
					"destination": [
						"obj-osc-funnel",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm-trig-osc",
						0
					],
					"destination": [
						"obj-osc-funnel",
						6
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-osc-funnel",
						0
					],
					"destination": [
						"obj-udpsend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mix-L",
						0
					],
					"destination": [
						"obj-output-dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mix-R",
						0
					],
					"destination": [
						"obj-output-dac",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mix-L",
						0
					],
					"destination": [
						"obj-ezdac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mix-R",
						0
					],
					"destination": [
						"obj-ezdac",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mix-L",
						0
					],
					"destination": [
						"obj-meter-L",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mix-R",
						0
					],
					"destination": [
						"obj-meter-R",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p3-gain",
						0
					],
					"destination": [
						"obj-p3-gain-L",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p3-gain",
						0
					],
					"destination": [
						"obj-p3-gain-R",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p4-gain",
						0
					],
					"destination": [
						"obj-p4-gain-L",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-p4-gain",
						0
					],
					"destination": [
						"obj-p4-gain-R",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gate-mode-toggle",
						0
					],
					"destination": [
						"obj-gate-mode-prepend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-gate-mode-prepend",
						0
					],
					"destination": [
						"obj-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-swarm",
						0
					],
					"destination": [
						"obj-poly-swarm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-r-metro",
						0
					],
					"destination": [
						"obj-r-snapshot",
						0
					]
				}
			}
		]
	}
}