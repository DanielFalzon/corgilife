#include "..\..\script_macros.hpp"
/*
	File: fn_repairDoor.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Re-locks the door mainly for the federal reserve structures.
*/
params [
	["_building",objNull,[objNull]]
];

if (isNull _building) exitWith {};
if (!(_building isKindOf "House_F")) exitWith {hint localize "STR_ISTR_Bolt_NotNear";};

private _doors = 1;
private _doors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _building),"NumberOfDoors");
private _door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format ["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if (player distance _worldSpace < 5) exitWith {_door = _i;};
};

if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
private _doorN = _building getVariable [format ["bis_disabled_Door_%1",_door],0];
if (_doorN isEqualTo 1) exitWith {hint localize "STR_House_FedDoor_Locked"};
CL_action_inUse = true;

closeDialog 0;
//Setup the progress bar
disableSerialization;
private _title = localize "STR_Cop_RepairingDoor";
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

private "_cpRate";

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.008;};
	case "Land_Medevac_house_V1_F";
	case "Land_Research_house_V1_F": {_cpRate = 0.005;};
	default {_cpRate = 0.08;}
};

for "_i" from 0 to 1 step 0 do {
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["CL_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.26;
	if (isNull _ui) then {
		"progressBar" cutRsc ["CL_progress","PLAIN"];
		_ui = uiNamespace getVariable "CL_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (_cP >= 1 || !alive player) exitWith {};
	if (CL_istazed) exitWith {}; //Tazed
	if (CL_isknocked) exitWith {}; //Knocked
	if (CL_interrupted) exitWith {};
	if (CL_isdowned) exitWith {}; //Rubbered
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || CL_istazed || CL_isknocked || CL_isdowned) exitWith {CL_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {CL_action_inUse = false;};
if (CL_interrupted) exitWith {CL_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; CL_action_inUse = false;};
CL_action_inUse = false;

_building animateSource [format ["Door_%1_source",_door], 0];
_building setVariable [format ["bis_disabled_Door_%1",_door],1,true]; //Lock the door.

private _locked = true;
for "_i" from 1 to _doors do {
	if ((_building getVariable [format ["bis_disabled_Door_%1",_i],0]) isEqualTo 0) exitWith {_locked = false};
};

if (_locked) then {
	_building setVariable ["locked",true,true];
};
