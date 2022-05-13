#include "..\..\script_macros.hpp"
	/*
		File: fn_mine.sqf
		Author: Devilfloh
		Editor: Dardo

		Description:
		Same as fn_gather,but it allows use of probabilities for mining.
	*/
private ["_maxGather", "_resource", "_amount", "_requiredItem", "_mined"];
if (CL_action_inUse) exitWith {};
if ((vehicle player) != player) exitWith {};
if (player getVariable "restrained") exitWith {
	hint localize "STR_NOTF_isrestrained";
};
_exit = false;
if (player getVariable "playerSurrender") exitWith {
	hint localize "STR_NOTF_surrender";
};
CL_action_inUse = true;
_zone = "";
_requiredItem = "";

_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
_percent = (floor random 100) + 1; //Make sure it's not 0

for "_i" from 0 to count(_resourceCfg)-1 do {
	_curConfig = _resourceCfg select _i;
	_resources = getArray(_curConfig >> "mined");
	_maxGather = getNumber(_curConfig >> "amount");
	_zoneSize = getNumber(_curConfig >> "zoneSize");
	_resourceZones = getArray(_curConfig >> "zones");
	_requiredItem = getText(_curConfig >> "item");
	_mined = "";

	if (_resources isEqualTo []) exitWith {}; //Smart guy :O
	for "_i" from 0 to count (_resources) do {
		if (count _resources isEqualTo 1) exitWith {
			if (!((_resources select 0) isEqualType [])) then {
				_mined = _resources select 0;
			} else {
				_mined = (_resources select 0) select 0;
			};
		};
		_resource = (_resources select _i) select 0;
		_prob = (_resources select _i) select 1;
		_probdiff = (_resources select _i) select 2;
		if ((_percent >= _prob) && (_percent <= _probdiff)) exitWith {
			_mined = _resource;
		};
	};

	{
		if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
			_zone = _x;
		};
	} forEach _resourceZones;

	if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {
	CL_action_inUse = false;
};

if (_requiredItem != "") then {
	_valItem = missionNamespace getVariable "CL_inv_" + _requiredItem;

	if (_valItem < 1) exitWith {
		switch (_requiredItem) do {
			case "pickaxe": {
				titleText[(localize "STR_NOTF_Pickaxe"), "PLAIN"];
		};
			case "chainsaw": {
			titleText[(localize "STR_NOTF_Chainsaw"), "PLAIN"];
		};
	};
		CL_action_inUse = false;
		_exit = true;
	};
};

if (_exit) exitWith {
	CL_action_inUse = false;
};

_amount = round(random(_maxGather)) + 1 + (missionNamespace getVariable ["mav_ttm_var_miningMultiplier", 0]);
_diff = [_mined, _amount, CL_carryWeight, CL_maxWeight] call CL_fnc_calWeightDiff;

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

if (([true, _mined, _diff] call CL_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
	titleText[format[localize "STR_NOTF_Mine_Success", (localize _itemName), _diff], "PLAIN"];

	["ItemMined"] spawn mav_ttm_fnc_addExp;
};

uiSleep 2.5;
CL_action_inUse = false;
