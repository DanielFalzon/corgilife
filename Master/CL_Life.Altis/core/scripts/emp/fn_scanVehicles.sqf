#include "..\..\..\script_macros.hpp"
/*
	File: fn_scanVehicles.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	Scans for vehicles nearby
*/
disableSerialization;

if (!isNull (findDisplay 3494)) then {
	private _display = findDisplay 3494;
	private _list = _display displayCtrl 2902;
	lbClear _list;
	nn_last_vehicles = [];
	private _objects = nearestObjects [player, ["Air","Car","Ship"], 150];
	{
		if (vehicle player != _x) then {
			_color = [(typeOf _x),(_x getVariable "CL_VEH_color")] call CL_fnc_vehicleColorStr;
			_text = format["(%1)",_color];
			_list lbAdd format ["%1 - %2 (%3)", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"), _text, round(player distance _x)];
			nn_last_vehicles set [count nn_last_vehicles, _x];
		};
	} forEach _objects;
};
