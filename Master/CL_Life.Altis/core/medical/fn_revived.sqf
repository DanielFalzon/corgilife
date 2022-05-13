#include "..\..\script_macros.hpp"
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private _medic = param [0,"Unknown Medic",[""]];
private _reviveCost = CL_Settings(getNumber,"revive_fee");

[CL_save_gear] spawn CL_fnc_loadDeadGear;
CL_corpse setVariable ["realname",nil,true]; //Should correct the double name sinking into the ground.
[CL_corpse] remoteExecCall ["CL_fnc_corpse",RANY];

private _dir = getDir CL_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[_reviveCost] call CL_fnc_numberText];

closeDialog 0;
CL_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy CL_deathCamera;

//Take fee for services.
if (CL_bmoola > _reviveCost) then {
	CL_bmoola = CL_bmoola - _reviveCost;
	[format ["%1 (%2) was revived by %3",profileName,getPlayerUID player,_medic],"MedicLog"] remoteExecCall ["A3Log",2];
} else {
	CL_bmoola = 0;
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL CL_corpse);
CL_corpse setVariable ["Revive",nil,true];
CL_corpse setVariable ["name",nil,true];
[CL_corpse] remoteExecCall ["CL_fnc_corpse",RANY];
deleteVehicle CL_corpse;

CL_action_inUse = false;
CL_is_alive = true;

player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
[] call CL_fnc_playerSkins;
[] call CL_fnc_hudUpdate;
[] call SOCK_fnc_updateRequest;
