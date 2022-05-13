#include "..\..\script_macros.hpp"
/*
	File: fn_vdmed.sqf
	Author:
	Edited: Dark
	Description:
	Anti-VDM
*/
params [
	["_unit",objNull,[objNull]],
	["_vdmer",objNull,[objNull]]
];

if (isNull _unit || isNull _vdmer) exitWith {
	CL_istazed = false;
};
if (_vdmer isKindOf "Man" && alive player) then {
	if (!CL_istazed) then {
	CL_istazed = true;

	_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
	_obj setPosATL (getPosATL _unit);
	[player,"AcinPercMrunSrasWrflDf_agony"] remoteExec ["CL_fnc_animSync",RANY];
	[0,format[localize "STR_NOTF_Vdmed", _unit getVariable["realname",name _unit], _vdmer getVariable["realname",name _vdmer]]] remoteExec ["CL_fnc_broadcast",RANY];

	if (CL_HC_isActive) then {
		[getPlayerUID _vdmer,_vdmer getVariable ["realname",name _vdmer],"13"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
	} else {
		[getPlayerUID _vdmer,_vdmer getVariable ["realname",name _vdmer],"13"] remoteExecCall ["CL_fnc_wantedAdd",RSERV];
	};

	_unit attachTo [_obj,[0,0,0]];
	uiSleep 5;
	[player,"AmovPpneMstpSrasWrflDnon"] remoteExec ["CL_fnc_animSync",RANY];
	if (!(player getVariable["Escorting",false])) then {
	    detach player;
		};
		CL_istazed = false;
		disableUserInput false;
	};
	} else {
	_unit allowDamage true;
	CL_istazed = false;
};
