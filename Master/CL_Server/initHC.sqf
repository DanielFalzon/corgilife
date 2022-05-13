/*
	Author: Nanou
	File: fn_initHC.sqf

	Description:
	Written for Life RPG.
*/

HC_UID = nil;

// JIP integration of an hc
"CL_HC_server_isReady" addPublicVariableEventHandler {
	if (_this select 1) then {
		HC_UID = getPlayerUID hc_1;
		HC_CL = owner hc_1;
		publicVariable "HC_CL";
		cleanupFSM setFSMVariable ["stopfsm",true];
		terminate cleanup;
		terminate aiSpawn;
		[true] call TON_fnc_transferOwnership;
		HC_CL publicVariableClient "animals";
		HC_CL publicVariableClient "serv_sv_use";
		CL_HC_isActive = true;
		publicVariable "CL_HC_isActive";
		diag_log "Headless client is connected and ready to work!";
	};
};

HC_DC = ["HC_Disconnected","onPlayerDisconnected",
	{
		if (!isNil "HC_UID" && {_uid == HC_UID}) then {
			CL_HC_isActive = false;
			publicVariable "CL_HC_isActive";
			HC_CL = false;
			publicVariable "HC_CL";
			cleanup = [] spawn TON_fnc_cleanup;
			cleanupFSM = [] execFSM "\CL_Server\FSM\cleanup.fsm";
			[false] call TON_fnc_transferOwnership;
//			aiSpawn = ["hunting_zone",30] spawn TON_fnc_huntingZone;
			diag_log "Headless client disconnected! Broadcasted the vars!";
			diag_log "Ready for receiving queries on the server machine.";
		};
	}
] call BIS_fnc_addStackedEventHandler;
