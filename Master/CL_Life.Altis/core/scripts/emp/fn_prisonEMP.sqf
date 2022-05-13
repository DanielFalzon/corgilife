/*
	File: fn_prisonEMP.sqf
	Author: Paul "Jerico" Smith
	
	Description:
	EMP to Protect the Prison from Vehicles
*/
if (playerSide isEqualTo civilian) then {
	[] spawn {
		private _vehicle = vehicle player;

		if (isNull _vehicle) exitWith {
			diag_log "Vehicle is null";
		};

		if ((driver _vehicle) == player) then {
			if (((_vehicle isKindOf "Car") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Air")) && (!(_vehicle getVariable ["nano_empd",false]))) then {
				_vehicle setVariable ["nano_empd",true,true];
				_vehicle say3D "empwarn";
				uiSleep 3.35;
				if (local _vehicle) then {
					_vehicle setHit [getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
					hint "Your vehicle has been disabled for entering a Black Zone.";
				};
			};
		};
	};
};
