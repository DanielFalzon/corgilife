#include "..\..\script_macros.hpp"
/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Reskins the vehicle.
*/
params [
	["_vehicle",objNull,[objNull]],
	["_index",-1,[0]]
];

private _className = typeOf _vehicle;
private _classNamein = _className;

if (isNull _vehicle || !alive _vehicle || _index isEqualTo -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

if (local _vehicle) then {
	switch _className do {
		case "C_Offroad_01_F": {[_vehicle,"color",3,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];};
		case "C_Hatchback_01_F": {[_vehicle,"color",1,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];};
		case "C_SUV_01_F": {[_vehicle,"color",1,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];};
		case "C_Van_01_box_F": {[_vehicle,"color",1,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];};
		case "C_Van_01_transport_F": {[_vehicle,"color",1,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];};
	};
};

if (!isClass (missionConfigFile >> "CLCfgVehicles" >> _classNamein)) then {
	_classNamein = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: CLCfgVehicles class doesn't exist",_className];
};

private _textures = ((M_CONFIG(getArray,"CLCfgVehicles",_classNamein,"textures") select _index) select 2);
if (isNil "_textures" || {count _textures isEqualTo 0}) exitWith {};

_vehicle setVariable ["CL_VEH_color",_index,true];

{_vehicle setObjectTextureGlobal [_forEachIndex,_x];} forEach _textures;
