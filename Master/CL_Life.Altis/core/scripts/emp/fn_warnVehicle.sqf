/*
	File: fn_warnVehicles.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	Warns the vehicle
*/
disableSerialization;

if (!isNull (findDisplay 3494)) then {
	if (nn_empInUse) exitWith {
		hint "EMP warning issued.";
	};
	nn_empInUse = true;
	private _index = lbCurSel (2902);
	private _vehicle = nn_last_vehicles select _index;
	if (isNull _vehicle) exitWith {};
	[_vehicle] remoteExec ["CL_fnc_vehicleWarned",crew _vehicle];
	uiSleep 10;
	nn_empInUse = false;
};
