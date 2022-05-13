#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPaid.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Verifies that the ticket was paid.
*/
params [
	["_value",5,[0]],
	["_unit",objNull,[objNull]],
	["_cop",objNull,[objNull]]
];
if (isNull _unit || {_unit != CL_ticket_unit}) exitWith {}; //NO
if (isNull _cop || {_cop != player}) exitWith {}; //Double NO

CL_bmoola = CL_bmoola + _value;
[format ["%1 (%2) got paid $%3 for a ticket.",profileName,getPlayerUID player,_value],"MoneyLog"] remoteExecCall ["A3Log",2];
["TicketPlayer"] spawn mav_ttm_fnc_addExp;
[1] call SOCK_fnc_updatePartial;
