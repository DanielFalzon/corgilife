#include "..\..\script_macros.hpp"
/*
	File : fn_placestorage.sqf
	Author: NiiRoZz

	Description:
	PLace container were player select with preview

*/
if (!CL_container_active) exitWith {};
if (CL_container_activeObj isEqualTo objNull) exitWith {};
if (!((typeOf CL_container_activeObj) in ["B_supplyCrate_F","Box_IND_Grenades_F"])) exitWith {};

private _container = CL_container_activeObj;
private _isFloating = if (((getPos _container) select 2) < 0.1) then {false} else {true};
detach _container;
[_container,true] remoteExecCall ["CL_fnc_simDisable",RANY];
_container setPosATL [getPosATL _container select 0, getPosATL _container select 1, (getPosATL _container select 2) + 0.7];
_container allowDamage false;

if ((typeOf _container) == "B_supplyCrate_F") then {
	[false,"storagebig",1] call CL_fnc_handleInv;
} else {
	[false,"storagesmall",1] call CL_fnc_handleInv;
};

[_container, _isFloating] call CL_fnc_placeContainer;
CL_container_active = false;
CL_container_activeObj = objNull;
