#define CL_Settings(TYPE,SETTING) TYPE(missionConfigFile >> "CL_Settings" >> SETTING)
/*
	File: initPlayerServer.sqf
	Author:

	Description:
	Executed only on server when a player joins mission.
*/
if (CL_Settings(getNumber,"player_deathLog") isEqualTo 0) exitWith {};

_this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneIt}];
