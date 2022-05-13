#include "..\..\script_macros.hpp"
/*
file: fn_robShops.sqf
Author: MrKraken
Edited: Dark
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
*/
params [
	["_shop",objNull,[objNull]],
	["_robber",objNull,[objNull]],
	"_action",
	["_name","",[""]]
];

private _rip = false;

if (robShops_Active) exitWith {hint "There is a Gas Station robbery in progress. Calm your tits.";};
if (!(side _robber isEqualTo civilian)) exitWith {hint "You are supposed to be a Civil Servant. Get back to work.";};
if (license_civ_corp) exitWith {hint "You cannot steal from your own property!";};
if (_robber distance _shop > 5) exitWith {hint "You need to be within 5 meters of the cashier to rob him!";};
if (west countSide playableUnits < (CL_Settings(getNumber,"minimum_cops_g"))) exitWith {hint format [localize "STR_Civ_NotEnoughCops",(CL_Settings(getNumber,"minimum_cops_g"))];};
if (_rip) exitWith {hint "Robbery already in progress!";};
if (!(vehicle player isEqualTo _robber)) exitWith {hint "Get out of your vehicle!";};
if !(alive _robber) exitWith {};
if (currentWeapon _robber in ["","Binocular","Rangefinder"]) exitWith {hint "You cannot rob the gas station without a weapon!";};

private _moola = 1000;
if (_moola isEqualTo 0) exitWith {hint "There is no cash in the register!";};

robShops_Active = true;

_rip = true;
_moola = 1000 + round(random 5000);
_shop removeAction _action;
//_shop switchMove "AmovPercMstpSsurWnonDnon";

disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["Robbery in progress, stay close (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
private _cP = 0.01;

if (_rip) then {
hint "The silent alarm has been triggered! The Police have been alerted!"; 
[1, format ["!ALARM! - Gas Station: %1 is being robbed!",_name]] remoteExec ["CL_fnc_broadcast",west];
	while {true} do {
		uiSleep 0.85;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format ["Robbery in progress, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
		private _Pos = position player; // by ehno: get player pos
		_marker = createMarker ["Marker100", _Pos]; //by ehno: Place a Maker on the map
		"Marker100" setMarkerColor "ColorRed";
		"Marker100" setMarkerText "ROBBERY IN PROGRESS!";
		"Marker100" setMarkerType "mil_warning";
		if (_cP >= 1) exitWith {};
		if (_robber distance _shop > 10.5) exitWith {};
		if !(alive _robber) exitWith {};
	};

	if !(alive _robber) exitWith {
		_rip = false;
	};

	if (_robber distance _shop > 10.5) exitWith {
		deleteMarker "Marker100";
//		_shop switchMove "";
//		[_shop,""] remoteExec ["CL_fnc_animSync",0];
		hint "You need to stay within 10 meters to rob the cash register! - The cash register has now been locked.";
		"progressBar" cutText ["","PLAIN"];
		_rip = false;
	};

	"progressBar" cutText ["","PLAIN"];

	titleText [format ["You have stolen $%1, now get out of here before the cops arrive!",[_moola] call CL_fnc_numberText],"PLAIN"];
	deleteMarker "Marker100"; // by ehno delete maker
	CL_cmoola = CL_cmoola + _moola;
	[0] call SOCK_fnc_updatePartial;

	[1, format ["911 - Gas Station: %1 was just robbed by %2 for a total of $%3",_name,name _robber, [_moola] call CL_fnc_numberText]] remoteExec ["CL_fnc_broadcast",west];
	[1, format ["%1 was just robbed by %2 for a total of $%3",_name,name _robber, [_moola] call CL_fnc_numberText]] remoteExec ["CL_fnc_broadcast",civilian];

	_rip = false;
	CL_use_atm = false;
	uiSleep (30 + random(180));
	CL_use_atm = true;
	if !(alive _robber) exitWith {};
	[getPlayerUID _robber,name _robber,"211"] remoteExec ["CL_fnc_wantedAdd",2];
};

uiSleep 300;

_action = _shop addAction ["Rob Gas Station",CL_fnc_robShops,_name];
//_shop switchMove "";
//[_shop,""] remoteExec ["CL_fnc_animSync",0];

uiSleep 300;

robShops_Active = false;
