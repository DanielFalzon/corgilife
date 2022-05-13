/*
	Author: [ED] Luke
	Version: 1.0
	Description: Gives a visual value for the treasure and converts it to a sellable item.
	(Just for some depth for the whole system)
	Edited: Dark
*/

if (CL_inv_roundobject == 1) then {
	hintC format ["This appears to be some kind of stone carving in four forms, and is atleast 1000 years old based on similar pieces I have seen."];
	CL_inv_roundobject = 0;
	CL_inv_carvedstone = 4; //Swaps the unknown item for a known one
	CL_wreck_searched = false;
	CL_explorer_task setTaskState "Succeeded";
	player removeSimpleTask CL_explorer_task;
	deleteVehicle CL_explorer_wreck;
	uiSleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You found four ancient stone carvings. You can now sell them to the trader."]] call bis_fnc_showNotification;
};

if (CL_inv_squareobject == 1) then {
	hintC format ["This is some kind of ancient stone tablet."];
	CL_inv_squareobject = 0;
	CL_inv_stonetablet = 2; //Swaps the unknown item for a known one
	CL_wreck_searched = false;
	CL_explorer_task setTaskState "Succeeded";
	player removeSimpleTask CL_explorer_task;
	deleteVehicle CL_explorer_wreck;
	uiSleep 1;
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You found two stone tablets! You can now sell them to the trader."]] call bis_fnc_showNotification;
};

if (CL_inv_coins == 1) then {
	hintC format ["These coins are quite valuable."];
	CL_inv_coins = 0;
	CL_inv_valuablecoins = 3;
	CL_wreck_searched = false;
	CL_explorer_task setTaskState "Succeeded";
	player removeSimpleTask CL_explorer_task;
	deleteVehicle CL_explorer_wreck;
	uiSleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You found a handful of valuable coins. You can now sell them to the trader."]] call bis_fnc_showNotification;
};

if (CL_inv_doubloon == 1) then {
	hintC format ["This is a very rare sack of doubloons."];
	CL_inv_doubloon = 0;
	CL_inv_golddoubloon = 4;
	CL_wreck_searched = false;
	CL_explorer_task setTaskState "Succeeded";
	player removeSimpleTask CL_explorer_task;
	deleteVehicle CL_explorer_wreck;
	uiSleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You found a sack of gold doubloons. You can now sell them to the trader."]] call bis_fnc_showNotification;
};
