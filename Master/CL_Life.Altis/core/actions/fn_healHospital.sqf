#include "..\..\script_macros.hpp"
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	Reworked: Jesse "TKCJesse" Schultz

	Description:
	Prompts user with a confirmation dialog to heal themselves.
	Used at the hospitals to restore health to full.
	Note: Dialog helps stop a few issues regarding money loss.
*/
if (CL_action_inUse) exitWith {};
if ((damage player) < 0.01) exitWith {hint localize "STR_NOTF_HS_FullHealth"};
private _healCost = CL_Settings(getNumber,"hospital_heal_fee");
if (CL_cmoola < _healCost) exitWith {hint format[localize "STR_NOTF_HS_NoCash",[_healCost] call CL_fnc_numberText];};

CL_action_inUse = true;
private _action = [
	format [localize "STR_NOTF_HS_PopUp",[_healCost] call CL_fnc_numberText],
	localize "STR_NOTF_HS_TITLE",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
	closeDialog 0;
	uiSleep 8;
	if (player distance (_this select 0) > 5) exitWith {CL_action_inUse = false; titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
	titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
	player setDamage 0;
	[] call CL_fnc_hudUpdate;
	CL_cmoola = CL_cmoola - _healCost;
	CL_action_inUse = false;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
	CL_action_inUse = false;
};
