#include "..\..\script_macros.hpp"
/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private ["_time","_bail","_esc","_countDown"];

params [
	["_ret",[],[[]]],
	["_bad",false,[false]]
];

if (_bad) then {
	_time = time + 1100;
} else {
	_time = time + (15 * 60);
};

if (count _ret > 0) then {
	CL_bail_amount = (_ret select 2);
} else {
	CL_bail_amount = 15000;
	_time = time + (30 * 60);
};

_esc = false;
_bail = false;

[_bad] spawn {
	CL_canpay_bail = false;
	if (_this select 0) then {
		uiSleep (30 * 60);
	} else {
		uiSleep (15 * 60);
	};
	CL_canpay_bail = true;
};

for "_i" from 0 to 1 step 0 do {
	if ((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[CL_bail_amount] call CL_fnc_numberText,if (CL_canpay_bail) then {"Yes"} else {"No"}];
	};

    if (CL_Settings(getNumber,"jail_forceWalk") isEqualTo 1) then {
        player forceWalk true;
    };

	if (player distance (getMarkerPos "jail_marker") > 150) exitWith {
		_esc = true;
	};

	if (CL_bail_paid) exitWith {
		_bail = true;
	};

	if ((round(_time - time)) < 1) exitWith {hint ""};
	if (!alive player && ((round(_time - time)) > 0)) exitWith {};
	uiSleep 0.1;
};

switch (true) do {
	case (_bail): {
		removeUniform player;
//		player forceAddUniform "U_C_WorkerCoveralls";
		CL_is_arrested = false;
		CL_bail_paid = false;
		hint localize "STR_Jail_Paid";
		player setPos (getMarkerPos "jail_release");

		if (CL_HC_isActive) then {
			[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_CL];
		} else {
			[getPlayerUID player] remoteExecCall ["CL_fnc_wantedRemove",RSERV];
		};
		[5] call SOCK_fnc_updatePartial;
	};

	case (_esc): {
		CL_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		if (CL_HC_isActive) then {
			[getPlayerUID player,profileName,"901"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
		} else {
			[getPlayerUID player,profileName,"901"] remoteExecCall ["CL_fnc_wantedAdd",RSERV];
		};

		[5] call SOCK_fnc_updatePartial;
	};

	case (alive player && !_esc && !_bail): {
		removeUniform player;
		player forceAddUniform "U_C_WorkerCoveralls";
		player addBackpack "B_FieldPack_cbr";
		CL_is_arrested = false;
		hint localize "STR_Jail_Released";

		if (CL_HC_isActive) then {
			[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_CL];
		} else {
			[getPlayerUID player] remoteExecCall ["CL_fnc_wantedRemove",RSERV];
		};

		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};

player forceWalk false; // Enable running & jumping
