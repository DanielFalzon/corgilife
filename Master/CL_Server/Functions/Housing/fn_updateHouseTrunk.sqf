/*
	File : fn_updateHouseTrunk.sqf
	Author: NiiRoZz

	Description:
	Update inventory "y" in container
*/
params [
	["_container",objNull,[objNull]]
];

if (isNull _container) exitWith {};

private _trunkData = _container getVariable ["Trunk",[[],0]];
private _containerID = _container getVariable ["container_id",-1];

if (_containerID isEqualTo -1) exitWith {}; //Dafuq?

_trunkData = [_trunkData] call DB_fnc_mresArray;
private _query = format ["UPDATE containers SET inventory='%1' WHERE id='%2'",_trunkData,_containerID];

[_query,1] call DB_fnc_asyncCall;
