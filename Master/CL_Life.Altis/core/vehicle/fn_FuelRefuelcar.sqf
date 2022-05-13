#include "..\..\script_macros.hpp"
/*
	File: fn_fuelRefuelCar.sqf
	Author: NiiRoZz

	Description:
	Adds fuel in car.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_classname = lbData[20302,(lbCurSel 20302)];
_index =  lbValue[20302,(lbCurSel 20302)];

if (isNil "_classname" || _classname isEqualTo "") exitWith {
	hint localize "STR_Select_Vehicle_Pump";
	vehiclefuelList = [];
	CL_action_inUse = false;
	closeDialog 0;
};

_car = (vehiclefuelList select _index) select 0;
_vehicleInfo = [_className]call CL_fnc_fetchVehInfo;
_fuelNow = fuel _car;
_fueltank = (_vehicleInfo select 12);
if (_car isKindOf "B_Truck_01_box_F" || _car isKindOf "B_Truck_01_transport_F") then {_fueltank = 350;};//hemtt
if (_car isKindOf "C_Van_01_box_F") then {_fueltank = 100;};
if (_car isKindOf "I_Truck_02_covered_F" || _car isKindOf "I_Truck_02_transport_F") then {_fueltank = 175;};
_fueltoput= ((SliderPosition 20901)-(floor(_fuelnow * _fueltank)));
_setfuell = _fuelnow + (_fueltoput/_fueltank);
_timer = ((_fueltoput * .25)/100);
if (_car distance player > 10 && vehicle player != player) exitWith {
	hint localize "STR_Distance_Vehicle_Pump";
	vehiclefuelList = [];
	CL_action_inUse = false;
	closeDialog 0;
};

if ((CL_bmoola - (_fueltoput * CL_fuelPrices))> 0)then {
	CL_is_processing = true;
	//Setup our progress bar.
	disableSerialization;
	"progressBar" cutRsc ["CL_progress","PLAIN"];
	_ui = uiNameSpace getVariable "CL_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%","Refuel:"];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	_tp =0;
	_totalcost = _fueltoput * CL_fuelPrices;
	for "_i" from 0 to 1 step 0 do {
		uiSleep  _timer;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Refuel:"];
		if (_cP >= 1) exitWith {};
		if (player distance _car > 10) exitWith {};
		if (vehicle player != player) exitWith {};
		if !((CL_bmoola - round(0.01 * _totalcost))> 0) exitWith {};
		CL_bmoola = CL_bmoola - round((0.01 * _totalcost));
		_tp = _tp +1;
		if (_tp == 9) then {
			_tp = 0;
			[_car,_cp * _setfuell] remoteExecCall ["CL_fnc_setFuel",_car];
		};
	};
	"progressBar" cutText ["","PLAIN"];
	if (_car distance player > 10 || vehicle player != player) then {
		hint localize "STR_Distance_Vehicle_Pump";
		vehiclefuelList = [];
		CL_is_processing = false;
		CL_action_inUse = false;
		[0] call SOCK_fnc_updatePartial;
		closeDialog 0;
	} else {
		CL_is_processing = false;
		[0] call SOCK_fnc_updatePartial;
	};
} else {
	hint localize "STR_NOTF_NotEnoughMoney";
};

vehiclefuelList = [];
CL_action_inUse = false;
closeDialog 0;
