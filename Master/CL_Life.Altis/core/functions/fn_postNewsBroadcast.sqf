#include "..\..\script_macros.hpp"
/*
	File: fn_postNewsBroadcast.sqf
	Author: Jesse "tkcjesse" Schultz

	Description:
	Handles actions after the broadcast button is clicked.
*/
disableSerialization;
private _broadcastHeader = ctrlText (CONTROL(100100,100101));
private _broadcastMessage = ctrlText (CONTROL(100100,100102));
private _length = count (toArray (_broadcastHeader));
private _characterByte = toArray (_broadcastHeader);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
private _allowedLength = CL_Settings(getNumber,"news_broadcast_header_length");
private _badCharacter = false;

if (_length > _allowedLength) exitWith {hint format[localize "STR_News_HeaderLength",_allowedLength];};

{
	if (!(_x in _allowed)) exitWith {_badCharacter = true;};
} forEach _characterByte;

if (_badCharacter) exitWith {hint localize "STR_News_UnsupportedCharacter"};

[_broadcastHeader,_broadcastMessage,profileName] remoteExec ['CL_fnc_AAN',-2];
[format ["%1 (%2) sent the following news broadcast: %3 - %4",profileName,getPlayerUID player,_broadcastHeader,_broadcastMessage],"MoneyLog"] remoteExecCall ["A3Log",2];

CL_cmoola = CL_cmoola - CL_Settings(getNumber,"news_broadcast_cost");
[0] call SOCK_fnc_updatePartial;
CL_broadcastTimer = time;
publicVariable "CL_broadcastTimer";
