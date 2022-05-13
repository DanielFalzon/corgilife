#include "..\..\script_macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Robs a person.
*/
params [
	["_robber",objNull,[objNull]]
];
if (isNull _robber) exitWith {}; //No one to return it to?

if (CL_cmoola > 0) then {
	[CL_cmoola,player,_robber] remoteExecCall ["CL_fnc_robReceive",_robber];

	if (CL_HC_isActive) then {
		[getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_CL];
	} else {
		[getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall ["CL_fnc_wantedAdd",RSERV];
	};

	[1,"STR_NOTF_Robbed",true,[_robber getVariable ["realname",name _robber],profileName,[CL_cmoola] call CL_fnc_numberText]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
	CL_cmoola = 0;
	[0] call SOCK_fnc_updatePartial;
} else {
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["CL_fnc_broadcast",_robber];
};
