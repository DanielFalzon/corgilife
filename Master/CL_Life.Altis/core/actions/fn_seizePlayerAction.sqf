#include "..\..\script_macros.hpp"
/*
	File: fn_seizePlayerAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the seize process..
	Based off Tonic's fn_searchAction.sqf
*/
params [
	["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
uiSleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSeizePerson"};
[player] remoteExec ["CL_fnc_seizeClient",_unit];
CL_action_inUse = false;