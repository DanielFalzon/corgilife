#include "..\..\script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives a ticket to the targeted player.
*/
if (isNil "CL_ticket_unit") exitWith {
	hint localize "STR_Cop_TicketNil";
};

if (isNull CL_ticket_unit) exitWith {
	hint localize "STR_Cop_TicketExist";
};

private _val = ctrlText 2652;

if (!([_val] call TON_fnc_isnumber)) exitWith {
	hint localize "STR_Cop_TicketNum";
};
if ((parseNumber _val) > 200000) exitWith {
	hint localize "STR_Cop_TicketOver100";
};

[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call CL_fnc_numberText,CL_ticket_unit getVariable ["realname",name CL_ticket_unit]]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["CL_fnc_ticketPrompt",CL_ticket_unit];
closeDialog 0;
[format ["%1 (%2) gave a ticket of $%3 to %4 (%5).",profileName,getPlayerUID player,(parseNumber _val),CL_ticket_unit getVariable ["realname",name CL_ticket_unit],getPlayerUID CL_ticket_unit],"PoliceLog"] remoteExecCall ["A3Log",2];
