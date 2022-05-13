/*
	File: fn_empVehicles.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	EMPs the vehicle
*/
disableSerialization;

if (!isNull (findDisplay 3494)) then {
	if (nn_empInUse) exitWith {
		hint "The EMP Weapon cannot be used again until the battery is recharged.";
	};
	nn_empInUse = true;
	private _index = lbCurSel (2902);
	private _vehicle = nn_last_vehicles select _index;
	if (isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[_vehicle] remoteExec ["CL_fnc_vehicleEmpd",crew _vehicle];
	uiSleep (3 * 60);
	nn_empInUse = false;
};
