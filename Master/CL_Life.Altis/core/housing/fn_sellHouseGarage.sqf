#include "..\..\script_macros.hpp"
/*
	File: fn_sellHouseGarage.sqf
	Author: BoGuu
	Description:
	Sell functionality for house garages.
*/
params [
	["_house",objNull,[objNull]]
];

private _uid = getPlayerUID player;

if (dialog) then {closeDialog 0};
if (isNull _house) exitWith {};
if !(_house getVariable ["garageBought",false]) exitWith {hint localize "STR_Garage_NotOwned";};
if ((_house getVariable "house_owner") select 0 != getPlayerUID player) exitWith {hint localize "STR_Garage_NotOwner";};
closeDialog 0;

private _sellPrice = CL_Settings(getNumber,"houseGarage_sellPrice");

_action = [
	format [localize "STR_Garage_HouseSellMSG",_price],
	localize "STR_House_GarageSell",
	localize "STR_Global_Sell",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if ((time - CL_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay";};
CL_action_delay = time;

uiSleep ((1 + random (1.75)) + (0.15 + random (3.25)));

if (_action) then {

	if (CL_HC_isActive) then {
		[_uid,_house,1] remoteExec ["HC_fnc_houseGarage",HC_CL];
	} else {
		[_uid,_house,1] remoteExec ["TON_fnc_houseGarage",RSERV];
	};

	CL_bmoola = CL_bmoola + _sellPrice;
	[1] call SOCK_fnc_updatePartial;

	_house setVariable ["garageBought",false,true];

};
