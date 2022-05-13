#include "..\..\script_macros.hpp"
/*
	File: fn_unrestrain.sqf
	Author:

	Description:

*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || !(_unit getVariable ["restrained",false])) exitWith {}; //Error check?

_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["tied", nil, true];
_unit setVariable ["gagged",false,true];
_unit setVariable ["blindfolded", nil, true];

detach _unit;

[0,"STR_NOTF_Unrestrain",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["CL_fnc_broadcast",west];
