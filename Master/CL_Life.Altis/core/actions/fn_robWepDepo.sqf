#include "..\..\script_macros.hpp"
/*
file: fn_robWeaponDepot.sqf
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

if (wepdepo_robbed) exitWith {hint "The Weapons Depot can only be robbed once per restart.";};
if (robWepDepo_Active) exitWith {hint "The Weapons Depot is in progress. Calm your tits.";};
if (!(side _robber isEqualTo civilian)) exitWith {hint "You are supposed to be a Civil Servant. Get back to work.";};
if (license_civ_corp) exitWith {hint "You are not a Corporation Operative and therefore cannot steal from this place!";};
if (_robber distance _shop > 50) exitWith {hint "You need to be within 50 meters of the Depot rob it!";};
if (civilian countSide playableUnits < (CL_Settings(getNumber,"minimum_cops"))) exitWith {hint format [localize "STR_Civ_NotEnoughCops",(CL_Settings(getNumber,"minimum_cops"))];};
if (_rip) exitWith {hint "Robbery already in progress!";};
if (!(vehicle player isEqualTo _robber)) exitWith {hint "Get out of your vehicle!";};
if !(alive _robber) exitWith {};
if (currentWeapon _robber in ["","Binocular","Rangefinder"]) exitWith {hint "You cannot rob the Weapons Depot without a weapon!";};

robWepDep_Active = true;

_rip = true;

_shop removeAction _action;
//_shop switchMove "AmovPercMstpSsurWnonDnon";

disableSerialization;
"progressBar" cutRsc ["CL_progress","PLAIN"];
private _ui = uiNamespace getVariable "CL_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["Robbery in progress, stay close (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
private _cP = 0.0020;

if (_rip) then {
hint "The silent alarm has been triggerd! The Rebels have been alerted!"; 
[1, format ["!ALARM! - The Weapons Depot is being robbed!"]] remoteExec ["CL_fnc_broadcast",west];
	while {true} do {
		uiSleep 0.85;
		_cP = _cP + 0.0020;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format ["Robbery in progress, stay close (50m) (%1%2)...",round(_cP * 100),"%"];
		private _Pos = position player; // by ehno: get player pos
		_marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
		"Marker200" setMarkerColor "ColorRed";
		"Marker200" setMarkerText "ROBBERY IN PROGRESS!";
		"Marker200" setMarkerType "o_recon";
		if (_cP >= 1) exitWith {};
		if (_robber distance _shop > 10.5) exitWith {};
		if !(alive _robber) exitWith {};
	};

	if !(alive _robber) exitWith {
		_rip = false;
	};

	if (_robber distance _shop > 50) exitWith {
		deleteMarker "Marker200";
//		_shop switchMove "";
//		[_shop,""] remoteExec ["CL_fnc_animSync",0];
		hint "You need to stay within 50 meters to rob the Weapons Depot! - The Depot has now been locked down!";
		"progressBar" cutText ["","PLAIN"];
		_rip = false;
	};

	"progressBar" cutText ["","PLAIN"];

	titleText [format ["You have stolen a range of weapon parts! Now get out of here before the cops arrive!"],"PLAIN"];
	deleteMarker "Marker200"; // by ehno delete maker

	[true,"polymer",70] call CL_fnc_handleInv;
	[true,"firingPin",24] call CL_fnc_handleInv;
	[true,"pipe",50] call CL_fnc_handleInv;

	[0] call SOCK_fnc_updatePartial;
	wepdepo_robbed = true;
	publicVariable "wepdepo_robbed";

	[1, format ["%1 was just robbed by %2 for a total of $%3",_name,name _robber, [_moola] call CL_fnc_numberText]] remoteExec ["CL_fnc_broadcast",civilian];

	_rip = false;
	CL_use_atm = false;
	uiSleep (30 + random(180));
	CL_use_atm = true;
	if !(alive _robber) exitWith {};
	[getPlayerUID _robber,name _robber,"211"] remoteExec ["CL_fnc_wantedAdd",2];
};

uiSleep 300;

_action = _shop addAction ["Rob Weapon Depot",CL_fnc_robWepDepo,_name];
//_shop switchMove "";
//[_shop,""] remoteExec ["CL_fnc_animSync",0];

uiSleep 300;

robWepDep_Active = false;
