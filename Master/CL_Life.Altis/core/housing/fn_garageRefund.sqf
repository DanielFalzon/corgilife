#include "..\..\script_macros.hpp"
/*
	File: fn_garageRefund.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	I don't know?
*/
private _price = _this select 0;
private _unit = _this select 1;
if (_unit != player) exitWith {};
CL_bmoola = CL_bmoola + _price;
[format ["%1 (%2) sold a garage for $%3.",profileName,getPlayerUID player,_price],"HouseLog"] remoteExecCall ["A3Log",2];
[format ["%1 (%2) sold a garage for $%3.",profileName,getPlayerUID player,_price],"MoneyLog"] remoteExecCall ["A3Log",2];
[1] call SOCK_fnc_updatePartial;