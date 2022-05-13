#include "..\..\script_macros.hpp"
/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts and monitors the knocked out state.
*/
params [
	["_target",objNull,[objNull]],
	["_who","",[""]]
];

if (isNull _target) exitWith {};
if (_target != player) exitWith {};
if (_who isEqualTo "") exitWith {};

if ("ItemRadio" in (assignedItems player) || "ItemRadio" in (items player)) then {
	player unassignItem "ItemRadio";
	player removeItem "ItemRadio";
	private _wh = createVehicle ["groundweaponholder", player modeltoworld [0,1,0], [], 0, "can_collide"];
	_wh addItemCargoGlobal ["ItemRadio",1];
};

if ("ItemGPS" in (assignedItems player) || "ItemGPS" in (items player)) then {
	player unassignItem "ItemGPS";
	player removeItem "ItemGPS";
	private _wh = createVehicle ["groundweaponholder", player modeltoworld [0,1,0], [], 0, "can_collide"];
	_wh addItemCargoGlobal ["ItemGPS",1];
};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "Incapacitated";
disableUserInput true;

private _obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
_obj setPosATL ASLTOATL(visiblePositionASL player);

CL_isknocked = true;
player attachTo [_obj,[0,0,0]];
uiSleep 15;
player playMoveNow "AmovPpneMstpSrasWrflDnon";
disableUserInput false;
detach player;
deleteVehicle _obj;
CL_isknocked = false;
player setVariable ["robbed",false,true];
