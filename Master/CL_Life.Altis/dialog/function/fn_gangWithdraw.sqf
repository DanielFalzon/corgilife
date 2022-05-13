#include "..\..\script_macros.hpp"
/*
	File: fn_gangWithdraw.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Withdraws money from the gang bank.
*/
if ((time - CL_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay"};
CL_action_delay = time;
private _value = parseNumber(ctrlText 2702);
group player setVariable ["gbank_in_use_by",player,true];
uiSleep ((1 + random (1.75)) + (0.15 + random (3.25)));

//Series of stupid checks
if (isNil {(group player) getVariable "gang_name"}) exitWith {hint localize "STR_ATM_NotInGang"}; // Checks if player isn't in a gang
if ((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {hint localize "STR_ATM_WithdrawInUseG";}; //Check if it's in use.
_gFund = GANG_FUNDS;
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};
if (_val < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

//Gang leader check to stop dem duping bitches!
if (getPlayerUID player isEqualTo (group player getVariable "gang_owner")) then {
	_gFund = _gFund - _value;
	CL_cmoola = CL_cmoola + _value;
	group player setVariable ["gang_bank",_gFund,true];

	if (CL_HC_isActive) then {
		[1,group player] remoteExec ["HC_fnc_updateGang",HC_CL]; //Update the database.
	} else {
		[1,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
	};

	hint format [localize "STR_ATM_WithdrawSuccessG",[_value] call CL_fnc_numberText];
	[] call CL_fnc_atmMenu;
	[6] call SOCK_fnc_updatePartial;

	[format [localize "STR_DL_ML_withdrewGang",profileName,(getPlayerUID player),_value,[_gFund] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
} else {
	hint "Only the gang leader can withdraw gang funds, sticky fingers!";
};