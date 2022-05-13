scriptName "fn_initializeNPC";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_initializeNPC.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_initializeNPC.sqf"

// NPC
_npc = param[0,objNull,[objNull]];

// Get current position
_curPosition = position _npc;

// Get closest airport
_airportCfgName = [_curPosition] call mav_planetaxi_fnc_getClosestAirport;
_localPos = (getArray (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> _airportCfgName >> "entryPosition")) select 0;

// Give NPC/object addActions
// Get all airport configs
_configs = "true" configClasses (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL");
_ppm = getNumber (missionConfigFile >> "Maverick_PlaneTaxis" >> "Costs" >> "pricePerMeter");

{
	if ((configName _x) != _airportCfgName) then {
		_name = getText (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> configName _x >> "displayName");
		_posData = getArray (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> configName _x >> "entryPosition");
		_pos = _posData select 0;
		_price = round(_ppm * (_localPos distance _pos));
		_npc addAction [format["Travel to %1 for $%2", _name, _price], format["['%1', '%2', %3] spawn mav_planetaxi_fnc_initRide;", _airportCfgName, configName _x, _price], nil, 10, false, true, "", "!(missionNamespace getVariable ['mav_pt_inPlane', false])"];
	};
} forEach _configs;