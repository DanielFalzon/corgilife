#include "..\..\script_macros.hpp"
/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private _curTarget = cursorTarget;
CL_interrupted = false;

if (CL_action_inUse) exitWith {};
if (isNull _curTarget) exitWith {}; //Bad type
if (playerSide isEqualTo civilian) exitWith {};
private _distance = ((boundingBox _curTarget select 1) select 0) + 2;
if (player distance _curTarget > _distance) exitWith {}; //Too far

private _isVehicle = if((_curTarget isKindOf "LandVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (_isVehicle && _curTarget in CL_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave";};

//More error checks
if (!_isVehicle && !isPlayer _curTarget) exitWith {};
if (!_isVehicle && !(_curTarget getVariable ["restrained",false])) exitWith {};

private _title = format [localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
CL_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
_ui = uiNamespace getVariable "CL_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

private "_badDistance";

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["CL_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	uiSleep 0.10;

	if (isNull _ui) then {
		"progressBar" cutRsc ["CL_progress","PLAIN"];
		_ui = uiNamespace getVariable "CL_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

	if (_cP >= 1 || !alive player) exitWith {};
	if (CL_istazed) exitWith {}; //Tazed
	if (CL_interrupted) exitWith {};
	if ((player getVariable ["restrained",false])) exitWith {};
	if (player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player switchMove "";

if (!alive player || CL_istazed) exitWith {CL_action_inUse = false;};
if ((player getVariable ["restrained",false])) exitWith {CL_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; CL_action_inUse = false;};
if (CL_interrupted) exitWith {CL_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; CL_action_inUse = false;};
if (!([false,"skeletonKey",1] call CL_fnc_handleInv)) exitWith {CL_action_inUse = false;};

CL_action_inUse = false;

if (!_isVehicle) then {
	_curTarget setVariable ["restrained",false,true];
	_curTarget setVariable ["Escorting",false,true];
	_curTarget setVariable ["transporting",false,true];
} else {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		CL_vehicles pushBack _curTarget;
};
