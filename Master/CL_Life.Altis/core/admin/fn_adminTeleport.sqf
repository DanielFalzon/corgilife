#include "..\..\script_macros.hpp"
/*
	File: fn_adminTeleport.sqf
	Author: ColinM9991
	Credits: To original script author(s)
	Description:
	Teleport to chosen position.
*/
if (FETCH_CONST(CL_adminlevel) < 3) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

closeDialog 0;

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call CL_fnc_teleport";
[format ["%1 (%2) used teleport to go to position: %3.",profileName,getPlayerUID player,getPos player],"AdminLog"] remoteExecCall ["A3Log",2];
