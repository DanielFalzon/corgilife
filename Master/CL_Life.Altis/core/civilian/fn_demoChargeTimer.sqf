#include "..\..\script_macros.hpp"
/*
	File: fn_demoChargeTimer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the "Demo" timer for the police.
*/
disableSerialization;
"CL_timer" cutRsc ["CL_timer","PLAIN"];
private _uiDisp = uiNamespace getVariable "CL_timer";
private _timer = _uiDisp displayCtrl 38301;
private _time = time + (5 * 60);
CL_Vault_Armed = true;

for "_i" from 0 to 1 step 0 do {
	if (isNull _uiDisp) then {
		"CL_timer" cutRsc ["CL_timer","PLAIN"];;
		_uiDisp = uiNamespace getVariable "CL_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if (round(_time - time) < 1) exitWith {};
	if (!(fed_bank getVariable ["chargeplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	uiSleep 0.08;
};

CL_Vault_Armed = false;
"CL_timer" cutRsc ["CL_timer","PLAIN"];
[] call CL_fnc_hudUpdate;
