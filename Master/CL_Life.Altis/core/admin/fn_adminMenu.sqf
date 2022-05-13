#include "..\..\script_macros.hpp"
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the admin menu and hides buttons based on CL_adminlevel.
*/
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

disableSerialization;

waitUntil {!isNull (findDisplay 2900)};
private _list = CONTROL(2900,2902);
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

switch (FETCH_CONST(CL_adminlevel)) do {
	case 1: {
	ctrlShow [2904,false];
	ctrlShow [2905,false];
	ctrlShow [2906,false];
	ctrlShow [2907,false];
	ctrlShow [2908,false];
	ctrlShow [2909,false];
	ctrlShow [2910,false];
	ctrlShow [2911,false];
	ctrlShow [2912,false];
	ctrlShow [2913,false];
	};

	case 2: {
	ctrlShow [2904,false];
	ctrlShow [2906,false];
	ctrlShow [2907,false];
	ctrlShow [2908,false];
	ctrlShow [2909,false];
	ctrlShow [2910,false];
	ctrlShow [2911,false];
	ctrlShow [2912,false];
	ctrlShow [2913,false];
	};

	case 3: {
	ctrlShow [2907,false];
	ctrlShow [2908,false];
	ctrlShow [2909,false];
	ctrlShow [2910,false];
	ctrlShow [2911,false];
	ctrlShow [2912,false];
	ctrlShow [2913,false];
	};

	case 4: {
	ctrlShow [2911,false];
	ctrlShow [2912,false];
	ctrlShow [2913,false];
	};
};

//Purge List
lbClear _list;

{
	private _side = switch (side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable ["realname",name _x],_side];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} forEach playableUnits;
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {closeDialog 0;};

if (CL_god) then {
	private _godmode = CONTROL(2900,2908);
	_godmode ctrlSetTextColor [0, 255, 0, 1];	// green
};
if (CL_markers) then {
	private _markers = CONTROL(2900,2910);
	_markers ctrlSetTextColor [0, 255, 0, 1];	// green
};
