#include "..\..\script_macros.hpp"
/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
if (CL_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
private _sender = player;
private _uid = getPlayerUID _sender;
private _side = playerSide;
[0, localize "STR_Session_Query"] call mav_introcam_fnc_updateCinematicStatus;
0 cutFadeOut 999999999;

if (CL_HC_isActive) then {
	[_uid,_side,_sender] remoteExec ["HC_fnc_queryRequest",HC_CL];
} else {
	[_uid,_side,_sender] remoteExec ["DB_fnc_queryRequest",RSERV];
};
