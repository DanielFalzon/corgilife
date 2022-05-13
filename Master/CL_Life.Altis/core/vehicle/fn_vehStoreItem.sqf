#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
disableSerialization;
if ((CL_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; hint localize "STR_MISC_VehInvUse"; };

private _ctrl = ctrlSelData(3503);
private _num = ctrlText 3506;
if (!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_MISC_Under1";};

private _totalWeight = [CL_trunk_vehicle] call CL_fnc_vehicleWeight;

private _itemWeight = ([_ctrl] call CL_fnc_itemWeight) * _num;
private _veh_data = CL_trunk_vehicle getVariable ["Trunk",[[],0]];
private _inv = _veh_data select 0;

if (_ctrl == "goldBar" && {!(CL_trunk_vehicle isKindOf "LandVehicle")}) exitWith {hint localize "STR_NOTF_canOnlyStoreInLandVeh";};
if (_ctrl == "uraniumA" && {!(CL_trunk_vehicle isKindOf "LandVehicle" || CL_trunk_vehicle isKindOf "House_F")}) exitWith {hint "The Radiation from the Uranium would make flying dangerous!";};

private ["_index","_val"];

if (_ctrl == "money") then {
	_index = [_ctrl,_inv] call TON_fnc_index;
	if (CL_cmoola < _num) exitWith {hint localize "STR_NOTF_notEnoughCashToStoreInVeh";};
	if (_index isEqualTo -1) then {
		_inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	CL_cmoola = CL_cmoola - _num;
	[0] call SOCK_fnc_updatePartial;
	CL_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[CL_trunk_vehicle] call CL_fnc_vehInventory;
} else {
	if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint localize "STR_NOTF_VehicleFullOrInsufCap";};

	if (!([false,_ctrl,_num] call CL_fnc_handleInv)) exitWith {hint localize "STR_CouldNotRemoveItemsToPutInVeh";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if (_index isEqualTo -1) then {
		_inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	CL_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[CL_trunk_vehicle] call CL_fnc_vehInventory;
};
