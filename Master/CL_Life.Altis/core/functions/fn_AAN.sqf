#include "..\..\script_macros.hpp"
/*
	File: fn_AAN.sqf
	Author: Karel Moricky
	Modified: Jesse "tkcjesse" Schultz

	Description:
	It's showtime!

	Parameter(s):
	_this select 0: STRUCTURED TEXT: Header text
	_this select 1: STRUCTURED TEXT: Bottom text (moving)
	_this select 2: PROFILENAME: Below Header text
*/
private _header = _this select 0;
private _line = _this select 1;
private _sender = _this select 2;
disableSerialization;

if (!CL_Settings_enableNewsBroadcast || isStreamFriendlyUIEnabled) exitWith {};

"rscAAN" cutRsc ["rscAAN","plain"];
private _display = uiNamespace getVariable "BIS_AAN";
private _textHeader = _display displayCtrl 3001;
_textHeader ctrlSetStructuredText parseText format [localize "STR_News_BroadcastedBy",_header,_sender];
_textHeader ctrlCommit 0;

private _textLine = _display displayCtrl 3002;
_textLine ctrlSetStructuredText parseText format["						 %1						 %1						 %1						 %1",_line];
_textLine ctrlCommit 0;
private _textLinePos = ctrlPosition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlCommit 1500;

private _textClock = _display displayctrl 3003;
_textClock ctrlSetText ([daytime,"HH:MM"] call bis_fnc_timetostring);
_textClock ctrlCommit 0;

uiSleep 30;
"rscAAN" cutText ["","plain"];
