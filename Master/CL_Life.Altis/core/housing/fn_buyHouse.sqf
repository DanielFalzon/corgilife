#include "..\..\script_macros.hpp"
/*
	File: fn_buyHouse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
params [
	["_house",objNull,[objNull]]
];

private _uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (_house getVariable ["house_owned",false]) exitWith {hint localize "STR_House_alreadyOwned";};
if (!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process";};
if (!license_civ_home) exitWith {hint localize "STR_House_License"};
if (count CL_houses >= (CL_Settings(getNumber,"house_limit"))) exitWith {hint format[localize "STR_House_Max_House",CL_Settings(getNumber,"house_limit")]};
closeDialog 0;

private _houseCfg = [(typeOf _house)] call CL_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

private _action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call CL_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (CL_bmoola < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	CL_bmoola = CL_bmoola - (_houseCfg select 0);
	[1] call SOCK_fnc_updatePartial;

	if (CL_HC_isActive) then {
		[_uid,_house] remoteExec ["HC_fnc_addHouse",HC_CL];
	} else {
		[_uid,_house] remoteExec ["TON_fnc_addHouse",RSERV];
	};

	[format [localize "STR_DL_AL_boughtHouse",profileName,(getPlayerUID player),[(_houseCfg select 0)] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"HouseLog"] remoteExecCall ["A3Log",2];
	[format [localize "STR_DL_AL_boughtHouse",profileName,(getPlayerUID player),[(_houseCfg select 0)] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];

	_house setVariable ["house_owner",[_uid,profileName],true];
	_house setVariable ["locked",true,true];
	_house setVariable ["containers",[],true];
	_house setVariable ["uid",floor(random 99999),true];

	CL_vehicles pushBack _house;
	CL_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _house), "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house),"numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable [format["bis_disabled_Door_%1",_i],1,true];
	};
};
