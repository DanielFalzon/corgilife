#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_reciever.sqf
	Author: Ryan. Edited by Fresqo for our auction house
	Edited: Dark (Edited to work with 4.4x)
	Description: messages and gives moneys etc from some auction house shiz
*/
private["_seller","_price","_item"];
_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

switch (_mode) do
{
	case 0:
	{
		_item = _info select 0;
		_price = _info select 1;
		_seller = _info select 2;
		hint format["You bought items from %1 for $%2",_seller,[_price]call CL_fnc_numberText];
		closeDialog 0;
	};
	case 1:
	{
		_seller = _info select 0;
		_price = _info select 1;
		hint parseText format
		[
			"%1 accepted one of your offers, you recieved<br/>
			<t color='#228B22'>%3%2</t><br/>", name _seller,[_price]call CL_fnc_numberText,"$"
		];
		CL_bmoola = CL_bmoola + _price;
	};

};
