#include "..\..\script_macros.hpp"
/*

	File: fn_transferOwnership.sqf
	Author: BoGuu

	Description:
	Transfer agent ownership to HC upon it's connection

*/

_which = param [0,false,[false]];

if (_which) then {

	if (!CL_HC_isActive) exitWith {diag_log "ERROR: Server is trying to give AI ownership to HC when CL_HC_isActive is false";};
	{
		if (!(isPlayer _x)) then {
			_x setOwner HC_CL;  //Move agents over to HC
		};
	} forEach animals;

} else {

	if (CL_HC_isActive) exitWith {diag_log "ERROR: Server is trying to give AI ownership to back to itself when CL_HC_isActive is true";};
	{
		if (!(isPlayer _x)) then {
			_x setOwner RSERV;  //Move agents over to Server
		};
	} forEach animals;

};
