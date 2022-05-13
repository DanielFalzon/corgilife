scriptName "functions_recoilCompensation_5";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: functions_recoilCompensation_5.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "functions_recoilCompensation_5.sqf"

player setUnitRecoilCoefficient .75;

player addEventHandler ["Respawn", {
	player setUnitRecoilCoefficient .75;
}];