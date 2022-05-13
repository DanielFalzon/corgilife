#include "..\..\script_macros.hpp"
/*
	File: fn_adminRepair.sqf
	Author: Jesse "tkcjesse" Schultz

	Description:
	Heals/Repairs the cursorObject.
*/
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

[format ["%1 (%2) used adminRepair on %3",profileName,getPlayerUID player,cursorTarget],"AdminLog"] remoteExecCall ["A3Log",2];
cursorTarget setDamage 0;
