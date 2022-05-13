#include "..\..\script_macros.hpp"
/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
if ((lbCurSel 3101) isEqualTo -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

private _price = 0;
{
	if (!(_x isEqualTo -1)) then {
		_price = _price + _x;
	};
} forEach CL_clothing_purchase;

if (_price > CL_cmoola) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
CL_cmoola = CL_cmoola - _price;
[0] call SOCK_fnc_updatePartial;

CL_clothesPurchased = true;
[] call CL_fnc_playerSkins;
[3] call SOCK_fnc_updatePartial;
closeDialog 0;
