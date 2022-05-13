#include "..\..\script_macros.hpp"
/*
	File: fn_s_onCheckedChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Switching it up and making it prettier..
*/
private["_option","_state"];
_option = _this select 0;
_state = _this select 1;

switch (_option) do {
	case "tags": {
		if (_state isEqualTo 1) then {
			CL_Settings_tagson = true;
			profileNamespace setVariable ["CL_Settings_tagson",true];
			CL_ID_PlayerTags = ["CL_PlayerTags","onEachFrame","CL_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
		} else {
			CL_Settings_tagson = false;
			profileNamespace setVariable ["CL_Settings_tagson",false];
			[CL_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};

	case "objects": {
		if (_state isEqualTo 1) then {
			CL_Settings_revealObjects = true;
			profileNamespace setVariable ["CL_Settings_revealObjects",true];
			CL_ID_RevealObjects = ["CL_RevealObjects","onEachFrame","CL_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
		} else {
			CL_Settings_revealObjects = false;
			profileNamespace setVariable ["CL_Settings_revealObjects",false];
			[CL_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};
/*
	case "sidechat": {
		if (_state isEqualTo 1) then {
			CL_enableSidechannel = true;
			profileNamespace setVariable ["CL_enableSidechannel",true];
			CL_Settings_enableSidechannel = profileNamespace getVariable ["CL_enableSidechannel",true];
		} else {
			CL_enableSidechannel = false;
			profileNamespace setVariable ["CL_enableSidechannel",false];
			CL_Settings_enableSidechannel = profileNamespace getVariable ["CL_enableSidechannel",false];
		};
		[player,CL_Settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];
	};
*/
	case "broadcast": {
		if (_state isEqualTo 1) then {
			CL_enableNewsBroadcast = true;
			profileNamespace setVariable ["CL_enableNewsBroadcast",true];
			CL_Settings_enableNewsBroadcast = profileNamespace getVariable ["CL_enableNewsBroadcast",true];
		} else {
			CL_enableNewsBroadcast = false;
			profileNamespace setVariable ["CL_enableNewsBroadcast",false];
			CL_Settings_enableNewsBroadcast = profileNamespace getVariable ["CL_enableNewsBroadcast",false];
		};
	};
};
