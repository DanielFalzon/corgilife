#include "..\..\script_macros.hpp"
/*
	File: fn_gutAnimal.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Guts the animal?
*/
params [
	["_animalCorpse",objNull,[objNull]]
];

private ["_displayName","_item"];

if (isNull _animalCorpse) exitWith {}; //Object passed is null?

CL_interrupted = false;
if (player distance _animalCorpse > 3.5) exitWith {}; //WTF need check with nearest objects I love Arma
CL_action_inUse = true;

switch (typeOf _animalCorpse) do {
	case "Hen_random_F": {_displayName = localize "STR_ANIM_chicken"; _item = "hen_raw";};
	case "Cock_random_F": {_displayName = localize "STR_ANIM_Rooster"; _item = "rooster_raw";};
	case "Goat_random_F": {_displayName = localize "STR_ANIM_Goat"; _item = "goat_raw";};
	case "Sheep_random_F": {_displayName = localize "STR_ANIM_Sheep"; _item = "sheep_raw";};
	case "Rabbit_F": {_displayName = localize "STR_ANIM_Rabbit"; _item = "rabbit_raw";};
	default {
		_displayName = "";
		_item = "";
	};
};

if (_displayName isEqualTo "") exitWith {
	CL_action_inUse = false;
};

private _upp = format [localize "STR_NOTF_Gutting",_displayName];
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["CL_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.15;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if (_cP >= 1) exitWith {};
	if (!alive player) exitWith {};
	if (isNull _animalCorpse) exitWith {};
	if (player != vehicle player) exitWith {};
	if (CL_interrupted) exitWith {};
};

CL_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (isNull _animalCorpse) exitWith {
	CL_action_inUse = false;
};

if (CL_interrupted) exitWith {
	CL_interrupted = false;
	titleText [localize "STR_NOTF_ActionCancel","PLAIN"];
	CL_action_inUse = false;
};

if (player != vehicle player) exitWith {
	titleText [localize "STR_NOTF_ActionInVehicle","PLAIN"];
};

if ([true,_item,1] call CL_fnc_handleInv) then {
	deleteVehicle _animalCorpse;
	titleText[format[(localize "STR_NOTF_Guttingfinish"),_displayName],"PLAIN"];
} else {
	titleText[(localize "STR_NOTF_InvFull"),"PLAIN"];
};
