#include "..\..\script_macros.hpp"
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Replaces the mass add actions for various vehicle actions.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Title 37401

if (!dialog) then {
	createDialog "vInteraction_Menu";
};

disableSerialization;

params [
	["_curTarget",objNull,[objNull]]
];

private _crushRank = CL_Settings(getNumber,"crush_minimum_rank");

if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if ((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (!_isVehicle) exitWith {closeDialog 0;};

private _display = findDisplay 37400;
private _Btn1 = _display displayCtrl Btn1;
private _Btn2 = _display displayCtrl Btn2;
private _Btn3 = _display displayCtrl Btn3;
private _Btn4 = _display displayCtrl Btn4;
private _Btn5 = _display displayCtrl Btn5;
private _Btn6 = _display displayCtrl Btn6;
private _Btn7 = _display displayCtrl Btn7;
CL_vInact_curTarget = _curTarget;
private _id = getObjectDLC _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_repairTruck; closeDialog 0;";

if ((CL_inv_toolkit >= 1) && {alive CL_vInact_curTarget} && {([CL_vInact_curTarget] call CL_fnc_isDamaged)}) then {
	_Btn1 ctrlEnable true;
} else {
	_Btn1 ctrlEnable false;
};

if (playerSide isEqualTo west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_searchVehAction; closeDialog 0;";

	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_vehInvSearch; closeDialog 0;";

	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_pulloutAction; closeDialog 0;";

	if (crew _curTarget isEqualTo []) then {
		_Btn4 ctrlEnable false;
	};

	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_impoundAction; closeDialog 0;";

	if (FETCH_CONST(CL_coplevel) >= _crushRank) then {
		_Btn7 ctrlSetText localize "STR_vInAct_Crush";
		_Btn7 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_crushAction; closeDialog 0;";
	} else {
		_Btn7 ctrlSetText localize "STR_vInAct_Crush";
		_Btn7 ctrlEnable false;
	};

	if (_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn CL_fnc_pushObject; closeDialog 0;";
		if (_curTarget isKindOf "Ship" && {local _curTarget} && {crew _curTarget isEqualTo []}) then {
			_Btn6 ctrlEnable true;
		} else {
			_Btn6 ctrlEnable false;
		};
	} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "CL_vInact_curTarget setPos [getPos CL_vInact_curTarget select 0, getPos CL_vInact_curTarget select 1, (getPos CL_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then {
				_Btn6 ctrlEnable false;
			} else {
				_Btn6 ctrlEnable true;
			};
		};

} else {

	if (_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn2 buttonSetAction "[] spawn CL_fnc_pushObject; closeDialog 0;";
		if (alive _curTarget && {_curTarget isKindOf "Ship"} && {local _curTarget} && {crew _curTarget isEqualTo []}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
			_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn2 buttonSetAction "CL_vInact_curTarget setPos [getPos CL_vInact_curTarget select 0, getPos CL_vInact_curTarget select 1, (getPos CL_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};

	if (typeOf _curTarget == "O_Truck_03_device_F") then {
		private _device_donor_level = CL_Settings(getNumber,"device_donor_level");
			if (FETCH_CONST(CL_donorlevel) >= _device_donor_level) then {
				_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
				_Btn3 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_deviceMine";
			if (!isNil {(_curTarget getVariable "mining")} || !local _curTarget && {_curTarget in CL_vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		} else {
			hint "Your donator level is not high enough to use this feature.";
		};
	} else {
		_Btn3 ctrlShow false;
		if (typeOf (_curTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"] && _curTarget in CL_vehicles) then {
			if (!isNil {_curTarget getVariable "fuelTankWork"}) then {
				_Btn3 ctrlSetText localize "STR_FuelTank_Stop";
				_Btn3 buttonSetAction "CL_vInact_curTarget setVariable [""fuelTankWork"",nil,true]; closeDialog 0;";
				_Btn3 ctrlShow true;
			} else {
				if (count (nearestObjects [_curTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 15]) > 0) then {
					_Btn3 ctrlSetText localize "STR_FuelTank_Supply";
					_Btn3 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_fuelSupply";
					_Btn3 ctrlShow true;
				} else {
					{
						if (player distance (getMarkerPos _x) < 20) exitWith {
							_Btn3 ctrlSetText localize "STR_FuelTank_Store";
							_Btn3 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_fuelStore";
							_Btn3 ctrlShow true;
						};
					} forEach ["fuel_storage_1","fuel_storage_2"];
				};
			};
		};
	};
	_Btn4 ctrlShow false;
	_Btn5 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn5 buttonSetAction "[CL_vInact_curTarget] spawn CL_fnc_pulloutAction;";
	if (count crew _curTarget isEqualTo 0) then {
	_Btn5 ctrlEnable false;
	};
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
};
