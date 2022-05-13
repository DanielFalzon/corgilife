/*
	File: fn_placeablesPlaceComplete.sqf
	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
if (!CL_barrier_active) exitWith {};
if (CL_barrier_activeObj isEqualTo ObjNull) exitWith {};
private _uid = getPlayerUID player;

detach CL_barrier_activeObj;

CL_barrier_activeObj setPos [(getPos CL_barrier_activeObj select 0),(getPos CL_barrier_activeObj select 1),0];
CL_barrier_activeObj enableSimulationGlobal true;
CL_barrier_activeObj setVariable ["owner",_uid,true];
CL_bar_placey pushBack CL_barrier_activeObj;
CL_barrier_active = false;
CL_barrier_activeObj = ObjNull;
