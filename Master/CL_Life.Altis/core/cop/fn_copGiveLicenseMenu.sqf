#include "..\..\script_macros.hpp"
/*
	File: fn_copGiveLicenseMenu.sqf
	Author: Dark
	Description:
	Allows cops to give individual licenses, or all licenses.
*/
#define Btn1 41002
#define Btn2 41003
#define Btn3 41004
#define Btn4 41005
#define Btn5 41006
#define Btn6 41007
#define Btn7 41008
#define Btn8 41009
#define Btn9 41010
#define Title 41001

disableSerialization;

params [
	["_curTarget",objNull,[objNull]]
];

private _giveRank = CL_Settings(getNumber,"give_minimum_rank");

if (FETCH_CONST(CL_coplevel) < _giveRank) exitWith { hint "Your rank is insufficient to use this feature.";};

createDialog "copGiveLicense_Menu";

private _display = findDisplay 41000;
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

_Btn1 ctrlSetText localize "STR_Cop_InAct_Btn1";
_Btn1 buttonSetAction "[0] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn2 ctrlSetText localize "STR_Cop_InAct_Btn2";
_Btn2 buttonSetAction "[1] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn3 ctrlSetText localize "STR_Cop_InAct_Btn3";
_Btn3 buttonSetAction "[2] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn4 ctrlSetText localize "STR_Cop_InAct_Btn4";
_Btn4 buttonSetAction "[3] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn5 ctrlSetText localize "STR_Cop_InAct_Btn5";
_Btn5 buttonSetAction "[4] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn6 ctrlSetText localize "STR_Cop_InAct_Btn6";
_Btn6 buttonSetAction "[5] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn7 ctrlSetText localize "STR_Cop_InAct_Btn7";
_Btn7 buttonSetAction "[6] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn8 ctrlSetText localize "STR_Cop_InAct_Btn8";
_Btn8 buttonSetAction "[7] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";

_Btn9 ctrlSetText localize "STR_Cop_InAct_Btn9";
_Btn9 buttonSetAction "[8] remoteExec ['CL_fnc_copGiveLicenses',CL_pInact_curTarget]; closeDialog 0;";
