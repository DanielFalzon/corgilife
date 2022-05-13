#include "..\..\script_macros.hpp"
/*
	File: fn_handleDowned.sqf
	Author: Skalicon modded by Mahribar
	Edited: Dark
	Description: Downed state for rubber bullets
*/
params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {
	CL_isdowned = false;
};

if (_shooter isKindOf "Man" && alive player) then {
	if (!CL_isdowned) then {
		CL_isdowned = true;
		player setDamage 0.5;
		private _curWep = currentWeapon player;
		private _curMags = magazines player;
		private _attach = if (!(primaryWeapon player isEqualTo "")) then {primaryWeaponItems player} else {[]};

		{
			player removeMagazine _x;
		} forEach _curMags;

		player removeWeapon _curWep;
		player addWeapon _curWep;

		if (!(count _attach isEqualTo 0 && primaryWeapon player isEqualTo "")) then {
			{
				player addPrimaryWeaponItem _x;
			} forEach _attach;
		};

		if (!(count _curMags isEqualTo 0)) then {
			{
				player addMagazine _x;
			} forEach _curMags;
		};

		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["CL_fnc_animSync",RCLIENT];
		[0,"STR_NOTF_Downed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		uiSleep 30;

		[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["CL_fnc_animSync",RCLIENT];

		if (!(player getVariable ["Escorting",false])) then {
			detach player;
		};
		CL_isdowned = false;
		disableUserInput false;
	};
} else {
	_unit allowDamage true;
	CL_isdowned = false;
};