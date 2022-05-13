#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;

if ((lbCurSel 38403) isEqualTo -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
private _price = lbValue[38403,(lbCurSel 38403)]; if (isNil "_price") then {_price = 0;};
private _item = lbData[38403,(lbCurSel 38403)];
private _itemInfo = [_item] call CL_fnc_fetchCfgDetails;
private _bad = "";
private _cartelSelection = CL_capture_list select 0;
private _taxed = false;
private _cartelOwner = false;
private _taxedAmount = 0;
private _oldPrice = 0;
private _success = false;

if ((_itemInfo select 6) != "CfgVehicles") then {
	if ((_itemInfo select 4) in [4096,131072]) then {
		if (!(player canAdd _item) && (uiNamespace getVariable ["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if (_bad != "") exitWith {hint _bad};

if ((uiNamespace getVariable ["Weapon_Shop_Filter",0]) isEqualTo 1) then {
	CL_cmoola = CL_cmoola + _price;
	[_item,false] call CL_fnc_handleItem;
	hint parseText format [localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call CL_fnc_numberText];
	[nil,(uiNamespace getVariable ["Weapon_Shop_Filter",0])] call CL_fnc_weaponShopFilter; //Update the menu.
} else {
	private _hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if ((uiNamespace getVariable "Weapon_Shop") in ["reb","corp"]) then {
		if ((_cartelSelection select 0) != group player getVariable ["gang_name",""]) then {
			_oldPrice = _price;
			_taxed = true;
			_price = round(_price * 1.05);
			_taxedAmount = round(_price - _oldPrice);
		} else {
			_cartelOwner = true;
		};
	};
	if (!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then {
		private _action = [
			format [(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call CL_fnc_numberText,
				[CL_cmoola] call CL_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if (_action) then {
			hint parseText format [localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call CL_fnc_numberText];
			private _funds = group player getVariable "gang_bank";
			_funds = _funds - _price;
			group player setVariable ["gang_bank",_funds,true];
			[_item,true] call CL_fnc_handleItem;

			if (CL_HC_isActive) then {
				[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
			} else {
				[1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
			};
			_success = true;

		} else {
			if (_price > CL_cmoola) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
			hint parseText format [localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call CL_fnc_numberText];
			CL_cmoola = CL_cmoola - _price;
			[_item,true] call CL_fnc_handleItem;
			_success = true;
		};
	} else {
		if (_price > CL_cmoola) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
		hint parseText format [localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call CL_fnc_numberText];
		CL_cmoola = CL_cmoola - _price;
		[_item,true] call CL_fnc_handleItem;
		_success = true;
	};
};

if (_success) then {
	if (_taxed) then {
		systemChat format ["A tax of $%1 was taken by the owners of Arms Dealer.",[_taxedAmount] call CL_fnc_numberText];
		if (CL_HC_isActive) then {
			[5,nil,(_cartelSelection select 0),_taxedAmount] remoteExecCall ["HC_fnc_updateGang",HC_CL];
		} else {
			[5,nil,(_cartelSelection select 0),_taxedAmount] remoteExecCall ["TON_fnc_updateGang",RSERV];
		};
	};	
	if (_cartelOwner) then {
		systemChat "No tax was taken for this purchase due to owning the Arms Dealer Cartel!";
	};
};

[0] call SOCK_fnc_updatePartial;
[1] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
