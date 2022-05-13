#include "..\..\script_macros.hpp"
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the player.
*/
params [
	["_target",objNull,[objNull]]
];

if (isNull _target) exitWith {};
private _reviveCost = CL_Settings(getNumber,"revive_fee");

private _revivable = _target getVariable ["Revive",false];
if (_revivable) exitWith {};
if (_target getVariable ["Reviving",objNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving"; CL_action_inUse = false;};
if (player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
private _targetName = _target getVariable ["name","Unknown"];
private _title = format[localize "STR_Medic_Progress",_targetName];
CL_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving",player,true];
//Setup our progress bar
disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable ["CL_progress",displayNull];
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

//Lets reuse the same thing!
for "_i" from 0 to 1 step 0 do {
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["CL_fnc_animSync",RCLIENT];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	uiSleep .15;
	_cP = _cP + .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (_cP >= 1 || !alive player) exitWith {};
	if (CL_istazed) exitWith {}; //Tazed
	if (CL_isknocked) exitWith {}; //Knocked
	if (CL_interrupted) exitWith {};
	if (CL_isdowned) exitWith {}; //Rubbered
	if (player getVariable ["restrained",false]) exitWith {};
	if (player distance _target > 4) exitWith {_badDistance = true;};
	if (_target getVariable ["Revive",false]) exitWith {};
	if (_target getVariable ["Reviving",objNull] != player) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (_target getVariable ["Reviving",objNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
_target setVariable ["Reviving",NIL,true];

if (!alive player || CL_istazed || CL_isknocked || CL_isdowned) exitWith {CL_action_inUse = false;};
if (_target getVariable ["Revive",false]) exitWith {hint localize "STR_Medic_RevivedRespawned"; CL_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {CL_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; CL_action_inUse = false;};
if (CL_interrupted) exitWith {CL_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; CL_action_inUse = false;};
CL_action_inUse = false;

[format ["%1 (%2) revived %3 (%4).",profileName,getPlayerUID player,_target,getPlayerUID _target],"MedicLog"] remoteExecCall ["A3Log",2];

_target setVariable ["Revive",true,true];
[profileName] remoteExecCall ["CL_fnc_revived",_target];

if (playerSide isEqualTo independent) then {
	titleText[format [localize "STR_Medic_RevivePayReceive",_targetName,[_reviveCost] call CL_fnc_numberText],"PLAIN"];
	CL_bmoola = CL_bmoola + _reviveCost;
	[1] call SOCK_fnc_updatePartial;
	["PlayerRevived"] spawn mav_ttm_fnc_addExp;
};

uiSleep .6;
player reveal _target;