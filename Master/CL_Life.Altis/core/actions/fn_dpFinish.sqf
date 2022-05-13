#include "..\..\script_macros.hpp"
/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
params [
	["_dp",objNull,[objNull]]
];

CL_delivery_in_progress = false;
CL_dp_point = nil;
private _dis = round((getPos CL_dp_start) distance (getPos _dp));
private _price = round(1.0 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call CL_fnc_numberText]]] call bis_fnc_showNotification;
CL_cur_task setTaskState "Succeeded";
player removeSimpleTask CL_cur_task;
CL_cmoola = CL_cmoola + _price;
[format ["%1 (%2) completed a DP mission and recieved $%3",profileName,getPlayerUID player,[_price] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
[0] call SOCK_fnc_updatePartial;
