scriptName "functions_gatherIncrease_1";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_gatherIncrease_1.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_gatherIncrease_1.sqf"

_ownsDependency1 = [CL_currentExpPerks, "perk_gathering_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [CL_currentExpPerks, "perk_gathering_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_gatherMultiplier = 1;
};