#include "..\..\script_macros.hpp"
/*
	File: fn_bloodbag.sqf
	Author: Tonic
	Second Author: [midgetgrimm]
	Third Author: Jesse Schultz

	Description: blood bag a player to give them full health and no fatgiue
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_badDistance","_val"];
_curTarget = cursorTarget;
CL_interrupted = false;
if (CL_action_inUse) exitWith {};
if (isNull _curTarget) exitWith {}; //Bad type
if (player isEqualTo _curTarget) exitWith {};
if (!isPlayer _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if (player distance _curTarget > _distance) exitWith {}; //Too far
if (player != vehicle player) exitWith {hint "You must exit your vehicle to give a bloodbag"};
if (_curTarget != vehicle _curTarget) exitWith {hint "You cannot perform this bloodbag a person who is in a vehicle";};
if ((damage _curTarget) < 0.05) exitWith {hint "Don't waste a bloodbag on someone missing so little health...";};
if ((_curTarget getVariable ["bloodBagged",false])) exitWith {hint "Someone is already bloodbagging this person";};
if (CL_inv_bloodbag < 1) exitWith {hint "You need a bloodbag to heal..."};
_title = format["Giving a blood transfusion to %1",name _curTarget];

//Setup the progress bar
disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
_ui = uiNamespace getVariable "CL_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.05;

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
	_cP = _cP + 0.03;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_curTarget setVariable ["bloodBagged",true,true];
	if (_cP >= 1 || !alive player) exitWith {};
	if (CL_istazed) exitWith {_curTarget setVariable ["bloodBagged",false,true];}; //Tazed
	if (CL_interrupted) exitWith {_curTarget setVariable ["bloodBagged",false,true];};
	if (player distance _curTarget > _distance) exitWith {_badDistance = true; _curTarget setVariable ["bloodBagged",false,true];};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || CL_istazed) exitWith {CL_action_inUse = false; _curTarget setVariable ["bloodBagged",false,true];};
if (!isNil "_badDistance") exitWith {titleText["You got too far away from the target.","PLAIN"]; CL_action_inUse = false; _curTarget setVariable ["bloodBagged",false,true];};
if (CL_interrupted) exitWith {CL_interrupted = false; titleText["Action cancelled","PLAIN"]; CL_action_inUse = false; _curTarget setVariable ["bloodBagged",false,true];};
_curTarget setdamage 0;
_curTarget setFatigue 0;
[] call CL_fnc_hudUpdate;
_curTarget setVariable ["bloodBagged",false,true];

_val = 500;
if (playerSide in [west,independent]) then {
	CL_bmoola = CL_bmoola + _val;
	hint "You have received $500 for your services";
};

player setVariable ["bloodBagged",false,true];
[false,"bloodbag",1] call CL_fnc_handleInv;
CL_action_inUse = false;
