#include "..\..\script_macros.hpp"
/*
	File: fn_gangCreated.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Tells the player that the gang is created and throws him into it.
*/
CL_action_gangInUse = nil;

if (CL_bmoola < (CL_Settings(getNumber,"gang_price"))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((CL_Settings(getNumber,"gang_price"))-CL_bmoola)] call CL_fnc_numberText];
	{group player setVariable [_x,nil,true];} forEach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

CL_bmoola = CL_bmoola - CL_Settings(getNumber,"gang_price");
[1] call SOCK_fnc_updatePartial;

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(CL_Settings(getNumber,"gang_price"))] call CL_fnc_numberText];
