#include "..\..\script_macros.hpp"
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private _value = parseNumber(ctrlText 2702);

//Series of stupid checks
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CL_cmoola) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CL_cmoola = CL_cmoola - _value;
CL_bmoola = CL_bmoola + _value;

hint format[localize "STR_ATM_DepositSuccess",[_value] call CL_fnc_numberText];
[] call CL_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[format [localize "STR_DL_ML_depositedBank",profileName,(getPlayerUID player),_value,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
