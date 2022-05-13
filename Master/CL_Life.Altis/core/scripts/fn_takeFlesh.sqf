/*
	File: fn_takeFlesh.sqf
	Author
	Edited: Dark (To work with 4.xx)
	Description: Bites a chunk of flesh out of a player
*/
private _unit = cursorObject;

// Bunch of fucking checks
if (isNull _unit) exitWith {};
if ((_unit getVariable ["missingFlesh",false])) exitWith {};
if ((player getVariable ["hasFlesh",false])) exitWith {};
if ((animationState _unit != "Incapacitated")) exitWith {};
if (player == _unit) exitWith {};
if (!license_civ_reb) exitWith {
	hint "You do not yet know the ways of the Brotherhood.";
};
if (!isPlayer _unit) exitWith {};
if (CL_inv_flesh >= 2) exitWith {
	hint "You can't possibly need that many flesh heaps!";
};
if (!([true,"flesh",1] call CL_fnc_handleInv)) exitWith {
	hint "You don't have room to store any flesh!";
};

//Lets get on with it
CL_action_inUse = true;
player setVariable ["hasFlesh",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";

[player,"omnomnom",5,1] remoteExec ["CL_fnc_say3D",RANY];
uiSleep 3;
_unit setVariable [ "missingFlesh",true,true];

CL_action_inUse = false;
[player] remoteExec ["CL_fnc_hasFlesh",_unit];
