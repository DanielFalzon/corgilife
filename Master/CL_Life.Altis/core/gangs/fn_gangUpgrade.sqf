#include "..\..\script_macros.hpp"
/*
	File: fn_gangUpgrade.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Determinds the upgrade price and blah
*/
private _maxMembers = group player getVariable ["gang_maxMembers",2];
private _slotIncrements = CL_Settings(getNumber,"gang_slotIncrements");
private _slotUpgrade = _maxMembers + _slotIncrements;
private _upgradePrice = round(_slotUpgrade * ((CL_Settings(getNumber,"gang_upgradeBase"))));
private _gangMaxUpgradeMembers = CL_Settings(getNumber,"gang_maxUpgradeMembers");

if (_maxMembers >= _gangMaxUpgradeMembers) exitWith {hint "You are allowed a maximum of %1 members in your gang.";};

_action = [
	format[(localize "STR_GNOTF_MaxMemberMSG")+ "<br/><br/>" +(localize "STR_GNOTF_CurrentMax")+ "<br/>" +(localize "STR_GNOTF_UpgradeMax")+ "<br/>" +(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call CL_fnc_numberText],
	localize "STR_Gang_UpgradeMax",
	localize "STR_Global_Buy",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (CL_bmoola < _upgradePrice) exitWith {
		hint parseText format[
			(localize "STR_GNOTF_NotEoughMoney_2")+ "<br/><br/>" +(localize "STR_GNOTF_Current")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_GNOTF_Lacking")+ " <t color='#FF0000'>$%2</t>",
			[CL_bmoola] call CL_fnc_numberText,
			[_upgradePrice - CL_bmoola] call CL_fnc_numberText
		];
	};
	CL_bmoola = CL_bmoola - _upgradePrice;
	[1] call SOCK_fnc_updatePartial;
	group player setVariable ["gang_maxMembers",_slotUpgrade,true];
	hint parseText format[localize "STR_GNOTF_UpgradeSuccess",_maxMembers,_slotUpgrade,[_upgradePrice] call CL_fnc_numberText];

	if (CL_HC_isActive) then {
		[2,group player] remoteExec ["HC_fnc_updateGang",HC_CL];
	} else {
		[2,group player] remoteExec ["TON_fnc_updateGang",RSERV];
	};

} else {
	hint localize "STR_GNOTF_UpgradeCancel";
};
