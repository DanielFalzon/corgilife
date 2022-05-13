#include "..\..\script_macros.hpp"
/*
	File: fn_debitCard.sqf
	Author: Jesse Schultz

	Description:
	Use or purchase a debit card...
*/
params [
  ["_cost",0,[0]],
  ["_mode",0,[0]]
];

private _transactionComplete = false;

if (CL_inv_debitcard > 1) exitWith {hint localize "STR_Debit_ExtraCard"; false;};

if (CL_cmoola < _cost && CL_bmoola < _cost) exitWith {hint localize "STR_Debit_NotEnoughMoney"; false;};

if ((CL_inv_debitcard > 0) && {(CL_bmoola <= 500000)}) then {
	hint "Your Debit Card has been removed, as your bank account grade is too low.";
	[false,"debitcard",1] call CL_fnc_handleInv;
};

switch (_mode) do {
	case 0: {
		if (CL_inv_debitcard > 1) exitWith {hint localize "STR_Debit_ExtraCard"; false;};

		if (CL_cmoola >= _cost) exitWith {
			CL_cmoola = CL_cmoola - _cost;
			systemChat format [localize "STR_Debit_OnHandPay",[_cost] call CL_fnc_numberText];
			_transactionComplete = true;
		};

		if (!(CL_inv_debitcard isEqualTo 0) && {CL_bmoola >= _cost}) exitWith {
			CL_bmoola = CL_bmoola - _cost;
			systemChat format [localize "STR_Debit_BankPay",[_cost] call CL_fnc_numberText];
			_transactionComplete = true;
		};
	};

	case 1: {
		if (CL_bmoola <= 500000) exitWith {hint "Your bank account grade isn't high enough to purchase a Debit Card."; false;};
		if (CL_inv_debitcard >= 1) exitWith {hint localize "STR_Debit_ExtraCard"; false};
		private _price = M_CONFIG(getNumber,"VirtualItems",debitcard,"buyPrice");
		private _cardPrice = CL_Settings(getNumber,"debit_cost");
		if (CL_bmoola < _cardPrice) exitWith {};
		if (CL_bmoola >= _cardPrice) exitWith {
			CL_bmoola = CL_bmoola - _cardPrice;
			[true,"debitcard",1] call CL_fnc_handleInv;
			hint format[localize "STR_Debit_BuyCard",[_cardPrice] call CL_fnc_numberText];
			closeDialog 0;
		};
	};
};

[0] call SOCK_fnc_updatePartial;
[1] call SOCK_fnc_updatePartial;

_transactionComplete;
