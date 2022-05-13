#include "..\..\script_macros.hpp"
/*
	File: fn_copRestrain.sqf
	Author: Dark
	Description:
	Restrains the cop to give the higher ranking cop the ability to apply licenses.
	Note: licensed is the variable which is set when the cop is restrained.
*/
params [
	["_cop",objNull,[objNull]]
];

private _player = player;
private _vehicle = vehicle player;

if (isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn {
	private "_time";
	for "_i" from 0 to 1 step 0 do {
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};

		if (!(player getVariable ["licensed",false])) exitWith {};
		if (!([west,getPos player,30] call CL_fnc_nearUnits) && (player getVariable ["licensed",false]) && isNull objectParent player) exitWith {
			player setVariable ["licensed",false,true];
			detach player;
			titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
		};
	};
};

titleText [format [localize "STR_Cop_Restrained",_cop getVariable ["realname",name _cop]],"PLAIN"];

CL_disable_getIn = true;
CL_disable_getOut = false;

while {player getVariable  "licensed"} do {
	if (isNull objectParent player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "licensed") || vehicle player != _state};

	if (!alive player) exitWith {
		player setVariable ["licensed",false,true];
		detach _player;
	};

	if (vehicle player != player && CL_disable_getIn) then {
		player action ["eject",vehicle player];
	};

	if ((vehicle player != player) && (vehicle player != _vehicle)) then {
		_vehicle = vehicle player;
	};

	if (isNull objectParent player && CL_disable_getOut) then {
		player moveInCargo _vehicle;
	};

	if ((vehicle player != player) && CL_disable_getOut && (driver (vehicle player) isEqualTo player)) then {
		player action ["eject",vehicle player];
		player moveInCargo _vehicle;
	};

	if (vehicle player != player && CL_disable_getOut) then {
		_turrets = [[-1]] + allTurrets _vehicle;
		{
			if (_vehicle turretUnit [_x select 0] isEqualTo player) then {
				player action ["eject",vehicle player];
				uiSleep 1;
				player moveInCargo _vehicle;
			};
		} forEach _turrets;
	};
};

//disableUserInput false;

if (alive player) then {
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	detach player;
};
