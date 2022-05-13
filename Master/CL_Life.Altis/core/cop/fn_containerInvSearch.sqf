#include "..\..\script_macros.hpp"
/*
	File: fn_containerInvSearch.sqf
	Author: NiiRoZz
	Inspired : Bryan "Tonic" Boardwine
	Description:
	Searches the container for illegal items.
*/
params [
	["_container",objNull,[objNull]]
];

if (isNull _container) exitWith {};

private _containerInfo = _container getVariable ["Trunk",[]];
if (_containerInfo isEqualTo []) exitWith {
	hint localize "STR_Cop_ContainerEmpty";
};

private _value = 0;
_illegalValue = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
	if (_isIllegalItem isEqualTo 1 ) then {
		_illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
		if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
			_illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
			_illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
		};

		_illegalValue = _illegalValue + (round(_val * _illegalPrice / 2));
	};
} forEach (_containerInfo select 0);
_value = _illegalValue;
if (_value > 0) then {
	[0,"STR_NOTF_ContainerContraband",true,[[_value] call CL_fnc_numberText]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
	CL_bmoola = CL_bmoola + _value;
	[1] call SOCK_fnc_updatePartial;
	_container setVariable ["Trunk",[[],0],true];
	[_container] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
	[format ["%1 (%2) searched a house crate and found contraband.",profileName,getPlayerUID player],"PoliceLog"] remoteExecCall ["A3Log",2];
} else {
	hint localize "STR_Cop_NoIllegalContainer";
	[format ["%1 (%2) searched a house crate and found nothing.",profileName,getPlayerUID player],"PoliceLog"] remoteExecCall ["A3Log",2];
};
