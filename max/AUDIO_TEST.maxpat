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
		"rect": [
			100,
			100,
			400,
			300
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
					"id": "lb",
					"maxclass": "newobj",
					"text": "loadbang",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						20,
						20,
						55,
						22
					]
				}
			},
			{
				"box": {
					"id": "sw",
					"maxclass": "message",
					"text": "startwindow",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						20,
						50,
						75,
						22
					]
				}
			},
			{
				"box": {
					"id": "lbl",
					"maxclass": "comment",
					"text": "AUDIO TEST — you should hear a 440Hz tone",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						230,
						350,
						20
					]
				}
			},
			{
				"box": {
					"id": "osc",
					"maxclass": "newobj",
					"text": "cycle~ 440",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						20,
						100,
						68,
						22
					]
				}
			},
			{
				"box": {
					"id": "vol",
					"maxclass": "newobj",
					"text": "*~ 0.25",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						20,
						130,
						45,
						22
					]
				}
			},
			{
				"box": {
					"id": "dac",
					"maxclass": "newobj",
					"text": "dac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						20,
						170,
						35,
						22
					]
				}
			},
			{
				"box": {
					"id": "ez",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						150,
						100,
						45,
						45
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"lb",
						0
					],
					"destination": [
						"sw",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sw",
						0
					],
					"destination": [
						"dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"osc",
						0
					],
					"destination": [
						"vol",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vol",
						0
					],
					"destination": [
						"dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vol",
						0
					],
					"destination": [
						"dac",
						1
					]
				}
			}
		]
	}
}