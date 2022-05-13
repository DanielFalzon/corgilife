#include "..\..\script_macros.hpp"
/*
	File: fn_newLifeRule.sqf
	Author: life.co.uk for framework, NLR Timer edited by Repentz
	Description: It's an NLR Timer?
*/
disableSerialization;

"CL_nlrtimer" cutRsc ["CL_nlrtimer","PLAIN"];

private _uiDisp = uiNamespace getVariable "CL_nlrtimer";
private _timer = _uiDisp displayCtrl 38301;
private _time = time + (15 * 60);

CL_nlrtimer_running = true;

for "_i" from 0 to 1 step 0 do {
if (isNull _uiDisp) then {
	"CL_nlrtimer" cutRsc ["CL_nlrtimer","PLAIN"];
	_uiDisp = uiNamespace getVariable "CL_nlrtimer";
	_timer = _uiDisp displayCtrl 38301;
};
if(round(_time - time) < 1) exitWith {};
if (CL_nlrtimer_stop) exitWith {
	CL_nlrtimer_stop = false;
};
_timer ctrlSetText format["NLR: %1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
uiSleep 0.08;
};

CL_nlrtimer_running = false;

"CL_nlrtimer" cutText ["","PLAIN"];