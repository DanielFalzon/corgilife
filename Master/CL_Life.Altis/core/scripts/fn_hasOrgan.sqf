/*
	File: fn_hasOrgan.sqf
	Author
	Edited: Dark (To work with 4.xx)
	Description: Has a players organs
*/
params [
	["_organThief",objNull,[objNull]]
];

if (isNull _organThief) exitWith {};
[0,format ["%1 has cut out a kidney from %2.",name _organThief,name player]] remoteExec ["CL_fnc_broadcast",0];
[_organThief,"kidney",1] call CL_fnc_handleInv;

if (CL_HC_isActive) then {
	[getPlayerUID _organThief,name _organThief,"919"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
} else {
	[getPlayerUID _organThief,name _organThief,"919"] remoteExecCall ["CL_fnc_wantedAdd",2];
};

uiSleep 900;
_organThief setVariable ["hasOrgan",false,true];
