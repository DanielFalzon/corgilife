/*
	File: fn_takeOrgans.sqf
	Author
	Edited: Dark (To work with 4.xx)
	Description: Steals a players organs
*/
private _unit = cursorObject;

// Bunch of fucking checks
if (isNull _unit) exitWith {};
if ((_unit getVariable ["missingOrgan",false])) exitWith {};
if ((player getVariable ["hasOrgan",false])) exitWith {};
if ((animationState _unit != "Incapacitated")) exitWith {};
if (!license_civ_reb) exitWith {
	hint "You don't have the training required to perform this surgery!";
};
if (!([false,"scalpel",1] call CL_fnc_handleInv)) exitWith {
	hint "You don't have a scalpel!";
};
if (player == _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
if (CL_inv_kidney >= 2) exitWith {
	hint "You can't possibly need that many organs!";
};
if (!([true,"kidney",1] call CL_fnc_handleInv)) exitWith {
	hint "You don't have room to store any organs!";
};

//Lets get on with it
CL_action_inUse = true;
player setVariable ["hasOrgan",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";

uiSleep 3;
_unit setVariable [ "missingOrgan",true,true];
[false,"scalpel",1] call CL_fnc_handleInv;
CL_action_inUse = false;
[player] remoteExec ["CL_fnc_hasOrgan",_unit];
