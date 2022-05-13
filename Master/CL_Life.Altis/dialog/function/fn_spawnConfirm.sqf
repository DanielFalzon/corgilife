#include "..\..\script_macros.hpp"
/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the player where he selected.
*/
private ["_spCfg","_sp","_spawnPos"];
closeDialog 0;

private "_handle";
if (CL_firstSpawn) then {
	_handle = [] spawn CL_fnc_welcomeNotification;
};

if (CL_spawn_point isEqualTo []) then {
	private ["_sp","_spCfg"];
	_spCfg = [playerSide] call CL_fnc_spawnPointCfg;
	_sp = _spCfg select 0;

	if (playerSide isEqualTo civilian) then {
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	} else {
		player setPos (getMarkerPos (_sp select 0));
	};
} else {
	if (playerSide isEqualTo civilian) then {
		if (isNil {(call compile format["%1",CL_spawn_point select 0])}) then {
			if (["house",CL_spawn_point select 0] call BIS_fnc_inString) then {
				private ["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (CL_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call CL_fnc_getBuildingPositions;

				if (_bPos isEqualTo []) exitWith {
					player setPos (getMarkerPos (CL_spawn_point select 0));
				};

				{_bPos = _bPos - [(_house buildingPos _x)];} forEach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (CL_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", CL_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	} else {
		player setPos (getMarkerPos (CL_spawn_point select 0));
	};
};

if (CL_firstSpawn) then {
	_handle spawn {
		waitUntil{scriptDone _this};
		CL_firstSpawn = false;
		cutText ["","BLACK IN"];
	};
} else {
	cutText ["","BLACK IN"];
};

[] call CL_fnc_playerSkins;
[] call CL_fnc_hudSetup;
