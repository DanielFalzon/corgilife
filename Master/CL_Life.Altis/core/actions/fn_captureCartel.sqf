/*
	File: fn_captureCartel.sqf
	Author:
	Description:
*/
params [
	["_capPoint",0,[0]],
	["_displayProgress",false,[false]]
];

CL_capture_zone = _capPoint;
if (_capPoint == 0) exitWith {"progressBar" cutText ["","PLAIN"];};

private _capProgress = CL_capture_list select (_capPoint - 1);

// Setup our progress bar.
private _upp = format["%2 Ownership", _capProgress select 1];
disableSerialization;
if (_displayProgress) then {"progressBar" cutRsc ["CL_progress","PLAIN"];};
private _ui = uiNameSpace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (%3%1)...","%",_upp,round((_capProgress select 2) * 100)];
_progress progressSetPosition (_capProgress select 2);
