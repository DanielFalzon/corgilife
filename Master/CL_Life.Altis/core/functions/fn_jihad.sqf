#include "..\..\script_macros.hpp"
/*
	File: fn_jihad.sqf
	Author: Credits to Yolo Joe for Original Script / Fixed by @Heavy_Bob and @Liam0.
	Special thanks to @NiiRoZz and @tkcjesse for additional input.
	Description:
	A suicide vest. Yes this is a bomb. Handle with causion.
*/
params [
	["_unit",ObjNull,[ObjNull]]
];

if (isNil "_unit" || isNull _unit || !isPlayer _unit || CL_isknocked || CL_istazed || (vehicle _unit != _unit) || !alive _unit || (_unit getVariable ["restrained",false])) exitWith {};
if (vest _unit != "V_HarnessOGL_gry") exitWith {hint "You aren't wearing a suicide vest.";};

private _bomb = "Bomb_04_F";
[_unit,"AllahuAkbar",25,1] remoteExec ["CL_fnc_say3D",RANY];
[0,format["%1 has set off their suicide vest.",name player]] remoteExec ["CL_fnc_broadcast",0];
uiSleep 2.424;
_unit setDamage 1;
_bomb createVehicle (ASLtoATL (getPosASL _unit));
removeVest _unit;
[0,format["%1 blew their load.",name player]] remoteExec ["CL_fnc_broadcast",0];
[format ["%1 (%2) used a suicide vest!",profileName,getPlayerUID player],"ItemLog"] remoteExecCall ["A3Log",2];