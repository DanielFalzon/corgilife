#include "..\..\script_macros.hpp"
/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {}; //Bad entry!
if (!(typeOf _vehicle in ["C_Offroad_01_F","C_Offroad_02_unarmed_F","C_SUV_01_F","I_MRAP_03_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

private _trueorfalse = _vehicle getVariable ["lights",false];

if (_trueorfalse) then {
	_vehicle setVariable ["lights",false,true];
} else {
	_vehicle setVariable ["lights",true,true];
	[_vehicle,0.22] remoteExec ["CL_fnc_medicLights",RCLIENT];
};