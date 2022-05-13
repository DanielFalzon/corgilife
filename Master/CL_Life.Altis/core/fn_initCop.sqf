#include "..\script_macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
waitUntil {!(isNull (findDisplay 46))};

if (CL_blacklisted) exitWith {
	["Blacklisted",false,true] call BIS_fnc_endMission;
	uiSleep 30;
};

if ((FETCH_CONST(CL_coplevel) < 1) && (FETCH_CONST(CL_adminlevel) >= 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};

// SWAT Slots
if (str(player) in ["cop_21","cop_22","cop_23","cop_24","cop_25"]) then {
	if !(license_cop_cSWAT || license_cop_cSniper) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 35;
	};
};

player setVariable ["rank",(FETCH_CONST(CL_coplevel)),true];
player setVariable ["licensed",false,true];
//player setVariable ["copLevel",1,true]; //--- Aus buildings / gates (allows cops to access them);

[] spawn CL_fnc_welcome;
waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done
[] call CL_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn CL_fnc_placeablesInit;


[] spawn {
	for "_i" from 0 to 1 step 0 do {
		[] call CL_fnc_copUniformUpdate;
		uiSleep 300;
	};
};
