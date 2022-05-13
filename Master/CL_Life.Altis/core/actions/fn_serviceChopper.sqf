#include "..\..\script_macros.hpp"
/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
if (CL_action_inUse) exitWith {hint localize "STR_NOTF_Action"};

private _serviceCost = CL_Settings(getNumber,"service_chopper");
private _search = nearestObjects[getPos air_sp, ["Air"],10];

if (count _search isEqualTo 0) exitWith {hint localize "STR_Service_Chopper_NoAir";};
if (CL_cmoola < _serviceCost) exitWith {hint localize "STR_Serive_Chopper_NotEnough";};

CL_action_inUse = true;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format[localize "STR_Service_Chopper_Servicing","waiting..."];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	uiSleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format[localize "STR_Service_Chopper_Servicing",round(_cP * 100)];
	if (_cP >= 1) exitWith {};
};

if (!alive (_search select 0) || (_search select 0) distance air_sp > 15) exitWith {CL_action_inUse = false; hint localize "STR_Service_Chopper_Missing"};

CL_cmoola = CL_cmoola - _serviceCost;
if (!local (_search select 0)) then {
	[(_search select 0),1] remoteExecCall ["CL_fnc_setFuel",(_search select 0)];
} else {
	(_search select 0) setFuel 1;
};

(_search select 0) setDamage 0;

"progressBar" cutText ["","PLAIN"];
titleText [localize "STR_Service_Chopper_Done","PLAIN"];
CL_action_inUse = false;
