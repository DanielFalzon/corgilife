/*
	File: fn_rum.sqf
	Author:
	Description:
	rum effects.
*/
//if (playerSide != civilian) exitWith {hint "You cannot do that while on duty!";};
hint "You drank a bottle of rum!";
closeDialog 0;
uiSleep 3;

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 120secs of effetcs
for "_i" from 0 to 120 do {
	"chromAberration" ppEffectAdjust [random 0.05,random 0.05,true];
	"chromAberration" ppEffectCommit 1;
	"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.01,0.01];
	"radialBlur" ppEffectCommit 1;
	addcamShake[random 1, 1, random 1];
	uiSleep 1;
};

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
