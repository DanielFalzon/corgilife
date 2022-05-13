#include "..\..\script_macros.hpp"
/*
	File: fn_sellHouse.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz
	Description:
	Sells the house and delete all container near house.
*/
params [
	["_house",objNull,[objNull]]
];

private _uid = getPlayerUID player;

if (dialog) then {closeDialog 0};
if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {hint localize "STR_House_noOwner";};
closeDialog 0;

private _houseCfg = [(typeOf _house)] call CL_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

private _action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call CL_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if ((time - CL_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay";};
CL_action_delay = time;

uiSleep ((1 + random (1.75)) + (0.15 + random (3.25)));

if (_action) then {
	_house setVariable ["house_sold",true,true];

	if (CL_HC_isActive) then {
		[_house] remoteExecCall ["HC_fnc_sellHouse",HC_CL];
	} else {
		[_house] remoteExecCall ["TON_fnc_sellHouse",RSERV];
	};

	_house setVariable ["locked",false,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable ["uid",nil,true];

	CL_bmoola = CL_bmoola + (round((_houseCfg select 0)/2));
	[1] call SOCK_fnc_updatePartial;
	_index = CL_vehicles find _house;

	[format [localize "STR_DL_AL_soldHouse",profileName,(getPlayerUID player),(round((_houseCfg select 0)/2)),[CL_bmoola] call CL_fnc_numberText],"AdminLog"] remoteExecCall ["A3Log",2];
	[format [localize "STR_DL_AL_soldHouse",profileName,(getPlayerUID player),(round((_houseCfg select 0)/2)),[CL_bmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];

	if (_index != -1) then {
		CL_vehicles deleteAt _index;
	};

	_index = [str(getPosATL _house),CL_houses] call TON_fnc_index;
	if (_index != -1) then {
		CL_houses deleteAt _index;
	};
	_numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house), "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable [format["bis_disabled_Door_%1",_i],0,true];
	};
	_containers = _house getVariable ["containers",[]];
	if (count _containers > 0) then {
		{
			_x setVariable ["Trunk",nil,true];

			if (CL_HC_isActive) then {
				[_x] remoteExecCall ["HC_fnc_sellHouseContainer",HC_CL];
			} else {
				[_x] remoteExecCall ["TON_fnc_sellHouseContainer",RSERV];
			};

		} forEach _containers;
	};
	_house setVariable ["containers",nil,true];
};