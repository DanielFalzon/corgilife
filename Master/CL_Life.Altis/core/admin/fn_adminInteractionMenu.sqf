#include "..\..\script_macros.hpp"
/*
	File: fn_adminInteractionMenu.sqf
	Author: Jesse "tkcjesse" Schultz

	Description:
	Admin Menu
*/
if (dialog) exitWith {};
if (FETCH_CONST(CL_adminlevel) < 1) exitWith {};

disableSerialization;
createDialog "aInteraction_Menu";

private _button1 = findDisplay 400300 displayCtrl 400301;
private _button2 = findDisplay 400300 displayCtrl 400302;
private _button3 = findDisplay 400300 displayCtrl 400303;
private _button4 = findDisplay 400300 displayCtrl 400304;
private _button5 = findDisplay 400300 displayCtrl 400305;
private _button6 = findDisplay 400300 displayCtrl 400306;
private _button7 = findDisplay 400300 displayCtrl 400307;
private _button8 = findDisplay 400300 displayCtrl 400308;
private _button9 = findDisplay 400300 displayCtrl 400309;

// WIP Buttons
{ _x ctrlShow false; _x ctrlEnable false; } forEach [_button1,_button2,_button3,_button5,_button6];

_button1 ctrlSetText "Spawn Vehicle";
_button1 buttonSetAction "";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button1 ctrlEnable false;_button1 ctrlShow false;};

_button2 ctrlSetText "Insert Vehicle";
_button2 buttonSetAction "";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button2 ctrlEnable false;_button2 ctrlShow false;};

_button3 ctrlSetText "Move In Target";
_button3 buttonSetAction "";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button3 ctrlEnable false;_button3 ctrlShow false;};

_button4 ctrlSetText "Repair/Heal Target";
_button4 buttonSetAction "[] call CL_fnc_adminRepair; closeDialog 0;";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button4 ctrlEnable false;_button4 ctrlShow false;};

_button5 ctrlSetText "Spawn Weapon";
_button5 buttonSetAction "";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button5 ctrlEnable false;_button5 ctrlShow false;};

_button6 ctrlSetText "Admin Clothing";
_button6 buttonSetAction "";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button6 ctrlEnable false;_button6 ctrlShow false;};

_button7 ctrlSetText "Self Heal";
_button7 buttonSetAction "[] call CL_fnc_adminHeal; closeDialog 0;";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button7 ctrlEnable false;_button7 ctrlShow false;};

_button8 ctrlSetText "Delete Target";
_button8 buttonSetAction "[] call CL_fnc_adminDeleteVehicle; closeDialog 0;";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button8 ctrlEnable false;_button8 ctrlShow false;};

_button9 ctrlSetText "Kill Target";
_button9 buttonSetAction "[] call CL_fnc_adminDestroy; closeDialog 0;";
if (FETCH_CONST(CL_adminlevel) < 5) then {_button9 ctrlEnable false;_button9 ctrlShow false;};
