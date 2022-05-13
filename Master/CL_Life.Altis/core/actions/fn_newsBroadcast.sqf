#include "..\..\script_macros.hpp"
/*
	File: fn_newsBroadcast.sqf
	Author: Jesse "tkcjesse" Schultz

	Description:
	Creates the dialog and handles the data in the Channel 7 News Dialog.
*/

if !(license_civ_press) exitWith {hint "You are not a news reporter!";};

#define Confirm 100104

private "_broadcastDelay";

createDialog "CL_news_broadcast";

disableSerialization;
private _display = findDisplay 100100;
private _confirmBtn = _display displayCtrl Confirm;
_confirmBtn ctrlEnable false;

private _msgCooldown = (60 * CL_Settings(getNumber,"news_broadcast_cooldown"));
private _msgCost = CL_Settings(getNumber,"news_broadcast_cost");

if (CL_cmoola < _msgCost) then {
	hint format[localize "STR_News_NotEnough",[_msgCost] call CL_fnc_numberText];
} else {
	_confirmBtn ctrlEnable true;
	_confirmBtn buttonSetAction "[] call CL_fnc_postNewsBroadcast; closeDialog 0;";
};

if (isNil "CL_broadcastTimer" || {(time - CL_broadcastTimer) > _msgCooldown}) then {
	_broadcastDelay = localize "STR_News_Now";
} else {
	_broadcastDelay = [(_msgCooldown - (time - CL_broadcastTimer))] call BIS_fnc_secondsToString;
	_confirmBtn ctrlEnable false;
};

CONTROL(100100,100103) ctrlSetStructuredText parseText format[ localize "STR_News_StructuredText",[_msgCost] call CL_fnc_numberText,_broadcastDelay];
