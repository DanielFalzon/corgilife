#include "..\..\script_macros.hpp"
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
if ((lbCurSel 2402) isEqualTo -1) exitWith {};
private _type = lbData[2402,(lbCurSel 2402)];
private _price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");

private _marketprice = [_type] call CL_fnc_marketGetSellPrice;
if (_marketprice != -1) then {
	_price = _marketprice;
};

if (_price isEqualTo -1) exitWith {};

private _amount = ctrlText 2405;

if (!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if (_amount > (ITEM_VALUE(_type))) exitWith {hint localize "STR_Shop_Virt_NotEnough"};
if ((time - CL_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
CL_action_delay = time;

_price = (_price * _amount);

private _cartelSelection = CL_capture_list select 1;
private _taxed = false;
private _taxedAmount = 0;
private _cartelOwner = false;
private _oldPrice = 0;
private _success = false;


if (CL_shop_type isEqualTo "drugdealer") then {
	if ((_cartelSelection select 0) != group player getVariable ["gang_name",""]) then {
		_taxed = true;
		_oldPrice = _price;
		_price = round(_price * .92);
		_taxedAmount = round(_oldPrice - _price);
	} else {
		_cartelOwner = true;
	};
};

private _name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if ([false,_type,_amount] call CL_fnc_handleInv) then {
	hint format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call CL_fnc_numberText];
	[format ["%1 (%2) sold %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[_price] call CL_fnc_numberText],"ItemLog"] remoteExecCall ["A3Log",2];
	[format ["%1 (%2) sold %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[_price] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
	CL_cmoola = CL_cmoola + _price;
	_success = true;
	[0] call SOCK_fnc_updatePartial;

		if (_marketprice != -1) then {
		[_type, _amount] spawn {
			uiSleep 120;
			[_this select 0,_this select 1] call CL_fnc_marketSell;
		};
	};
	[] call CL_fnc_virt_update;
};

if (CL_shop_type isEqualTo "drugdealer") then {
	private _array = CL_shop_npc getVariable ["sellers",[]];
	private _ind = [getPlayerUID player,_array] call TON_fnc_index;
	if (!(_ind isEqualTo -1)) then {
		private _val = ((_array select _ind) select 2);
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		CL_shop_npc setVariable ["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		CL_shop_npc setVariable ["sellers",_array,true];
	};
};

if (CL_shop_type isEqualTo "goldBar" && (CL_Settings(getNumber,"noatm_timer")) > 0) then {
	[] spawn {
		CL_use_atm = false;
		uiSleep ((CL_Settings(getNumber,"noatm_timer")) * 60);
		CL_use_atm = true;
	};
};

if (_success) then {
	if (_taxed) then {
		systemChat format ["A cut of $%1 was taken by the drug cartel owners.",[_taxedAmount] call CL_fnc_numberText];
		if (CL_HC_isActive) then {
			[5,nil,(_cartelSelection select 0),_taxedAmount] remoteExecCall ["HC_fnc_updateGang",HC_CL];
		} else {
			[5,nil,(_cartelSelection select 0),_taxedAmount] remoteExecCall ["TON_fnc_updateGang",RSERV];
		};
	};
		
	if (_cartelOwner) then {
		systemChat "You keep your entire cut of the drugs for owning the Drugs Cartel!";
	};
};

[3] call SOCK_fnc_updatePartial;
