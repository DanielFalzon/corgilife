#include "..\..\script_macros.hpp"
/*
	File: fn_adminDeleteVehicle.sqf
	Author: Jesse "tkcjesse" Schultz

	Description:
	Deletes cursor object.
*/
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

[format ["%1 (%2) used deleteVehicle on %3",profileName,getPlayerUID player,cursorTarget],"AdminLog"] remoteExecCall ["A3Log",2];
deleteVehicle cursorTarget;
