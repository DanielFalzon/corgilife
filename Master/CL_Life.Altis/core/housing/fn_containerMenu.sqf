#include "..\..\script_macros.hpp"
/*
	File: fn_containerMenu.sqf
	Author: NiiRoZz

	Description:
	Container interaction menu.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

disableSerialization;

params [
	["_container",objNull,[objNull]]
];

if (isNull _container) exitWith {}; //Bad target

if (!dialog) then {
	createDialog "pInteraction_Menu";
};

private _Btn1 = CONTROL(37400,Btn1);
private _Btn2 = CONTROL(37400,Btn2);
private _Btn3 = CONTROL(37400,Btn3);
private _Btn4 = CONTROL(37400,Btn4);
private _Btn5 = CONTROL(37400,Btn5);
private _Btn6 = CONTROL(37400,Btn6);
private _Btn7 = CONTROL(37400,Btn7);
private _Btn8 = CONTROL(37400,Btn8);
{_x ctrlShow false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];

CL_pInact_container = _container;
if (playerSide isEqualTo west) then {
	_Btn1 ctrlSetText localize "STR_vInAct_SearchContainer";
	_Btn1 buttonSetAction "[CL_pInact_container] spawn CL_fnc_containerInvSearch; closeDialog 0;";
	_Btn1 ctrlShow true;
} else {
	_Btn1 ctrlSetText localize "STR_pInAct_RemoveContainer";
	_Btn1 buttonSetAction "[CL_pInact_container] spawn CL_fnc_removeContainer; closeDialog 0;";
	_Btn1 ctrlShow true;
};
