/*
	File: standup.sqf
	Author:
	Edited: Dark (to work with 4.4x)
	Description: It might just give you the ability to stand up?
*/
player switchMove "";  
player removeAction CL_action_standup;
CL_action_standup = nil;
if (!isNil 'CL_sitting_chair') then {
	CL_sitting_chair setVariable ["occupied",false,true];
	CL_sitting_chair = nil;
};
