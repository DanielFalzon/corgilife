/*
	File: fn_openEmpMenu.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	Opens the EMP operator menu
*/
if (!alive player || dialog) exitWith {};

createDialog "nanoEMPConsole";	
disableSerialization;

waitUntil {
	(!isNull (findDisplay 3494));
};
[] spawn CL_fnc_scanVehicles;
