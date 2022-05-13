#include "..\..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out again.
*/
private _value = parseNumber(ctrlText 2702);
private _unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if (isNull _unit) exitWith {};
if ((lbCurSel 2703) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if (isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if (_value > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CL_bmoola) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
private _tax = _value * CL_Settings(getNumber,"bank_transferTax");
if ((_value + _tax) > CL_bmoola) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_value,_tax]};

CL_bmoola = CL_bmoola - (_value + _tax);

[_value,profileName] remoteExecCall ["CL_fnc_wireTransfer",_unit];
[] call CL_fnc_atmMenu;
[1] call SOCK_fnc_updatePartial;
hint format[localize "STR_ATM_SentMoneySuccess",[_value] call CL_fnc_numberText,_unit getVariable ["realname",name _unit],[_tax] call CL_fnc_numberText];

[format [localize "STR_DL_ML_transferredBank",profileName,(getPlayerUID player),_value,_unit getVariable ["realname",name _unit],[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
