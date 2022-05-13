/*
	Author: [ED] Luke
	Version: 1.0
	Description: Searches wrecked ship for treasure!
	Edited: Dark
*/
private["_sum","_finding","_txt","_RandomNumber"];
_finding = ["roundobject","squareobject","coins"] call BIS_fnc_selectRandom;

// Did you find something really rare?
_RandomNumber = floor(random 100); // Generator Massive Random Number;
if (_RandomNumber < 6) then {
	_finding = "doubloon";
};

if (_finding == "roundobject") then {_txt = "unusual marked object";};
if (_finding == "squareobject") then {_txt = "unidentifiable square object";};
if (_finding == "coins") then {_txt = "handful of old coins";};
if (_finding == "doubloon") then {_txt = "large coin of some kind";};
_sum = [_finding,1,CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;
CL_wreck_searched = true; //used to remove search action in fn_TreasureHunt.sqf
if (_sum > 0) then {
	CL_action_inUse = true;
	CL_action_in_Use = true;
	titleText["Searching Wreck...","PLAIN"];
	titleFadeOut 5;
	uiSleep 5;
	if ([true,_finding,1] call CL_fnc_handleInv) then
	{
		titleText["You have collected a " + _txt,"PLAIN"];
	};
};
//wtf
CL_action_inUse = false;
CL_action_in_Use = false;
