#include "..\..\..\script_macros.hpp"
/*
	File: fn_vehicleEmpd.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	EMPs the vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {};
if ((_vehicle getVariable["nano_empd", false])) exitWith {};
_vehicle setVariable["nano_empd",true,true];

if (_vehicle isKindOf "Car") then {
	_vehicle say3D "empwarn";
	uiSleep 3.35;
	if (local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		uiSleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	};
};

if (_vehicle isKindOf "Air") then {
	_vehicle say3D "empwarn";
	uiSleep 3.35;
	_vehicle say3D "empwarn";
	uiSleep 3.35;
	_vehicle say3D "empwarn";
	uiSleep 3.35;
	if (local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		uiSleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};

if (_vehicle isKindOf "Ship") then {
	_vehicle say3D "empwarn";
	uiSleep 3.35;
	if (local _vehicle) then {
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
		uiSleep (3 * 60);
		_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	}
};

_vehicle setVariable["nano_empd",false,true];
