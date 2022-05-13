#include "..\..\script_macros.hpp"
/*
	File: fn_inventoryClosed.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz

	Description:
	1 : Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
	2 : Used for syncing vehicle inventory when save vehicle gear are activated
*/
private "_container";
_container = param [1,objNull,[objNull]];
if (isNull _container) exitWith {}; //MEH

if ((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	if (CL_HC_isActive) then {
		[_container] remoteExecCall ["HC_fnc_updateHouseContainers",HC_CL];
	} else {
		[_container] remoteExecCall ["TON_fnc_updateHouseContainers",RSERV];
	};
};

if (CL_Settings(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
	if ((_container isKindOf "Car") || (_container isKindOf "Air") || (_container isKindOf "Ship")) then {
		if (CL_HC_isActive) then {
			[_container,1] remoteExecCall ["HC_fnc_vehicleUpdate",HC_CL];
		} else {
			[_container,1] remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];
		};
	};
};
[] call SOCK_fnc_updateRequest;