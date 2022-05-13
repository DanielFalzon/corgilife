#include "..\..\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	Description:
	Opens the cellphone menu?
*/
private ["_display","_units","_type"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;

ctrlSetText [3003, ""];
lbClear _units;


if (FETCH_CONST(CL_adminlevel) < 1) then {
	ctrlShow[3020,false];
	ctrlShow[3021,false];
};
_unitsArray = playableUnits select {alive _x && _x != player};
_ListAlphabetical = [_unitsArray,[],{_x getVariable ["realname",name _x]},"ASCEND"] call BIS_fnc_sortBy;

{
	switch (side _x) do {
		case west: {_type = "Cop"};
		case civilian: {_type = "Civ"};
		case independent: {_type = "Med"};
	};
	_units lbAdd format["%1 (%2)",_x getVariable ["realname",name _x],_type];
	_units lbSetData [(lbSize _units)-1,str(_x)];
} forEach _ListAlphabetical;

lbSetCurSel [3004,0];