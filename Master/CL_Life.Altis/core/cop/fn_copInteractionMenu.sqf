#include "..\..\script_macros.hpp"
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addActions for various cop actions towards another player.
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

switch (playerSide) do {
	case west: {
		private _patdownRank = CL_Settings(getNumber,"patdown_minimum_rank");
		private _revokeRank = CL_Settings(getNumber,"revoke_minimum_rank");

		if (player getVariable ["Escorting",false]) then {
			if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
			if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
			if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
		};

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

		if (player getVariable ["isEscorting",false]) then {
			{ _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
		};

		//Set Unrestrain Button
		_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
		_Btn1 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_unrestrain; closeDialog 0;";

		//Set Check Licenses Button
		_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
		_Btn2 buttonSetAction "[player] remoteExecCall [""CL_fnc_licenseCheck"",CL_pInact_curTarget]; closeDialog 0;";

		//Set Search Button
		_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
		_Btn3 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_searchAction; closeDialog 0;";

		//Set Escort Button
		if (player getVariable ["isEscorting",false]) then {
			_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
			_Btn4 buttonSetAction "[] call CL_fnc_stopEscorting; closeDialog 0;";
		} else {
			_Btn4 ctrlSetText localize "STR_pInAct_Escort";
			_Btn4 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_escortAction; closeDialog 0;";
		};

		//Set Ticket Button
		_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
		_Btn5 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_ticketAction;";

		//Arrest
		_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
		_Btn6 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_arrestAction; closeDialog 0;";
		_Btn6 ctrlEnable false;

		_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
		_Btn7 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_putInCar; closeDialog 0;";

		//Patdown Button
		_Btn8 ctrlSetText localize "STR_pInAct_Patdown";
		_Btn8 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_seizePlayerAction; closeDialog 0;";

		//Revoke
		_Btn9 ctrlSetText localize "STR_pInAct_RevokeLicense";
		_Btn9 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_revokeLicense;";

		if (FETCH_CONST(CL_coplevel) < _patdownRank) then {
			_Btn8 ctrlEnable false;
		};

		if (FETCH_CONST(CL_coplevel) < _revokeRank) then {
			_Btn9 ctrlEnable false;
		};

		{
			if (player distance (getMarkerPos _x) < 30) exitWith {
				_Btn6 ctrlEnable true;
			};
		} forEach CL_Settings(getArray,"sendtoJail_locations");
	};

	case civilian: {

		if (player getVariable ["Escorting",false]) then {
			if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
			if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
		};

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

		if (player getVariable ["isEscorting",false]) then {
			{ _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
		};

		if (_curTarget getVariable ["blindfolded",false]) then {
			_Btn2 ctrlSetText "Remove blindfold";
			_Btn2 buttonSetAction "[] call CL_fnc_untieb; closeDialog 0;";
		} else {
			_Btn2 ctrlSetText "Blindfold Person";
			_Btn2 buttonSetAction "[] call CL_fnc_tieingActionb; closeDialog 0;";
		};

		if (player getVariable ["isEscorting",false]) then {
			_Btn3 ctrlSetText localize "STR_pInAct_StopEscort";
			_Btn3 buttonSetAction "[] call CL_fnc_stopEscorting; closeDialog 0;";
		} else {
			_Btn3 ctrlSetText localize "STR_pInAct_Escort";
			_Btn3 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_escortAction; closeDialog 0;";
		};

		_Btn4 ctrlSetText localize "STR_pInAct_PutInCar";
		_Btn4 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_putInCar; closeDialog 0;";

		if (_curTarget getVariable ["gagged",false]) then {
			_Btn5 ctrlSetText "Remove Gag";
			_Btn5 buttonSetAction "[] call CL_fnc_removeGagAction; closeDialog 0;";
		} else {
			_Btn5 ctrlSetText "Gag Person";
			_Btn5 buttonSetAction "[] call CL_fnc_gagAction; closeDialog 0;";
		};

		if !(_curTarget getVariable ["tied",false]) then {
			_Btn1 ctrlSetText "Ziptie Person";
			_Btn1 buttonSetAction "[] call CL_fnc_tieingAction; closeDialog 0;";
			_Btn2 ctrlEnable false;
			_Btn3 ctrlEnable false;
			_Btn4 ctrlEnable false;
			_Btn5 ctrlEnable false;
		} else {
			_Btn1 ctrlSetText "Remove Zipties";
			_Btn1 buttonSetAction "[] call CL_fnc_untie; closeDialog 0;";
		};
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
	};
};
