#include "..\..\script_macros.hpp"
/*
	File: fn_gangDisband.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private _action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";

	if (CL_HC_isActive) then {
		[group player] remoteExec ["HC_fnc_removeGang",HC_CL];
	} else {
		[group player] remoteExec ["TON_fnc_removeGang",RSERV];
	};
	[format ["%1 (%2) disbaned their gang.",profileName,getPlayerUID player],"CivilianLog"] remoteExecCall ["A3Log",2];
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};
