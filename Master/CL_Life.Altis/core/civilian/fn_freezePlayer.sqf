#include "..\..\script_macros.hpp"
/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991

	Description:
	Freezes selected player.
*/
params [
	["_admin",objNull,[objNull]]
];

if (CL_frozen) then {
	hint localize "STR_NOTF_Unfrozen";
	[1, format [localize "STR_ANOTF_Unfrozen",profileName]] remoteExecCall ["CL_fnc_broadcast",_admin];
	disableUserInput false;
	CL_frozen = false;
} else {
	hint localize "STR_NOTF_Frozen";
	[1, format [localize "STR_ANOTF_Frozen",profileName]] remoteExecCall ["CL_fnc_broadcast",_admin];
	disableUserInput true;
	CL_frozen = true;
};
