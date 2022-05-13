#include "..\..\script_macros.hpp"
/*
	File: fn_speedBomb.sqf
	Author: Fuzz
	Edited: Dark
	Description:
	Attaches a speed bomb to a vehicle.
*/
private _unit = cursorTarget;
if (!license_civ_reb) exitWith {hint "You need Rebel Training to use this equipment.";};
if ((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "You cannot attach a speed bomb to this.";};
if (player distance _unit > 7) exitWith {hint "You need to be within 7 feet!"};
if (!([false,"speedbomb",1] call CL_fnc_handleInv)) exitWith {};
closeDialog 0;

CL_action_inUse = true;
player switchMove "hubFixingVehicleProne_idle1";
uiSleep 4;
CL_action_inUse = false;
if (player distance _unit > 7) exitWith {titleText ["You are not in range!","PLAIN"];};
titleText ["You have attached an armed speed bomb to this vehicle.","PLAIN"];

player switchMove "amovppnemstpsraswrfldnon";

[_unit] spawn {
	_veh = _this select 0;
	waitUntil {(speed _veh) > 70}; // 70 - Speed for activate the bomb. You can change if you want ;)
	[_veh] remoteExec ["CL_fnc_carAlarmSound",RCLIENT];
	hint "A speed bomb you planted on a vehicle has just become active!";
	{
		["A speed bomb has been activated on this vehicle and will detonate when your speed drops below 50km/h!"] remoteExec ["CL_fnc_broadcast",RCLIENT];
	} forEach (crew _veh);
	waitUntil {(speed _veh) < 50}; // 50 - Speed that the bomb will explode. You change it what you want. Don't forget to change the text above too.
	_test = "Bo_Mk82" createVehicle [0,0,9999];
	_test setPos (getPos _veh);
	_test setVelocity [100,0,0];
	hint "A speed bomb you planted on a vehicle has DETONATED!";
};
