#include "..\..\script_macros.hpp"
/*
	File: fn_addLicenses.sqf
	Author: Dark
	Description:
	Used for adding certain licenses to players.
*/
private _state = param [0,1,[0]];

switch (_state) do {
	// Bounty Hunter
	case 0: {
		missionNamespace setVariable [LICENSE_VARNAME("bountyH","civ"),true];
	};
};

[2] call SOCK_fnc_updatePartial;
