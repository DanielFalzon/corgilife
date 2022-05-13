#include "..\..\script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vehiclein","_vid","_pid","_unit","_price","_price","_storageFee","_purchasePrice"];
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehiclein = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
_spawntext = localize "STR_Garage_spawn_Success";
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if (!isClass (missionConfigFile >> "CLCfgVehicles" >> _vehiclein)) then {
	_vehiclein = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: CLCfgVehicles class doesn't exist",_vehicle];
};

_price = M_CONFIG(getNumber,"CLCfgVehicles",_vehiclein,"price");
_storageFee = CL_Settings(getNumber,"vehicle_storage_fee_multiplier");

switch (playerSide) do {
	case civilian: {_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_CIVILIAN");};
	case west: {_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_COP");};
	case independent: {_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_MEDIC");};
	case east: {_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_OPFOR");};
};
_price = _purchasePrice * _storageFee;

if (!(_price isEqualType 0) || _price < 1) then {_price = 500;};
if (CL_bmoola < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call CL_fnc_numberText];};

if (CL_garage_sp isEqualType []) then {
	if (CL_HC_isActive) then {
		[_vid,_pid,(CL_garage_sp select 0),_unit,_price,(CL_garage_sp select 1),_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_CL];
	} else {
		[_vid,_pid,(CL_garage_sp select 0),_unit,_price,(CL_garage_sp select 1),_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
	};
} else {
	if (CL_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		if (CL_HC_isActive) then {
			[_vid,_pid,CL_garage_sp,_unit,_price,0,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_CL];
		} else {
			[_vid,_pid,CL_garage_sp,_unit,_price,0,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	} else {
		if (CL_HC_isActive) then {
			[_vid,_pid,(getMarkerPos CL_garage_sp),_unit,_price,markerDir CL_garage_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_CL];
		} else {
			[_vid,_pid,(getMarkerPos CL_garage_sp),_unit,_price,markerDir CL_garage_sp,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	};
};

hint localize "STR_Garage_SpawningVeh";
CL_bmoola = CL_bmoola - _price;
[1] call SOCK_fnc_updatePartial;
closeDialog 0;
