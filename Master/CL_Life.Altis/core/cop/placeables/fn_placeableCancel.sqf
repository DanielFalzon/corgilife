/*
	File: fn_placeableCancel.sqf
	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
if (!CL_barrier_active) exitWith {}; //bad check?
deleteVehicle CL_barrier_activeObj;
CL_barrier_active = false;
CL_barrier_activeObj = ObjNull;
