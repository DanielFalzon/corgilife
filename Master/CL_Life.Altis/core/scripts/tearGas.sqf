#include "..\..\script_macros.hpp"
/*
	File: tearGas.sqf
	Author:
	Edited: Dark
	Description: It's tear gas.. throw it at yourself
*/
for "_i" from 0 to 1 step 0 do {
    "dynamicBlur" ppEffectEnable false; // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
    "dynamicBlur" ppEffectCommit 15; // time it takes to normal
    resetCamShake; // resets the shake
    20 fadeSound 1;     //fades the sound back to normal
	
	waitUntil
	{
		(((nearestObject [getpos player, "SmokeShellOrange"]) distance player < 20) && ((abs(((getPosASL player) select 2) - (getPosASL (nearestObject [getPos player, "SmokeShellOrange"]) select 2))) <= 2) || {((nearestObject [getpos player, "G_40mm_SmokeOrange"]) distance player < 15) && ((abs(((getPosASL player) select 2) - (getPosASL (nearestObject [getPos player, "G_40mm_SmokeOrange"]) select 2))) <= 2)})
	};

if !(goggles player isEqualTo "H_CrewHelmetHeli_B") then {
		// play coughing sound
		[player,"coughing",5,1] remoteExec ["CL_fnc_say3D",RANY];
		// run the teargas effects on player
		"dynamicBlur" ppEffectEnable true; // enables ppeffect
		"dynamicBlur" ppEffectAdjust [10]; // intensity of blur
		"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
		enableCamShake true;	 // enables camera shake
		addCamShake [10, 45, 10];	// sets shakevalues
		player setFatigue 1; // sets the fatigue to 100%
		5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds
		uiSleep 5;
		"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
		"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
		uiSleep 5;
	} else {
		[player,"diver",1,1] remoteExec ["CL_fnc_say3D",RANY];
		uiSleep 5;
	};
	uiSleep 5;
};
