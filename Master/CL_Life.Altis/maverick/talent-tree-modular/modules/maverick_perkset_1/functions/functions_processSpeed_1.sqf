scriptName "functions_processSpeed_1";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_processSpeed_1.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_processSpeed_1.sqf"

_ownsDependency = [CL_currentExpPerks, "perk_processing_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency1 = [CL_currentExpPerks, "perk_processing_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency && !_ownsDependency1) then {
	mav_ttm_var_processMultiplier = 2;
};