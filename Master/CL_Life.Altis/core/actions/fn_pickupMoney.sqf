#include "..\..\script_macros.hpp"
/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Picks up money
*/
if ((time - CL_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay"; _this setVariable ["inUse",false,true];};
if (isNull _this || {player distance _this > 3}) exitWith {_this setVariable ["inUse",false,true];};

private _value = ((_this getVariable "item") select 1);
if (!isNil "_value") exitWith {
	deleteVehicle _this;

	switch (true) do {
		case (_value > 20000000) : {_value = 100000;}; //VAL>20mil->100k
		case (_value > 5000000) : {_value = 250000;}; //VAL>5mil->250k
		default {};
	};

	player playMove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_value] call CL_fnc_numberText],"PLAIN"];
	CL_cmoola = CL_cmoola + _value;
	[0] call SOCK_fnc_updatePartial;
	CL_action_delay = time;

	[format [localize "STR_DL_ML_pickedUpMoney",profileName,(getPlayerUID player),[_value] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
};
