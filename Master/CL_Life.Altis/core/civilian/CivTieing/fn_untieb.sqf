/*
	File: fn_untie.sqf
*/
private _unit = cursorTarget;

if ((CL_action_inUse) || (player getVariable ["tied",false]) || (player getVariable ["restrained",false])) exitWith { 
	hint "You cannot do that!";
}; 

if (isNull _unit || !(_unit getVariable ["blindfolded",false])) exitWith {};

_unit setVariable["blindfolded",false,true];
