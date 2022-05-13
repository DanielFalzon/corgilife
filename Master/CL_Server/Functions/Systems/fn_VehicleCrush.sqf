#include "\CL_Server\script_macros.hpp"
/*
	File: fn_VehicleCrush.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.com)
	
	Description:
	Crushes a vehicle instead of impounding it
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle OR isNull _unit) exitWith {CL_impound_inuse = false; (owner _unit) publicVariableClient "CL_impound_inuse";CL_garage_store = false;(owner _unit) publicVariableClient "CL_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

if(count _vInfo isEqualTo 0) then  {
	CL_impound_inuse = false;
	(owner _unit) publicVariableClient "CL_impound_inuse";
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
} else {
	_query = format["UPDATE vehicles SET active='0', alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	CL_impound_inuse = false;
	(owner _unit) publicVariableClient "CL_impound_inuse";
};
