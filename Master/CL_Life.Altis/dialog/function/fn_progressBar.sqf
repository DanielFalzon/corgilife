/*
	File: fn_progressBar.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the progress bar.
*/
disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNameSpace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;

_progress progressSetPosition 0.5;
