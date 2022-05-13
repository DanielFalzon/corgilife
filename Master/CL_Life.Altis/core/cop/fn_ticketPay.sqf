#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pays the ticket.
*/
if (isNil "CL_ticket_val" || isNil "CL_ticket_cop") exitWith {};
if (CL_cmoola < CL_ticket_val) exitWith {
	if (CL_bmoola < CL_ticket_val) exitWith {
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",CL_ticket_cop];
		closeDialog 0;
	};

	hint format[localize "STR_Cop_Ticket_Paid",[CL_ticket_val] call CL_fnc_numberText];
	CL_bmoola = CL_bmoola - CL_ticket_val;
	[1] call SOCK_fnc_updatePartial;
	CL_ticket_paid = true;

	[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[CL_ticket_val] call CL_fnc_numberText]] remoteExecCall ["CL_fnc_broadcast",west];
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",CL_ticket_cop];
	[CL_ticket_val,player,CL_ticket_cop] remoteExecCall ["CL_fnc_ticketPaid",CL_ticket_cop];

	if (CL_HC_isActive) then {
		[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_CL];
	} else {
		[getPlayerUID player] remoteExecCall ["CL_fnc_wantedRemove",RSERV];
	};
	closeDialog 0;
};

CL_cmoola = CL_cmoola - CL_ticket_val;
[format ["%1 (%2) paid a ticket of $%3.",profileName,getPlayerUID player,CL_ticket_val],"MoneyLog"] remoteExecCall ["A3Log",2];
[0] call SOCK_fnc_updatePartial;
CL_ticket_paid = true;

if (CL_HC_isActive) then {
	[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_CL];
} else {
	[getPlayerUID player] remoteExecCall ["CL_fnc_wantedRemove",RSERV];
};

[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[CL_ticket_val] call CL_fnc_numberText]] remoteExecCall ["CL_fnc_broadcast",west];
closeDialog 0;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",CL_ticket_cop];
[CL_ticket_val,player,CL_ticket_cop] remoteExecCall ["CL_fnc_ticketPaid",CL_ticket_cop];
