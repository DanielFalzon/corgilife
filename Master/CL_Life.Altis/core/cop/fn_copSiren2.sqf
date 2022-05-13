#include "..\..\script_macros.hpp"
/*
	File: fn_copSiren2.sqf
	Author:
	Edited: Dark
	Description:
	Yelp
*/
params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "siren2"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
	if(!(_vehicle getVariable "siren2")) exitWith {};
	if(count (crew (_vehicle)) isEqualTo 0) then {_vehicle setVariable["siren2",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D ["Yelp",500,1]; //Class name specified in description.ext, max distance & pitch
	uiSleep 2.0;
	if(!(_vehicle getVariable "siren2")) exitWith {};
};
