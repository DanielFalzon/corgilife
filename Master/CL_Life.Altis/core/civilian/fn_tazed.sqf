#include "..\..\script_macros.hpp"
/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
params [
	["_unit",objNull,[objNull]],
	["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {
	CL_istazed = false;
};

if (_shooter isKindOf "Man" && alive player) then {
	if (!CL_istazed) then {
		CL_istazed = true;
		private _curWep = currentWeapon player;
		private _curMags = magazines player;
		private _attach = if (!(primaryWeapon player isEqualTo "")) then {primaryWeaponItems player} else {[]};

		{
			player removeMagazine _x;
		} forEach _curMags;

		player removeWeapon _curWep;
		player addWeapon _curWep;

		if (!(count _attach isEqualTo 0) && !(primaryWeapon player isEqualTo "")) then {
			{
				_unit addPrimaryWeaponItem _x;
			} forEach _attach;
		};

		if (!(count _curMags isEqualTo 0)) then {
			{
				player addMagazine _x;
			} forEach _curMags;
		};

		[_unit,"tazerSound",25,1] remoteExecCall ["CL_fnc_say3D",RCLIENT];

		_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
		_obj setPosATL ASLTOATL(visiblePositionASL player);

		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["CL_fnc_animSync",RCLIENT];
		[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		uiSleep 15;

		[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["CL_fnc_animSync",RCLIENT];

		if (!(player getVariable ["Escorting",false])) then {
			detach player;
		};
		CL_istazed = false;
		disableUserInput false;
	};
} else {
	_unit allowDamage true;
	CL_istazed = false;
};
