#include "..\..\script_macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private _amount = ctrlText 2018;
ctrlShow[2001,false];
if ((lbCurSel 2022) isEqualTo -1) exitWith {hint "No one was selected!"; ctrlShow[2001,true];};
private _unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if (isNil "_unit") exitWith {ctrlShow[2001,true];};
if (_unit == player) exitWith {ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if (!CL_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet."; ctrlShow[2001,true];};
if (!([_amount] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format"; ctrlShow[2001,true];};
if (parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give."; ctrlShow[2001,true];};
if (parseNumber(_amount) > CL_cmoola) exitWith {hint "You don't have that much to give!"; ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};
if (isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range.";};

hint format [localize "STR_NOTF_youGaveMoney",[(parseNumber(_amount))] call CL_fnc_numberText,_unit getVariable ["realname",name _unit]];
CL_cmoola = CL_cmoola - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;

[_unit,_amount,player] remoteExecCall ["CL_fnc_receiveMoney",_unit];
[] call CL_fnc_p_updateMenu;

ctrlShow[2001,true];
