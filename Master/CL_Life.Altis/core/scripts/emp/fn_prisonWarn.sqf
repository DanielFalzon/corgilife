/*
	File: fn_prisonWarn.sqf
	Author: Paul "Jerico" Smith
	
	Description:
	EMP Warning to Protect the Prison from Vehicles
*/
if (playerSide isEqualTo civilian) then {
	[] spawn {
		private _vehicle = vehicle player;

		if (isNull _vehicle) exitWith {
			diag_log "Vehicle is null";
		};

		if ((driver _vehicle) == player) then {
			if ((_vehicle isKindOf "Car") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Air")) then {
				hint "You are entering a Black Zone. Turn back now, or your vehicle will be disabled.";
				_vehicle say3D "empwarn";
				uiSleep 3.35;
				_vehicle say3D "empwarn";
				uiSleep 3.35;
				_vehicle say3D "empwarn";
				uiSleep 3.35;
			};
		};
	};
};
