#include "..\..\script_macros.hpp"
#define INUSE(ENTITY) ENTITY setVariable ["inUse",false,true]
/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for picking up an item.
*/
if ((time - CL_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay"; INUSE(_this);};
if (isNull _this || {player distance _this > 3}) exitWith {INUSE(_this);};

private _itemInfo = _this getVariable ["item",[]];
if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _this;};
private _illegal = ITEM_ILLEGAL(_itemInfo select 0);
private _itemName = ITEM_NAME(_itemInfo select 0);
if (isLocalized _itemName) then {
	_itemName = (localize _itemName);
};

if (playerSide isEqualTo west && _illegal isEqualTo 1) exitWith {
	titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[round(ITEM_SELLPRICE(_itemInfo select 0) / 2)] call CL_fnc_numberText],"PLAIN"];
	CL_bmoola = CL_bmoola + round(ITEM_SELLPRICE(_itemInfo select 0) / 2);
	deleteVehicle _this;
	[1] call SOCK_fnc_updatePartial;
	CL_action_delay = time;
};

CL_action_delay = time;
private _diff = [(_itemInfo select 0),(_itemInfo select 1),CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;
if (_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"; INUSE(_this);};

if (!(_diff isEqualTo (_itemInfo select 1))) then {
	if ([true,(_itemInfo select 0),_diff] call CL_fnc_handleInv) then {
		player playMove "AinvPknlMstpSlayWrflDnon";

		_this setVariable ["item",[(_itemInfo select 0),(_itemInfo select 1) - _diff],true];
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
		INUSE(_this);
	} else {
		INUSE(_this);
	};
} else {
	if ([true,(_itemInfo select 0),(_itemInfo select 1)] call CL_fnc_handleInv) then {
		deleteVehicle _this;
		//waitUntil{isNull _this};
		player playMove "AinvPknlMstpSlayWrflDnon";

		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	} else {
		INUSE(_this);
	};
};
[format [localize "STR_DL_AL_pickedUp",profileName,(getPlayerUID player),_diff,_itemName],"AdminLog"] remoteExecCall ["A3Log",2];