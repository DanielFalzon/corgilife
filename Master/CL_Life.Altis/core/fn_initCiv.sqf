#include "..\script_macros.hpp"
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
civ_spawn_1 = nearestObjects[getMarkerPos "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];

waitUntil {!(isNull (findDisplay 46))};
if (CL_is_alive && !CL_is_arrested) then {
	/* Spawn at our last position */
	player setVehiclePosition [CL_civ_position, [], 0, "CAN_COLLIDE"];
} else {
	if (!CL_is_alive && !CL_is_arrested) then {
		if (CL_Settings(getNumber,"save_civilian_positionStrict") isEqualTo 1) then {
			_handle = [] spawn CL_fnc_civLoadout;
			waitUntil {scriptDone _handle};
			CL_cmoola = 0;
			[0] call SOCK_fnc_updatePartial;
		};
		[] spawn CL_fnc_welcome;
		waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
		waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.
		[] call CL_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	} else {
		if (CL_is_arrested) then {
			CL_is_arrested = false;
			[player,true] spawn CL_fnc_jail;
		};
	};
};

CL_is_alive = true;
