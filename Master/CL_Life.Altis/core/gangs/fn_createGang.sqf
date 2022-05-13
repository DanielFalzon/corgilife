#include "..\..\script_macros.hpp"
/*
	File: fn_createGang.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls up the menu and creates the gang with the name the user enters in.
*/
disableSerialization;

private _gangName = ctrlText (CONTROL(2520,2522));
private _length = count (toArray(_gangName));
private _chrByte = toArray (_gangName);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {
	hint localize "STR_GNOTF_Over32";
};
private _badChar = false;

{
	if (!(_x in _allowed)) exitWith {
		_badChar = true;
	};
} forEach _chrByte;

if (_badChar) exitWith {
	hint localize "STR_GNOTF_IncorrectChar";
};
if (CL_bmoola < (CL_Settings(getNumber,"gang_price"))) exitWith {hint format [localize "STR_GNOTF_NotEnoughMoney",[((CL_Settings(getNumber,"gang_price")) - CL_bmoola)] call CL_fnc_numberText];};

private _faction = [] call CL_fnc_getFaction;

if (CL_HC_isActive) then {
	[player,getPlayerUID player,_gangName,_faction] remoteExec ["HC_fnc_insertGang",HC_CL];
} else {
	[player,getPlayerUID player,_gangName,_faction] remoteExec ["TON_fnc_insertGang",RSERV];
};

[format [localize "STR_DL_AL_createdGang",profileName,(getPlayerUID player),_gangName,_faction,CL_Settings(getNumber,"gang_price")],"MoneyLog"] remoteExecCall ["A3Log",2];
[format [localize "STR_DL_AL_createdGang",profileName,(getPlayerUID player),_gangName,_faction,CL_Settings(getNumber,"gang_price")],"CivilianLog"] remoteExecCall ["A3Log",2];

hint localize "STR_NOTF_SendingData";
closeDialog 0;
CL_action_gangInUse = true;
