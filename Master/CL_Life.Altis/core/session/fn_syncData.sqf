#include "..\..\script_macros.hpp"
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (isNil "CL_session_time") then {CL_session_time = false;};
if (CL_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};
if (playerSide isEqualTo civilian) exitWith {hint "You do not have authorization to use this function.";};

[] call SOCK_fnc_updateRequest;

if (playerSide isEqualTo west) then {
	[] call CL_fnc_copUniformUpdate;
};

if (playerSide isEqualTo independent) then {
	[] call CL_fnc_medicUniformUpdate;
};

hint localize "STR_Session_SyncData";
[] spawn {
	CL_session_time = true;
	uiSleep (5 * 60);
	CL_session_time = false;
};
