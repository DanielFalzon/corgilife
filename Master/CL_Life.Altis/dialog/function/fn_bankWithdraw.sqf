#include "..\..\script_macros.hpp"
/*
	File: fn_bankWithdraw.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the players account
*/
private _value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CL_bmoola) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_value < 100 && CL_bmoola > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

CL_cmoola = CL_cmoola + _value;
CL_bmoola = CL_bmoola - _value;
hint format [localize "STR_ATM_WithdrawSuccess",[_value] call CL_fnc_numberText];
[] call CL_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
