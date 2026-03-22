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
		"rect": [ 100, 100, 600, 400 ],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [ 15.0, 15.0 ],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,

		"boxes": [
			{
				"box": {
					"id": "obj-comment",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "SWARM VOICE WRAPPER for poly~\nReceives [freq velocity] from route → unpack → trigger gen~",
					"patching_rect": [ 15.0, 15.0, 350.0, 35.0 ],
					"linecount": 2
				}
			},

			{
				"box": {
					"id": "obj-in1",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"text": "in 1",
					"patching_rect": [ 15.0, 60.0, 30.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-unpack",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "float", "float" ],
					"text": "unpack 0. 0.",
					"patching_rect": [ 15.0, 90.0, 100.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-freq-sig",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "signal" ],
					"text": "sig~ 110",
					"patching_rect": [ 15.0, 130.0, 55.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-vel-sig",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "signal" ],
					"text": "sig~ 0.5",
					"patching_rect": [ 130.0, 130.0, 55.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-trig",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "signal" ],
					"text": "click~",
					"patching_rect": [ 250.0, 130.0, 42.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-thispoly",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "int", "int" ],
					"text": "thispoly~",
					"patching_rect": [ 350.0, 60.0, 65.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-voiceid-minus",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "int" ],
					"text": "- 1",
					"patching_rect": [ 350.0, 90.0, 32.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-voiceid-prepend",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"text": "prepend voice_id",
					"patching_rect": [ 350.0, 120.0, 90.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-gen",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 2,
					"outlettype": [ "signal", "signal" ],
					"text": "gen~ @gen swarm_voice",
					"patching_rect": [ 15.0, 200.0, 300.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-out1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "out~ 1",
					"patching_rect": [ 15.0, 260.0, 42.0, 22.0 ]
				}
			},

			{
				"box": {
					"id": "obj-out2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"text": "out~ 2",
					"patching_rect": [ 160.0, 260.0, 42.0, 22.0 ]
				}
			}
		],

		"lines": [
			{ "patchline": { "source": [ "obj-in1", 0 ], "destination": [ "obj-unpack", 0 ] } },
			{ "patchline": { "source": [ "obj-in1", 0 ], "destination": [ "obj-trig", 0 ] } },
			{ "patchline": { "source": [ "obj-unpack", 0 ], "destination": [ "obj-freq-sig", 0 ] } },
			{ "patchline": { "source": [ "obj-unpack", 1 ], "destination": [ "obj-vel-sig", 0 ] } },
			{ "patchline": { "source": [ "obj-trig", 0 ], "destination": [ "obj-gen", 0 ] } },
			{ "patchline": { "source": [ "obj-freq-sig", 0 ], "destination": [ "obj-gen", 1 ] } },
			{ "patchline": { "source": [ "obj-vel-sig", 0 ], "destination": [ "obj-gen", 2 ] } },
			{ "patchline": { "source": [ "obj-thispoly", 0 ], "destination": [ "obj-voiceid-minus", 0 ] } },
			{ "patchline": { "source": [ "obj-voiceid-minus", 0 ], "destination": [ "obj-voiceid-prepend", 0 ] } },
			{ "patchline": { "source": [ "obj-voiceid-prepend", 0 ], "destination": [ "obj-gen", 0 ] } },
			{ "patchline": { "source": [ "obj-gen", 0 ], "destination": [ "obj-out1", 0 ] } },
			{ "patchline": { "source": [ "obj-gen", 1 ], "destination": [ "obj-out2", 0 ] } }
		]
	}
}
