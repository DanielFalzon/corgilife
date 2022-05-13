#include "..\..\script_macros.hpp"
/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
params [
	["_target",objNull,[objNull]]
];

private "_dp";

if (str(_target) in CL_Settings(getArray,"delivery_points")) then {
	private "_point";
	_point = CL_Settings(getArray,"delivery_points");
	_point deleteAt (_point find (str(_target)));
	_dp = _point call BIS_fnc_selectRandom;
} else {
	_dp = CL_Settings(getArray,"delivery_points") call BIS_fnc_selectRandom;
};

CL_dp_start = _target;

CL_delivery_in_progress = true;
CL_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
CL_cur_task = player createSimpleTask [format["Delivery_%1",CL_dp_point]];
CL_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
CL_cur_task setTaskState "Assigned";
player setCurrentTask CL_cur_task;

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn {
	waitUntil {!CL_delivery_in_progress || !alive player};
	if (!alive player) then {
		CL_cur_task setTaskState "Failed";
		player removeSimpleTask CL_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		CL_delivery_in_progress = false;
		CL_dp_point = nil;
	};
};