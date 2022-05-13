#include "..\..\script_macros.hpp"
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Enables God mode for Admin
*/
if (FETCH_CONST(CL_adminlevel) < 4) exitWith {
	closeDialog 0;
	hint localize "STR_ANOTF_ErrorLevel";
};

closeDialog 0;

if (CL_god) then {
	CL_god = false;
//	titleText [localize "STR_ANOTF_godModeOff","PLAIN"];
//	titleFadeOut 2;
	hint {"This feature has been disabled."};
} else {
	CL_god = true;
//	titleText [localize "STR_ANOTF_godModeOn","PLAIN"];
//	titleFadeOut 2;
	hint {"This feature has been disabled."};
};
