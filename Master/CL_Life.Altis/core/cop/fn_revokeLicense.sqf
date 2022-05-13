#include "..\..\script_macros.hpp"
/*
	File: fn_revokeLicense.sqf
	Author: Michael Francis
    Edited: Dark (To work with 4.xx)
	Description:
	Allows cops to revoke individual licenses, or all licenses. Vehicle related only.
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

createDialog "revokeLicense_Menu";
disableSerialization;

params [
	["_curTarget",objNull,[objNull]]
];

private _revokeRank = CL_Settings(getNumber,"revoke_minimum_rank");

if (player getVariable ["Escorting", false]) then {
	if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
	if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
	if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if (FETCH_CONST(CL_coplevel) < _revokeRank) exitWith { hint "Your rank is insufficient to use this feature.";};

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

//--- All Illegal Licenses;
_Btn1 ctrlSetText localize "STR_rInAct_Btn1";
_Btn1 buttonSetAction "[6] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- All Legal Licenses;
_Btn2 ctrlSetText localize "STR_rInAct_Btn2";
_Btn2 buttonSetAction "[7] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Corp License;
_Btn3 ctrlSetText localize "STR_rInAct_Btn3";
_Btn3 buttonSetAction "[9] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Rebel Training;
_Btn4 ctrlSetText localize "STR_rInAct_Btn9";
_Btn4 buttonSetAction "[8] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Pilot License;
_Btn5 ctrlSetText localize "STR_rInAct_Btn4";
_Btn5 buttonSetAction "[16] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Driver License;
_Btn6 ctrlSetText localize "STR_rInAct_Btn5";
_Btn6 buttonSetAction "[11] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Trucking License;
_Btn7 ctrlSetText localize "STR_rInAct_Btn6";
_Btn7 buttonSetAction "[12] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Boating License;
_Btn8 ctrlSetText localize "STR_rInAct_Btn7";
_Btn8 buttonSetAction "[13] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";

//--- Firearms License;
_Btn9 ctrlSetText localize "STR_rInAct_Btn8";
_Btn9 buttonSetAction "[14] remoteExec ['CL_fnc_removeLicenses',CL_pInact_curTarget]; closeDialog 0;";
