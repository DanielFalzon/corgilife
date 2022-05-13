#include "..\..\script_macros.hpp"
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private "_handle";
//Reset our weight and other stuff

CL_action_inUse = false;
CL_use_atm = true;
CL_hunger = 100;
CL_thirst = 100;
CL_carryWeight = 0;
CL_cmoola = 0; //Make sure we don't get our cash back.
CL_respawned = false;
player playMove "AmovPercMstpSnonWnonDnon";

CL_corpse setVariable ["Revive",nil,true];
CL_corpse setVariable ["name",nil,true];
CL_corpse setVariable ["Reviving",nil,true];
player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];

//Load gear for a 'new in'
switch (playerSide) do {
	case west: {
		_handle = [] spawn CL_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn CL_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn CL_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if (!isNull CL_corpse) then {
	private "_containers";
	CL_corpse setVariable ["Revive",true,true];
	_containers = nearestObjects[CL_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} forEach _containers; //Delete the containers.
	deleteVehicle CL_corpse;
};

//Destroy our camera...
CL_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy CL_deathCamera;

//Bad boy
if (CL_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	CL_is_arrested = false;
	[player,true] spawn CL_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if (!isNil "CL_copRecieve") then {

	if (CL_HC_isActive) then {
		[getPlayerUID player,player,CL_copRecieve,true] remoteExecCall ["HC_fnc_wantedBounty",HC_CL];
	} else {
		[getPlayerUID player,player,CL_copRecieve,true] remoteExecCall ["CL_fnc_wantedBounty",RSERV];
	};

	CL_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Most Wanted
if (CL_removeWanted) then {

	if (CL_HC_isActive) then {
		[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_CL];
	} else {
		[getPlayerUID player] remoteExecCall ["CL_fnc_wantedRemove",RSERV];
	};

};

[] call SOCK_fnc_updateRequest;
[] call CL_fnc_hudUpdate;
