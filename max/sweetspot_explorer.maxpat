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
        "rect": [ 50.0, 100.0, 1200.0, 900.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "fluid.plotter",
                    "id": "obj-1",
                    "maxclass": "jsui",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 322.0, 280.0, 64.0, 64.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 163.0, 215.0, 187.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-title",
                    "linecount": 9,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 20.0, 460.0, 131.0 ],
                    "text": "SWEETSPOT EXPLORER — 50 presets\nFluCoMa analysis + UMAP navigation\n\n1. Open step6_chaos_resonator, turn on audio\n2. Click [Start Sweep] below\n3. Wait ~3.5 min for analysis\n4. Click points on the map to recall presets\n\nRequires: FluCoMa package (Max Package Manager)"
                }
            },
            {
                "box": {
                    "id": "obj-coll-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 200.0, 148.0, 65.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-coll-loaddelay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 200.0, 172.0, 72.0, 22.0 ],
                    "text": "delay 200"
                }
            },
            {
                "box": {
                    "id": "obj-coll-readmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 190.0, 115.0, 22.0 ],
                    "text": "read presets.coll"
                }
            },
            {
                "box": {
                    "id": "obj-coll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 30.0, 222.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll presets"
                }
            },
            {
                "box": {
                    "id": "obj-sweep-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 272.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 10.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-sweep-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 274.0, 130.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 45.0, 14.0, 130.0, 20.0 ],
                    "text": "Start / Stop Sweep"
                }
            },
            {
                "box": {
                    "id": "obj-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 30.0, 308.0, 80.0, 22.0 ],
                    "text": "metro 4000"
                }
            },
            {
                "box": {
                    "id": "obj-counter",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 30.0, 340.0, 130.0, 22.0 ],
                    "text": "counter 0 49"
                }
            },
            {
                "box": {
                    "id": "obj-sweep-done",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 340.0, 25.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-progress",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 340.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 14.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-progress-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 285.0, 342.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 232.0, 14.0, 50.0, 20.0 ],
                    "text": "/ 49"
                }
            },
            {
                "box": {
                    "id": "obj-trig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "int" ],
                    "patching_rect": [ 30.0, 372.0, 100.0, 22.0 ],
                    "text": "t b b b i"
                }
            },
            {
                "box": {
                    "id": "obj-s-toGen",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 404.0, 55.0, 22.0 ],
                    "text": "s toGen"
                }
            },
            {
                "box": {
                    "id": "obj-preset-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 404.0, 380.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 42.0, 460.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recv-L",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 30.0, 454.0, 130.0, 22.0 ],
                    "text": "receive~ feedback_L"
                }
            },
            {
                "box": {
                    "id": "obj-capture-buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 330.0, 454.0, 160.0, 22.0 ],
                    "text": "buffer~ capture_buf 2000"
                }
            },
            {
                "box": {
                    "id": "obj-record",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 30.0, 486.0, 130.0, 22.0 ],
                    "text": "record~ capture_buf 1"
                }
            },
            {
                "box": {
                    "id": "obj-rec-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 200.0, 486.0, 75.0, 22.0 ],
                    "text": "delay 500"
                }
            },
            {
                "box": {
                    "id": "obj-rec-stop-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 310.0, 486.0, 85.0, 22.0 ],
                    "text": "delay 2500"
                }
            },
            {
                "box": {
                    "id": "obj-rec-start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 518.0, 25.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-rec-stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 310.0, 518.0, 25.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-analyze-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 30.0, 568.0, 85.0, 22.0 ],
                    "text": "delay 2600"
                }
            },
            {
                "box": {
                    "id": "obj-mfcc_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 568.0, 150.0, 22.0 ],
                    "text": "buffer~ mfcc_buf"
                }
            },
            {
                "box": {
                    "id": "obj-mfcc_stats_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 596.0, 150.0, 22.0 ],
                    "text": "buffer~ mfcc_stats_buf"
                }
            },
            {
                "box": {
                    "id": "obj-shape_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 624.0, 150.0, 22.0 ],
                    "text": "buffer~ shape_buf"
                }
            },
            {
                "box": {
                    "id": "obj-shape_stats_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 652.0, 150.0, 22.0 ],
                    "text": "buffer~ shape_stats_buf"
                }
            },
            {
                "box": {
                    "id": "obj-loud_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 680.0, 150.0, 22.0 ],
                    "text": "buffer~ loud_buf"
                }
            },
            {
                "box": {
                    "id": "obj-loud_stats_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 708.0, 150.0, 22.0 ],
                    "text": "buffer~ loud_stats_buf"
                }
            },
            {
                "box": {
                    "id": "obj-pitch_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 736.0, 150.0, 22.0 ],
                    "text": "buffer~ pitch_buf"
                }
            },
            {
                "box": {
                    "id": "obj-pitch_stats_buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 764.0, 150.0, 22.0 ],
                    "text": "buffer~ pitch_stats_buf"
                }
            },
            {
                "box": {
                    "id": "obj-feature_row",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 520.0, 792.0, 150.0, 22.0 ],
                    "text": "buffer~ feature_row"
                }
            },
            {
                "box": {
                    "id": "obj-mfcc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 600.0, 486.0, 22.0 ],
                    "text": "fluid.bufmfcc~ @source capture_buf @features mfcc_buf @numcoeffs 13 @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-mfcc-stats",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 632.0, 460.0, 22.0 ],
                    "text": "fluid.bufstats~ @source mfcc_buf @stats mfcc_stats_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-spectral",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 664.0, 460.0, 22.0 ],
                    "text": "fluid.bufspectralshape~ @source capture_buf @features shape_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-spectral-stats",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 696.0, 460.0, 22.0 ],
                    "text": "fluid.bufstats~ @source shape_buf @stats shape_stats_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-loudness",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 728.0, 460.0, 22.0 ],
                    "text": "fluid.bufloudness~ @source capture_buf @features loud_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-loud-stats",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 760.0, 460.0, 22.0 ],
                    "text": "fluid.bufstats~ @source loud_buf @stats loud_stats_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 792.0, 460.0, 22.0 ],
                    "text": "fluid.bufpitch~ @source capture_buf @features pitch_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-pitch-stats",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 824.0, 460.0, 22.0 ],
                    "text": "fluid.bufstats~ @source pitch_buf @stats pitch_stats_buf @numchans 1"
                }
            },
            {
                "box": {
                    "id": "obj-comp-mfcc",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 874.0, 460.0, 50.0 ],
                    "text": "fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row @startframe 0 @numframes 1 @startchan 0 @numchans 13 @deststartframe 0 @deststartchan 0"
                }
            },
            {
                "box": {
                    "id": "obj-comp-mfcc-std",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 906.0, 460.0, 36.0 ],
                    "text": "fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row @startframe 0 @numframes 1 @startchan 0 @numchans 13 @deststartchan 13"
                }
            },
            {
                "box": {
                    "id": "obj-comp-shape",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 938.0, 460.0, 36.0 ],
                    "text": "fluid.bufcompose~ @source shape_stats_buf @destination feature_row @startframe 0 @numframes 1 @startchan 0 @numchans 7 @deststartchan 26"
                }
            },
            {
                "box": {
                    "id": "obj-comp-loud",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 970.0, 460.0, 36.0 ],
                    "text": "fluid.bufcompose~ @source loud_stats_buf @destination feature_row @startframe 0 @numframes 1 @startchan 0 @numchans 2 @deststartchan 33"
                }
            },
            {
                "box": {
                    "id": "obj-comp-pitch",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 1002.0, 460.0, 36.0 ],
                    "text": "fluid.bufcompose~ @source pitch_stats_buf @destination feature_row @startframe 0 @numframes 1 @startchan 0 @numchans 2 @deststartchan 35"
                }
            },
            {
                "box": {
                    "id": "obj-idx-hold",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 230.0, 1038.0, 30.0, 22.0 ],
                    "text": "i"
                }
            },
            {
                "box": {
                    "id": "obj-idx-sym",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 1038.0, 65.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-addpoint-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 1070.0, 190.0, 22.0 ],
                    "text": "addpoint $1 feature_row"
                }
            },
            {
                "box": {
                    "id": "obj-dataset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 1102.0, 170.0, 22.0 ],
                    "text": "fluid.dataset~ sweetspots"
                }
            },
            {
                "box": {
                    "id": "obj-labelset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 230.0, 1102.0, 160.0, 22.0 ],
                    "text": "fluid.labelset~ labels"
                }
            },
            {
                "box": {
                    "id": "obj-umap-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 30.0, 1152.0, 75.0, 22.0 ],
                    "text": "delay 500"
                }
            },
            {
                "box": {
                    "id": "obj-build-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 150.0, 1152.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 300.0, 10.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-build-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 180.0, 1154.0, 70.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 335.0, 14.0, 70.0, 20.0 ],
                    "text": "Build Map"
                }
            },
            {
                "box": {
                    "id": "obj-post-trig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 30.0, 1184.0, 35.0, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "obj-norm-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 1216.0, 270.0, 22.0 ],
                    "text": "fittransform sweetspots sweetspots_norm"
                }
            },
            {
                "box": {
                    "id": "obj-normalize",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 1248.0, 120.0, 22.0 ],
                    "text": "fluid.normalize~"
                }
            },
            {
                "box": {
                    "id": "obj-ds-norm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 520.0, 1248.0, 190.0, 22.0 ],
                    "text": "fluid.dataset~ sweetspots_norm"
                }
            },
            {
                "box": {
                    "id": "obj-umap-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 1280.0, 280.0, 22.0 ],
                    "text": "fittransform sweetspots_norm sweetspots_2d"
                }
            },
            {
                "box": {
                    "id": "obj-umap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 1312.0, 462.0, 22.0 ],
                    "text": "fluid.umap~ @numdimensions 2 @numneighbours 10 @mindist 0.3 @iterations 200"
                }
            },
            {
                "box": {
                    "id": "obj-ds-2d",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 520.0, 1312.0, 180.0, 22.0 ],
                    "text": "fluid.dataset~ sweetspots_2d"
                }
            },
            {
                "box": {
                    "id": "obj-kdtree-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 1344.0, 120.0, 22.0 ],
                    "text": "fit sweetspots_2d"
                }
            },
            {
                "box": {
                    "id": "obj-kdtree",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 1376.0, 100.0, 22.0 ],
                    "text": "fluid.kdtree~"
                }
            },
            {
                "box": {
                    "id": "obj-dump-2d-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 1426.0, 40.0, 22.0 ],
                    "text": "dump"
                }
            },
            {
                "box": {
                    "id": "obj-color-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 90.0, 1426.0, 75.0, 22.0 ],
                    "text": "delay 200"
                }
            },
            {
                "box": {
                    "id": "obj-color-0",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1426.0, 340.0, 77.0 ],
                    "text": "pointcolor 0 0.9 0.2 0.2 1., pointcolor 1 0.9 0.2 0.2 1., pointcolor 2 0.9 0.2 0.2 1., pointcolor 3 0.9 0.2 0.2 1., pointcolor 4 0.9 0.2 0.2 1., pointcolor 5 0.9 0.2 0.2 1., pointcolor 6 0.9 0.2 0.2 1., pointcolor 7 0.9 0.2 0.2 1., pointcolor 8 0.9 0.2 0.2 1., pointcolor 9 0.9 0.2 0.2 1."
                }
            },
            {
                "box": {
                    "id": "obj-color-1",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1452.0, 340.0, 77.0 ],
                    "text": "pointcolor 10 0.2 0.8 0.2 1., pointcolor 11 0.2 0.8 0.2 1., pointcolor 12 0.2 0.8 0.2 1., pointcolor 13 0.2 0.8 0.2 1., pointcolor 14 0.2 0.8 0.2 1., pointcolor 15 0.2 0.8 0.2 1., pointcolor 16 0.2 0.8 0.2 1., pointcolor 17 0.2 0.8 0.2 1., pointcolor 18 0.2 0.8 0.2 1., pointcolor 19 0.2 0.8 0.2 1."
                }
            },
            {
                "box": {
                    "id": "obj-color-2",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1478.0, 340.0, 77.0 ],
                    "text": "pointcolor 20 0.3 0.4 0.9 1., pointcolor 21 0.3 0.4 0.9 1., pointcolor 22 0.3 0.4 0.9 1., pointcolor 23 0.3 0.4 0.9 1., pointcolor 24 0.3 0.4 0.9 1., pointcolor 25 0.3 0.4 0.9 1., pointcolor 26 0.3 0.4 0.9 1., pointcolor 27 0.3 0.4 0.9 1., pointcolor 28 0.3 0.4 0.9 1., pointcolor 29 0.3 0.4 0.9 1."
                }
            },
            {
                "box": {
                    "id": "obj-color-3",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1504.0, 340.0, 77.0 ],
                    "text": "pointcolor 30 0.9 0.8 0.1 1., pointcolor 31 0.9 0.8 0.1 1., pointcolor 32 0.9 0.8 0.1 1., pointcolor 33 0.9 0.8 0.1 1., pointcolor 34 0.9 0.8 0.1 1., pointcolor 35 0.9 0.8 0.1 1., pointcolor 36 0.9 0.8 0.1 1., pointcolor 37 0.9 0.8 0.1 1., pointcolor 38 0.9 0.8 0.1 1., pointcolor 39 0.9 0.8 0.1 1."
                }
            },
            {
                "box": {
                    "id": "obj-color-4",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1530.0, 340.0, 77.0 ],
                    "text": "pointcolor 40 0.7 0.3 0.9 1., pointcolor 41 0.7 0.3 0.9 1., pointcolor 42 0.7 0.3 0.9 1., pointcolor 43 0.7 0.3 0.9 1., pointcolor 44 0.7 0.3 0.9 1., pointcolor 45 0.7 0.3 0.9 1., pointcolor 46 0.7 0.3 0.9 1., pointcolor 47 0.7 0.3 0.9 1., pointcolor 48 0.7 0.3 0.9 1., pointcolor 49 0.7 0.3 0.9 1."
                }
            },
            {
                "box": {
                    "id": "obj-labels-0",
                    "linecount": 4,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1556.0, 340.0, 64.0 ],
                    "text": "pointlabel 0 Lorenz, pointlabel 1 Lorenz, pointlabel 2 Lorenz, pointlabel 3 Lorenz, pointlabel 4 Lorenz, pointlabel 5 Lorenz, pointlabel 6 Lorenz, pointlabel 7 Lorenz, pointlabel 8 Lorenz, pointlabel 9 Lorenz"
                }
            },
            {
                "box": {
                    "id": "obj-labels-1",
                    "linecount": 4,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1582.0, 340.0, 64.0 ],
                    "text": "pointlabel 10 Rossler, pointlabel 11 Rossler, pointlabel 12 Rossler, pointlabel 13 Rossler, pointlabel 14 Rossler, pointlabel 15 Rossler, pointlabel 16 Rossler, pointlabel 17 Rossler, pointlabel 18 Rossler, pointlabel 19 Rossler"
                }
            },
            {
                "box": {
                    "id": "obj-labels-2",
                    "linecount": 4,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1608.0, 340.0, 64.0 ],
                    "text": "pointlabel 20 Chua, pointlabel 21 Chua, pointlabel 22 Chua, pointlabel 23 Chua, pointlabel 24 Chua, pointlabel 25 Chua, pointlabel 26 Chua, pointlabel 27 Chua, pointlabel 28 Chua, pointlabel 29 Chua"
                }
            },
            {
                "box": {
                    "id": "obj-labels-3",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1634.0, 340.0, 77.0 ],
                    "text": "pointlabel 30 Halvorsen, pointlabel 31 Halvorsen, pointlabel 32 Halvorsen, pointlabel 33 Halvorsen, pointlabel 34 Halvorsen, pointlabel 35 Halvorsen, pointlabel 36 Halvorsen, pointlabel 37 Halvorsen, pointlabel 38 Halvorsen, pointlabel 39 Halvorsen"
                }
            },
            {
                "box": {
                    "id": "obj-labels-4",
                    "linecount": 4,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1660.0, 340.0, 64.0 ],
                    "text": "pointlabel 40 Aizawa, pointlabel 41 Aizawa, pointlabel 42 Aizawa, pointlabel 43 Aizawa, pointlabel 44 Aizawa, pointlabel 45 Aizawa, pointlabel 46 Aizawa, pointlabel 47 Aizawa, pointlabel 48 Aizawa, pointlabel 49 Aizawa"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-legend",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 1704.0, 480.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 70.0, 480.0, 19.0 ],
                    "text": "RED=Lorenz  GREEN=Rossler  BLUE=Chua  YELLOW=Halvorsen  PURPLE=Aizawa"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-plotter",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 1726.0, 400.0, 19.0 ],
                    "text": "(old fluid.plotter newobj removed — using jsui obj-1 above)"
                }
            },
            {
                "box": {
                    "id": "obj-refer-2d",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 1400.0, 150.0, 22.0 ],
                    "text": "refer sweetspots_2d"
                }
            },
            {
                "box": {
                    "id": "obj-click-buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 330.0, 2144.0, 130.0, 22.0 ],
                    "text": "buffer~ click_xy 1 2"
                }
            },
            {
                "box": {
                    "id": "obj-click-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 30.0, 2144.0, 80.0, 22.0 ],
                    "text": "unpack f f"
                }
            },
            {
                "box": {
                    "id": "obj-peek-x",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 30.0, 2176.0, 130.0, 22.0 ],
                    "text": "peek~ click_xy 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-peek-y",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 180.0, 2176.0, 130.0, 22.0 ],
                    "text": "peek~ click_xy 2 0"
                }
            },
            {
                "box": {
                    "id": "obj-knn-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 2208.0, 130.0, 22.0 ],
                    "text": "knearest click_xy 1"
                }
            },
            {
                "box": {
                    "id": "obj-kdtree-query",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 2240.0, 100.0, 22.0 ],
                    "text": "fluid.kdtree~"
                }
            },
            {
                "box": {
                    "id": "obj-kdtree-query-fit",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 2240.0, 120.0, 22.0 ],
                    "text": "fit sweetspots_2d"
                }
            },
            {
                "box": {
                    "id": "obj-knn-fromsym",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 2272.0, 80.0, 22.0 ],
                    "text": "fromsymbol"
                }
            },
            {
                "box": {
                    "id": "obj-recall-idx",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 130.0, 2272.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 550.0, 500.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-recall-coll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 30.0, 2304.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll presets"
                }
            },
            {
                "box": {
                    "id": "obj-recall-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 2336.0, 55.0, 22.0 ],
                    "text": "s toGen"
                }
            },
            {
                "box": {
                    "id": "obj-recall-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 2336.0, 380.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 500.0, 460.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-manual-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 520.0, 2144.0, 110.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 530.0, 110.0, 20.0 ],
                    "text": "Manual preset #:"
                }
            },
            {
                "box": {
                    "id": "obj-manual-num",
                    "maxclass": "number",
                    "maximum": 49,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 640.0, 2144.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 120.0, 530.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-manual-coll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 640.0, 2176.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll presets"
                }
            },
            {
                "box": {
                    "id": "obj-manual-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 640.0, 2240.0, 55.0, 22.0 ],
                    "text": "s toGen"
                }
            },
            {
                "box": {
                    "id": "obj-iter-sweep",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 390.0, 60.0, 22.0 ],
                    "text": "zl.iter 2"
                }
            },
            {
                "box": {
                    "id": "obj-iter-recall",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 2322.0, 60.0, 22.0 ],
                    "text": "zl.iter 2"
                }
            },
            {
                "box": {
                    "id": "obj-iter-manual",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 640.0, 2208.0, 60.0, 22.0 ],
                    "text": "zl.iter 2"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-dataset", 0 ],
                    "source": [ "obj-addpoint-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mfcc", 0 ],
                    "source": [ "obj-analyze-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-post-trig", 0 ],
                    "source": [ "obj-build-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peek-x", 0 ],
                    "source": [ "obj-click-unpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-peek-y", 0 ],
                    "source": [ "obj-click-unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-preset-display", 1 ],
                    "order": 0,
                    "source": [ "obj-coll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-iter-sweep", 0 ],
                    "order": 1,
                    "source": [ "obj-coll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-coll-loaddelay", 0 ],
                    "source": [ "obj-coll-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-coll-readmsg", 0 ],
                    "source": [ "obj-coll-loaddelay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-coll", 0 ],
                    "source": [ "obj-coll-readmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-color-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-color-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-color-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-color-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-color-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-color-0", 0 ],
                    "order": 9,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-color-1", 0 ],
                    "order": 8,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-color-2", 0 ],
                    "order": 7,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-color-3", 0 ],
                    "order": 6,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-color-4", 0 ],
                    "order": 5,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-labels-0", 0 ],
                    "order": 4,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-labels-1", 0 ],
                    "order": 3,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-labels-2", 0 ],
                    "order": 2,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-labels-3", 0 ],
                    "order": 1,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-labels-4", 0 ],
                    "order": 0,
                    "source": [ "obj-color-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-comp-pitch", 0 ],
                    "source": [ "obj-comp-loud", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-comp-mfcc-std", 0 ],
                    "source": [ "obj-comp-mfcc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-comp-shape", 0 ],
                    "source": [ "obj-comp-mfcc-std", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-idx-hold", 0 ],
                    "source": [ "obj-comp-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-comp-loud", 0 ],
                    "source": [ "obj-comp-shape", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-idx-hold", 1 ],
                    "order": 0,
                    "source": [ "obj-counter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-progress", 0 ],
                    "order": 1,
                    "source": [ "obj-counter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sweep-done", 0 ],
                    "order": 0,
                    "source": [ "obj-counter", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-trig", 0 ],
                    "order": 2,
                    "source": [ "obj-counter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-umap-delay", 0 ],
                    "order": 1,
                    "source": [ "obj-counter", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-refer-2d", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-color-delay", 0 ],
                    "order": 1,
                    "source": [ "obj-dump-2d-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ds-2d", 0 ],
                    "order": 0,
                    "source": [ "obj-dump-2d-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-idx-sym", 0 ],
                    "source": [ "obj-idx-hold", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-addpoint-msg", 0 ],
                    "source": [ "obj-idx-sym", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dump-2d-msg", 0 ],
                    "order": 0,
                    "source": [ "obj-kdtree", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-refer-2d", 0 ],
                    "order": 1,
                    "source": [ "obj-kdtree", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kdtree", 0 ],
                    "source": [ "obj-kdtree-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-knn-fromsym", 0 ],
                    "source": [ "obj-kdtree-query", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kdtree-query", 0 ],
                    "source": [ "obj-kdtree-query-fit", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recall-coll", 0 ],
                    "order": 1,
                    "source": [ "obj-knn-fromsym", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recall-idx", 0 ],
                    "order": 0,
                    "source": [ "obj-knn-fromsym", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kdtree-query", 0 ],
                    "source": [ "obj-knn-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-labels-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-labels-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-labels-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-labels-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-labels-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch", 0 ],
                    "source": [ "obj-loud-stats", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-loud-stats", 0 ],
                    "source": [ "obj-loudness", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-iter-manual", 0 ],
                    "source": [ "obj-manual-coll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-manual-coll", 0 ],
                    "source": [ "obj-manual-num", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-counter", 0 ],
                    "source": [ "obj-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mfcc-stats", 0 ],
                    "source": [ "obj-mfcc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-spectral", 0 ],
                    "source": [ "obj-mfcc-stats", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-normalize", 0 ],
                    "source": [ "obj-norm-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-umap-msg", 0 ],
                    "source": [ "obj-normalize", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch-stats", 0 ],
                    "source": [ "obj-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-comp-mfcc", 0 ],
                    "source": [ "obj-pitch-stats", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-click-unpack", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-norm-msg", 0 ],
                    "source": [ "obj-post-trig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-start", 0 ],
                    "source": [ "obj-rec-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-record", 1 ],
                    "source": [ "obj-rec-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-record", 1 ],
                    "source": [ "obj-rec-stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-stop", 0 ],
                    "source": [ "obj-rec-stop-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recall-display", 1 ],
                    "order": 0,
                    "source": [ "obj-recall-coll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-iter-recall", 0 ],
                    "order": 1,
                    "source": [ "obj-recall-coll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-record", 0 ],
                    "source": [ "obj-recv-L", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-spectral-stats", 0 ],
                    "source": [ "obj-spectral", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-loudness", 0 ],
                    "source": [ "obj-spectral-stats", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sweep-tog", 0 ],
                    "source": [ "obj-sweep-done", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-metro", 0 ],
                    "source": [ "obj-sweep-tog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-analyze-delay", 0 ],
                    "source": [ "obj-trig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-coll", 0 ],
                    "source": [ "obj-trig", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-delay", 0 ],
                    "order": 1,
                    "source": [ "obj-trig", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-stop-delay", 0 ],
                    "order": 0,
                    "source": [ "obj-trig", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kdtree-msg", 0 ],
                    "order": 1,
                    "source": [ "obj-umap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kdtree-query-fit", 0 ],
                    "order": 0,
                    "source": [ "obj-umap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-post-trig", 0 ],
                    "source": [ "obj-umap-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-umap", 0 ],
                    "source": [ "obj-umap-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-s-toGen", 0 ],
                    "source": [ "obj-iter-sweep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-recall-send", 0 ],
                    "source": [ "obj-iter-recall", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-manual-send", 0 ],
                    "source": [ "obj-iter-manual", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}