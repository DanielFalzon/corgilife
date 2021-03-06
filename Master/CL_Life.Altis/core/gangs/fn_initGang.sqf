#include "..\..\script_macros.hpp"
/*
	File: fn_initGang.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main initialization for gangs.
*/
if (playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if (count CL_gangData isEqualTo 0) exitWith {}; //Dafuq?

private _wait = round(random(8));
uiSleep _wait;

//Loop through to make sure there is not a group already created with the gang.
private _exitLoop = false;
private "_group";
{
	_groupName = _x getVariable "gang_name";
	if (!isNil "_groupName") then {
		_groupOwner = _x getVariable ["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if (_groupOwner isEqualTo "" || isNil "_groupID") exitWith {}; //Seriously?
		if ((CL_gangData select 0) isEqualTo _groupID && {(CL_gangData select 1) isEqualTo _groupOwner}) exitWith {
			_group = _x;
			_exitLoop = true;
		};
	};
} forEach allGroups;

if (!isNil "_group") then {
	[player] join _group;
	if ((CL_gangData select 1) isEqualTo getPlayerUID player) then {
		_group selectLeader player;
		[player,_group] remoteExecCall ["TON_fnc_clientGangLeader",(units _group)];
	};
} else {
	_group = group player;
	_group setVariable ["gang_id",(CL_gangData select 0),true];
	_group setVariable ["gang_owner",(CL_gangData select 1),true];
	_group setVariable ["gang_name",(CL_gangData select 2),true];
	_group setVariable ["gang_maxMembers",(CL_gangData select 3),true];
	_group setVariable ["gang_bank",(CL_gangData select 4),true];
	_group setVariable ["gang_members",(CL_gangData select 5),true];
	_group setVariable ["gang_faction",(CL_gangData select 6),true];
};
