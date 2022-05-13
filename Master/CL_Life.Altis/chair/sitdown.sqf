/*
	File: sitdown.sqf
	Author:
	Edited: Dark (To work with 4.xx)
	Description: It might just give you the ability to sit down?
*/
//this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf","",0,false,false,"",'player distance _target < 2 && !(_target getVariable["occupied",false]) && isNil "CL_sitting_chair" && isNil "CL_action_standup"'];
private _chair = _this select 0; 
private _unit = _this select 1;

_chair setVariable["occupied",true,true]; 
[player,"Crew"] remoteExec ["CL_fnc_animSync",-2];

waitUntil {
	animationState player == "crew";
};

_unit setPos (getPosATL _chair); 
_unit setDir ((getDir _chair) - 180); 

CL_action_standup = _unit addAction ["<t color='#0099FF'>Stand Up</t>","Chair\standup.sqf"];
CL_sitting_chair = _chair;

_unit setPosAtl [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2))];
