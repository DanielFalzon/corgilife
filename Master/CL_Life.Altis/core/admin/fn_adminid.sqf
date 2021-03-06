/*
	File: fn_adminID.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Output information received to admin menu.
*/
disableSerialization;

private _ret = _this select 0;
private _display = findDisplay 2900;
private _text = _display displayCtrl 2903;

_text ctrlSetStructuredText parseText format["ID: %1",_ret];
