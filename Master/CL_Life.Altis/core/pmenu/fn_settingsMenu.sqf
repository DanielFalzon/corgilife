#include "..\..\script_macros.hpp"
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine

	Description:
	Setup the settings menu.
*/
if (isNull (findDisplay 2900)) then {
	if (!createDialog "SettingsMenu") exitWith {hint localize "STR_NOTF_menuWillNotOpen";};
};

disableSerialization;

ctrlSetText[2902, format["%1", CL_Settings_viewDistanceFoot]];
ctrlSetText[2912, format["%1", CL_Settings_viewDistanceCar]];
ctrlSetText[2922, format["%1", CL_Settings_viewDistanceAir]];

/* Set up the sliders */
{
	slidersetRange [(_x select 0),100,8000];
	CONTROL(2900,(_x select 0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[2901,CL_Settings_viewDistanceFoot],[2911,CL_Settings_viewDistanceCar],[2921,CL_Settings_viewDistanceAir]];


if (isNil "CL_Settings_revealObjects") then {
	CL_Settings_enableNewsBroadcast = profileNamespace setVariable ["CL_enableNewsBroadcast",true];
	CL_Settings_enableSidechannel = profileNamespace setVariable ["CL_enableSidechannel",true];
	CL_Settings_tagson = profileNamespace setVariable ["CL_Settings_tagson",true];
	CL_Settings_revealObjects = profileNamespace setVariable ["CL_Settings_revealObjects",true];
};

CONTROL(2900,2971) cbSetChecked CL_Settings_enableSidechannel;
CONTROL(2900,2973) cbSetChecked CL_Settings_enableNewsBroadcast;
CONTROL(2900,2970) cbSetChecked CL_Settings_tagson;
CONTROL(2900,2972) cbSetChecked CL_Settings_revealObjects;
