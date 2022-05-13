#include "..\..\script_macros.hpp"
/*
	File: fn_gangDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Deposits money into the players gang bank.
*/
private _value = parseNumber(ctrlText 2702);
group player setVariable ["gbank_in_use_by",player,true];

//Series of stupid checks
if (isNil {(group player) getVariable "gang_name"}) exitWith {hint localize "STR_ATM_NotInGang"}; // Checks if player isn't in a gang
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CL_cmoola) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if ((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Check if it's in use.

CL_cmoola = CL_cmoola - _value;
_gFund = GANG_FUNDS;
_gFund = _gFund + _value;
group player setVariable ["gang_bank",_gFund,true];

if (CL_HC_isActive) then {
	[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_CL];
} else {
	[1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
};

hint format[localize "STR_ATM_DepositSuccessG",[_value] call CL_fnc_numberText];
[] call CL_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync

[format [localize "STR_DL_ML_depositeGang",profileName,(getPlayerUID player),_value,[_gFund] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
