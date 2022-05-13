#include "..\..\script_macros.hpp"
/*
	File: fn_seatBelt.sqf
	Author: repentz
	Description: It's a seatbelt!
*/
playSound "seatBelt"; //--Enable this to play a sound when you put your seatbelt on
if (!CL_seatbelt) then {
	CL_seatbelt = true;
} else {
	CL_seatbelt = false;
};

[] call CL_fnc_hudUpdate; //--Enable this if you are putting a hud option to display when your seatbelt is on.
