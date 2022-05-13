#include "..\..\script_macros.hpp"
/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Receives money
*/

params [
	["_unit",objNull,[objNull]],
	["_val","",[""]],
	["_from",objNull,[objNull]]
];

if (isNull _unit || isNull _from || _val isEqualTo "") exitWith {};
if (player != _unit) exitWith {};
if (!([_val] call TON_fnc_isnumber)) exitWith {};
if (_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format[localize "STR_NOTF_GivenMoney",_from getVariable ["realname",name _from],[(parseNumber (_val))] call CL_fnc_numberText];
[format ["%1 (%2) was given %3 from %4 (%5) ",profileName,getPlayerUID player,[(parseNumber (_val))] call CL_fnc_numberText,_from getVariable ["realname",name _from],getPlayerUID _from],"MoneyLog"] remoteExecCall ["A3Log",2];
CL_cmoola = CL_cmoola + parseNumber(_val);

[0] call SOCK_fnc_updatePartial;
