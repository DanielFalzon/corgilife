scriptName "functions_lockpickMastery_1";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_lockpickMastery_1.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_lockpickMastery_1.sqf"

_ownsDependency = [CL_currentExpPerks, "perk_locksmithMastery_2"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_lockpickMasteryMultiplier = 0.9;
};