/*
    File: fn_gagAction.sqf
    Author: Lowheartrate & Panda
*/
private _unit = cursorTarget;
if (isNull _unit) exitWith {};
if (_unit getVariable "gagged") exitWith {};
if (player distance _unit > 3) exitWith {};
if (player == _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
_unit setVariable ["gagged",true,true];
[player] remoteExec ["CL_fnc_gagged", _unit,false]; 
hint format ["You gagged %1.", _unit getVariable["realname",_unit]];
