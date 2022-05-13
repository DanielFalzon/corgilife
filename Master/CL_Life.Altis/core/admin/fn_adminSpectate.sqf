#include "..\..\script_macros.hpp"
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991

	Description:
	Spectate the chosen player.
*/
if (FETCH_CONST(CL_adminlevel) < 2) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

private _unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];

if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {
	hint localize "STR_ANOTF_Error";
};

closeDialog 0;

_unit switchCamera "INTERNAL";
[format ["%1 (%2) spectated %3",profileName,getPlayerUID player,_unit getVariable ["realname",name _unit]],"AdminLog"] remoteExecCall ["A3Log",2];
hint format [localize "STR_NOTF_nowSpectating",_unit getVariable ["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) isEqualTo 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'You have stopped spectating';};false"];
