#include "..\..\script_macros.hpp"
/*
	File: fn_selfbloodbag.sqf
	Author: [midgetgrimm]
	Second Author: Jesse Schultz

	Description:
	Self bloodbaging
*/
if (player != vehicle player) exitWith {
	hint "You must exit your vehicle to bloodbag.";
};
CL_interrupted = false;
if (CL_action_inUse) exitWith {};
if ((player getVariable ["Escorting",false]) || (player getVariable ["Transporting",false]) || (player getVariable ["restrained",false]) || (player getVariable ["ziptied",false])) exitWith {};
if ((damage player) < 0.01) exitWith {};
if (CL_inv_bloodbag < 1) exitWith {
	hint "You need a bloodbag to heal...";
};

//hint "You start your own blood transfusion";
player setVariable ["bloodBagged",true,true];
CL_action_inUse = true;

if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["CL_fnc_animSync",RCLIENT];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
};

uiSleep 6;

if (!alive player || CL_istazed) exitWith {
	CL_action_inUse = false;
	player setVariable ["bloodBagged",false,true];
};
if (CL_interrupted) exitWith {
	CL_interrupted = false;
	titleText["Action cancelled","PLAIN"];
	CL_action_inUse = false;
	player setVariable ["bloodBagged",false,true];
};
player setdamage 0;
[] call CL_fnc_hudUpdate;
hint "Transfusion was successful.";

player setVariable ["bloodBagged",false,true];
[false,"bloodbag",1] call CL_fnc_handleInv;
CL_action_inUse = false;
