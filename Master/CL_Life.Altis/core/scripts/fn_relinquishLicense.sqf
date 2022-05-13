#include "..\..\script_macros.hpp"
/*
	File: fn_RelinquishLicense.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.co.uk)
	Edited: Dark
	Description:
	Script for handing back a license
*/
// Check for money requirement
private _relinquishCash = CL_Settings(getNumber,"relinquish_cash");

if (CL_cmoola < _relinquishCash) exitWith {hint "You need 500k cash on hand to continue.";};

private _type = _this select 3;

// Check to see if you are in a gang for faction based licenses
if (!isNil {(group player) getVariable "gang_owner"}) exitWith {
	["You are currently in a Gang for your current Faction. <BR/>Leave this Gang before switching Factions.","Relinquish Error","OK"] call BIS_fnc_guiMessage; 
};

if (_type == "reb") then {
	private _action = [
		"Are you sure you want to relinquish your Rebel Training? <BR/>You will lose all Rebel related Licenses and this will cost you 500k.","Relinquish Rebel Training","Relinquish","Cancel"
	] call BIS_fnc_guiMessage;
		
	if (_action) then {
		CL_cmoola = CL_cmoola - _relinquishCash;
		[0] call SOCK_fnc_updatePartial;
		[4] call CL_fnc_removeLicenses;
	};
};

if (_type == "corp") then {
	private _action = [
		"Are you sure you want to relinquish your Corporation License? <BR/>You will lose all Corporation related Licenses and this will cost you 500k.","Relinquish Corporation License","Relinquish","Cancel"
	] call BIS_fnc_guiMessage;

	if (_action) then {
		CL_cmoola = CL_cmoola - _relinquishCash;
		[0] call SOCK_fnc_updatePartial;
		[5] call CL_fnc_removeLicenses;
	};
};
