#include "..\..\script_macros.hpp"
/*
	File: fn_arrestAction.sqf
	Author:

	Description:
	Arrests the targeted person.
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {}; //Not valid
if (isNil "_unit") exitWith {}; //Not Valid
if (!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if (!isPlayer _unit) exitWith {}; //Not a human
if (!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if (!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if (isNull _unit) exitWith {}; //Not valid

if (CL_HC_isActive) then {
	[getPlayerUID _unit,_unit,player,false] remoteExecCall ["HC_fnc_wantedBounty",HC_CL];
} else {
	[getPlayerUID _unit,_unit,player,false] remoteExecCall ["CL_fnc_wantedBounty",RSERV];
};

if (isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false] remoteExecCall ["CL_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
["ArrestPlayer"] spawn mav_ttm_fnc_addExp;
[format ["%1 (%2) arrested %3 (%4)",profileName,getPlayerUID player,_unit getVariable ["realname",name _unit],getPlayerUID _unit],"PoliceLog"] remoteExecCall ["A3Log",2];
