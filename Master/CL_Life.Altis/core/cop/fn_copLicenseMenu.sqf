#include "..\..\script_macros.hpp"
/*
	File: fn_copLicenseMenu.sqf
	Author: Dark
	Description:
	Replaces the mass addactions for various cop actions towards another cop for licensing purposes.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401

disableSerialization;

params [
	["_curTarget",objNull,[objNull]]
];

if (!dialog) then {
	createDialog "pInteraction_Menu";
};

private _display = findDisplay 37400;
private _Btn1 = _display displayCtrl Btn1;
private _Btn2 = _display displayCtrl Btn2;
private _Btn3 = _display displayCtrl Btn3;
private _Btn4 = _display displayCtrl Btn4;
private _Btn5 = _display displayCtrl Btn5;
private _Btn6 = _display displayCtrl Btn6;
private _Btn7 = _display displayCtrl Btn7;
private _Btn8 = _display displayCtrl Btn8;
private _Btn9 = _display displayCtrl Btn9;
CL_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_copUnrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[player] remoteExecCall [""CL_fnc_copLicenseCheck"",CL_pInact_curTarget]; closeDialog 0;";

_Btn3 ctrlSetText localize "STR_pInAct_GiveLicense";
_Btn3 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_copGiveLicenseMenu;";

_Btn4 ctrlSetText localize "STR_pInAct_RemoveLicense";
_Btn4 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_copRemoveLicenseMenu;";

_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;