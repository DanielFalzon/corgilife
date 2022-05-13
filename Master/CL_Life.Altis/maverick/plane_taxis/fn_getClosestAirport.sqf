scriptName "fn_getClosestAirport";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_getClosestAirport.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_getClosestAirport.sqf"

_position = param[0,[0,0,0],[[]]];

// Get all airport configs
_configs = "true" configClasses (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL");

// Cycle and determine the closest
_closest = "";
_closestPosition = [0,0,0];

{
	_posData = getArray (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> configName _x >> "entryPosition");
	_pos = _posData select 0;

	if ((_position distance _pos) < (_position distance _closestPosition)) then {
		_closest = configName _x;
		_closestPosition = _pos;
	};
} forEach _configs;

// Return closest classname of airport
_closest;