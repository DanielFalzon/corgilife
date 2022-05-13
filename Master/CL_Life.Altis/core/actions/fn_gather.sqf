#include "..\..\script_macros.hpp"
/*
	File: fn_gather.sqf
	Author: Devilfloh

	Description:
	Main functionality for gathering.
*/
private ["_maxGather","_resource","_amount","_requiredItem"];
if (CL_action_inUse) exitWith {};
if ((vehicle player) != player) exitWith {};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};

CL_action_inUse = true;
_zone = "";
_requiredItem = "";
_exit = false;

_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do {

	_curConfig = _resourceCfg select _i;
	_resource = configName _curConfig;
	_maxGather = getNumber(_curConfig >> "amount");
	_zoneSize = getNumber(_curConfig >> "zoneSize");
	_resourceZones = getArray(_curConfig >> "zones");
	_requiredItem = getText(_curConfig >> "item");
	{
		if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
	} forEach _resourceZones;

	if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {CL_action_inUse = false;};

if (_requiredItem != "") then {
	_valItem = missionNamespace getVariable "CL_inv_" + _requiredItem;

	if (_valItem < 1) exitWith {
		switch (_requiredItem) do {
		 //Messages here
		};
		CL_action_inUse = false;
		_exit = true;
	};
};

if (_exit) exitWith {CL_action_inUse = false;};

_amount = round(random(_maxGather)) + 1 + (missionNamespace getVariable ["mav_ttm_var_gatherMultiplier", 0]);

_diff = [_resource,_amount,CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;

if (_diff isEqualTo 0) exitWith {
	hint localize "STR_NOTF_InvFull";
	CL_action_inUse = false;
};

switch (_requiredItem) do {
	case "pickaxe": {
	  {[player,"mining",35,1] remoteExecCall ["CL_fnc_say3D",RCLIENT]};
	};
	case "chainsaw": {
	  {[player,"cutting",50,1] remoteExecCall ["CL_fnc_say3D",RCLIENT]};
	};
	default {
	  {[player,"harvest",20,1] remoteExecCall ["CL_fnc_say3D",RCLIENT]};
	};
};

for "_i" from 0 to 4 do {
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil {
	  animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	};
	uiSleep 0.5;
};

if ([true,_resource,_diff] call CL_fnc_handleInv) then {
	_itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];

	["ItemGathered"] spawn mav_ttm_fnc_addExp;
};

uiSleep 1;
CL_action_inUse = false;
