#include "..\..\script_macros.hpp"
/*
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the safe inventory menu.
*/
if (dialog) exitWith {}; //A dialog is already open.
CL_safeObj = param [0,objNull,[objNull]];
if (isNull CL_safeObj) exitWith {};
if (playerSide != civilian) exitWith {};
if ((CL_safeObj getVariable ["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if (CL_safeObj getVariable ["inUse",false]) exitWith {hint localize "STR_Civ_VaultInUse"};
if (west countSide playableUnits < (CL_Settings(getNumber,"minimum_cops"))) exitWith {
	hint format [localize "STR_Civ_NotEnoughCops",(CL_Settings(getNumber,"minimum_cops"))];
};
if (!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[CL_safeObj] call CL_fnc_safeInventory;
CL_safeObj setVariable ["inUse",true,true];

[CL_safeObj] spawn {
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable ["inUse",false,true];
};