#include "..\..\script_macros.hpp"
/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private ["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private ["_abortButton","_thread","_syncManager"];
		disableSerialization;

	_syncManager = {
		disableSerialization;
		private ["_abortButton","_timeStamp","_abortTime"];
		_abortButton = CONTROL(49,104);
		_timeStamp = time + 10;

		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};

	_abortButton = CONTROL(49,104);

	if (_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread || isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if (playerSide isEqualTo west) exitWith {true};
	if ((player getVariable ["restrained",false]) || (player getVariable ["Escorting",false]) || (player getVariable ["transporting",false]) || (CL_is_arrested) || (CL_istazed) || (CL_isdowned) || (CL_isknocked)) then {false} else {true};
};

for "_i" from 0 to 1 step 0 do {
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = CONTROL(49,104);
//	_abortButton buttonSetAction "[] call SOCK_fnc_updateRequest; [player] remoteExec [""TON_fnc_cleanupRequest"",2];";
	_abortButton ctrlSetEventHandler [
	  "ButtonClick",
	  "[] spawn CL_fnc_goodbye; (findDisplay 49) closeDisplay 2; true"
	];

	//Custom Button Info
	_continueButton = CONTROL(49,2) ctrlSetText "CorgiLife.co.uk";
	_saveButton = CONTROL(49,103) ctrlSetText "By Gamers, For Gamers";
	_profileName = CONTROL(49,523) ctrlSetText profileName;
	_playerUID = CONTROL(49,109) ctrlSetText getPlayerUID player;

	//Standard Buttons
	_respawnButton = CONTROL(49,1010);
	_fieldManual = CONTROL(49,122);

	//Custom Bottom Info
	_inInfo = CONTROL(49,120) ctrlSetText "Website: CorgiLife.co.uk / TeamSpeak: ts.CorgiLife.co.uk";

	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_respawnButton ctrlShow false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	_fieldManual ctrlShow false;

	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;

	if (_usebleCtrl) then {
		_respawnButton ctrlEnable false; //Enable the button.
	};

	waitUntil {isNull (findDisplay 49) || {!alive player}};
	if (!isNull (findDisplay 49) && {!alive player}) then {
		(findDisplay 49) closeDisplay 2;
	};
};
