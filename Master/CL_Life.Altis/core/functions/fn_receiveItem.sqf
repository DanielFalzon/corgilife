#include "..\..\script_macros.hpp"
/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Receive an item from a player.
*/
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if (_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;

if (!(_diff isEqualTo (parseNumber _val))) then {
	if ([true,_item,_diff] call CL_fnc_handleInv) then {
		hint format[localize "STR_MISC_TooMuch_3",_from getVariable ["realname",name _from],_val,_diff,((parseNumber _val) - _diff)];
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["CL_fnc_giveDiff",_from];
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["CL_fnc_giveDiff",_from];
	};
} else {
	if ([true,_item,(parseNumber _val)] call CL_fnc_handleInv) then {
		private "_type";
		_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
		hint format[localize "STR_NOTF_GivenItem",_from getVariable ["realname",name _from],_val,(localize _type)];
		[format ["%1 (%2) was given %3 %4 by %5 (%6).",profileName,getPlayerUID player,_val,(localize _type),_from getVariable ["realname",name _from],getPlayerUID _from],"ItemLog"] remoteExecCall ["A3Log",2];
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["CL_fnc_giveDiff",_from];
	};
};