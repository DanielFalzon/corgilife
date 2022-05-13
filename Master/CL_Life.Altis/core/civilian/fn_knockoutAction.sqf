#include "..\..\script_macros.hpp"
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Knocks out the target.
*/
params [
	["_target",objNull,[objNull]]
];

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
CL_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["CL_fnc_animSync",RCLIENT];
uiSleep 0.08;
[_target,profileName] remoteExec ["CL_fnc_knockedOut",_target];

uiSleep 3;
CL_knockout = false;
