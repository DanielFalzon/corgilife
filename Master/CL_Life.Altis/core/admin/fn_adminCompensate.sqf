#include "..\..\script_macros.hpp"
/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991

	Description:
	Figure it out.
*/
if (FETCH_CONST(CL_adminlevel) < 3) exitWith {
	closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";
};

private _value = parseNumber(ctrlText 9922);
if (_value < 0) exitWith {};
if (_value > 999999) exitWith {
	hint localize "STR_ANOTF_Fail";
};

private _action = [
	format [localize "STR_ANOTF_CompWarn",[_value] call CL_fnc_numberText],
	localize "STR_Admin_Compensate",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	CL_cmoola = CL_cmoola + _value;
	hint format [localize "STR_ANOTF_Success",[_value] call CL_fnc_numberText];
	closeDialog 0;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};

[format ["%1 (%3) used Admin Compensate for $%2.",profileName,_value,getPlayerUID player],"AdminLog"] remoteExecCall ["A3Log",2];
