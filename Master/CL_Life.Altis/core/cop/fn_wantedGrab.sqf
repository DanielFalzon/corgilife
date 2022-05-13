#include "..\..\script_macros.hpp"
/*
	File: fn_wantedGrab.sqf
	Author: ColinM

	Description:
	Prepare the array to query the crimes.
*/
disableSerialization;
private _display = findDisplay 2400;
private _tab = _display displayCtrl 2402;
private _criminal = lbData[2401,(lbCurSel 2401)];
_criminal = call compile format["%1", _criminal];
if (isNil "_criminal") exitWith {};

if (CL_HC_isActive) then {
	[player,_criminal] remoteExec ["HC_fnc_wantedCrimes",HC_CL];
} else {
	[player,_criminal] remoteExec ["CL_fnc_wantedCrimes",RSERV];
};
