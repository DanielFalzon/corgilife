#include "..\..\script_macros.hpp"
/*
	File: fn_earPlugs.sqf
	Author:
	Description: Earplugs.. to block all of those annoying noises!
*/
CL_fadeSound = !CL_fadeSound;

if (CL_fadeSound) then
{
	1 fadeSound 0.1;
	call CL_fnc_hudUpdate;
} else {
	1 fadeSound 1;
	call CL_fnc_hudUpdate;
};
