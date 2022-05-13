#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
params [
	["_spawnPos",objNull,[objNull]],
	["_type","",[""]]
];


CL_garage_sp = [(_spawnPos modelToWorld [-11.5,0,0]),(getDir _spawnPos)-90];
CL_garage_type = _type;

if (CL_HC_isActive) then {
	[getPlayerUID player,playerSide,_type,player] remoteExec ["HC_fnc_getVehicles",HC_CL];
} else {
	[getPlayerUID player,playerSide,_type,player] remoteExec ["TON_fnc_getVehicles",RSERV];
};

createDialog "CL_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];