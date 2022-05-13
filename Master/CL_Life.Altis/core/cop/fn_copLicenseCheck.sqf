#include "..\..\script_macros.hpp"
/*
	File: fn_copLicenseCheck.sqf
	Author: Dark
	Description:
	Returns the licenses to the higher ranking cop.
*/
params [
	["_cop",objNull,[objNull]]
];

if (isNull _cop) exitWith {}; //Bad entry

private _licenses = "";

//Config entries for licenses that are civilian
private _licensesConfigs = "getText(_x >> 'side') isEqualTo 'cop'" configClasses (missionConfigFile >> "Licenses");

{
	if (LICENSE_VALUE(configName _x,"cop")) then {
		_licenses = _licenses + localize getText(_x >> "displayName") + "<br/>";
	};
} forEach _licensesConfigs;

if (_licenses isEqualTo "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[profileName,_licenses] remoteExecCall ["CL_fnc_copLicensesRead",_cop];
