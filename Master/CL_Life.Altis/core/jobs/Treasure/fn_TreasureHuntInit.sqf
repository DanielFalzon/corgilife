/*
	Author: [ED] Luke
	Version: 1.0
	Description: Spawns wrecks and gives tasks
	Edited: Dark
*/
private ["_wreck","_randomLocation","_wreckVeh","_txt","_pos"];

if (playerSide == west) exitWith { hint "Cops cant do this job."; };
if (!isNull CL_explorer_wreck) exitWith { hint format ["You were already assigned a task to search around %1.", mapGridPosition CL_explorer_wreck]; };

// Define wrecks.
CL_explorer_wrecks = [
	["Land_UWreck_FishingBoat_F", "Fishing Boat"],
	["Land_UWreck_MV22_F", "MV-22"],
	["Land_Wreck_Traw2_F", "Ship"],
	["Land_Wreck_Traw_F", "Ship"]
];
// Define logics (wreck locations).
CL_explorer_logics = [wreck_logic_A,wreck_logic_B,wreck_logic_C,wreck_logic_D,wreck_logic_E,wreck_logic_F];

// Create wreck.
_wreck = CL_explorer_wrecks select (round(random((count CL_explorer_wrecks) - 1)));
_randomLocation = getPos (CL_explorer_logics select (round(random((count CL_explorer_logics) - 1))));
//_wreckVeh = (_wreck select 0) createVehicle [0,0,0];
_wreckVeh = createVehicle [ (_wreck select 0), [0,0,0], [] , 0, "NONE"];
CL_explorer_wreck = _wreckVeh;
CL_explorer_wreck setDir (random 360);
// Set position of wreck.
_pos = [((_randomLocation select 0) + (random 1000 - random 1000)), ((_randomLocation select 1) + (random 1000 - random 1000))];
CL_explorer_wreck setPosASL [_pos select 0, _pos select 1, getTerrainHeightASL _pos];
hintC format ["A wrecked %1 has been seen around grid co-ordinates %2. Find this wreckage and search it for any valuable items.", _wreck select 1, mapGridPosition CL_explorer_wreck];
_txt = format ["The wrecked %1 is around map co-ordinates %2. Find this wreck and search it for any valuables.", _wreck select 1, mapGridPosition CL_explorer_wreck];

// Create task.
CL_explorer_task = player createSimpleTask ["treasure_hunting"];
CL_explorer_task setSimpleTaskDescription [_txt, "Treasure Hunting", ""];
CL_explorer_task setTaskState "Assigned";
player setCurrentTask CL_explorer_task;
CL_wreck_searched = false;
uiSleep 1;

["TaskAssigned", ["Treasure Hunting", format["Search for the wrecked %1.", _wreck select 1]]] call bis_fnc_showNotification;
[] spawn CL_fnc_TreasureHunt;
