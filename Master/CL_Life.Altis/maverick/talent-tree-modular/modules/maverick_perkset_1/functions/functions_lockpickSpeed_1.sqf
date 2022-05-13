scriptName "functions_lockpickSpeed_1";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_lockpickSpeed_1.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_lockpickSpeed_1.sqf"

_ownsDependency = [CL_currentExpPerks, "perk_locksmith_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency1 = [CL_currentExpPerks, "perk_locksmith_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency && !_ownsDependency1) then {
	mav_ttm_var_lockpickMultiplier = 2;
};