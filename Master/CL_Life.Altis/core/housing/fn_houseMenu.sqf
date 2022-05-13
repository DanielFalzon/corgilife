#include "..\..\script_macros.hpp"
/*
	File: fn_houseMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Building interaction menu
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
if (isNull _curTarget) exitWith {}; //Bad target
if (playerSide isEqualTo independent) exitWith {};
_houseCfg = [(typeOf _curTarget)] call CL_fnc_houseConfig;
if (count _houseCfg isEqualTo 0 && playerSide isEqualTo civilian) exitWith {};

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
private _Btn9 = CONTROL(37400,Btn9);
{_x ctrlShow false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];

CL_pInact_curTarget = _curTarget;

if (_curTarget isKindOf "House_F" && playerSide isEqualTo west) exitWith {
	if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget || (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget || (nearestObject [[20894.2,19226.8,0],"Land_Dome_Big_F"]) == _curTarget) then {

		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;

		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;

	} else {
		if (!isNil {_curTarget getVariable "house_owner"}) then {
			_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
			_Btn1 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;

			_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
			_Btn2 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;

			_Btn3 ctrlSetText localize "STR_pInAct_SearchHouse";
			_Btn3 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;

			if (player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};

			_Btn4 ctrlSetText localize "STR_pInAct_LockHouse";
			_Btn4 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

if (!(_curTarget in CL_vehicles) || isNil {_curTarget getVariable "house_owner"}) then {
	private _isHouse = (isClass (missionConfigFile >> "Housing" >> "CL" >> typeOf _curTarget));
	private _buildingPurchaseString = [
		"STR_pInAct_BuyGarage",
		"STR_pInAct_BuyHouse"
	] select _isHouse;
	
	_Btn1 ctrlSetText localize _buildingPurchaseString;
	_Btn1 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_buyHouse; closeDialog 0";
	_Btn1 ctrlShow true;

	if (!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlEnable false;
	};

	if (_isHouse) then {
		if (getNumber (missionConfigFile >> "Housing" >> "CL" >> (typeOf _curTarget) >> "canGarage") isEqualTo 1) then {
			_Btn2 ctrlSetText localize "STR_pInAct_GarageExt";
			_Btn2 buttonSetAction "hint format [localize 'STR_pInAct_GarageExtNOTF',CL_Settings(getNumber,'houseGarage_buyPrice')];";
			_Btn2 ctrlShow true;
		};
	};

} else {
	if (isClass (missionConfigFile >> "Garages" >> "CL" >> (typeOf _curTarget))) then {
		_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
		_Btn1 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;

		if !(((_curTarget getVariable "house_owner") select 0) isEqualTo getPlayerUID player) then {
			_Btn1 ctrlEnable false;
		};

		_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
		_Btn2 buttonSetAction "[CL_pInact_curTarget,""Car""] spawn CL_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;

		_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
		_Btn3 buttonSetAction "[CL_pInact_curTarget,player] spawn CL_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;
	} else {
		_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
		_Btn1 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;

		if (((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};

		if (_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
		} else {
			_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
		};
		_Btn2 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;

		if (isNull (_curTarget getVariable ["lightSource",objNull])) then {
			_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
		} else {
			_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
		};
		_Btn3 buttonSetAction "[CL_pInact_curTarget] call CL_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;

		if (getNumber (missionConfigFile >> "Housing" >> "CL" >> (typeOf _curTarget) >> "canGarage") isEqualTo 1 && {!(_curTarget getVariable ["blacklistedGarage",false])}) then {
			if (_curTarget getVariable ["garageBought",false]) then {
				_Btn4 ctrlSetText localize "STR_pInAct_SellGarage";
				_Btn4 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_sellHouseGarage; closeDialog 0;";
				_Btn4 ctrlShow true;

				if (((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
					_Btn4 ctrlEnable false;
				};

				_Btn5 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn5 buttonSetAction "[CL_pInact_curTarget,""Car""] spawn CL_fnc_vehicleGarage; closeDialog 0;";
				_Btn5 ctrlShow true;

				_Btn6 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn6 buttonSetAction "[CL_pInact_curTarget,player] spawn CL_fnc_storeVehicle; closeDialog 0;";
				_Btn6 ctrlShow true;
			} else {
				_Btn5 ctrlSetText localize "STR_pInAct_BuyGarage";
				_Btn5 buttonSetAction "[CL_pInact_curTarget] spawn CL_fnc_buyHouseGarage; closeDialog 0;";
			};

			_Btn5 ctrlShow true;

		};

	};
};
