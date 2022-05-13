#include "..\script_macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
waitUntil {!(isNull (findDisplay 46))};

if ((FETCH_CONST(CL_mediclevel) < 1) && (FETCH_CONST(CL_adminlevel) >= 0)) exitWith {
	["Notwhitelisted",false,true] call BIS_fnc_endMission;
	uiSleep 35;
	};

[] spawn CL_fnc_welcome;
waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

[] call CL_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.


[] spawn {
	for "_i" from 0 to 1 step 0 do {
		[] call CL_fnc_medicUniformUpdate;
		uiSleep 300;
	};
};
