#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the player that he is being ticketed.
*/
if (!isNull(findDisplay 2600)) exitWith {}; //Already at the ticket menu, block for abuse?
private _cop = _this select 0;
if (isNull _cop) exitWith {};
private _val = _this select 1;

createDialog "CL_ticket_pay";
disableSerialization;
waitUntil {
	(!isNull(findDisplay 2600));
};

CL_ticket_paid = false;
CL_ticket_val = _val;
CL_ticket_cop = _cop;
CONTROL(2600,2601) ctrlSetStructuredText parseText format ["<t align='center'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),_cop getVariable ["realname",name _cop],_val];

[] spawn {
	disableSerialization;
	waitUntil {CL_ticket_paid || (isNull (findDisplay 2600))};
	if (isNull (findDisplay 2600) && !CL_ticket_paid) then {
		[0,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",west];
		[1,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",CL_ticket_cop];
	};
};
