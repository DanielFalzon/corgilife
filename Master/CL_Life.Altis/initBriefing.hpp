waitUntil {!isNull player && player == player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["servinf","Server Info"];
player createDiarySubject ["servrule","Server Rules"];
player createDiarySubject ["controls","Controls"];
/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br /><br />
				"
		]
	];
*/
player createDiaryRecord ["servinf", //Container
	[
		"Forums and Teamspeak", //Subsection
		"
		Our website address is: CorgiLife.co.uk<br /><br />
		Our Teamspeak 3 server can be found at: ts.CorgiLife.co.uk<br /><br />
		You're more than welcome to join us at either or both of those places, and become a part of the community that makes this server great!<br />
		Or, you may even wish to join up with a whitelisted group on the server! If this is the case, apply on the forums!
		"
	]
];
player createDiaryRecord ["servrule", //Container
	[
		"Read the Rules!", //Subsection
		"
		Read the rules at CorgiLife.co.uk/rules
		"
	]
];

// Controls Section

    player createDiaryRecord ["controls",
        [
            "Police and medic controls",
                "
F: Vehicle siren.<br/>
L: Speed radar (police only and weapon is P07 Suppressed).<br/>
Left Shift + L: Activates siren lights.<br/>
Left Shift + R: Restrain (police only).<br/><br/>
                "
        ]
    ];
    player createDiaryRecord ["controls",
        [
            "Civilian controls",
                "
Left Shift + G: Knock out / stun (Weapon required. Used for robbing).<br/>
Spacebar: Place storage container.<br/><br/>
                "
        ]
    ];
    player createDiaryRecord ["controls",
        [
            "General controls",
                "
Y: Open Player Menu.<br/>
U: Lock and unlock vehicles and houses.<br/>
T: Vehicle trunk and house virtual item storage.<br/>
P: Explode Suicide Vest.<br/>
Q / E: Left / Right Vehicle Indicators.<br/>
F: Vehile Nitrous Oxide.<br/>
Shift + L: Vehicle Neon Lights.<br/>
Left Shift + B: Surrender (hands on head).<br/>
Left Windows: Main interaction key. Used for interacting with objects like vehicles, houses, ATMs, and restrained players. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10.<br/>
Left Shift + H: Holsters the weapon in your hands.<br/>
Left Ctrl + H: Revert holster action.<br/>
Spacebar: Jump.<br/>
F2: Ear Plugs.<br/>
Inside Vehicle: Scroll: Put on / Take off Seatbelt<br/>
                "
        ]
    ];
