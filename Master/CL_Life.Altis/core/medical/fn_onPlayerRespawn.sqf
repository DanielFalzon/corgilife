#include "..\..\script_macros.hpp"
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something but I won't know till I write it...
*/
private _unit = _this select 0;
private _corpse = _this select 1;
CL_corpse = _corpse;

//Set some vars on our new body.
if (playerSide isEqualTo west) then {
	_unit setVariable ["restrained",false,true];
	_unit setVariable ["licensed",false,true];
	_unit setVariable ["Escorting",false,true];
	_unit setVariable ["transporting",false,true];
	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
	_unit setVariable ["realname",profileName,true]; //Reset the players name.
	_unit setVariable ["missingOrgan", false,true];
	_unit setVariable ["hasOrgan",false,true];
	_unit setVariable ["missingFlesh", false,true];
	_unit setVariable ["hasFlesh",false,true];
	_unit setVariable ["bloodBagged",false,true];
	_unit setVariable ["occupied",false,true];
} else {
	_unit setVariable ["restrained",false,true];
	_unit setVariable ["Escorting",false,true];
	_unit setVariable ["transporting",false,true];
	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
	_unit setVariable ["realname",profileName,true]; //Reset the players name.
	_unit setVariable ["missingOrgan", false,true];
	_unit setVariable ["hasOrgan",false,true];
	_unit setVariable ["missingFlesh", false,true];
	_unit setVariable ["hasFlesh",false,true];
	_unit setVariable ["bloodBagged",false,true];
	_unit setVariable ["occupied",false,true];
};

player playMoveNow "AmovPpneMstpSrasWrflDnon";

[] call CL_fnc_setupActions;
//[_unit,CL_Settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];
if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 0) then {player enableFatigue false;};
