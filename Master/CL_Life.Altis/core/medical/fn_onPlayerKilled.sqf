#include "..\..\script_macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];
disableSerialization;

if !((vehicle _unit) isEqualTo _unit) then {
	UnAssignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
if (playerSide isEqualTo west) then {
	_unit setVariable ["Revive",true,true];
	_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
	_unit setVariable ["restrained",false,true];
	_unit setVariable ["licensed",false,true];
	_unit setVariable ["Escorting",false,true];
	_unit setVariable ["transporting",false,true];
	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.
	_unit setVariable ["missingOrgan", false,true];
	_unit setVariable ["hasOrgan",false,true];
	_unit setVariable ["missingFlesh", false,true];
	_unit setVariable ["hasFlesh",false,true];
	_unit setVariable ["bloodBagged",false,true];
	_unit setVariable ["occupied",false,true];
} else {
	_unit setVariable ["Revive",true,true];
	_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
	_unit setVariable ["restrained",false,true];
	_unit setVariable ["Escorting",false,true];
	_unit setVariable ["transporting",false,true];
	_unit setVariable ["playerSurrender",false,true];
	_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.
	_unit setVariable ["missingOrgan", false,true];
	_unit setVariable ["hasOrgan",false,true];
	_unit setVariable ["missingFlesh", false,true];
	_unit setVariable ["hasFlesh",false,true];
	_unit setVariable ["bloodBagged",false,true];
	_unit setVariable ["occupied",false,true];
};

//Stop processing
if (CL_is_processing) then {
	"progressBar" cutText ["","PLAIN"];
	CL_is_processing = false;
	CL_action_inUse = false;
};

//Close dialogs
if (dialog) then {
	closeDialog 0;
};

//Setup our camera view
CL_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder true;
CL_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
CL_deathCamera camSetTarget _unit;
CL_deathCamera camSetRelPos [0,3.5,4.5];
CL_deathCamera camSetFOV .5;
CL_deathCamera camSetFocus [50,0];
CL_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn {
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);

		if (CL_Settings(getNumber,"respawn_timer") < 5) then {
			_maxTime = time + 5;
		} else {
			_maxTime = time + CL_Settings(getNumber,"respawn_timer");
		};
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 || isNull _this || CL_request_timer};

	if (CL_request_timer) then {
		_maxTime = time + (CL_Settings(getNumber,"respawn_timer") * 5);
		waitUntil {_Timer ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0 || isNull _this};
	};

	CL_request_timer = false;

	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

_unit spawn {
	private["_requestBtn","_requestTime"];
	disableSerialization;
	_requestBtn = ((findDisplay 7300) displayCtrl 7303);
	_requestBtn ctrlEnable false;
	_requestTime = time + 5;
	waitUntil {round(_requestTime - time) <= 0 || isNull _this};
	_requestBtn ctrlEnable true;
};

[] spawn CL_fnc_deathScreen;

if (CL_nlrtimer_running) then {
	CL_nlrtimer_stop = true;
	waitUntil {!CL_nlrtimer_running};
};

[] spawn CL_fnc_newLifeRule;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
	private "_unit";
	_unit = _this select 0;
	waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; CL_deathCamera camSetTarget _unit; CL_deathCamera camSetRelPos [0,3.5,4.5]; CL_deathCamera camCommit 0;};
};

//Make the killer wanted
if (!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if (vehicle _killer isKindOf "LandVehicle") then {

		if (CL_HC_isActive) then {
			[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
		} else {
			[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["CL_fnc_wantedAdd",RSERV];
		};
		[format ["%1 (%2) was ran over by %3 (%4).",profileName,getPlayerUID player,_killer getVariable ["realname",name _killer],getPlayerUID _killer],"CivilianLog"] remoteExecCall ["A3Log",2];
		[format ["%1 (%2) was ran over by %3 (%4).",profileName,getPlayerUID player,_killer getVariable ["realname",name _killer],getPlayerUID _killer],"VehicleLog"] remoteExecCall ["A3Log",2];
		//Get rid of this if you don't want automatic vehicle license removal.
		if (!local _killer) then {
			[2] remoteExecCall ["CL_fnc_removeLicenses",_killer];
		};
	} else {

		if (CL_HC_isActive) then {
			[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
		} else {
			[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["CL_fnc_wantedAdd",RSERV];
		};
		[format ["%1 (%2) was killed by %3 (%4).",profileName,getPlayerUID player,_killer getVariable ["realname",name _killer],getPlayerUID _killer],"CivilianLog"] remoteExecCall ["A3Log",2];
		[format ["%1 (%2) was killed by %3 (%4).",profileName,getPlayerUID player,_killer getVariable ["realname",name _killer],getPlayerUID _killer],"VehicleLog"] remoteExecCall ["A3Log",2];
		if (!local _killer) then {
			[3] remoteExecCall ["CL_fnc_removeLicenses",_killer];
		};
	};
};

CL_save_gear = [player] call CL_fnc_fetchDeadGear;

if (CL_Settings(getNumber,"drop_weapons_onDeath") isEqualTo 0) then {
    _unit removeWeapon (primaryWeapon _unit);
    _unit removeWeapon (handgunWeapon _unit);
    _unit removeWeapon (secondaryWeapon _unit);
};

//Killed by cop stuff...
if (side _killer isEqualTo west && playerSide != west) then {
	CL_copRecieve = _killer;
	//Did I rob the federal reserve?
	if (!CL_use_atm && {CL_cmoola > 0}) then {
		[format[localize "STR_Cop_RobberDead",[CL_cmoola] call CL_fnc_numberText]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
		CL_cmoola = 0;
	};
};

if (!isNull _killer && {_killer != _unit}) then {
	CL_removeWanted = true;
};

[_unit] call CL_fnc_dropItems;

CL_action_inUse = false;
CL_hunger = 100;
CL_thirst = 100;
CL_carryWeight = 0;
CL_cmoola = 0;
CL_is_alive = false;

[] call CL_fnc_hudUpdate;
//[player,CL_Settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
if (playerSide isEqualTo civilian) then {
    [4] call SOCK_fnc_updatePartial;
};
