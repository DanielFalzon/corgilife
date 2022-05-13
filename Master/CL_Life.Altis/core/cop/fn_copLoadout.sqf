/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Loads the cops out with the default gear.
*/
private _handle = [] spawn CL_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

switch (call CL_coplevel) do {
    case 1: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 2: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 3: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 4: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 5: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 6: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 7: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 8: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
    case 9: { 
		// Load player with default cop gear
		player addUniform "U_Rangemaster";
		player addVest "";
		player addBackpack "";
		player addGoggles "";
		player addHeadgear "";
	};
};

player addWeapon "hgun_ACPC2_snds_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

// Items
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";

[] call CL_fnc_playerSkins;
[] call CL_fnc_saveGear;
