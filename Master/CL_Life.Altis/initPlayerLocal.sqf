#include "script_macros.hpp"
#include "initBriefing.hpp"
/*
	File: initPlayerLocal.sqf
	Author:

	Description:
	Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
	[] call compile preprocessFileLineNumbers "\CL_hc\initHC.sqf";
};

#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define CL_Settings(TYPE,SETTING) TYPE(missionConfigFile >> "CL_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);

//--- Initialize Client;
_handle = [] execVM "core\init.sqf";
waitUntil {scriptDone _handle};

//--- Mod Checker;
[] execVM "custom\fn_initMods.sqf";

//[] execVM "core\scripts\statusBar.sqf"; //--- Keep this around - it was pretty good for its time;

//--- StatusBar;
[] execVM "core\scripts\statusBarOld.sqf";

//--- Teargas Script;
[] execVM "core\scripts\tearGas.sqf";

//--- SeatBelts;
if (hasInterface) then {
    player addEventHandler ["GetOutMan", {
        CL_seatbelt = false;
        [] call CL_fnc_hudUpdate; //--- Enable if you are putting a hud option to display when your seatbelt is on;
    }];
};

if (hasInterface) then {
    player addEventHandler ["GetInMan", {
        CL_seatbelt = false;
        [] call CL_fnc_hudUpdate; //--- Enable if you are putting a hud option to display when your seatbelt is on;
    }];
};
