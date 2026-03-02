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
			60,
			1400,
			800
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
					"text": "STEP 1.4: RECORD THE ENSEMBLE\n\nSame ensemble as Step 1.3 + recording.\n\n1. Turn on ezdac\n2. Click 'open' to choose save location\n3. Toggle RECORD on\n4. Play for 10 minutes\n5. Toggle RECORD off",
					"linecount": 7,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						15.0,
						280.0,
						110.0
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
						160.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "obj-bang",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						100.0,
						160.0,
						40.0,
						40.0
					]
				}
			},
			{
				"box": {
					"id": "obj-metro-label",
					"maxclass": "comment",
					"text": "auto",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						175.0,
						148.0,
						40.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-metro-tog",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						175.0,
						165.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-metro",
					"maxclass": "newobj",
					"text": "metro 600",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						175.0,
						200.0,
						65.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-click",
					"maxclass": "newobj",
					"text": "click~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						100.0,
						240.0,
						40.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-ctrl-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 CONTROLS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						148.0,
						130.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-root-label",
					"maxclass": "comment",
					"text": "root Hz",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						168.0,
						55.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-root-num",
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
						188.0,
						60.0,
						22.0
					],
					"minimum": 20.0,
					"maximum": 880.0
				}
			},
			{
				"box": {
					"id": "obj-root-msg",
					"maxclass": "message",
					"text": "root $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						350.0,
						218.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-flex-label",
					"maxclass": "comment",
					"text": "flex",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						425.0,
						168.0,
						40.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-flex-num",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						425.0,
						188.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-flex-msg",
					"maxclass": "message",
					"text": "flex $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						425.0,
						218.0,
						48.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-drive-label",
					"maxclass": "comment",
					"text": "drive",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						500.0,
						168.0,
						40.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-drive-num",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						500.0,
						188.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-drive-msg",
					"maxclass": "message",
					"text": "drive $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						500.0,
						218.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-mgain-label",
					"maxclass": "comment",
					"text": "master",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						575.0,
						168.0,
						50.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-mgain-num",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						575.0,
						188.0,
						55.0,
						22.0
					],
					"minimum": 0.0,
					"maximum": 1.0
				}
			},
			{
				"box": {
					"id": "obj-mgain-msg",
					"maxclass": "message",
					"text": "master_gain $1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						575.0,
						218.0,
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
					"numinlets": 6,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"patching_rect": [
						100.0,
						310.0,
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
									"id": "obj-gin2",
									"maxclass": "newobj",
									"text": "in 2",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										150.0,
										15.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gin3",
									"maxclass": "newobj",
									"text": "in 3",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										250.0,
										15.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gin4",
									"maxclass": "newobj",
									"text": "in 4",
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
									]
								}
							},
							{
								"box": {
									"id": "obj-gin5",
									"maxclass": "newobj",
									"text": "in 5",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										450.0,
										15.0,
										30.0,
										22.0
									]
								}
							},
							{
								"box": {
									"id": "obj-gin6",
									"maxclass": "newobj",
									"text": "in 6",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										550.0,
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
									"numinlets": 6,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										50.0,
										55.0,
										650.0,
										550.0
									],
									"code": "// RESONATOR ENSEMBLE - 6 Heterogeneous Voices\n\nParam root(110);\nParam flex(0.5);\nParam tuning_system(0);\nParam master_gain(0.7);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);\nParam deg4(4);\nParam deg5(0);\nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam drive(0.5);\nHistory r1_pt(0);\nHistory r1_ec(0);\nHistory r1_pd(0);\nHistory r2_pt(0);\nHistory r2_ec(0);\nHistory r2_pd(0);\nHistory r3_pt(0);\nHistory r3_ec(0);\nHistory r3_pd(0);\nHistory r4_pt(0);\nHistory r4_ec(0);\nHistory r4_pd(0);\nHistory r5_pt(0);\nHistory r5_ec(0);\nHistory r5_pd(0);\nHistory r6_pt(0);\nHistory r6_ec(0);\nHistory r6_pd(0);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\n\npyth_0 = 1.0; pyth_1 = 1.125; pyth_2 = 1.265625; pyth_3 = 1.5; pyth_4 = 1.6875;\njust_0 = 1.0; just_1 = 1.111111; just_2 = 1.25; just_3 = 1.5; just_4 = 1.666667;\nyor_0 = 1.0;\nyor_1 = pyth_1 * (1-flex) + just_1 * flex;\nyor_2 = pyth_2 * (1-flex) + just_2 * flex;\nyor_3 = 1.5;\nyor_4 = pyth_4 * (1-flex) + just_4 * flex;\ndun_0 = 1.0; dun_1 = 1.122; dun_2 = 1.26;\nbal_0 = 1.0; bal_1 = pow(2.0, 0.22); bal_2 = pow(2.0, 0.46);\nbal_3 = pow(2.0, 0.69); bal_4 = pow(2.0, 0.93);\n\n// Voice 1: Sub Bass (iya ilu) bright=0.2 damp=0.9995\ndeg1_w = mod(floor(deg1), (tuning_system==1)?3:(tuning_system==3)?7:5);\noct1_x = floor(deg1 / ((tuning_system==1)?3:(tuning_system==3)?7:5));\nr1_rat = (tuning_system==0) ? ((deg1_w==0)?yor_0:(deg1_w==1)?yor_1:(deg1_w==2)?yor_2:(deg1_w==3)?yor_3:yor_4) : (tuning_system==1) ? ((deg1_w==0)?dun_0:(deg1_w==1)?dun_1:dun_2) : (tuning_system==2) ? ((deg1_w==0)?bal_0:(deg1_w==1)?bal_1:(deg1_w==2)?bal_2:(deg1_w==3)?bal_3:bal_4) : pow(2.0, deg1_w/7.0);\nr1_freq = root * r1_rat * pow(2.0, oct1 + oct1_x);\nr1_dlen = samplerate / max(r1_freq, 20);\nr1_trig = (in1 > 0.5) * (r1_pt <= 0.5);\nr1_pt = in1;\nr1_ec = r1_trig ? r1_dlen : max(r1_ec - 1, 0);\nr1_exc = (r1_ec > 0) ? noise() * drive : 0;\nr1_del = r1_d.read(r1_dlen);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_filt = r1_del * 0.2 + r1_avg * 0.8;\nr1_out = r1_filt * 0.9995;\nr1_d.write(r1_exc + r1_out);\n\n// Voice 2: Body (omele) bright=0.4 damp=0.998\ndeg2_w = mod(floor(deg2), (tuning_system==1)?3:(tuning_system==3)?7:5);\noct2_x = floor(deg2 / ((tuning_system==1)?3:(tuning_system==3)?7:5));\nr2_rat = (tuning_system==0) ? ((deg2_w==0)?yor_0:(deg2_w==1)?yor_1:(deg2_w==2)?yor_2:(deg2_w==3)?yor_3:yor_4) : (tuning_system==1) ? ((deg2_w==0)?dun_0:(deg2_w==1)?dun_1:dun_2) : (tuning_system==2) ? ((deg2_w==0)?bal_0:(deg2_w==1)?bal_1:(deg2_w==2)?bal_2:(deg2_w==3)?bal_3:bal_4) : pow(2.0, deg2_w/7.0);\nr2_freq = root * r2_rat * pow(2.0, oct2 + oct2_x);\nr2_dlen = samplerate / max(r2_freq, 20);\nr2_trig = (in2 > 0.5) * (r2_pt <= 0.5);\nr2_pt = in2;\nr2_ec = r2_trig ? r2_dlen : max(r2_ec - 1, 0);\nr2_exc = (r2_ec > 0) ? noise() * drive : 0;\nr2_del = r2_d.read(r2_dlen);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_filt = r2_del * 0.4 + r2_avg * 0.6;\nr2_out = r2_filt * 0.998;\nr2_d.write(r2_exc + r2_out);\n\n// Voice 3: Metallic (ogene) bright=0.85 damp=0.996\ndeg3_w = mod(floor(deg3), (tuning_system==1)?3:(tuning_system==3)?7:5);\noct3_x = floor(deg3 / ((tuning_system==1)?3:(tuning_system==3)?7:5));\nr3_rat = (tuning_system==0) ? ((deg3_w==0)?yor_0:(deg3_w==1)?yor_1:(deg3_w==2)?yor_2:(deg3_w==3)?yor_3:yor_4) : (tuning_system==1) ? ((deg3_w==0)?dun_0:(deg3_w==1)?dun_1:dun_2) : (tuning_system==2) ? ((deg3_w==0)?bal_0:(deg3_w==1)?bal_1:(deg3_w==2)?bal_2:(deg3_w==3)?bal_3:bal_4) : pow(2.0, deg3_w/7.0);\nr3_freq = root * r3_rat * pow(2.0, oct3 + oct3_x);\nr3_dlen = samplerate / max(r3_freq, 20);\nr3_trig = (in3 > 0.5) * (r3_pt <= 0.5);\nr3_pt = in3;\nr3_ec = r3_trig ? r3_dlen : max(r3_ec - 1, 0);\nr3_exc = (r3_ec > 0) ? noise() * drive : 0;\nr3_del = r3_d.read(r3_dlen);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_filt = r3_del * 0.85 + r3_avg * 0.15;\nr3_out = r3_filt * 0.996;\nr3_d.write(r3_exc + r3_out);\n\n// Voice 4: Transient (gudugudu) bright=0.9 damp=0.97\ndeg4_w = mod(floor(deg4), (tuning_system==1)?3:(tuning_system==3)?7:5);\noct4_x = floor(deg4 / ((tuning_system==1)?3:(tuning_system==3)?7:5));\nr4_rat = (tuning_system==0) ? ((deg4_w==0)?yor_0:(deg4_w==1)?yor_1:(deg4_w==2)?yor_2:(deg4_w==3)?yor_3:yor_4) : (tuning_system==1) ? ((deg4_w==0)?dun_0:(deg4_w==1)?dun_1:dun_2) : (tuning_system==2) ? ((deg4_w==0)?bal_0:(deg4_w==1)?bal_1:(deg4_w==2)?bal_2:(deg4_w==3)?bal_3:bal_4) : pow(2.0, deg4_w/7.0);\nr4_freq = root * r4_rat * pow(2.0, oct4 + oct4_x);\nr4_dlen = samplerate / max(r4_freq, 20);\nr4_trig = (in4 > 0.5) * (r4_pt <= 0.5);\nr4_pt = in4;\nr4_ec = r4_trig ? r4_dlen : max(r4_ec - 1, 0);\nr4_exc = (r4_ec > 0) ? noise() * drive * 1.2 : 0;\nr4_del = r4_d.read(r4_dlen);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_filt = r4_del * 0.9 + r4_avg * 0.1;\nr4_out = r4_filt * 0.97;\nr4_d.write(r4_exc + r4_out);\n\n// Voice 5: Drone bright=0.3 damp=0.9998\ndeg5_w = mod(floor(deg5), (tuning_system==1)?3:(tuning_system==3)?7:5);\noct5_x = floor(deg5 / ((tuning_system==1)?3:(tuning_system==3)?7:5));\nr5_rat = (tuning_system==0) ? ((deg5_w==0)?yor_0:(deg5_w==1)?yor_1:(deg5_w==2)?yor_2:(deg5_w==3)?yor_3:yor_4) : (tuning_system==1) ? ((deg5_w==0)?dun_0:(deg5_w==1)?dun_1:dun_2) : (tuning_system==2) ? ((deg5_w==0)?bal_0:(deg5_w==1)?bal_1:(deg5_w==2)?bal_2:(deg5_w==3)?bal_3:bal_4) : pow(2.0, deg5_w/7.0);\nr5_freq = root * r5_rat * pow(2.0, oct5 + oct5_x);\nr5_dlen = samplerate / max(r5_freq, 20);\nr5_trig = (in5 > 0.5) * (r5_pt <= 0.5);\nr5_pt = in5;\nr5_ec = r5_trig ? r5_dlen : max(r5_ec - 1, 0);\nr5_exc = (r5_ec > 0) ? noise() * drive * 0.7 : 0;\nr5_del = r5_d.read(r5_dlen);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_filt = r5_del * 0.3 + r5_avg * 0.7;\nr5_out = r5_filt * 0.9998;\nr5_d.write(r5_exc + r5_out);\n\n// Voice 6: Crystalline (shekere) bright=0.95 damp=0.994\ndeg6_w = mod(floor(deg6), (tuning_system==1)?3:(tuning_system==3)?7:5);\noct6_x = floor(deg6 / ((tuning_system==1)?3:(tuning_system==3)?7:5));\nr6_rat = (tuning_system==0) ? ((deg6_w==0)?yor_0:(deg6_w==1)?yor_1:(deg6_w==2)?yor_2:(deg6_w==3)?yor_3:yor_4) : (tuning_system==1) ? ((deg6_w==0)?dun_0:(deg6_w==1)?dun_1:dun_2) : (tuning_system==2) ? ((deg6_w==0)?bal_0:(deg6_w==1)?bal_1:(deg6_w==2)?bal_2:(deg6_w==3)?bal_3:bal_4) : pow(2.0, deg6_w/7.0);\nr6_freq = root * r6_rat * pow(2.0, oct6 + oct6_x);\nr6_dlen = samplerate / max(r6_freq, 20);\nr6_trig = (in6 > 0.5) * (r6_pt <= 0.5);\nr6_pt = in6;\nr6_ec = r6_trig ? r6_dlen : max(r6_ec - 1, 0);\nr6_exc = (r6_ec > 0) ? noise() * drive : 0;\nr6_del = r6_d.read(r6_dlen);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_filt = r6_del * 0.95 + r6_avg * 0.05;\nr6_out = r6_filt * 0.994;\nr6_d.write(r6_exc + r6_out);\n\n// Stereo Mix\nleft = r1_out * 0.7 + r2_out * 0.5 + r3_out * 0.2 + r4_out * 0.4 + r5_out * 0.6 + r6_out * 0.3;\nright = r1_out * 0.3 + r2_out * 0.5 + r3_out * 0.8 + r4_out * 0.6 + r5_out * 0.4 + r6_out * 0.7;\nout1 = left * master_gain;\nout2 = right * master_gain;"
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
										200.0,
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
										"obj-gin2",
										0
									],
									"destination": [
										"obj-gcb",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gin3",
										0
									],
									"destination": [
										"obj-gcb",
										2
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gin4",
										0
									],
									"destination": [
										"obj-gcb",
										3
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gin5",
										0
									],
									"destination": [
										"obj-gcb",
										4
									]
								}
							},
							{
								"patchline": {
									"source": [
										"obj-gin6",
										0
									],
									"destination": [
										"obj-gcb",
										5
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
					"text": "*~ 0.5",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						100.0,
						370.0,
						42.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-gain-r",
					"maxclass": "newobj",
					"text": "*~ 0.5",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						180.0,
						370.0,
						42.0,
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
					"id": "obj-scope-l-label",
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
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-scope-r-label",
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
					"id": "obj-dac",
					"maxclass": "newobj",
					"text": "dac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						100.0,
						440.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-voices-label",
					"maxclass": "comment",
					"text": "VOICES:\n1 Sub Bass (iya ilu) \u2014 dark, long decay\n2 Body (omele) \u2014 warm, medium\n3 Metallic (ogene) \u2014 bright bell\n4 Transient (gudugudu) \u2014 percussive click\n5 Drone \u2014 dark, infinite sustain\n6 Crystalline (shekere) \u2014 sparkle",
					"linecount": 7,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						15.0,
						500.0,
						320.0,
						105.0
					],
					"fontsize": 11.0
				}
			},
			{
				"box": {
					"id": "obj-preset-label",
					"maxclass": "comment",
					"text": "\u2014\u2014 CHORD PRESETS \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						148.0,
						170.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-p1",
					"maxclass": "message",
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -1, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						175.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p1-label",
					"maxclass": "comment",
					"text": "Default Yoruba (pentatonic spread)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						197.0,
						250.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p2",
					"maxclass": "message",
					"text": "deg1 0, deg2 0, deg3 0, deg4 0, deg5 0, deg6 0, oct1 -1, oct2 0, oct3 0, oct4 1, oct5 -2, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						225.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p2-label",
					"maxclass": "comment",
					"text": "Root Cluster (unison across octaves)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						247.0,
						250.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p3",
					"maxclass": "message",
					"text": "deg1 0, deg2 1, deg3 2, deg4 3, deg5 4, deg6 0, oct1 -1, oct2 -1, oct3 0, oct4 0, oct5 0, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						275.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p3-label",
					"maxclass": "comment",
					"text": "Full Scale (all 5 degrees ascending)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						297.0,
						250.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p4",
					"maxclass": "message",
					"text": "deg1 0, deg2 3, deg3 0, deg4 3, deg5 0, deg6 3, oct1 -2, oct2 -1, oct3 -1, oct4 0, oct5 0, oct6 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						325.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p4-label",
					"maxclass": "comment",
					"text": "Open Fifths (root + fifth, stacked)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						347.0,
						250.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p5",
					"maxclass": "message",
					"text": "deg1 0, deg2 1, deg3 3, deg4 4, deg5 0, deg6 2, oct1 -2, oct2 -2, oct3 -1, oct4 -1, oct5 -2, oct6 -1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						375.0,
						600.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p5-label",
					"maxclass": "comment",
					"text": "Sub Drone (everything low, rumbling)",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						720.0,
						397.0,
						250.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-root-label2",
					"maxclass": "comment",
					"text": "\u2014\u2014 ROOT \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						430.0,
						120.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-r55",
					"maxclass": "message",
					"text": "root 55",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						452.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-r110",
					"maxclass": "message",
					"text": "root 110",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						760.0,
						452.0,
						58.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-r220",
					"maxclass": "message",
					"text": "root 220",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						828.0,
						452.0,
						58.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-flex-label2",
					"maxclass": "comment",
					"text": "\u2014\u2014 FLEX \u2014\u2014",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						700.0,
						485.0,
						120.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-f0",
					"maxclass": "message",
					"text": "flex 0",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						507.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-f0-label",
					"maxclass": "comment",
					"text": "Pythagorean",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						750.0,
						507.0,
						85.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "obj-f05",
					"maxclass": "message",
					"text": "flex 0.5",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						532.0,
						55.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-f1",
					"maxclass": "message",
					"text": "flex 1",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						557.0,
						45.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-f1-label",
					"maxclass": "comment",
					"text": "just intonation",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						750.0,
						557.0,
						100.0,
						20.0
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
						480.0,
						120.0,
						20.0
					],
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
						505.0,
						40.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-open-label",
					"maxclass": "comment",
					"text": "choose file",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						145.0,
						505.0,
						75.0,
						20.0
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
						230.0,
						503.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-tog-label",
					"maxclass": "comment",
					"text": "RECORD on/off",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						258.0,
						505.0,
						100.0,
						20.0
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-sfrecord",
					"maxclass": "newobj",
					"text": "sfrecord~ 2",
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						100.0,
						545.0,
						120.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-rec-tip",
					"maxclass": "comment",
					"text": "Records stereo WAV. Click 'open' first, then toggle record.\nFile saves to wherever you chose. 48kHz/32-bit float.",
					"linecount": 2,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						100.0,
						575.0,
						350.0,
						35.0
					],
					"fontsize": 11.0
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-bang",
						0
					],
					"destination": [
						"obj-click",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-metro-tog",
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
						"obj-click",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click",
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
						"obj-click",
						0
					],
					"destination": [
						"obj-gen",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click",
						0
					],
					"destination": [
						"obj-gen",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click",
						0
					],
					"destination": [
						"obj-gen",
						3
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click",
						0
					],
					"destination": [
						"obj-gen",
						4
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-click",
						0
					],
					"destination": [
						"obj-gen",
						5
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-num",
						0
					],
					"destination": [
						"obj-root-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-root-msg",
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
						"obj-flex-num",
						0
					],
					"destination": [
						"obj-flex-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-flex-msg",
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
						"obj-drive-num",
						0
					],
					"destination": [
						"obj-drive-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-drive-msg",
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
						"obj-mgain-num",
						0
					],
					"destination": [
						"obj-mgain-msg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-mgain-msg",
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
						"obj-gen",
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
						"obj-gen",
						1
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
						"obj-p1",
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
						"obj-p2",
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
						"obj-p3",
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
						"obj-p4",
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
						"obj-p5",
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
						"obj-r55",
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
						"obj-r110",
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
						"obj-r220",
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
						"obj-f0",
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
						"obj-f05",
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
						"obj-f1",
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
			}
		]
	}
}