#include "..\..\..\script_macros.hpp"
/*
	File: fn_isEmpOperator.sqf
	Author: 2014 nano2K - written for we-are-friendly.de
	Edited: Dark
	Description:
	Operator of EMP
*/
private _slot = assignedVehicleRole player;
private _vehicle = vehicle player;
private _result = false;

// More cop aircraft (and possibly vehicles?) need to be added to the list - when I'm not busy ofc!
if ((_vehicle != player) && (playerSide isEqualTo west)) then {
	if ((typeOf _vehicle isEqualTo "B_Heli_Light_01_F") && (_vehicle getVariable ["nano_emp_enabled", false])) then {
		if (_slot select 0 isEqualTo "Turret") then {
			if (_slot select 1 select 0 isEqualTo 0) then {
				_result = true;
			};
		};
	};
};
_result;
