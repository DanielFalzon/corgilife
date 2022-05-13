#include "..\..\..\script_macros.hpp"
/*
	File: fn_restrainAction.sqf


	Description:
	Retrains the target.
*/
private _unit = cursorTarget;

if (CL_inv_zipties < 1) exitWith {
	hintSilent "You need to buy zipties from the market to do this..";
};

if ((CL_action_inUse) || (player getVariable ["tied",false]) || (player getVariable ["restrained",false])) exitWith {
	hintSilent "You can not do that.";
};

if (!(_unit getVariable ["playerSurrender",false]) || animationState cursorObject == "Incapacitated") exitWith {
	hintSilent "Your target has to surrender or be knocked outfirst!";
};

if (isNull _unit) exitWith {}; //Not valid
if (_unit getVariable ["tied",false]) exitWith {};

if (player == _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
//Broadcast!

CL_inv_zipties = CL_inv_zipties - 1;

CL_action_inUse = true;
hintSilent "Restraining!";
[_unit,"handcuffs",5,1] remoteExec ["CL_fnc_say3D",RANY];

_randycunt = 3;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
	_randycunt = _randycunt - 1;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 1;
};

_unit setVariable ["tied",true,true];
[player] remoteExecCall ["CL_fnc_tieing", _unit];

CL_action_inUse = false;
