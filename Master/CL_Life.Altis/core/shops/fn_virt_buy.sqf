#include "..\..\script_macros.hpp"
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
if ((lbCurSel 2401) isEqualTo -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
private _type = lbData[2401,(lbCurSel 2401)];
private _price = lbValue[2401,(lbCurSel 2401)];
private _amount = ctrlText 2404;

private _marketprice = [_type] call CL_fnc_marketGetBuyPrice;
if(_marketprice != -1) then {
	_price = _marketprice;
};

if (!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
if (parseNumber(_amount) > 50) exitWith {hint localize "STR_NOTF_QuantTooHigh"};
private _diff = [_type,parseNumber(_amount),CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if (_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
private _hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if ((_price * _amount) > CL_cmoola && {!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
if ((time - CL_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
CL_action_delay = time;

private _name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if ([true,_type,_amount] call CL_fnc_handleInv) then {
	if (!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then {
		_action = [
			format [(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call CL_fnc_numberText,
				[CL_cmoola] call CL_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if (_action) then {
			hint format [localize "STR_Shop_Virt_BoughtGang",_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText];
			[format ["%1 (%2) bought %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText],"ItemLog"] remoteExecCall ["A3Log",2];
			[format ["%1 (%2) bought %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
			_funds = group player getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			group player setVariable ["gang_bank",_funds,true];

			if (CL_HC_isActive) then {
				[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_CL];
			} else {
				[1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
			};

		} else {
			if ((_price * _amount) > CL_cmoola) exitWith {[false,_type,_amount] call CL_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format [localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText];
			[format ["%1 (%2) bought %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText],"ItemLog"] remoteExecCall ["A3Log",2];
			[format ["%1 (%2) bought %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
			CL_cmoola = CL_cmoola - _price * _amount;
		};
	} else {
		if ((_price * _amount) > CL_cmoola) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call CL_fnc_handleInv;};
		hint format [localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText];
		[format ["%1 (%2) bought %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText],"ItemLog"] remoteExecCall ["A3Log",2];
		[format ["%1 (%2) bought %3 %4 for $%5.",profileName,getPlayerUID player,_amount,(localize _name),[(_price * _amount)] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
		CL_cmoola = CL_cmoola - _price * _amount;
	};
		if (_marketprice != -1) then {
			[_type, _amount] spawn {
				uiSleep 120;
				[_this select 0,_this select 1] call CL_fnc_marketBuy;
			};
		};
	[] call CL_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[1] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
