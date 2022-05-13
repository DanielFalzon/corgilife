waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
	uiSleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do {
		uiSleep 1;
		if (isNull ((uiNamespace getVariable "osefStatusBar") displayCtrl 55554)) then {
			disableSerialization;
			_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["osefStatusBar","PLAIN"];
		};

		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar") displayCtrl 55554) ctrlSetText format ["FPS: %1 | Cops: %2 | Civs: %3 | Medics: %4 | CASH: %5 | BANK: %6 | CorgiLife.co.uk", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, [CL_cmoola] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText, _counter];
	}; 
};
