#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
params [
	["_className","",[""]]
];

private _classNamein = _className;

if (!isClass (missionConfigFile >> "CLCfgVehicles" >> _classNamein)) then {
	_classNamein = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: CLCfgVehicles class doesn't exist",_className];
};
private _weight = M_CONFIG(getNumber,"CLCfgVehicles",_classNamein,"vItemSpace");

if (isNil "_weight") then {_weight = -1;};
_weight;