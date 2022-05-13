/*
	File: fn_captureCartelUpdate.sqf
	Author:
	Description:
*/
private _point = CL_capture_list select (CL_capture_zone - 1);
private _cP = _point select 2;
private _ui = uiNameSpace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%3 Ownership (%1%2)...",round(_cP * 100),"%",(_point select 1)];