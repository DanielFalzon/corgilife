#include "..\..\script_macros.hpp"
/*
	File: fn_fuelStatOpen.sqf
	Author : NiiRoZz

	Description:
	Open dialog Pump.
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_fuelCost"];

disableSerialization;
//Long boring series of checks
if (CL_action_inUse) exitWith {};
if (dialog) exitWith {};
if (CL_is_processing) exitWith {};
CL_action_inUse = true;
_fuelstations = nearestObjects [player, ["Land_fs_feed_F"],10];
if (_fuelstations isEqualTo []) exitWith {CL_action_inUse = false;};
_vehicleList = nearestObjects [player, ["Car","air"], 10];
if (count _vehicleList < 1) exitWith {hint localize "STR_NOTF_VehicleNear";CL_action_inUse = false;};
if (!createDialog "CL_FuelStat") exitWith {};
_fuelCost = CL_Settings(getNumber,"fuel_cost");
[] spawn {waitUntil {!dialog}; CL_action_inUse = false;};
ctrlSetText [20301,"Fuel Station"];
if (isNil "CL_fuelPrices") then {
	CL_fuelPrices = _fuelCost;
};

//Fetch the shop config.
vehicleFuelList =[];
{
	_fuel = fuel _x;
	vehicleFuelList pushBack [_x,_fuel];
} forEach _vehicleList;

_control = ((findDisplay 20300) displayCtrl 20302);
lbClear _control; //Flush the list.

ctrlSetText [20322,format [localize "STR_Price_Fuel_Pump",CL_fuelPrices]];
ctrlSetText [20323,format ["Total : %1$",CL_fuelPrices * 0.1]];

//Loop through
{
	_className = typeOf (_x select 0);
	_fuelleft = _x select 1;

	_vehicleInfo = [_className]call CL_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_className];
	_control lbSetValue [(lbSize _control)-1,_forEachIndex];
} forEach vehicleFuelList;
