/*
	File: fn_placeablePlace.sqf
	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
if (CL_barrier_active) exitWith {
    closeDialog 0;
    hint"Can't place 2 at the same time!";
};
if (count CL_bar_placey >= CL_bar_limit) exitWith {
    hint "You've reached the limit of objects you can place.";
};

private _className = lbData [20001,lbCurSel(20001)];
closeDialog 0;
CL_barrier_active = true;
private _allowMoveDistance = 50;
private _object = _className createVehicle (position player);
CL_barrier_activeObj = _object;
private _attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;
private _originalPos = position _object;
private _playerOriginalPos = position player;

waitUntil {
	if (CL_barrier_activeObj distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
		[true] call CL_fnc_placeableCancel;
	};
	uiSleep 1;
	!CL_barrier_active;
};
