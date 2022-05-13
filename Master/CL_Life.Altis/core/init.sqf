#include "..\script_macros.hpp"
/*
	File: init.sqf
	Author:

	Description:
	Master client initialization file
*/
private ["_handle","_timeStamp","_server_isReady","_extDB_notLoaded"];

CL_firstSpawn = true;
CL_session_completed = false;
[] call mav_introcam_fnc_startCinematicCam;
[0, "Setting up client, please wait"] call mav_introcam_fnc_updateCinematicStatus;
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Life Client Init ----------------------------------";
diag_log "---------------------------------------- Corgi Life ----------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile preprocessFileLineNumbers "core\clientValidator.sqf";

//Setup initial client core functions
diag_log "::CL Client:: Initialization Variables";
[] call compile preprocessFileLineNumbers "core\configuration.sqf";

//--- Costum GUI menu colours
profileNamespace setVariable ['GUI_BCG_RGB_R', 0.941];
profileNamespace setVariable ['GUI_BCG_RGB_G', 0.624];
profileNamespace setVariable ['GUI_BCG_RGB_B', 0.18];
profileNamespace setVariable ['GUI_BCG_RGB_A', 1];
saveProfileNamespace;

//--- Disable some features of the ArmA engine
enableRadio false; //--- Radio messages
enableSentences false; //--- Radio messages
enableEnvironment true; //--- Environment
disableRemoteSensors true; //--- Raycasting

//--- Disable unit damage
//player allowDamage false;

//--- Setup event handlers
diag_log "::CL Client:: Variables initialized";
diag_log "::CL Client:: Setting up Eventhandlers";
[] call CL_fnc_setupEVH;
diag_log "::CL Client:: Eventhandlers completed";

diag_log "::CL Client:: Setting up user actions";
[] call CL_fnc_setupActions;
diag_log "::CL Client:: User actions completed";

diag_log "::CL Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil "TON_fnc_clientGangLeader")};

diag_log "::CL Client:: Received server functions.";
[0, "Waiting for server to be ready"] call mav_introcam_fnc_updateCinematicStatus;
0 cutFadeOut 99999999;

diag_log "::CL Client:: Waiting for the server to be ready..";
waitUntil{!isNil "CL_HC_isActive"};
if (CL_HC_isActive) then {
    waitUntil{!isNil "CL_HC_server_isReady" && !isNil "CL_hc_server_extDB_notLoaded"};
    _server_isReady = CL_HC_server_isReady;
    _extDB_notLoaded = CL_hc_server_extDB_notLoaded;
} else {
    waitUntil{!isNil "CL_server_isReady" && !isNil "CL_server_extDB_notLoaded"};
    _server_isReady = CL_server_isReady;
    _extDB_notLoaded = CL_server_extDB_notLoaded;
};

