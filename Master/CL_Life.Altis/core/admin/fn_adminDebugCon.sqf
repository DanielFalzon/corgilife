#include "..\..\script_macros.hpp"
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991

	Description:
	Opens the Debug Console.
*/
if (FETCH_CONST(CL_adminlevel) < 5) exitWith {
	closeDialog 0;
	hint localize "STR_NOTF_adminDebugCon";
};

CL_admin_debug = true;

createDialog "RscDisplayDebugPublic";
[0, format [localize "STR_NOTF_adminHasOpenedDebug",profileName]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
[format ["%1 (%2) opened the debug console.",profileName,getPlayerUID player],"AdminLog"] remoteExecCall ["A3Log",2];
