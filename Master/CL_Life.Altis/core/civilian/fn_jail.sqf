#include "..\..\script_macros.hpp"
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the initial process of jailing.
*/
params [
	["_unit",objNull,[objNull]],
	["_bad",false,[false]]
];

if (isNull _unit) exitWith {}; //Dafuq?
if (!(_unit isEqualTo player)) exitWith {}; //Dafuq?
if (CL_is_arrested) exitWith {}; //Dafuq i'm already arrested
private _illegalItems = CL_Settings(getArray,"jail_seize_vItems");

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if (_bad) then {
	waitUntil {alive player};
	uiSleep 1;
};

//Check to make sure they goto check
if (player distance (getMarkerPos "jail_marker") > 150) then {
	player setPos (getMarkerPos "jail_marker");
};

CL_cmoola = 0;
[1] call CL_fnc_removeLicenses;

{
	_amount = ITEM_VALUE(_x);
	if (_amount > 0) then {
		[false,_x,_amount] call CL_fnc_handleInv;
	};
} forEach _illegalItems;

CL_is_arrested = true;

//--- Remove equipment
removeAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
	player unassignItem _x;
	player removeItem _x;
} forEach (assignedItems player);

if (!(hmd player isEqualTo "")) then {
	player unlinkItem (hmd player);
};

//--- Prison overalls
player forceAddUniform "U_C_WorkerCoveralls";
player addBackpack "B_FieldPack_cbr";

if (CL_HC_isActive) then {
	[player,_bad] remoteExecCall ["HC_fnc_jailSys",HC_CL];
} else {
	[player,_bad] remoteExecCall ["CL_fnc_jailSys",RSERV];
};

[0] call SOCK_fnc_updatePartial;
[5] call SOCK_fnc_updatePartial;
