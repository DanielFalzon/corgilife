#include "..\..\script_macros.hpp"
/*
	File: fn_doomsDay.sqf
	Author: Dark
	Description:
*/
if (FETCH_CONST(CL_adminlevel) < 5) exitWith {
	closeDialog 0;
	hint "Your Admin level is not high enough."
};

[1] remoteExec ["mav_ServerRestartEvent_fnc_ServerRestartEvent"];

uiSleep 600;
