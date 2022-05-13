/*
	File: fn_heroine.sqf
	Author:
*/
//if (playerSide != civilian) exitWith {hint "You cannot do that while on duty!";};
hint "You have used heroin and will start feeling the effects shortly.";
private "_force";
closeDialog 0;
uiSleep 3;

for "_i" from 0 to 200 do {
	_force = random 15;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
	"chromAberration" ppEffectCommit (0.3 + random 0.1);
	waituntil {ppEffectCommitted "chromAberration"};
	uiSleep 0.02;
};

"chromAberration" ppEffectEnable false;
