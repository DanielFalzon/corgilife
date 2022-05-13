scriptName "fn_clientReceiveData";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_clientReceiveData.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_clientReceiveData.sqf"

params [
	["_level", 0],
	["_exp", 0],
	["_perkPoints", 0],
	["_perks", []]
];

// -- Already intitialized?
if (CL_perksInitialized) exitWith {diag_log "Experience data already loaded";};

diag_log "TTM: Perk data received";
diag_log _level;
diag_log _exp;
diag_log _perkPoints;
diag_log _perks;

// -- Assign data
if !(_perks isEqualTo []) then {
	[_perks] call mav_ttm_fnc_setPerks;
};

CL_currentExpLevel = _level;
CL_currentExp = _exp;
CL_currentPerkPoints = _perkPoints;

// -- Done
CL_perksInitialized = true;