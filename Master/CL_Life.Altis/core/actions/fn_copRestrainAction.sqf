#include "..\..\script_macros.hpp"
/*
	File: fn_copRestrainAction.sqf
	Author: Dark
	Description:
	Calls the cop restrain script (fn_copRestrain.sqf) to give the higher ranking cop the ability to apply licenses.
	Note: licensed is the variable which is set when the cop is restrained.
*/
private _unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "licensed") exitWith {};
if (player isEqualTo _unit) exitWith {};
if (!isPlayer _unit) exitWith {};

_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["licensed",true,true];
[player] remoteExec ["CL_fnc_copRestrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["CL_fnc_broadcast",west];
