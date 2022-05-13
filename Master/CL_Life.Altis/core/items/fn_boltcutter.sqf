#include "..\..\script_macros.hpp"
/*
	File: fn_boltcutter.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
params [
	["_building",objNull,[objNull]]
];

private _home = false;
private _ownerName = "";

if (isNull _building) exitWith {};
if (!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if ((((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building) || ((nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) || (nearestObject [[20894.2,19226.8,0],"Land_Dome_Big_F"] == _building)) && (west countSide playableUnits < (CL_Settings(getNumber,"minimum_cops")))) exitWith {
	hint format [localize "STR_Civ_NotEnoughCops",(CL_Settings(getNumber,"minimum_cops"))];
};
if ((typeOf _building) == "Land_Research_house_V1_F" && (nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) getVariable ["locked",true]) exitWith {hint localize "STR_ISTR_Bolt_Exploit"};
if (isNil "CL_boltcutter_uses") then {CL_boltcutter_uses = 0;};

private _doors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _building),"numberOfDoors");
private _door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	private _selPos = _building selectionPosition format["Door_%1_trigger",_i];
	private _worldSpace = _building modelToWorld _selPos;
		if (player distance _worldSpace < 2) exitWith {_door = _i;};
};
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if ((_building getVariable [format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

if (((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building) || ((nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building)) then {
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
} else {
	if ((nearestObject [[20894.2,19226.8,0],"Land_Dome_Big_F"]) == _building) then {
		[[1,2],"STR_ISTR_Bolt_AlertWepDepo",true,[]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
	} else {
		[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
	};
};

private _ownerUid = (_building getVariable ["house_owner",["",""]]) select 0;
if (!(_ownerUid isEqualTo "")) then {_home = true};
if (_home && (!([_ownerUid] call CL_fnc_isUIDActive))) exitWith {hint localize "STR_ISTR_Bolt_Offline"};
private _copsNeeded = CL_Settings(getNumber,"copsHouseRaid");
if (({side _x isEqualTo west} count playableUnits < _copsNeeded) && _home) exitWith {hint format[localize "STR_Civ_NotEnoughCops",_copsNeeded]};

CL_action_inUse = true;

if (_home) then {
	private _unitsToNotify = [];
	{
		if (_uid isEqualTo (getPlayerUID _x) || side _x isEqualTo west) then {_unitsToNotify pushBack _x};
		if (_uid isEqualTo (getPlayerUID _x)) then {_ownerName = name _x};
	} forEach playableUnits;
	if (count _unitsToNotify isEqualTo 0) exitWith {};
	[1,[_building,60,"Mil_dot","HOUSE ROBBERY IN PROGRESS"]] remoteExec ["CL_fnc_markers",_unitsToNotify];
	[1,format[localize "STR_ISTR_Bolt_Notify",_ownerName]] remoteExec ["CL_fnc_broadcast",_unitsToNotify];
};

//Setup the progress bar
disableSerialization;
private _title = localize "STR_ISTR_Bolt_Process";
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

private "_cpRate";

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.0005;}
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
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
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
CL_boltcutter_uses = CL_boltcutter_uses + 1;
CL_action_inUse = false;

if (CL_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call CL_fnc_handleInv;
	CL_boltcutter_uses = 0;
};

_building setVariable [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
_building setVariable ["locked",false,true];

if (CL_HC_isActive) then {
	[getPlayerUID player,profileName,"459"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
} else {
	[getPlayerUID player,profileName,"459"] remoteExecCall ["CL_fnc_wantedAdd",RSERV];
};
