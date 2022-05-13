#include "\CL_Server\script_macros.hpp"
/*
	File: fn_chopShopClaim.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks whether or not the vehicle is persistent or temp and claims it.
*/
params [
	["_unit",objNull,[objNull]],
	["_vehicle",objNull,[objNull]],
	["_price",500,[0]],
	["_cash",0,[0]]
];

private _unitOwner = owner _unit;

//Error checks
if (isNull _vehicle || isNull _unit) exitWith {
	CL_action_inUse = false;
	_unitOwner publicVariableClient "CL_action_inUse";
};

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");
private _side = side _unit;
private _uidNew = getPlayerUID _unit;
private _dbInfo = _vehicle getVariable ["dbInfo",[]];

diag_log "************************************";
diag_log format["SIDE: %1",_side];
diag_log "************************************";

//If you want the car to despawn decomment A, if you want the car to stay there, decomment B.

// OPTION A //
if(count _dbInfo > 0) then {
	private _uid = _dbInfo select 0;
	private _plate = _dbInfo select 1;
	private _query = format["UPDATE vehicles SET side='%1',pid='%2',active='0' WHERE pid='%3' AND plate='%4'",_side,_uidNew,_uid,_plate];
	private _sql = [_query,1] call DB_fnc_asyncCall;
};
deleteVehicle _vehicle;
[1,"Vehicle Claimed. It is now in your Garage!"] remoteExecCall ["CL_fnc_broadcast",_unit];

/*
// OPTION B //
if(count _dbInfo > 0) then {
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;
	_query = format["UPDATE vehicles SET side='%1',pid='%2' WHERE pid='%3' AND plate='%4'",_side,_unit,_uid,_plate];
	_sql = [_query,1] call DB_fnc_asyncCall;
};
*/

CL_action_inUse = false;
_unitOwner publicVariableClient "CL_action_inUse";
CL_cmoola = _cash;
_unitOwner publicVariableClient "CL_cmoola";
//[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call CL_fnc_numberText]] remoteExecCall ["CL_fnc_broadcast",_unit];
