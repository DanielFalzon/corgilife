#include "..\..\..\script_macros.hpp"
/*
    File: fn_placeablesMenu.sqf
    Author: Maximum
    Description: Placeables for the cop\medic sides.
*/
if (!(playerSide isEqualTo [west,independent])) exitWith {
	hint "You are not a government employee...";
};

disableSerialization;
createDialog "CL_cop_placeables";
waitUntil {
	(!isNull(findDisplay 20000));
};
private _display = findDisplay 20000;
private _placeables = _display displayCtrl 20001;
lbClear _placeables;

{
    private _name = _x select 0;
    private _className = _x select 1;
    _placeables lbAdd _name;
    _placeables lbSetData [(lbSize _placeables) - 1, _className];
} forEach (CL_placeables);
