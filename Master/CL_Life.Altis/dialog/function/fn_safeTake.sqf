#include "..\..\script_macros.hpp"
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if ((lbCurSel 3502) isEqualTo -1) exitWith {hint localize "STR_Civ_SelectItem";};
_ctrl = CONTROL_DATA(3502);
_num = ctrlText 3505;
_safeInfo = CL_safeObj getVariable ["safe",0];

//Error checks
if (!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if (!(_ctrl isEqualTo "goldBar")) exitWith {hint localize "STR_Cop_OnlyGold"};
if (_num > _safeInfo) exitWith {hint format[localize "STR_Civ_IsntEnoughGold",_num];};

//Secondary checks
_num = [_ctrl,_num,CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};


//Take it
if (!([true,_ctrl,_num] call CL_fnc_handleInv)) exitWith {hint localize "STR_NOTF_CouldntAdd";};
CL_safeObj setVariable ["safe",_safeInfo - _num,true];
[CL_safeObj] call CL_fnc_safeInventory;
