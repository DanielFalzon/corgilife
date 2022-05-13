#include "..\..\script_macros.hpp"
/*
	File: fn_s_onChar.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When a character is entered it is validated and changes the
	correct slider it is associated with. I probably over-complicated
	this more then I had to but onChar behaves weird.

	PARAMS:
		0: CONTROL
		1: SCALAR (INT)
		2: STRING (Case option)
*/
private["_control","_code","_slider","_value","_varName","_onKeyUp"];
_control = _this select 0;
_code = _this select 1;
_slider = _this select 2;
_onKeyUp = _this select 3;

disableSerialization;
if (isNull _control) exitWith {};

if (_onKeyUp) then {
	_value = parseNumber(ctrlText _control);
	_varName = switch (_slider) do {
		case "ground": {"CL_Settings_viewDistanceFoot";};
		case "vehicle": {"CL_Settings_viewDistanceCar"};
		case "ship": {"CL_Settings_viewDistanceCar"};
		case "air": {"CL_Settings_viewDistanceAir"};
		default {"CL_Settings_viewDistanceFoot"};
	};

	missionNamespace setVariable [_varName,_value];
	[] call CL_fnc_settingsMenu;
	[] call CL_fnc_updateViewDistance;
};