/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private _handle = [] spawn CL_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

private _clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
player addUniform (selectRandom _clothings);

/* ITEMS */
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
