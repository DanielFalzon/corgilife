#include "..\..\..\script_macros.hpp"
/*
	File: fn_vehicleWarned.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	Warns the vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {};
if ((_vehicle getVariable ["nano_warned",false])) exitWith {};
_vehicle setVariable ["nano_warned",true,true];
_vehicle say3D "empwarn";
uiSleep 3.35;
_vehicle say3D "empwarn";
uiSleep 3.35;
_vehicle say3D "empwarn";
uiSleep 3.35;
_vehicle setVariable ["nano_warned",false,true];
