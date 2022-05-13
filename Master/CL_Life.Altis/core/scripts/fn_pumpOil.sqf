#include "..\..\script_macros.hpp"
/*
	File: fn_pumpOil.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.co.uk)
	Edited: Dark (To work with 4.xx)
	Description:
	Pumps Oil from Oil Rig
*/
params [
	["_pump",objNull,[objNull]]
];

//Error check
if ((isNull _pump) || (player distance _pump > 10)) exitWith {};
if (CL_is_processing) exitWith {
	hint localize "STR_Process_Pump_InUse";
};

/*
case "oil": {
	["oil_unprocessed","oilProcessed",1200,(localize "STR_Process_Oil"),0];
};
*/

private _upp = localize "STR_Process_Pump_Oil";

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

CL_is_processing = true;

for "_i" from 0 to 1 step 0 do {
	uiSleep  0.3;
	_cP = _cP + 0.02;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if (_cP >= 1) exitWith {};
	if (player distance _pump > 10) exitWith {};
};

if (player distance _pump > 10) exitWith {
	hint localize "STR_Process_Pump_Stay";
	"progressBar" cutText ["","PLAIN"];
	CL_is_processing = false;
};

/*
if (!([false,_oldItem,1] call CL_fnc_handleInv)) exitWith {
	"progressBar" cutText ["","PLAIN"];
	CL_is_processing = false;
};

if (!([true,oil_unprocessed,2] call CL_fnc_handleInv)) exitWith {
	"progressBar" cutText ["","PLAIN"];
	[true,_oldItem,_oldVal] call CL_fnc_handleInv;
	CL_is_processing = false;
};
*/

if (!([true,"oil_unprocessed",2] call CL_fnc_handleInv)) exitWith {
	"progressBar" cutText ["","PLAIN"];
	titleText [localize "STR_Process_Pump_Oil_Fail","PLAIN"];
	CL_is_processing = false;
};

"progressBar" cutText ["","PLAIN"];
titleText [format [localize "STR_Process_Pumped_Oil",1],"PLAIN"];
["ItemGathered"] spawn mav_ttm_fnc_addExp;
CL_is_processing = false;