waitUntil{_server_isReady};
if (_extDB_notLoaded isEqualType []) exitWith {
    diag_log (_extDB_notLoaded select 1);
    999999 cutText [localize "STR_Init_ExtdbFail","BLACK FADED"];
    999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {CL_session_completed};
[1, "PRESS SPACE TO CONTINUE"] call mav_introcam_fnc_updateCinematicStatus;
waitUntil {mav_introcam_continue};
0 cutFadeOut 9999999;

//diag_log "::CL Client:: Group Base Execution";
[] spawn CL_fnc_escInterupt;

//--- Set paycheck amount for new players
switch (playerSide) do {
    case west: {
        CL_paycheck = CL_Settings(getNumber,"paycheck_cop");
    };
    case civilian: {
        CL_paycheck = CL_Settings(getNumber,"paycheck_civ");
    };
    case independent: {
        CL_paycheck = CL_Settings(getNumber,"paycheck_med");
    };
};

//--- Initialize each faction
switch (playerSide) do {
	case west: {
		_handle = [] spawn CL_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	case civilian: {
		_handle = [] spawn CL_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	case independent: {
		_handle = [] spawn CL_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

//--- Set all variables to false
player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
player setVariable ["playerSurrender",false,true];
player setVariable ["missingOrgan", false,true];
player setVariable ["hasOrgan",false,true];
player setVariable ["missingFlesh", false,true];
player setVariable ["hasFlesh",false,true];
player setVariable ["bloodBagged",false,true];
player setVariable ["occupied",false,true];

//--- Execute FSMs
diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";

//--- Direct comms speaking var
[] spawn CL_fnc_speaking;

diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};

diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CL_fnc_keyHandler"];

//[player,CL_Settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];
0 cutText ["","BLACK IN"];
[] call CL_fnc_hudSetup;

//--- Set up frame-by-frame handlers
CL_ID_PlayerTags = ["CL_PlayerTags","onEachFrame","CL_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
CL_ID_RevealObjects = ["CL_RevealObjects","onEachFrame","CL_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

//--- Set variables related to player information
player setVariable ["steam64ID",getPlayerUID player];
player setVariable ["realname",profileName,true];

CL_fnc_moveIn = compileFinal
"
	CL_disable_getIn = false;
	player moveInCargo (_this select 0);
	CL_disable_getOut = true;
";

CL_fnc_RequestClientId = player;
publicVariableServer "CL_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

//--- Spawn survival script
[] spawn CL_fnc_survival;

//--- Initialize perks & custom paycheck
waitUntil {(missionNamespace getVariable ["CL_perksInitialized", true])}; CL_paycheck = CL_paycheck * (missionNamespace getVariable ["mav_ttm_var_paycheckMultiplier", 1]);

//--- Set camera to 3rd person
player switchCamera "EXTERNAL";

//--- Switch to direct channel
setCurrentChannel 5;

//--- Disable unit conversations
player disableConversation true;
player setVariable ["BIS_noCoreConversations", true];
player setSpeaker "NoVoice";

//--- Enable sound and show scene
5 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;

//--- Show chat
showChat true;

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil{(!isNull (findDisplay 49)) && (!isNull (findDisplay 602))}; // Check if Inventory and ESC dialogs are open
		(findDisplay 49) closeDisplay 2; // Close ESC dialog
		(findDisplay 602) closeDisplay 2; // Close Inventory dialog
	};
};

//--- Make paycheck static
CONSTVAR(CL_paycheck);

//--- Fatigue Toggle
if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 0) then {player enableFatigue false;};

//--- Execute pump service
if (CL_Settings(getNumber,"pump_service") isEqualTo 1) then{
	[] execVM "core\fn_setupStationService.sqf";
};

//--- Update wanted list
if (CL_HC_isActive) then {
	[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["HC_fnc_wantedProfUpdate",HC_CL];
} else {
	[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["CL_fnc_wantedProfUpdate",RSERV];
};

//--- Virtual Auction House
waitUntil {vAH_loaded};
private _total = 0;
private _toDel = [];
private _uid = getPlayerUID player;
{if ((_x select 5 isEqualTo _uid) && (_x select 7 isEqualTo 2)) then {_total = _total + (_x select 4);_toDel pushBack (_x select 0)};}forEach all_ah_items;

 if (_total > 0) then {
	{[1,_x] remoteExec ["TON_fnc_vAH_update",2];}forEach _toDel;
	[0,format["While you were offline you sold $%1 worth of items at Fat Tony's Shop",[_total]call CL_fnc_numberText]] remoteExec ["CL_fnc_broadcast",player];
	CL_bmoola = CL_bmoola + _total;
	[1] call SOCK_fnc_updatePartial;
};

//--- Disable channels;
{
	_x params [["_chan",-1,[0]], ["_noText","false",[""]], ["_noVoice","false",[""]]];

	_noText = [false,true] select ((["false","true"] find toLower _noText) max 0);
	_noVoice = [false,true] select ((["false","true"] find toLower _noVoice) max 0);

	_chan enableChannel [!_noText, !_noVoice];

} forEach getArray (missionConfigFile >> "disableChannels");

/*
//--- AutoSave;
[] spawn CL_fnc_autoSaveInv;
*/

/*
//--- TFR Checks;
if (isNil "TFAR_fnc_isTeamSpeakPluginEnabled") exitwith {
	999999 cutText ["Task Force Radio is not running on your computer. Please re-sync and retry","BLACK FADED"];
	999999 cutFadeOut 99999999;
	if (player getvariable "taskfr") then {
		player setvariable ["taskfr",false,true];
	};
};

_TFenabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;

if (!(_TFenabled)) then {

	while {!([] call TFAR_fnc_isTeamSpeakPluginEnabled)} do {
		titleText ["Please enable Task Force Radio in your TS3 Plugins! || TS3 -> Tools -> Options -> Addons", "BLACK"];
		uiSleep 2;
		if (player getvariable "taskfr") then {
		player setvariable ["taskfr",false,true];
		};
	};
};

CL_TFEnabled = true;
CL_onTsServer = "[UK/EU] Corgi Life - TeamSpeak" == (call TFAR_fnc_getTeamSpeakServerName);
CL_onChannel = "TaskForceRadio" == (call TFAR_fnc_getTeamSpeakChannelName);
titleText ["Task Force Radio loaded succesfully","BLACK IN"];

[] spawn {
	while {true} do {
				_isadmin = false;
				if (!(isNil "CL_adminlevel")) then {
					_adminlvl = CL_adminlevel call BIS_fnc_parseNumber;

					if (_adminlvl > 0) then {
						_isadmin = true;
					};
				};

					_TFenabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;
					if ((!(_TFenabled)) && (CL_TFEnabled)) then {
					if (!(_isadmin)) then {
						titleText ["Please enable TFR in your TS3 Plugins! || TS3 -> Tools -> Options -> Addons", "BLACK"];
						CL_TFEnabled = false;
					};
							if (player getvariable "taskfr") then {
								player setvariable ["taskfr",false,true];
							};
					};

					_onTsServer = "[UK/EU] Corgi Life - TeamSpeak" == (call TFAR_fnc_getTeamSpeakServerName);
					if (!(_onTsServer)) then {
					if (!(_isadmin)) then {
						titleText ["Please join the TS3 Server! Address: ts.CorgiLife.co.uk", "BLACK"];
						CL_onTsServer = false;
					};
						if (player getvariable "taskfr") then {
							player setvariable ["taskfr",false,true];
						};
					} else {
						if (!(CL_onTsServer)) then {
						if (!(_isadmin)) then {
							titleText ["TS3 server check completed. Welcome!","BLACK IN"];
							CL_onTsServer = true;
							};
						if (!(player getvariable "taskfr")) then {
							player setvariable ["taskfr",true,true];
						};
						};
					};

					_onChannel = "TaskForceRadio" == (call TFAR_fnc_getTeamSpeakChannelName);
					if (!(_onChannel)) then {
					if (!(_isadmin)) then {
						titleText ["Please reload the plugin to join the TFR channel || TS3 -> Tools -> Options -> Addons -> Reload All", "BLACK"];
						CL_onChannel = false;
					};
						if (player getvariable "taskfr") then {
							player setvariable ["taskfr",false,true];
						};
					} else {
						if (!(CL_onChannel)) then {
							titleText ["TS3 channel check completed. Welcome!","BLACK IN"];
							CL_onChannel = true;
						if (!(player getvariable "taskfr")) then {
							player setvariable ["taskfr",true,true];
						};
						};
					};

					if ((_TFenabled) && (!(CL_TFEnabled))) then {
						titleText ["TFR plugin enabled, welcome back!","BLACK IN"];
						CL_TFEnabled = true;
						if (!(player getvariable "taskfr")) then {
							player setvariable ["taskfr",true,true];
						};
					};
				uiSleep 2;	
			};
};
*/
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["				End of Corgi Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
