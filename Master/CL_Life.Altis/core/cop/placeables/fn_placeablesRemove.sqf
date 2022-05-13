/*
	File: fn_placeablesRemove.sqf
	Author: TheRick
	Description: Addition to Maximums placeables
*/
private _curTarget = cursorTarget;
private _uid = getPlayerUID player;

if (isNil {_curTarget getVariable "owner"}) exitWith {};
if ((_curTarget getVariable "owner") != _uid) exitWith {
	hint "That is not yours!";
};

deleteVehicle _curTarget;
CL_bar_placey = CL_bar_placey - [_curTarget];
