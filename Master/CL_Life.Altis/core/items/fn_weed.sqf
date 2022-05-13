/*
	File: fn_weed.sqf
	Author:
	Description: Color effect for weed usage, fades over time
*/
//if (playerSide != civilian) exitWith {hint "You cannot do that while on duty!";};
hint "You have used weed and will start feeling the effects shortly.";
private "_smoke";
closeDialog 0;
uiSleep 1;

CL_degradeEffect = 4.0;
if (count attachedObjects player < 3) then {
	_smoke = "SmokeShell" createVehicle position player;
	if (vehicle player != player) then {
		_smoke attachTo [vehicle player, [0,-1,0]];
	} else {
		_smoke attachTo [player, [0,0,1.2]];
	};
};

while {CL_degradeEffect > 0.10} do {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.0], [random(CL_degradeEffect),random(CL_degradeEffect),random(CL_degradeEffect),random(1)], [random(CL_degradeEffect),random(CL_degradeEffect),random(CL_degradeEffect), random(1)]];
	"colorCorrections" ppEffectCommit 1;
	CL_degradeEffect = CL_degradeEffect - 0.10;
	if (!alive player) then {
		CL_degradeEffect = .10;
	};
	if (CL_degradeEffect < 2.0) then {
		detach _smoke;
		deleteVehicle _smoke;
	};
	uiSleep 2.0;
};

CL_degradeEffect = nil;
"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
