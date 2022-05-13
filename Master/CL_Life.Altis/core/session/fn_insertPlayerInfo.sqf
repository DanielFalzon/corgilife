#include "..\..\script_macros.hpp"
/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Upon first join inital player data is sent to the server and added to the database.
	Setup data gets sent to CL_server\Functions\MySQL\fn_insertRequest.sqf
*/
if (CL_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
[0, localize "STR_Session_QueryFail"] call mav_introcam_fnc_updateCinematicStatus;
0 cutFadeOut 9999999;
private ["_bank"];

switch (playerSide) do {
	case west: {
		_bank = CL_Settings(getNumber,"bank_cop");
	};
	case civilian: {
		_bank = CL_Settings(getNumber,"bank_civ");
	};
	case independent: {
		_bank = CL_Settings(getNumber,"bank_med");
	};
};

if (CL_HC_isActive) then {
	[getPlayerUID player,profileName,CL_cmoola,_bank,player] remoteExecCall ["HC_fnc_insertRequest",HC_CL];
} else {
	[getPlayerUID player,profileName,CL_cmoola,_bank,player] remoteExecCall ["DB_fnc_insertRequest",RSERV];
};