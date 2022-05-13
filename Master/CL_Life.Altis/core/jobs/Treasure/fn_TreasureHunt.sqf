/*
	Author: [ED] Luke
	Version: 1.0
	Description: More tasks, and allows player to search the wreck
	Edited: Dark
*/

private ["_distance","_pay","_txt","_search"];

if (playerSide == west) exitWith {hint "Cops cant use this."; };

_distance = player distance CL_explorer_wreck ;
_pay = round(_distance * (6 + random 2));

waitUntil {player distance CL_explorer_wreck <= 15 || !alive player};

// Check if player is still alive.
if (!alive player) exitWith {
	["TaskFailed", ["Treasure Hunting", "You failed the mission because you died."]] call BIS_fnc_showNotification;
	CL_explorer_task setTaskState "Failed";
	player removeSimpleTask CL_explorer_task;
	deleteVehicle CL_wrecks;
};

// Remove task.
["TaskSucceeded", ["Treasure Hunting", "You've found the wreck, search it for items!"]] call bis_fnc_showNotification;
CL_explorer_task setTaskState "Succeeded";
player removeSimpleTask CL_explorer_task;

if (player distance CL_explorer_wreck <= 15 ) then {
_search = player addAction ["Search Wreck", CL_fnc_SearchWreck];
};
waitUntil {CL_wreck_searched}; //set in fn_SearchWreck.sqf
player removeAction _search;

// Create new task.
[] spawn  {
	uiSleep 2;
	CL_explorer_task = player createSimpleTask ["treasure_hunting"];
	CL_explorer_task setSimpleTaskDescription ["Go to the Appraiser to get your item valued..", "Treasure Hunting",""];
	CL_explorer_task setTaskState "Assigned";
	player setCurrentTask CL_explorer_task;
	["TaskAssigned", ["Treasure Hunting", "Go to the Appraiser to get your item valued."]] call bis_fnc_showNotification;
};
