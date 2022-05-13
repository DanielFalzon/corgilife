#include "script_macros.hpp"
/*
	File: init.sqf
	Author: Bryan "Tonic" Boardwine

	Edit: Nanou for HeadlessClient optimization.
	Please read support for more informations.

	Description:
	Initialize the server and required systems.
*/
private["_dome","_wepDome","_copDome","_rsb","_timeStamp"];
DB_Async_Active = false;
DB_Async_ExtraLock = false;
CL_Server_isReady = false;
CL_Server_extDB_notLoaded = "";
serv_sv_use = [];
publicVariable "CL_Server_isReady";

CL_save_civilian_position = if (CL_Settings(getNumber,"save_civilian_position") isEqualTo 0) then {false} else {true};
fn_whoDoneIt = compile preprocessFileLineNumbers "\CL_Server\Functions\Systems\fn_whoDoneIt.sqf";

/*
	Prepare the headless client.
*/
CL_HC_isActive = false;
publicVariable "CL_HC_isActive";
HC_CL = false;
publicVariable "HC_CL";

if (EXTDB_SETTING(getNumber,"HeadlessSupport") isEqualTo 1) then {
	[] execVM "\CL_Server\initHC.sqf";
};

/*
	Prepare extDB before starting the initialization process
	for the server.
*/

if (isNil {uiNamespace getVariable "CL_sql_id"}) then {
	CL_sql_id = round(random(9999));
	CONSTVAR(CL_sql_id);
	uiNamespace setVariable ["CL_sql_id",CL_sql_id];
		try {
		_result = EXTDB format["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
		if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
		_result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(CL_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
		if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
	} catch {
		diag_log _exception;
		CL_Server_extDB_notLoaded = [true, _exception];
	};
	publicVariable "CL_Server_extDB_notLoaded";
	if (CL_Server_extDB_notLoaded isEqualType []) exitWith {};
	EXTDB "9:LOCK";
	diag_log "extDB3: Connected to Database";
} else {
	CL_sql_id = uiNamespace getVariable "CL_sql_id";
	CONSTVAR(CL_sql_id);
	diag_log "extDB3: Still Connected to Database";
};

if (CL_Server_extDB_notLoaded isEqualType []) exitWith {};

/* Run stored procedures for SQL side cleanup */
["CALL resetCLVehicles",1] call DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Life Server Init ---------------------------------";
diag_log "----------------------------------------- Corgi Life -----------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

if (CL_Settings(getNumber,"save_civilian_position_restart") isEqualTo 1) then {
	[] spawn {
		_query = "UPDATE players SET civ_alive = '0' WHERE civ_alive = '1'";
		[_query,1] call DB_fnc_asyncCall;
		diag_log "Civ Positioning: Established";
	};
};

{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
	detach _var;
} forEach ["hospital_2","hospital_3"];
diag_log "Hospitals: Spawned In";

{
	if (!isPlayer _x) then {
		_npc = _x;
		{
			if (_x != "") then {
				_npc removeWeapon _x;
			};
		} forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} forEach allUnits;

[8,true,12] execFSM "\CL_Server\FSM\timeModule.fsm";

CL_adminlevel = 0;
CL_mediclevel = 0;
CL_coplevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/*
// Setup radio channels for west/independent/civilian
CL_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
CL_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
CL_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
*/

/* Set the amount of gold bars in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;
diag_log "Fed: Setup";

[] spawn TON_fnc_capZones;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\CL_Server\functions.sqf";

/* Set OwnerID players for Headless Client */
TON_fnc_requestClientID =
{
	(_this select 1) setVariable ["in_clientID", owner (_this select 1), true];
};
"CL_fnc_RequestClientId" addPublicVariableEventHandler TON_fnc_requestClientID;

/* Miscellaneous mission-required stuff */
CL_wanted_list = [];

cleanupFSM = [] execFSM "\CL_Server\FSM\cleanup.fsm";

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		uiSleep (10 * 60);
		{
			_x setVariable ["sellers",[],true];
		} forEach [Dealer_1,Dealer_2,Dealer_3,Dealer_4,Dealer_5];
	};
};
diag_log "Drug Dealers: Initialized";

[] spawn TON_fnc_initHouses;
cleanup = [] spawn TON_fnc_cleanup;
diag_log "Housing: Initialized";

/* Setup the federal reserve building(s) */
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_wepDome = nearestObject [[20894.2,19226.8,0],"Land_Dome_Big_F"];
//private _copDome = nearestObject [[20832.842,7266.885,0],"Land_Dome_Small_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable [format ["bis_disabled_Door_%1",_i],1,true]; _dome animateSource [format ["Door_%1_source",_i],0];};
for "_i" from 1 to 3 do {_wepDome setVariable [format ["bis_disabled_Door_%1",_i],1,true]; _wepDome animateSource [format ["Door_%1_source",_i],0];};
//_copDome setVariable ["bis_disabled_Door_1",1,true]; _copDome setVariable ["bis_disabled_Door_2",1,true]; _copDome animate ["door_2A_move",0]; _copDome animate ["door_2B_move",0];
_dome setVariable ["locked",true,true];
_wepDome setVariable ["locked",true,true];
_rsb setVariable ["locked",true,true];
_rsb setVariable ["bis_disabled_Door_1",1,true];
_dome allowDamage false;
_wepDome allowDamage false;
_rsb allowDamage false;
//_copDome allowDamage false;
diag_log "Domes: Initialized";

// Airdrop
[] execVM "\CL_Server\Functions\airdrop\config.sqf";
//[] execVM "\CL_Server\Functions\airdrop\fn_generateAirdropAuto.sqf";
diag_log "Airdrop: Initialized";

all_ah_items = [];
publicVariable "all_ah_items";
[] spawn TON_fnc_vAH_init;
[] spawn {
	for "_i" from 0 to 1 step 0 do {
	uiSleep (20 * 60);
	if (count all_ah_items > 0) then {
			[] spawn TON_fnc_vAH_update;
		};
	};
};
diag_log "AH: Initialized";

/* Tell clients that the server is ready and is accepting queries */
CL_Server_isReady = true;
publicVariable "CL_Server_isReady";

/* Initialize hunting zone(s) */
//aiSpawn = ["hunting_zone",30] spawn TON_fnc_huntingZone;

// We create the attachment point to be used for objects to attachTo load virtually in vehicles.
CL_attachment_point = "Land_Hospital_side2_F" createVehicle [0,0,0];
CL_attachment_point setPosASL [0,0,0];
CL_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];

// Sharing the point of attachment with all players.
publicVariable "CL_attachment_point";
diag_log "Hospital: Landing Zone Attached";

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format["			   End of Corgi Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";