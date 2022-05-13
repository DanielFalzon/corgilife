#include "..\..\script_macros.hpp"
/*
	File: fn_copUnrestrain.sqf
	Author: Dark
	Description:
	Releases cop from being in the licensed state
*/
params [
	["_cop",objNull,[objNull]]
];

if (isNull _cop || !(_cop getVariable ["licensed",false])) exitWith {}; //Error check?

_cop setVariable ["restrained",false,true];
_cop setVariable ["licensed",false,true];
_cop setVariable ["Escorting",false,true];
_cop setVariable ["transporting",false,true];

detach _cop;

[0,"STR_NOTF_Unrestrain",true,[_cop getVariable ["realname",name _cop], profileName]] remoteExecCall ["CL_fnc_broadcast",west];
