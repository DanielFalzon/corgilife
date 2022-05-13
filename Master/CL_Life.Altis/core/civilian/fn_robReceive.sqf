#include "..\..\script_macros.hpp"
/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:

*/
params [
	["_cash",0,[0]],
	["_victim",objNull,[objNull]],
	["_robber",objNull,[objNull]]
];

if (_robber == _victim) exitWith {};
if (_cash isEqualTo 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

CL_cmoola = CL_cmoola + _cash;
[0] call SOCK_fnc_updatePartial;
titleText[format[localize "STR_Civ_Robbed",[_cash] call CL_fnc_numberText],"PLAIN"];
[format [localize "STR_DL_ML_Robbed",profileName,(getPlayerUID player),[_cash] call CL_fnc_numberText,_victim,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
