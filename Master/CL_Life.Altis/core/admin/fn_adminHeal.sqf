#include "..\..\script_macros.hpp"
/*
	File: fn_adminHeal.sqf
	Author: Jesse "tkcjesse" Schultz

	Description:
	Heals/Repairs self.
*/
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

[format ["%1 (%2) admin healed.",profileName,getPlayerUID player],"AdminLog"] remoteExecCall ["A3Log",2];
player setDamage 0;
