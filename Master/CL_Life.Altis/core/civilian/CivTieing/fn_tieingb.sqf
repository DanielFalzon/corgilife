/*
	File: fn_tieingb.sqf
*/
params [
	["_civ", Objnull, [Objnull]]
];

if (isNull _civ) exitWith {};

//Monitor excessive blindfolding
[] spawn {
	for "_i" from 0 to 1 step 0 do {
		uiSleep 5;
		
		if (!(player getVariable ["blindfolded",false])) exitWith {};

		if (!(player getVariable ["tied",false])) exitWith {
			player setVariable ["blindfolded",false,true];
			hint "You managed to remove the blindfold!";
		};

		if (!([east,getPos player,50] call CL_fnc_nearUnits) && !([civilian,getPos player,50] call CL_fnc_nearUnits) && (player getVariable ["blindfolded",false]) && isNull objectParent player) exitWith {

			player setVariable ["blindfolded",false,true];
			"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
			"colorCorrections" ppEffectCommit 3;
			"colorCorrections" ppEffectEnable false;	
			hint "You managed to remove the blindfold!";
		};
	};
};

cutText ["Removed Blindfold!","PLAIN",2];	

cutText ["You are blindfolded.","PLAIN",0,true];

"colorCorrections" ppEffectEnable true;			
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
"colorCorrections" ppEffectCommit 0.3;

removeHeadGear player;
player addheadgear "mgsr_headbag";

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		if !(player getvariable ["blindfolded",false]) exitWith {
			cutText ["You are no longer blind folded.!","PLAIN",2];	
			player setVariable ["blindfolded",false,true];
		};
		if (!alive player) exitWith {
			cutText ["You are no longer blind folded.!","PLAIN",2];	
			player setVariable ["blindfolded",false,true];
		};

		if (vehicle player != player) then {
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player]
			};
		};
		uiSleep 1;
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.3;
	};

	"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
	"colorCorrections" ppEffectCommit 3;
	"colorCorrections" ppEffectEnable false;	

	removeHeadGear player;
	if (alive player) exitWith {
		player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
		player setVariable ["blindfolded",false,true];
		detach player;
	};
};
