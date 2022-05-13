scriptName "functions_recoilCompensation_3";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_recoilCompensation_3.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_recoilCompensation_3.sqf"

_ownsDependency1 = [CL_currentExpPerks, "perk_gunsspecialist_lessRecoil_4"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [CL_currentExpPerks, "perk_gunsspecialist_lessRecoil_5"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1 && !_ownsDependency2) then {
	player setUnitRecoilCoefficient .85;

		player addEventHandler ["Respawn", {
		player setUnitRecoilCoefficient .85;
	}];
};