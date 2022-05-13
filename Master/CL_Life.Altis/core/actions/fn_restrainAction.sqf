#include "..\..\script_macros.hpp"
/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Restrains the target.
*/
private _unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
if (side _unit isEqualTo west) exitWith {};
if (player isEqualTo _unit) exitWith {};
if (!isPlayer _unit) exitWith {};

[player,"handcuffs",5,1] remoteExec ["CL_fnc_say3D",RANY];

_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["restrained",true,true];
[player] remoteExec ["CL_fnc_restrain",_unit];

if ("ItemGPS" in (assignedItems _unit) || "ItemGPS" in (items _unit)) then {
	_unit unassignItem "ItemGPS";
	_unit removeItem "ItemGPS";
	private _wh = createVehicle ["groundweaponholder", _unit modeltoworld [0,1,0], [], 0, "can_collide"];
	_wh addItemCargoGlobal ["ItemGPS",1];
};

if ("ItemRadio" in (assignedItems _unit) || "ItemRadio" in (items _unit)) then {
	_unit unassignItem "ItemRadio";
	_unit removeItem "ItemRadio";
	private _wh = createVehicle ["groundweaponholder", _unit modeltoworld [0,1,0], [], 0, "can_collide"];
	_wh addItemCargoGlobal ["ItemRadio",1];
};

[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["CL_fnc_broadcast",west];
