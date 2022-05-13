#include "..\..\script_macros.hpp"
/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private _unit = param [1,objNull,[objNull]];
if (CL_bail_paid) exitWith {};
if (isNil "CL_bail_amount") then {CL_bail_amount = 35000;};
if (!CL_canpay_bail) exitWith {hint localize "STR_NOTF_Bail_Post";};
if (CL_cmoola < CL_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",CL_bail_amount];};

CL_cmoola = CL_cmoola - CL_bail_amount;
CL_bail_paid = true;
[0] call SOCK_fnc_updatePartial;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
