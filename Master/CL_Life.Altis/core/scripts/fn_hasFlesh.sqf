/*
	File: fn_hasFlesh.sqf
	Author
	Edited: Dark (To work with 4.xx)
	Description: Has a players flesh
*/
params [
	["_fleshThief",objNull,[objNull]]
];

if (isNull _fleshThief) exitWith {};
[0,format ["%1 has bitten a piece of flesh out of %2.",name _fleshThief,name player]] remoteExec ["CL_fnc_broadcast",0];
[_fleshThief,"flesh",1] call CL_fnc_handleInv;

if (CL_HC_isActive) then {
	[getPlayerUID _fleshThief,name _fleshThief,"920"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
} else {
	[getPlayerUID _fleshThief,name _fleshThief,"920"] remoteExecCall ["CL_fnc_wantedAdd",2];
};

uiSleep 900;
_fleshThief setVariable ["hasFlesh",false,true];
