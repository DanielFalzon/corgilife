/*
	File: fn_cocaine.sqf
	Author:
*/
//if (playerSide != civilian) exitWith {hint "You cannot do that while on duty!";};
hint "You have used cocaine and will start feeling the effects shortly.";
closeDialog 0;
uiSleep 3;

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 44 do {
	"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
	"chromAberration" ppEffectCommit 1;
	"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
	"radialBlur" ppEffectCommit 1;
	addcamShake[random 3, 1, random 3];
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
