{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 48.0, 290.0, 460.0, 280.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-title",
                    "linecount": 10,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 15.0, 420.0, 144.0 ],
                    "text": "FEEDBACK — VEVE TOPOLOGY INSTRUMENT\n\nKuramoto coupled oscillators with veve adjacency matrices\ndrive 6 heterogeneous Karplus-Strong resonators.\n19 African tuning systems. OSC → TouchDesigner (port 7000).\n\n1. Turn on ezdac~\n2. Select veve preset (topology)\n3. Adjust K (coupling) — sweet spot 0.3-0.7\n4. Adjust Root, Tuning, Drive",
                    "varname": "obj-title"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 180.0, 45.0, 45.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 5.0, 5.0, 40.0, 40.0 ],
                    "varname": "obj-ezdac"
                }
            },
            {
                "box": {
                    "id": "obj-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 200.0, 180.0, 58.0, 22.0 ],
                    "text": "loadbang",
                    "varname": "obj-loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-startdsp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 210.0, 75.0, 22.0 ],
                    "text": "startwindow",
                    "varname": "obj-startdsp"
                }
            },
            {
                "box": {
                    "id": "obj-dac-msg",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 240.0, 35.0, 22.0 ],
                    "text": "dac~",
                    "varname": "obj-dac-msg"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-veve",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 275.0, 350.0, 23.0 ],
                    "text": "── VEVE TOPOLOGY (adjacency matrix) ──",
                    "varname": "obj-comment-veve"
                }
            },
            {
                "box": {
                    "id": "obj-veve-buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 15.0, 305.0, 130.0, 22.0 ],
                    "text": "buffer~ veve_adj 6 6",
                    "varname": "obj-veve-buf"
                }
            },
            {
                "box": {
                    "id": "obj-veve-loader",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 160.0, 305.0, 110.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "veve_loader.js",
                        "parameter_enable": 0
                    },
                    "text": "js veve_loader.js",
                    "varname": "obj-veve-loader"
                }
            },
            {
                "box": {
                    "id": "obj-veve-menu",
                    "items": [ "All-to-all", ",", "Legba Carrefour", ",", "Carrefour Diamond", ",", "Ferraille", ",", "Ogou Bhathalah", ",", "Legba co-sou", ",", "Marassa", ",", "Damballah Wedo", ",", "Erzulie Freda", ",", "Baron Samedi", ",", "Simbi", ",", "Ayizan", ",", "Gran Bwa" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 290.0, 305.0, 140.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 55.0, 12.0, 155.0, 22.0 ],
                    "varname": "obj-veve-menu"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-veve-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 288.0, 40.0, 19.0 ],
                    "text": "Veve:",
                    "varname": "obj-veve-label"
                }
            },
            {
                "box": {
                    "id": "obj-veve-init",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 280.0, 35.0, 22.0 ],
                    "text": "init",
                    "varname": "obj-veve-init"
                }
            },
            {
                "box": {
                    "id": "obj-veve-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 335.0, 180.0, 22.0 ],
                    "text": "loaded 8 \"Erzulie Freda\"",
                    "varname": "obj-veve-status"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-kuramoto",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 370.0, 400.0, 23.0 ],
                    "text": "── KURAMOTO COUPLED RHYTHM ENGINE ──",
                    "varname": "obj-comment-kuramoto"
                }
            },
            {
                "box": {
                    "id": "obj-K",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 15.0, 400.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 60.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "K",
                            "parameter_mmax": 5.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "K",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "obj-K"
                }
            },
            {
                "box": {
                    "id": "obj-tempo",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 80.0, 400.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 60.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 120 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Tempo",
                            "parameter_mmax": 300.0,
                            "parameter_mmin": 30.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Tempo",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "obj-tempo"
                }
            },
            {
                "box": {
                    "id": "obj-K-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 15.0, 455.0, 64.0, 22.0 ],
                    "text": "prepend K",
                    "varname": "obj-K-prep"
                }
            },
            {
                "box": {
                    "id": "obj-tempo-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 80.0, 455.0, 91.0, 22.0 ],
                    "text": "prepend tempo",
                    "varname": "obj-tempo-prep"
                }
            },
            {
                "box": {
                    "id": "obj-kuramoto",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 14,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 0.0, 0.0, 900.0, 700.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "code": "Param K(0.5);\nParam tempo(120);\nParam ratio1(1.0);\nParam ratio2(1.8);\nParam ratio3(1.333);\nParam ratio4(0.4);\nParam ratio5(2.5);\nParam ratio6(0.333);\nParam trig_width(0.001);\nParam veve_preset(0);\nParam phase_reset(0);\nParam reset_attack(200);\nParam reset_release(1000);\nHistory did_reset(0);\nHistory reset_env(1);\nHistory reset_state(0);\nParam row0(62);\nParam row1(61);\nParam row2(59);\nParam row3(55);\nParam row4(47);\nParam row5(31);\nHistory t1(0.0);\nHistory t2(1.047);\nHistory t3(2.094);\nHistory t4(3.142);\nHistory t5(4.189);\nHistory t6(5.236);\nHistory trig_count1(0);\nHistory trig_count2(0);\nHistory trig_count3(0);\nHistory trig_count4(0);\nHistory trig_count5(0);\nHistory trig_count6(0);\ntwopi = 6.28318530718;\nN = 6;\ndt_step = 1.0 / samplerate;\nbase_freq = tempo / 60.0;\nw1 = base_freq * ratio1 * twopi;\nw2 = base_freq * ratio2 * twopi;\nw3 = base_freq * ratio3 * twopi;\nw4 = base_freq * ratio4 * twopi;\nw5 = base_freq * ratio5 * twopi;\nw6 = base_freq * ratio6 * twopi;\na01 = floor(row0 / 2) % 2;\na02 = floor(row0 / 4) % 2;\na03 = floor(row0 / 8) % 2;\na04 = floor(row0 / 16) % 2;\na05 = floor(row0 / 32) % 2;\na10 = floor(row1 / 1) % 2;\na12 = floor(row1 / 4) % 2;\na13 = floor(row1 / 8) % 2;\na14 = floor(row1 / 16) % 2;\na15 = floor(row1 / 32) % 2;\na20 = floor(row2 / 1) % 2;\na21 = floor(row2 / 2) % 2;\na23 = floor(row2 / 8) % 2;\na24 = floor(row2 / 16) % 2;\na25 = floor(row2 / 32) % 2;\na30 = floor(row3 / 1) % 2;\na31 = floor(row3 / 2) % 2;\na32 = floor(row3 / 4) % 2;\na34 = floor(row3 / 16) % 2;\na35 = floor(row3 / 32) % 2;\na40 = floor(row4 / 1) % 2;\na41 = floor(row4 / 2) % 2;\na42 = floor(row4 / 4) % 2;\na43 = floor(row4 / 8) % 2;\na45 = floor(row4 / 32) % 2;\na50 = floor(row5 / 1) % 2;\na51 = floor(row5 / 2) % 2;\na52 = floor(row5 / 4) % 2;\na53 = floor(row5 / 8) % 2;\na54 = floor(row5 / 16) % 2;\ncoupling = K * reset_env;\nsum1 = a01*sin(t2-t1) + a02*sin(t3-t1) + a03*sin(t4-t1) + a04*sin(t5-t1) + a05*sin(t6-t1);\nsum2 = a10*sin(t1-t2) + a12*sin(t3-t2) + a13*sin(t4-t2) + a14*sin(t5-t2) + a15*sin(t6-t2);\nsum3 = a20*sin(t1-t3) + a21*sin(t2-t3) + a23*sin(t4-t3) + a24*sin(t5-t3) + a25*sin(t6-t3);\nsum4 = a30*sin(t1-t4) + a31*sin(t2-t4) + a32*sin(t3-t4) + a34*sin(t5-t4) + a35*sin(t6-t4);\nsum5 = a40*sin(t1-t5) + a41*sin(t2-t5) + a42*sin(t3-t5) + a43*sin(t4-t5) + a45*sin(t6-t5);\nsum6 = a50*sin(t1-t6) + a51*sin(t2-t6) + a52*sin(t3-t6) + a53*sin(t4-t6) + a54*sin(t5-t6);\nd1 = w1 + coupling * sum1;\nd2 = w2 + coupling * sum2;\nd3 = w3 + coupling * sum3;\nd4 = w4 + coupling * sum4;\nd5 = w5 + coupling * sum5;\nd6 = w6 + coupling * sum6;\nt1_new = t1 + d1 * dt_step;\nt2_new = t2 + d2 * dt_step;\nt3_new = t3 + d3 * dt_step;\nt4_new = t4 + d4 * dt_step;\nt5_new = t5 + d5 * dt_step;\nt6_new = t6 + d6 * dt_step;\nattack_samples = max(reset_attack * 0.001 * samplerate, 1);\nrelease_samples = max(reset_release * 0.001 * samplerate, 1);\nif (phase_reset > 0.5 && did_reset < 0.5) {\n\treset_state = 1;\n\tdid_reset = 1;\n}\nif (phase_reset < 0.5) {\n\tdid_reset = 0;\n}\nif (reset_state > 0.5 && reset_state < 1.5) {\n\treset_env = max(reset_env - 1.0 / attack_samples, 0);\n\tif (reset_env <= 0) {\n\t\tt1_new = 0.0;\n\t\tt2_new = 1.047;\n\t\tt3_new = 2.094;\n\t\tt4_new = 3.142;\n\t\tt5_new = 4.189;\n\t\tt6_new = 5.236;\n\t\treset_state = 2;\n\t}\n}\nif (reset_state > 1.5) {\n\treset_env = min(reset_env + 1.0 / release_samples, 1);\n\tif (reset_env >= 1) {\n\t\treset_state = 0;\n\t}\n}\nwrap1 = (t1_new >= twopi) ? 1 : 0;\nwrap2 = (t2_new >= twopi) ? 1 : 0;\nwrap3 = (t3_new >= twopi) ? 1 : 0;\nwrap4 = (t4_new >= twopi) ? 1 : 0;\nwrap5 = (t5_new >= twopi) ? 1 : 0;\nwrap6 = (t6_new >= twopi) ? 1 : 0;\nt1 = t1_new - twopi * floor(t1_new / twopi);\nt2 = t2_new - twopi * floor(t2_new / twopi);\nt3 = t3_new - twopi * floor(t3_new / twopi);\nt4 = t4_new - twopi * floor(t4_new / twopi);\nt5 = t5_new - twopi * floor(t5_new / twopi);\nt6 = t6_new - twopi * floor(t6_new / twopi);\ntrig_samples = max(trig_width * samplerate, 1);\ntrig_count1 = (wrap1 > 0) ? trig_samples : max(trig_count1 - 1, 0);\ntrig_count2 = (wrap2 > 0) ? trig_samples : max(trig_count2 - 1, 0);\ntrig_count3 = (wrap3 > 0) ? trig_samples : max(trig_count3 - 1, 0);\ntrig_count4 = (wrap4 > 0) ? trig_samples : max(trig_count4 - 1, 0);\ntrig_count5 = (wrap5 > 0) ? trig_samples : max(trig_count5 - 1, 0);\ntrig_count6 = (wrap6 > 0) ? trig_samples : max(trig_count6 - 1, 0);\npulse1 = (trig_count1 > 0) ? 1 : 0;\npulse2 = (trig_count2 > 0) ? 1 : 0;\npulse3 = (trig_count3 > 0) ? 1 : 0;\npulse4 = (trig_count4 > 0) ? 1 : 0;\npulse5 = (trig_count5 > 0) ? 1 : 0;\npulse6 = (trig_count6 > 0) ? 1 : 0;\nconn1 = a01 + a02 + a03 + a04 + a05;\nn1 = max(conn1, 1);\ncoh1 = (a01*cos(t2-t1) + a02*cos(t3-t1) + a03*cos(t4-t1) + a04*cos(t5-t1) + a05*cos(t6-t1)) / n1;\nvel1 = (conn1 > 0) ? (0.05 + 0.95 * pow(clamp((coh1 + 1) * 0.5, 0, 1), 2)) : 0.05;\nconn2 = a10 + a12 + a13 + a14 + a15;\nn2 = max(conn2, 1);\ncoh2 = (a10*cos(t1-t2) + a12*cos(t3-t2) + a13*cos(t4-t2) + a14*cos(t5-t2) + a15*cos(t6-t2)) / n2;\nvel2 = (conn2 > 0) ? (0.05 + 0.95 * pow(clamp((coh2 + 1) * 0.5, 0, 1), 2)) : 0.05;\nconn3 = a20 + a21 + a23 + a24 + a25;\nn3 = max(conn3, 1);\ncoh3 = (a20*cos(t1-t3) + a21*cos(t2-t3) + a23*cos(t4-t3) + a24*cos(t5-t3) + a25*cos(t6-t3)) / n3;\nvel3 = (conn3 > 0) ? (0.05 + 0.95 * pow(clamp((coh3 + 1) * 0.5, 0, 1), 2)) : 0.05;\nconn4 = a30 + a31 + a32 + a34 + a35;\nn4 = max(conn4, 1);\ncoh4 = (a30*cos(t1-t4) + a31*cos(t2-t4) + a32*cos(t3-t4) + a34*cos(t5-t4) + a35*cos(t6-t4)) / n4;\nvel4 = (conn4 > 0) ? (0.05 + 0.95 * pow(clamp((coh4 + 1) * 0.5, 0, 1), 2)) : 0.05;\nconn5 = a40 + a41 + a42 + a43 + a45;\nn5 = max(conn5, 1);\ncoh5 = (a40*cos(t1-t5) + a41*cos(t2-t5) + a42*cos(t3-t5) + a43*cos(t4-t5) + a45*cos(t6-t5)) / n5;\nvel5 = (conn5 > 0) ? (0.05 + 0.95 * pow(clamp((coh5 + 1) * 0.5, 0, 1), 2)) : 0.05;\nconn6 = a50 + a51 + a52 + a53 + a54;\nn6 = max(conn6, 1);\ncoh6 = (a50*cos(t1-t6) + a51*cos(t2-t6) + a52*cos(t3-t6) + a53*cos(t4-t6) + a54*cos(t5-t6)) / n6;\nvel6 = (conn6 > 0) ? (0.05 + 0.95 * pow(clamp((coh6 + 1) * 0.5, 0, 1), 2)) : 0.05;\ncos_sum = cos(t1) + cos(t2) + cos(t3) + cos(t4) + cos(t5) + cos(t6);\nsin_sum = sin(t1) + sin(t2) + sin(t3) + sin(t4) + sin(t5) + sin(t6);\nr = sqrt(cos_sum * cos_sum + sin_sum * sin_sum) / N;\nphase1 = t1 / twopi;\nphase2 = t2 / twopi;\nphase3 = t3 / twopi;\nphase4 = t4 / twopi;\nphase5 = t5 / twopi;\nphase6 = t6 / twopi;\nout1 = pulse1 * vel1;\nout2 = pulse2 * vel2;\nout3 = pulse3 * vel3;\nout4 = pulse4 * vel4;\nout5 = pulse5 * vel5;\nout6 = pulse6 * vel6;\nout7 = r;\nout8  = phase1;\nout9  = phase2;\nout10 = phase3;\nout11 = phase4;\nout12 = phase5;\nout13 = phase6;\nout14 = veve_preset;",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-codebox",
                                    "maxclass": "codebox",
                                    "numinlets": 1,
                                    "numoutlets": 14,
                                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 150.0, 150.0, 600.0, 400.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 150.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 200.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 250.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 300.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 350.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 400.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 450.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 500.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 8"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 550.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out10",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 600.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 10"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out11",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 650.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 11"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out12",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 700.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 12"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out13",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 750.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 13"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out14",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 800.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 14"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-codebox", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out10", 0 ],
                                    "source": [ "obj-codebox", 9 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out11", 0 ],
                                    "source": [ "obj-codebox", 10 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out12", 0 ],
                                    "source": [ "obj-codebox", 11 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out13", 0 ],
                                    "source": [ "obj-codebox", 12 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out14", 0 ],
                                    "source": [ "obj-codebox", 13 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out2", 0 ],
                                    "source": [ "obj-codebox", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out3", 0 ],
                                    "source": [ "obj-codebox", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out4", 0 ],
                                    "source": [ "obj-codebox", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out5", 0 ],
                                    "source": [ "obj-codebox", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out6", 0 ],
                                    "source": [ "obj-codebox", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out7", 0 ],
                                    "source": [ "obj-codebox", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out8", 0 ],
                                    "source": [ "obj-codebox", 7 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out9", 0 ],
                                    "source": [ "obj-codebox", 8 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 15.0, 490.0, 560.0, 22.0 ],
                    "text": "gen~",
                    "varname": "obj-kuramoto"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-resonator",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 525.0, 450.0, 23.0 ],
                    "text": "── RESONATOR ENSEMBLE (6 voices, 19 tuning systems) ──",
                    "varname": "obj-comment-resonator"
                }
            },
            {
                "box": {
                    "id": "obj-root",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 15.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 140.0, 60.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 110 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Root",
                            "parameter_mmax": 880.0,
                            "parameter_mmin": 20.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Root",
                            "parameter_type": 0,
                            "parameter_unitstyle": 3
                        }
                    },
                    "varname": "obj-root"
                }
            },
            {
                "box": {
                    "id": "obj-tuning",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 145.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 60.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Tuning",
                            "parameter_mmax": 18.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Tuning",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "obj-tuning"
                }
            },
            {
                "box": {
                    "id": "obj-drive",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 210.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 115.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.5 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Drive",
                            "parameter_mmax": 4.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Drive",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "obj-drive"
                }
            },
            {
                "box": {
                    "id": "obj-root-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 15.0, 610.0, 84.0, 22.0 ],
                    "text": "prepend root",
                    "varname": "obj-root-prep"
                }
            },
            {
                "box": {
                    "id": "obj-tuning-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 145.0, 610.0, 147.0, 22.0 ],
                    "text": "prepend tuning_system",
                    "varname": "obj-tuning-prep"
                }
            },
            {
                "box": {
                    "id": "obj-drive-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 210.0, 610.0, 91.0, 22.0 ],
                    "text": "prepend drive",
                    "varname": "obj-drive-prep"
                }
            },
            {
                "box": {
                    "id": "obj-resonator",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 8,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 0.0, 0.0, 900.0, 700.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "code": "Param root(110);\nParam flex(0.5);\nParam tuning_system(0);\nParam master_gain(0.7);\nParam octave_offset(0);\nParam excite_mode(0);\nParam peri_level(0.5);\nParam feedback_amt(0);\nParam drift(0.001);\nParam deg1(0);\nParam deg2(1);\nParam deg3(3);\nParam deg4(4);\nParam deg5(0);\nParam deg6(2);\nParam oct1(-1);\nParam oct2(0);\nParam oct3(0);\nParam oct4(1);\nParam oct5(-1);\nParam oct6(1);\nParam drive(0.5);\nParam decay(0.3);\nData tuning_table(190);\nHistory init_done(0);\nHistory r1_pt(0);\nHistory r1_ec(0);\nHistory r1_pd(0);\nHistory r2_pt(0);\nHistory r2_ec(0);\nHistory r2_pd(0);\nHistory r3_pt(0);\nHistory r3_ec(0);\nHistory r3_pd(0);\nHistory r4_pt(0);\nHistory r4_ec(0);\nHistory r4_pd(0);\nHistory r5_pt(0);\nHistory r5_ec(0);\nHistory r5_pd(0);\nHistory r6_pt(0);\nHistory r6_ec(0);\nHistory r6_pd(0);\nHistory r1_vel(1);\nHistory r2_vel(1);\nHistory r3_vel(1);\nHistory r4_vel(1);\nHistory r5_vel(1);\nHistory r6_vel(1);\nHistory r1_drft(0);\nHistory r2_drft(0);\nHistory r3_drft(0);\nHistory r4_drft(0);\nHistory r5_drft(0);\nHistory r6_drft(0);\nDelay r1_d(48000);\nDelay r2_d(48000);\nDelay r3_d(48000);\nDelay r4_d(48000);\nDelay r5_d(48000);\nDelay r6_d(48000);\nif (init_done < 0.5) {\n    poke(tuning_table, 5, 0, 0);\n    poke(tuning_table, 1.0, 1, 0);\n    poke(tuning_table, 1.125, 2, 0);\n    poke(tuning_table, 1.265625, 3, 0);\n    poke(tuning_table, 1.5, 4, 0);\n    poke(tuning_table, 1.6875, 5, 0);\n    poke(tuning_table, 3, 10, 0);\n    poke(tuning_table, 1.0, 11, 0);\n    poke(tuning_table, 1.12246, 12, 0);\n    poke(tuning_table, 1.25992, 13, 0);\n    poke(tuning_table, 5, 20, 0);\n    poke(tuning_table, 1.0, 21, 0);\n    poke(tuning_table, 1.13534, 22, 0);\n    poke(tuning_table, 1.30486, 23, 0);\n    poke(tuning_table, 1.49180, 24, 0);\n    poke(tuning_table, 1.71002, 25, 0);\n    poke(tuning_table, 7, 30, 0);\n    poke(tuning_table, 1.0, 31, 0);\n    poke(tuning_table, 1.10409, 32, 0);\n    poke(tuning_table, 1.21901, 33, 0);\n    poke(tuning_table, 1.34590, 34, 0);\n    poke(tuning_table, 1.48599, 35, 0);\n    poke(tuning_table, 1.64059, 36, 0);\n    poke(tuning_table, 1.81145, 37, 0);\n    poke(tuning_table, 5, 40, 0);\n    poke(tuning_table, 1.0, 41, 0);\n    poke(tuning_table, 1.14870, 42, 0);\n    poke(tuning_table, 1.31951, 43, 0);\n    poke(tuning_table, 1.51572, 44, 0);\n    poke(tuning_table, 1.74110, 45, 0);\n    poke(tuning_table, 7, 50, 0);\n    poke(tuning_table, 1.0, 51, 0);\n    poke(tuning_table, 1.10957, 52, 0);\n    poke(tuning_table, 1.24574, 53, 0);\n    poke(tuning_table, 1.33484, 54, 0);\n    poke(tuning_table, 1.49831, 55, 0);\n    poke(tuning_table, 1.65948, 56, 0);\n    poke(tuning_table, 1.86121, 57, 0);\n    poke(tuning_table, 7, 60, 0);\n    poke(tuning_table, 1.0, 61, 0);\n    poke(tuning_table, 1.05946, 62, 0);\n    poke(tuning_table, 1.18921, 63, 0);\n    poke(tuning_table, 1.33484, 64, 0);\n    poke(tuning_table, 1.49831, 65, 0);\n    poke(tuning_table, 1.58740, 66, 0);\n    poke(tuning_table, 1.78180, 67, 0);\n    poke(tuning_table, 7, 70, 0);\n    poke(tuning_table, 1.0, 71, 0);\n    poke(tuning_table, 1.12246, 72, 0);\n    poke(tuning_table, 1.24915, 73, 0);\n    poke(tuning_table, 1.33484, 74, 0);\n    poke(tuning_table, 1.49831, 75, 0);\n    poke(tuning_table, 1.68179, 76, 0);\n    poke(tuning_table, 1.86459, 77, 0);\n    poke(tuning_table, 7, 80, 0);\n    poke(tuning_table, 1.0, 81, 0);\n    poke(tuning_table, 1.11278, 82, 0);\n    poke(tuning_table, 1.26330, 83, 0);\n    poke(tuning_table, 1.41747, 84, 0);\n    poke(tuning_table, 1.49831, 85, 0);\n    poke(tuning_table, 1.66230, 86, 0);\n    poke(tuning_table, 1.88800, 87, 0);\n    poke(tuning_table, 5, 90, 0);\n    poke(tuning_table, 1.0, 91, 0);\n    poke(tuning_table, 1.12246, 92, 0);\n    poke(tuning_table, 1.25992, 93, 0);\n    poke(tuning_table, 1.49831, 94, 0);\n    poke(tuning_table, 1.68179, 95, 0);\n    poke(tuning_table, 5, 100, 0);\n    poke(tuning_table, 1.0, 101, 0);\n    poke(tuning_table, 1.12246, 102, 0);\n    poke(tuning_table, 1.18921, 103, 0);\n    poke(tuning_table, 1.49831, 104, 0);\n    poke(tuning_table, 1.58740, 105, 0);\n    poke(tuning_table, 5, 110, 0);\n    poke(tuning_table, 1.0, 111, 0);\n    poke(tuning_table, 1.12246, 112, 0);\n    poke(tuning_table, 1.33484, 113, 0);\n    poke(tuning_table, 1.49831, 114, 0);\n    poke(tuning_table, 1.68179, 115, 0);\n    poke(tuning_table, 5, 120, 0);\n    poke(tuning_table, 1.0, 121, 0);\n    poke(tuning_table, 1.12246, 122, 0);\n    poke(tuning_table, 1.25992, 123, 0);\n    poke(tuning_table, 1.49831, 124, 0);\n    poke(tuning_table, 1.58740, 125, 0);\n    poke(tuning_table, 5, 130, 0);\n    poke(tuning_table, 1.0, 131, 0);\n    poke(tuning_table, 1.05946, 132, 0);\n    poke(tuning_table, 1.33484, 133, 0);\n    poke(tuning_table, 1.41421, 134, 0);\n    poke(tuning_table, 1.68179, 135, 0);\n    poke(tuning_table, 5, 140, 0);\n    poke(tuning_table, 1.0, 141, 0);\n    poke(tuning_table, 1.14870, 142, 0);\n    poke(tuning_table, 1.31951, 143, 0);\n    poke(tuning_table, 1.51572, 144, 0);\n    poke(tuning_table, 1.74110, 145, 0);\n    poke(tuning_table, 7, 150, 0);\n    poke(tuning_table, 1.0, 151, 0);\n    poke(tuning_table, 1.10653, 152, 0);\n    poke(tuning_table, 1.22082, 153, 0);\n    poke(tuning_table, 1.34890, 154, 0);\n    poke(tuning_table, 1.48160, 155, 0);\n    poke(tuning_table, 1.63720, 156, 0);\n    poke(tuning_table, 1.80699, 157, 0);\n    poke(tuning_table, 6, 160, 0);\n    poke(tuning_table, 1.0, 161, 0);\n    poke(tuning_table, 1.12246, 162, 0);\n    poke(tuning_table, 1.24984, 163, 0);\n    poke(tuning_table, 1.33322, 164, 0);\n    poke(tuning_table, 1.50000, 165, 0);\n    poke(tuning_table, 1.66212, 166, 0);\n    poke(tuning_table, 6, 170, 0);\n    poke(tuning_table, 1.0, 171, 0);\n    poke(tuning_table, 1.25, 172, 0);\n    poke(tuning_table, 1.5, 173, 0);\n    poke(tuning_table, 1.75, 174, 0);\n    poke(tuning_table, 2.0, 175, 0);\n    poke(tuning_table, 2.25, 176, 0);\n    poke(tuning_table, 5, 180, 0);\n    poke(tuning_table, 1.0, 181, 0);\n    poke(tuning_table, 1.12246, 182, 0);\n    poke(tuning_table, 1.24984, 183, 0);\n    poke(tuning_table, 1.50000, 184, 0);\n    poke(tuning_table, 1.66212, 185, 0);\n    init_done = 1;\n}\nts = clamp(floor(tuning_system), 0, 18);\nts_base = ts * 10;\nts_size = peek(tuning_table, ts_base, 0);\nts_size = max(ts_size, 1);\nj0 = 1.0; j1 = 1.111111; j2 = 1.25; j3 = 1.5; j4 = 1.666667;\ndc = clamp(decay, 0, 1.5);\ndc_c = pow(dc / 1.5, 0.2);\nd1_damp = 0.50 + dc_c * 0.53;\nd2_damp = 0.48 + dc_c * 0.535;\nd3_damp = 0.45 + dc_c * 0.545;\nd4_damp = 0.42 + dc_c * 0.555;\nd5_damp = 0.48 + dc_c * 0.535;\nd6_damp = 0.45 + dc_c * 0.545;\nroot_oct = root * pow(2.0, clamp(floor(octave_offset), -2, 2));\nfb_sig = in8 * clamp(feedback_amt, 0, 1);\nperi_m = floor(excite_mode);\ndeg1_w = mod(floor(deg1), ts_size);\noct1_x = floor(deg1 / ts_size);\nr1_rat = peek(tuning_table, ts_base + 1 + deg1_w, 0);\nr1_jrat = (deg1_w<0.5)?j0:(deg1_w<1.5)?j1:(deg1_w<2.5)?j2:(deg1_w<3.5)?j3:j4;\nr1_rat = (ts < 0.5) ? (r1_rat * (1.0-flex) + r1_jrat * flex) : r1_rat;\nr1_freq = root_oct * r1_rat * pow(2.0, oct1 + oct1_x);\nr1_dlen = samplerate / max(r1_freq, 20);\nr1_trig = (in1 > 0.05) * (r1_pt <= 0.05);\nr1_vel = r1_trig ? in1 : r1_vel;\nr1_pt = in1;\nr1_ec = r1_trig ? r1_dlen : max(r1_ec - 1, 0);\nr1_cont = noise() * drive * 0.03;\nr1_punch = (r1_ec > 0) ? noise() * drive * r1_vel : 0;\nr1_exc = (peri_m > 1.5) ? in7 * peri_level * 0.08 + r1_punch : ((peri_m > 0.5) ? in7 * peri_level * 0.4 + r1_punch : r1_cont + r1_punch);\nr1_drft = clamp(r1_drft * 0.9999 + noise() * 0.0001, -1, 1);\nr1_del = r1_d.read(r1_dlen + r1_drft * drift * r1_dlen);\nr1_avg = (r1_del + r1_pd) * 0.5;\nr1_pd = r1_del;\nr1_filt = r1_del * 0.2 + r1_avg * 0.8;\nr1_out = r1_filt * d1_damp;\nr1_d.write(r1_exc + r1_out + fb_sig);\nr1_snd = tanh(r1_out * (1.0 + drive * 4.0));\ndeg2_w = mod(floor(deg2), ts_size);\noct2_x = floor(deg2 / ts_size);\nr2_rat = peek(tuning_table, ts_base + 1 + deg2_w, 0);\nr2_jrat = (deg2_w<0.5)?j0:(deg2_w<1.5)?j1:(deg2_w<2.5)?j2:(deg2_w<3.5)?j3:j4;\nr2_rat = (ts < 0.5) ? (r2_rat * (1.0-flex) + r2_jrat * flex) : r2_rat;\nr2_freq = root_oct * r2_rat * pow(2.0, oct2 + oct2_x);\nr2_dlen = samplerate / max(r2_freq, 20);\nr2_trig = (in2 > 0.05) * (r2_pt <= 0.05);\nr2_vel = r2_trig ? in2 : r2_vel;\nr2_pt = in2;\nr2_ec = r2_trig ? r2_dlen : max(r2_ec - 1, 0);\nr2_cont = noise() * drive * 0.03;\nr2_punch = (r2_ec > 0) ? noise() * drive * r2_vel : 0;\nr2_exc = (peri_m > 1.5) ? in7 * peri_level * 0.08 + r2_punch : ((peri_m > 0.5) ? in7 * peri_level * 0.4 + r2_punch : r2_cont + r2_punch);\nr2_drft = clamp(r2_drft * 0.9999 + noise() * 0.0001, -1, 1);\nr2_del = r2_d.read(r2_dlen + r2_drft * drift * r2_dlen);\nr2_avg = (r2_del + r2_pd) * 0.5;\nr2_pd = r2_del;\nr2_filt = r2_del * 0.4 + r2_avg * 0.6;\nr2_out = r2_filt * d2_damp;\nr2_d.write(r2_exc + r2_out + fb_sig);\nr2_snd = tanh(r2_out * (1.0 + drive * 4.0));\ndeg3_w = mod(floor(deg3), ts_size);\noct3_x = floor(deg3 / ts_size);\nr3_rat = peek(tuning_table, ts_base + 1 + deg3_w, 0);\nr3_jrat = (deg3_w<0.5)?j0:(deg3_w<1.5)?j1:(deg3_w<2.5)?j2:(deg3_w<3.5)?j3:j4;\nr3_rat = (ts < 0.5) ? (r3_rat * (1.0-flex) + r3_jrat * flex) : r3_rat;\nr3_freq = root_oct * r3_rat * pow(2.0, oct3 + oct3_x);\nr3_dlen = samplerate / max(r3_freq, 20);\nr3_trig = (in3 > 0.05) * (r3_pt <= 0.05);\nr3_vel = r3_trig ? in3 : r3_vel;\nr3_pt = in3;\nr3_ec = r3_trig ? r3_dlen : max(r3_ec - 1, 0);\nr3_cont = noise() * drive * 0.03;\nr3_punch = (r3_ec > 0) ? noise() * drive * r3_vel : 0;\nr3_exc = (peri_m > 1.5) ? in7 * peri_level * 0.08 + r3_punch : ((peri_m > 0.5) ? in7 * peri_level * 0.4 + r3_punch : r3_cont + r3_punch);\nr3_drft = clamp(r3_drft * 0.9999 + noise() * 0.0001, -1, 1);\nr3_del = r3_d.read(r3_dlen + r3_drft * drift * r3_dlen);\nr3_avg = (r3_del + r3_pd) * 0.5;\nr3_pd = r3_del;\nr3_filt = r3_del * 0.85 + r3_avg * 0.15;\nr3_out = r3_filt * d3_damp;\nr3_d.write(r3_exc + r3_out + fb_sig);\nr3_snd = tanh(r3_out * (1.0 + drive * 4.0));\ndeg4_w = mod(floor(deg4), ts_size);\noct4_x = floor(deg4 / ts_size);\nr4_rat = peek(tuning_table, ts_base + 1 + deg4_w, 0);\nr4_jrat = (deg4_w<0.5)?j0:(deg4_w<1.5)?j1:(deg4_w<2.5)?j2:(deg4_w<3.5)?j3:j4;\nr4_rat = (ts < 0.5) ? (r4_rat * (1.0-flex) + r4_jrat * flex) : r4_rat;\nr4_freq = root_oct * r4_rat * pow(2.0, oct4 + oct4_x);\nr4_dlen = samplerate / max(r4_freq, 20);\nr4_trig = (in4 > 0.05) * (r4_pt <= 0.05);\nr4_vel = r4_trig ? in4 : r4_vel;\nr4_pt = in4;\nr4_ec = r4_trig ? r4_dlen : max(r4_ec - 1, 0);\nr4_cont = noise() * drive * 0.03;\nr4_punch = (r4_ec > 0) ? noise() * drive * 1.2 * r4_vel : 0;\nr4_exc = (peri_m > 1.5) ? in7 * peri_level * 0.08 + r4_punch : ((peri_m > 0.5) ? in7 * peri_level * 0.4 + r4_punch : r4_cont + r4_punch);\nr4_drft = clamp(r4_drft * 0.9999 + noise() * 0.0001, -1, 1);\nr4_del = r4_d.read(r4_dlen + r4_drft * drift * r4_dlen);\nr4_avg = (r4_del + r4_pd) * 0.5;\nr4_pd = r4_del;\nr4_filt = r4_del * 0.9 + r4_avg * 0.1;\nr4_out = r4_filt * d4_damp;\nr4_d.write(r4_exc + r4_out + fb_sig);\nr4_snd = tanh(r4_out * (1.0 + drive * 4.0));\ndeg5_w = mod(floor(deg5), ts_size);\noct5_x = floor(deg5 / ts_size);\nr5_rat = peek(tuning_table, ts_base + 1 + deg5_w, 0);\nr5_jrat = (deg5_w<0.5)?j0:(deg5_w<1.5)?j1:(deg5_w<2.5)?j2:(deg5_w<3.5)?j3:j4;\nr5_rat = (ts < 0.5) ? (r5_rat * (1.0-flex) + r5_jrat * flex) : r5_rat;\nr5_freq = root_oct * r5_rat * pow(2.0, oct5 + oct5_x);\nr5_dlen = samplerate / max(r5_freq, 20);\nr5_trig = (in5 > 0.05) * (r5_pt <= 0.05);\nr5_vel = r5_trig ? in5 : r5_vel;\nr5_pt = in5;\nr5_ec = r5_trig ? r5_dlen : max(r5_ec - 1, 0);\nr5_cont = noise() * drive * 0.03;\nr5_punch = (r5_ec > 0) ? noise() * drive * 0.7 * r5_vel : 0;\nr5_exc = (peri_m > 1.5) ? in7 * peri_level * 0.08 + r5_punch : ((peri_m > 0.5) ? in7 * peri_level * 0.4 + r5_punch : r5_cont + r5_punch);\nr5_drft = clamp(r5_drft * 0.9999 + noise() * 0.0001, -1, 1);\nr5_del = r5_d.read(r5_dlen + r5_drft * drift * r5_dlen);\nr5_avg = (r5_del + r5_pd) * 0.5;\nr5_pd = r5_del;\nr5_filt = r5_del * 0.3 + r5_avg * 0.7;\nr5_out = r5_filt * d5_damp;\nr5_d.write(r5_exc + r5_out + fb_sig);\nr5_snd = tanh(r5_out * (1.0 + drive * 4.0));\ndeg6_w = mod(floor(deg6), ts_size);\noct6_x = floor(deg6 / ts_size);\nr6_rat = peek(tuning_table, ts_base + 1 + deg6_w, 0);\nr6_jrat = (deg6_w<0.5)?j0:(deg6_w<1.5)?j1:(deg6_w<2.5)?j2:(deg6_w<3.5)?j3:j4;\nr6_rat = (ts < 0.5) ? (r6_rat * (1.0-flex) + r6_jrat * flex) : r6_rat;\nr6_freq = root_oct * r6_rat * pow(2.0, oct6 + oct6_x);\nr6_dlen = samplerate / max(r6_freq, 20);\nr6_trig = (in6 > 0.05) * (r6_pt <= 0.05);\nr6_vel = r6_trig ? in6 : r6_vel;\nr6_pt = in6;\nr6_ec = r6_trig ? r6_dlen : max(r6_ec - 1, 0);\nr6_cont = noise() * drive * 0.03;\nr6_punch = (r6_ec > 0) ? noise() * drive * r6_vel : 0;\nr6_exc = (peri_m > 1.5) ? in7 * peri_level * 0.08 + r6_punch : ((peri_m > 0.5) ? in7 * peri_level * 0.4 + r6_punch : r6_cont + r6_punch);\nr6_drft = clamp(r6_drft * 0.9999 + noise() * 0.0001, -1, 1);\nr6_del = r6_d.read(r6_dlen + r6_drft * drift * r6_dlen);\nr6_avg = (r6_del + r6_pd) * 0.5;\nr6_pd = r6_del;\nr6_filt = r6_del * 0.95 + r6_avg * 0.05;\nr6_out = r6_filt * d6_damp;\nr6_d.write(r6_exc + r6_out + fb_sig);\nr6_snd = tanh(r6_out * (1.0 + drive * 4.0));\nperi_dry = (peri_m > 1.5) ? in7 * peri_level : 0;\nleft  = r1_snd * 0.6 + r2_snd * 0.35 + r3_snd * 0.65\n      + r4_snd * 0.4 + r5_snd * 0.55 + r6_snd * 0.45 + peri_dry;\nright = r1_snd * 0.4 + r2_snd * 0.65 + r3_snd * 0.35\n      + r4_snd * 0.6 + r5_snd * 0.45 + r6_snd * 0.55 + peri_dry;\nout1 = left * master_gain;\nout2 = right * master_gain;\nout3 = r1_snd * master_gain;\nout4 = r2_snd * master_gain;\nout5 = r3_snd * master_gain;\nout6 = r4_snd * master_gain;\nout7 = r5_snd * master_gain;\nout8 = r6_snd * master_gain;",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-codebox",
                                    "maxclass": "codebox",
                                    "numinlets": 8,
                                    "numoutlets": 8,
                                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 150.0, 150.0, 600.0, 400.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 150.0, 50.0, 30.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 50.0, 30.0, 22.0 ],
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 310.0, 50.0, 30.0, 22.0 ],
                                    "text": "in 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in4",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 390.0, 50.0, 30.0, 22.0 ],
                                    "text": "in 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in5",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 470.0, 50.0, 30.0, 22.0 ],
                                    "text": "in 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in6",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 550.0, 50.0, 30.0, 22.0 ],
                                    "text": "in 6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 150.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 200.0, 600.0, 35.0, 22.0 ],
                                    "text": "out 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in7",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 770.0, 20.0, 30.0, 22.0 ],
                                    "text": "in 7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-in8",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 820.0, 20.0, 30.0, 22.0 ],
                                    "text": "in 8"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 310.0, 600.0, 40.0, 22.0 ],
                                    "text": "out 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 390.0, 600.0, 40.0, 22.0 ],
                                    "text": "out 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 470.0, 600.0, 40.0, 22.0 ],
                                    "text": "out 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 550.0, 600.0, 40.0, 22.0 ],
                                    "text": "out 6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 630.0, 600.0, 40.0, 22.0 ],
                                    "text": "out 7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-out8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 710.0, 600.0, 40.0, 22.0 ],
                                    "text": "out 8"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-codebox", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out2", 0 ],
                                    "source": [ "obj-codebox", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out3", 0 ],
                                    "source": [ "obj-codebox", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out4", 0 ],
                                    "source": [ "obj-codebox", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out5", 0 ],
                                    "source": [ "obj-codebox", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out6", 0 ],
                                    "source": [ "obj-codebox", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out7", 0 ],
                                    "source": [ "obj-codebox", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out8", 0 ],
                                    "source": [ "obj-codebox", 7 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 0 ],
                                    "source": [ "obj-in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 1 ],
                                    "source": [ "obj-in2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 2 ],
                                    "source": [ "obj-in3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 3 ],
                                    "source": [ "obj-in4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 4 ],
                                    "source": [ "obj-in5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 5 ],
                                    "source": [ "obj-in6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 6 ],
                                    "source": [ "obj-in7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-codebox", 7 ],
                                    "source": [ "obj-in8", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 15.0, 645.0, 700.0, 22.0 ],
                    "text": "gen~",
                    "varname": "obj-resonator"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-output",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 680.0, 200.0, 23.0 ],
                    "text": "── OUTPUT ──",
                    "varname": "obj-comment-output"
                }
            },
            {
                "box": {
                    "id": "obj-master",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 15.0, 710.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 115.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.7 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Master",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Vol",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "obj-master"
                }
            },
            {
                "box": {
                    "id": "obj-gain-L",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 15.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7",
                    "varname": "obj-gain-L"
                }
            },
            {
                "box": {
                    "id": "obj-gain-R",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 115.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7",
                    "varname": "obj-gain-R"
                }
            },
            {
                "box": {
                    "id": "obj-output-dac",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 810.0, 180.0, 22.0 ],
                    "text": "dac~ 1 2 3 4 5 6 7 8",
                    "varname": "obj-output-dac"
                }
            },
            {
                "box": {
                    "id": "obj-meter-L",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 15.0, 845.0, 200.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 200.0, 215.0, 20.0 ],
                    "varname": "obj-meter-L"
                }
            },
            {
                "box": {
                    "id": "obj-meter-R",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 230.0, 845.0, 200.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 230.0, 200.0, 215.0, 20.0 ],
                    "varname": "obj-meter-R"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-comment-osc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 370.0, 350.0, 23.0 ],
                    "text": "── OSC → TOUCHDESIGNER (port 7000) ──",
                    "varname": "obj-comment-osc"
                }
            },
            {
                "box": {
                    "id": "obj-osc-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 700.0, 415.0, 56.0, 22.0 ],
                    "text": "metro 50",
                    "varname": "obj-osc-metro"
                }
            },
            {
                "box": {
                    "id": "obj-r-snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 700.0, 435.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-r-snap"
                }
            },
            {
                "box": {
                    "id": "obj-r-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 465.0, 117.0, 22.0 ],
                    "text": "prepend kuramoto_r",
                    "varname": "obj-r-prep"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-r-display",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 820.0, 435.0, 55.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 275.0, 12.0, 50.0, 22.0 ],
                    "varname": "obj-r-display"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-r-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 418.0, 20.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 260.0, 15.0, 18.0, 19.0 ],
                    "text": "r:",
                    "varname": "obj-r-label"
                }
            },
            {
                "box": {
                    "id": "obj-phase-snap1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 700.0, 500.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-phase-snap1"
                }
            },
            {
                "box": {
                    "id": "obj-phase-snap2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 770.0, 500.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-phase-snap2"
                }
            },
            {
                "box": {
                    "id": "obj-phase-snap3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 840.0, 500.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-phase-snap3"
                }
            },
            {
                "box": {
                    "id": "obj-phase-snap4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 910.0, 500.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-phase-snap4"
                }
            },
            {
                "box": {
                    "id": "obj-phase-snap5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 980.0, 500.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-phase-snap5"
                }
            },
            {
                "box": {
                    "id": "obj-phase-snap6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1050.0, 500.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-phase-snap6"
                }
            },
            {
                "box": {
                    "id": "obj-phase-pak",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 535.0, 200.0, 22.0 ],
                    "text": "pak 0. 0. 0. 0. 0. 0.",
                    "varname": "obj-phase-pak"
                }
            },
            {
                "box": {
                    "id": "obj-phase-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 565.0, 151.0, 22.0 ],
                    "text": "prepend kuramoto_phases",
                    "varname": "obj-phase-prep"
                }
            },
            {
                "box": {
                    "id": "obj-veve-snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 700.0, 600.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-veve-snap"
                }
            },
            {
                "box": {
                    "id": "obj-veve-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 630.0, 121.0, 22.0 ],
                    "text": "prepend veve_preset",
                    "varname": "obj-veve-prep"
                }
            },
            {
                "box": {
                    "id": "obj-osc-node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 700.0, 670.0, 140.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 0,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    },
                    "text": "node.script osc_send.js",
                    "textfile": {
                        "filename": "osc_send.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "obj-osc-node"
                }
            },
            {
                "box": {
                    "id": "obj-osc-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 700.0, 385.0, 67.0, 22.0 ],
                    "text": "delay 3000",
                    "varname": "obj-osc-delay"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-mcp-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1000.0, 15.0, 300.0, 23.0 ],
                    "text": "── MCP BRIDGE (Claude ↔ Max) ──",
                    "varname": "obj-mcp-comment"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1000.0, 50.0, 170.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 0,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    },
                    "text": "node.script max_mcp_node.js",
                    "textfile": {
                        "filename": "max_mcp_node.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "maxmcpid-node"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-route",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1000.0, 85.0, 190.0, 22.0 ],
                    "text": "route command request port",
                    "varname": "maxmcpid-route"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-handler",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1000.0, 120.0, 85.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "max_mcp.js",
                        "parameter_enable": 0
                    },
                    "text": "js max_mcp.js",
                    "varname": "maxmcpid-handler"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-v8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1180.0, 120.0, 151.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "max_mcp_v8_add_on.js",
                        "parameter_enable": 0
                    },
                    "text": "js max_mcp_v8_add_on.js",
                    "varname": "maxmcpid-v8"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 160.0, 200.0, 22.0 ],
                    "varname": "maxmcpid-status"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 190.0, 75.0, 22.0 ],
                    "text": "script start",
                    "varname": "maxmcpid-start"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-npm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1090.0, 190.0, 110.0, 22.0 ],
                    "text": "script npm install",
                    "varname": "maxmcpid-npm"
                }
            },
            {
                "box": {
                    "id": "obj-mcp-stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1210.0, 190.0, 70.0, 22.0 ],
                    "text": "script stop",
                    "varname": "maxmcpid-stop"
                }
            },
            {
                "box": {
                    "id": "obj-decay",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 280.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 115.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.3 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Decay",
                            "parameter_mmax": 1.5,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Decay",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "obj-decay"
                }
            },
            {
                "box": {
                    "id": "obj-decay-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 610.0, 98.0, 22.0 ],
                    "text": "prepend decay",
                    "varname": "obj-decay-prep"
                }
            },
            {
                "box": {
                    "id": "obj-decay-osc-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 610.0, 148.0, 22.0 ],
                    "text": "prepend resonator_decay",
                    "varname": "obj-decay-osc-prep"
                }
            },
            {
                "box": {
                    "id": "obj-root-osc-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 850.0, 620.0, 104.0, 22.0 ],
                    "text": "prepend root_freq",
                    "varname": "obj-root-osc-prep"
                }
            },
            {
                "box": {
                    "id": "obj-phase-reset",
                    "maxclass": "live.button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 380.0, 400.0, 30.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 220.0, 12.0, 25.0, 25.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "PhaseReset",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Reset",
                            "parameter_type": 2
                        }
                    },
                    "varname": "obj-phase-reset"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-phase-reset-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 415.0, 405.0, 40.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 220.0, 38.0, 40.0, 18.0 ],
                    "text": "Reset",
                    "varname": "obj-phase-reset-label"
                }
            },
            {
                "box": {
                    "id": "obj-phase-reset-trig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 380.0, 440.0, 40.0, 22.0 ],
                    "text": "t 1 0",
                    "varname": "obj-phase-reset-trig"
                }
            },
            {
                "box": {
                    "id": "obj-phase-reset-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 380.0, 470.0, 130.0, 22.0 ],
                    "text": "prepend phase_reset",
                    "varname": "obj-phase-reset-prep"
                }
            },
            {
                "box": {
                    "id": "obj-reset-release",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 460.0, 400.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 395.0, 5.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1000 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Release",
                            "parameter_mmax": 5000.0,
                            "parameter_mmin": 100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Release",
                            "parameter_type": 0,
                            "parameter_unitstyle": 2
                        }
                    },
                    "varname": "obj-reset-release"
                }
            },
            {
                "box": {
                    "id": "obj-reset-release-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 460.0, 455.0, 140.0, 22.0 ],
                    "text": "prepend reset_release",
                    "varname": "obj-reset-release-prep"
                }
            },
            {
                "box": {
                    "id": "obj-reset-attack",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 540.0, 400.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 335.0, 5.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 200 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Attack",
                            "parameter_mmax": 3000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Attack",
                            "parameter_type": 0,
                            "parameter_unitstyle": 2
                        }
                    },
                    "varname": "obj-reset-attack"
                }
            },
            {
                "box": {
                    "id": "obj-reset-attack-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 455.0, 135.0, 22.0 ],
                    "text": "prepend reset_attack",
                    "varname": "obj-reset-attack-prep"
                }
            },
            {
                "box": {
                    "id": "obj-osc-start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 640.0, 75.0, 22.0 ],
                    "text": "script start",
                    "varname": "obj-osc-start"
                }
            },
            {
                "box": {
                    "id": "obj-morph",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 450.0, 305.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 335.0, 60.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Morph",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Morph",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "obj-morph"
                }
            },
            {
                "box": {
                    "id": "obj-morph-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 360.0, 90.0, 22.0 ],
                    "text": "prepend morph",
                    "varname": "obj-morph-prep"
                }
            },
            {
                "box": {
                    "id": "obj-morph-osc-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 520.0, 360.0, 90.0, 22.0 ],
                    "text": "prepend morph",
                    "varname": "obj-morph-osc-prep"
                }
            },
            {
                "box": {
                    "id": "obj-amp-abs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1050.0, 630.0, 35.0, 22.0 ],
                    "text": "abs~",
                    "varname": "obj-amp-abs"
                }
            },
            {
                "box": {
                    "id": "obj-amp-snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1050.0, 660.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50",
                    "varname": "obj-amp-snap"
                }
            },
            {
                "box": {
                    "id": "obj-amp-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1050.0, 690.0, 110.0, 22.0 ],
                    "text": "prepend amplitude",
                    "varname": "obj-amp-prep"
                }
            },
            {
                "box": {
                    "id": "obj-gain-ch3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 215.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-gain-ch4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 295.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-gain-ch5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 375.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-gain-ch6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 455.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-gain-ch7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 535.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-gain-ch8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 615.0, 770.0, 45.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-octave",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 350.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.0, 60.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Octave",
                            "parameter_mmax": 2.0,
                            "parameter_mmin": -2.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Oct",
                            "parameter_steps": 5,
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "live.dial"
                }
            },
            {
                "box": {
                    "id": "obj-octave-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 625.0, 127.0, 22.0 ],
                    "text": "prepend octave_offset"
                }
            },
            {
                "box": {
                    "id": "obj-octave-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 542.0, 50.0, 20.0 ],
                    "text": "Octave:"
                }
            },
            {
                "box": {
                    "id": "obj-drift",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 420.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 140.0, 115.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.001 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Drift",
                            "parameter_mmax": 0.01,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Drift",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial[1]"
                }
            },
            {
                "box": {
                    "id": "obj-drift-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 610.0, 80.0, 22.0 ],
                    "text": "prepend drift"
                }
            },
            {
                "box": {
                    "id": "obj-comment-peri",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 525.0, 150.0, 20.0 ],
                    "text": "-- PERI EXCITATION --"
                }
            },
            {
                "box": {
                    "id": "obj-peri-noise",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 555.0, 45.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "obj-peri-nn",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 580.0, 220.0, 22.0 ],
                    "text": "nn~ peri_v1 forward 2048"
                }
            },
            {
                "box": {
                    "id": "obj-comment-mic",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 660.0, 130.0, 20.0 ],
                    "text": "-- MIC FEEDBACK --"
                }
            },
            {
                "box": {
                    "id": "obj-mic-adc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 680.0, 45.0, 22.0 ],
                    "text": "adc~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-mic-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 710.0, 55.0, 22.0 ],
                    "text": "gate~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-mic-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 660.0, 685.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 170.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-mic-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 688.0, 688.0, 47.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 208.0, 173.0, 47.0, 20.0 ],
                    "text": "Mic On"
                }
            },
            {
                "box": {
                    "id": "obj-fb-amt",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 490.0, 555.0, 50.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.0, 115.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Feedback",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "FB",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial[2]"
                }
            },
            {
                "box": {
                    "id": "obj-fb-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 490.0, 610.0, 131.0, 22.0 ],
                    "text": "prepend feedback_amt"
                }
            },
            {
                "box": {
                    "id": "obj-oct-osc-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 850.0, 650.0, 127.0, 22.0 ],
                    "text": "prepend octave_offset"
                }
            },
            {
                "box": {
                    "id": "obj-peri-gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 605.0, 35.0, 22.0 ],
                    "text": "*~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-peri-level",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 580.0, 430.0, 41.0, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 335.0, 115.0, 50.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "PERI Level",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "PERI Lvl",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "peri_level"
                }
            },
            {
                "box": {
                    "id": "obj-peri-level-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 580.0, 490.0, 107.0, 22.0 ],
                    "text": "prepend peri_level"
                }
            },
            {
                "box": {
                    "id": "obj-peri-tab",
                    "maxclass": "live.tab",
                    "num_lines_patching": 3,
                    "num_lines_presentation": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 480.0, 300.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 170.0, 160.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "OFF", "SHAPED", "SYMPATHETIC" ],
                            "parameter_initial": [ 2 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "PERI Mode",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "PERI",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "peri_mode"
                }
            },
            {
                "box": {
                    "id": "obj-peri-tab-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 480.0, 330.0, 124.0, 22.0 ],
                    "text": "prepend excite_mode"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-K-prep", 0 ],
                    "source": [ "obj-K", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kuramoto", 0 ],
                    "source": [ "obj-K-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-amp-snap", 0 ],
                    "source": [ "obj-amp-abs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-amp-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-amp-prep", 0 ],
                    "source": [ "obj-amp-snap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-decay-osc-prep", 0 ],
                    "order": 0,
                    "source": [ "obj-decay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-decay-prep", 0 ],
                    "order": 1,
                    "source": [ "obj-decay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-decay-osc-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-decay-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-drift-prep", 0 ],
                    "source": [ "obj-drift", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-drift-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-drive-prep", 0 ],
                    "source": [ "obj-drive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-drive-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fb-prep", 0 ],
                    "source": [ "obj-fb-amt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-fb-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ezdac", 0 ],
                    "order": 2,
                    "source": [ "obj-gain-L", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-meter-L", 0 ],
                    "order": 0,
                    "source": [ "obj-gain-L", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 0 ],
                    "order": 1,
                    "source": [ "obj-gain-L", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ezdac", 1 ],
                    "order": 1,
                    "source": [ "obj-gain-R", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-meter-R", 0 ],
                    "order": 0,
                    "source": [ "obj-gain-R", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 1 ],
                    "order": 2,
                    "source": [ "obj-gain-R", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 2 ],
                    "source": [ "obj-gain-ch3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 3 ],
                    "source": [ "obj-gain-ch4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 4 ],
                    "source": [ "obj-gain-ch5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 5 ],
                    "source": [ "obj-gain-ch6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 6 ],
                    "source": [ "obj-gain-ch7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-output-dac", 7 ],
                    "source": [ "obj-gain-ch8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap1", 0 ],
                    "source": [ "obj-kuramoto", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap2", 0 ],
                    "source": [ "obj-kuramoto", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap3", 0 ],
                    "source": [ "obj-kuramoto", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap4", 0 ],
                    "source": [ "obj-kuramoto", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap5", 0 ],
                    "source": [ "obj-kuramoto", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap6", 0 ],
                    "source": [ "obj-kuramoto", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-r-snap", 0 ],
                    "source": [ "obj-kuramoto", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 5 ],
                    "source": [ "obj-kuramoto", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 4 ],
                    "source": [ "obj-kuramoto", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 3 ],
                    "source": [ "obj-kuramoto", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 2 ],
                    "source": [ "obj-kuramoto", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 1 ],
                    "source": [ "obj-kuramoto", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-kuramoto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-snap", 0 ],
                    "source": [ "obj-kuramoto", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-delay", 0 ],
                    "order": 0,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-startdsp", 0 ],
                    "order": 1,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-init", 0 ],
                    "order": 2,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-L", 1 ],
                    "order": 7,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-R", 1 ],
                    "order": 6,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch3", 1 ],
                    "order": 5,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch4", 1 ],
                    "order": 4,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch5", 1 ],
                    "order": 3,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch6", 1 ],
                    "order": 2,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch7", 1 ],
                    "order": 1,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch8", 1 ],
                    "order": 0,
                    "source": [ "obj-master", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-node", 0 ],
                    "source": [ "obj-mcp-handler", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-status", 0 ],
                    "source": [ "obj-mcp-handler", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-v8", 0 ],
                    "source": [ "obj-mcp-handler", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-route", 0 ],
                    "source": [ "obj-mcp-node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-status", 0 ],
                    "source": [ "obj-mcp-node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-node", 0 ],
                    "source": [ "obj-mcp-npm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-handler", 0 ],
                    "source": [ "obj-mcp-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-handler", 0 ],
                    "source": [ "obj-mcp-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-node", 0 ],
                    "source": [ "obj-mcp-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-node", 0 ],
                    "source": [ "obj-mcp-stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mcp-node", 0 ],
                    "source": [ "obj-mcp-v8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mic-gate", 1 ],
                    "source": [ "obj-mic-adc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 7 ],
                    "source": [ "obj-mic-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mic-gate", 0 ],
                    "source": [ "obj-mic-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-morph-osc-prep", 0 ],
                    "order": 0,
                    "source": [ "obj-morph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-morph-prep", 0 ],
                    "order": 1,
                    "source": [ "obj-morph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-morph-osc-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-loader", 0 ],
                    "source": [ "obj-morph-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-oct-osc-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oct-osc-prep", 0 ],
                    "order": 0,
                    "source": [ "obj-octave", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-octave-prep", 0 ],
                    "order": 1,
                    "source": [ "obj-octave", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-octave-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-metro", 0 ],
                    "order": 1,
                    "source": [ "obj-osc-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-start", 0 ],
                    "order": 0,
                    "source": [ "obj-osc-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-amp-snap", 0 ],
                    "order": 0,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap1", 0 ],
                    "order": 7,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap2", 0 ],
                    "order": 5,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap3", 0 ],
                    "order": 4,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap4", 0 ],
                    "order": 3,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap5", 0 ],
                    "order": 2,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-snap6", 0 ],
                    "order": 1,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-r-snap", 0 ],
                    "order": 8,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-snap", 0 ],
                    "order": 6,
                    "source": [ "obj-osc-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-osc-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 6 ],
                    "source": [ "obj-peri-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peri-level-prep", 0 ],
                    "source": [ "obj-peri-level", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-peri-level-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peri-gain", 0 ],
                    "source": [ "obj-peri-nn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peri-nn", 0 ],
                    "source": [ "obj-peri-noise", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peri-tab-prep", 0 ],
                    "source": [ "obj-peri-tab", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-peri-tab-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-prep", 0 ],
                    "source": [ "obj-phase-pak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-phase-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-reset-trig", 0 ],
                    "source": [ "obj-phase-reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kuramoto", 0 ],
                    "source": [ "obj-phase-reset-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-reset-prep", 0 ],
                    "source": [ "obj-phase-reset-trig", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-reset-prep", 0 ],
                    "source": [ "obj-phase-reset-trig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-pak", 0 ],
                    "source": [ "obj-phase-snap1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-pak", 1 ],
                    "source": [ "obj-phase-snap2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-pak", 2 ],
                    "source": [ "obj-phase-snap3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-pak", 3 ],
                    "source": [ "obj-phase-snap4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-pak", 4 ],
                    "source": [ "obj-phase-snap5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-phase-pak", 5 ],
                    "source": [ "obj-phase-snap6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-r-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-r-display", 0 ],
                    "order": 0,
                    "source": [ "obj-r-snap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-r-prep", 0 ],
                    "order": 1,
                    "source": [ "obj-r-snap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reset-attack-prep", 0 ],
                    "source": [ "obj-reset-attack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kuramoto", 0 ],
                    "source": [ "obj-reset-attack-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reset-release-prep", 0 ],
                    "source": [ "obj-reset-release", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kuramoto", 0 ],
                    "source": [ "obj-reset-release-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-amp-abs", 0 ],
                    "order": 0,
                    "source": [ "obj-resonator", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-L", 0 ],
                    "order": 1,
                    "source": [ "obj-resonator", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-R", 0 ],
                    "source": [ "obj-resonator", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch3", 0 ],
                    "source": [ "obj-resonator", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch4", 0 ],
                    "source": [ "obj-resonator", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch5", 0 ],
                    "source": [ "obj-resonator", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch6", 0 ],
                    "source": [ "obj-resonator", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch7", 0 ],
                    "source": [ "obj-resonator", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-ch8", 0 ],
                    "source": [ "obj-resonator", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-root-osc-prep", 0 ],
                    "order": 0,
                    "source": [ "obj-root", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-root-prep", 0 ],
                    "order": 1,
                    "source": [ "obj-root", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-root-osc-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-root-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac-msg", 0 ],
                    "source": [ "obj-startdsp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tempo-prep", 0 ],
                    "source": [ "obj-tempo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kuramoto", 0 ],
                    "source": [ "obj-tempo-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tuning-prep", 0 ],
                    "source": [ "obj-tuning", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-resonator", 0 ],
                    "source": [ "obj-tuning-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-loader", 0 ],
                    "source": [ "obj-veve-init", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kuramoto", 0 ],
                    "source": [ "obj-veve-loader", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-prep", 0 ],
                    "source": [ "obj-veve-loader", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-status", 1 ],
                    "source": [ "obj-veve-loader", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-veve-loader", 0 ],
                    "source": [ "obj-veve-menu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osc-node", 0 ],
                    "source": [ "obj-veve-prep", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-K": [ "K", "K", 0 ],
            "obj-decay": [ "Decay", "Decay", 0 ],
            "obj-drift": [ "Drift", "Drift", 0 ],
            "obj-drive": [ "Drive", "Drive", 0 ],
            "obj-fb-amt": [ "Feedback", "FB", 0 ],
            "obj-master": [ "Master", "Vol", 0 ],
            "obj-morph": [ "Morph", "Morph", 0 ],
            "obj-octave": [ "Octave", "Oct", 0 ],
            "obj-peri-level": [ "PERI Level", "PERI Lvl", 0 ],
            "obj-peri-tab": [ "PERI Mode", "PERI", 0 ],
            "obj-phase-reset": [ "PhaseReset", "Reset", 0 ],
            "obj-reset-attack": [ "Attack", "Attack", 0 ],
            "obj-reset-release": [ "Release", "Release", 0 ],
            "obj-root": [ "Root", "Root", 0 ],
            "obj-tempo": [ "Tempo", "Tempo", 0 ],
            "obj-tuning": [ "Tuning", "Tuning", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}