#include "..\..\script_macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
private _vehiclein = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if ((time - CL_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay";};
if (!isClass (missionConfigFile >> "CLCfgVehicles" >> _vehiclein)) then {
	_vehiclein = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: CLCfgVehicles class doesn't exist",_vehicle];
};

private _price = M_CONFIG(getNumber,"CLCfgVehicles",_vehiclein,"price");
private ["_multiplier","_purchasePrice"];

switch (playerSide) do {
	case civilian: {
		_multiplier = CL_Settings(getNumber,"vehicle_sell_multiplier_CIVILIAN");
		_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};
	case west: {
		_multiplier = CL_Settings(getNumber,"vehicle_sell_multiplier_COP");
		_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_COP");
	};
	case independent: {
		_multiplier = CL_Settings(getNumber,"vehicle_sell_multiplier_MEDIC");
		_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_MEDIC");
	};
	case east: {
		_multiplier = CL_Settings(getNumber,"vehicle_sell_multiplier_OPFOR");
		_purchasePrice = _price * CL_Settings(getNumber,"vehicle_purchase_multiplier_OPFOR");
	};
};

private _sellPrice = _purchasePrice * _multiplier;

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};

if (CL_HC_isActive) then {
	[_vid,_pid,_sellPrice,player,CL_garage_type] remoteExecCall ["HC_fnc_vehicleDelete",HC_CL];
} else {
	[_vid,_pid,_sellPrice,player,CL_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
};

hint format[localize "STR_Garage_SoldCar",[_sellPrice] call CL_fnc_numberText];
CL_bmoola = CL_bmoola + _sellPrice;
[1] call SOCK_fnc_updatePartial;

[format [localize "STR_DL_AL_soldVehicle",profileName,(getPlayerUID player),_vehiclein,[_sellPrice] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
[format [localize "STR_DL_AL_soldVehicle",profileName,(getPlayerUID player),_vehiclein,[_sellPrice] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"VehicleLog"] remoteExecCall ["A3Log",2];

CL_action_delay = time;
closeDialog 0;
