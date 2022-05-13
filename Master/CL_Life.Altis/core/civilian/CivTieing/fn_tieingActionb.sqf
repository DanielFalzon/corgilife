/*
	File: fn_tieingActionb.sqf
*/
private _unit = cursorTarget;
if (isNull _unit) exitWith {}; //Not valid
if ((_unit getVariable ["blindfolded",false])) exitWith {};

if ((CL_action_inUse) || (player getVariable ["tied",false]) || (player getVariable ["restrained",false])) exitWith { 
	hintSilent "You can not do that.";
}; 

if (player == _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
//Broadcast!

if (CL_inv_blindfold < 1) exitWith {
	hintSilent "You need to buy a blindfold from the market to do this.";
};

CL_inv_blindfold = CL_inv_blindfold - 1;

hintSilent "Blindfolding...";
_cme = 1;
_myposy = getPos player;

for "_i" from 0 to 1 step 0 do {
	CL_action_inUse = true;
	if ( player distance _myposy > 2.5 ) exitwith { 
		hint "Too far away!";
	};
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_cme = _cme + 1;
	if (_cme > 3) exitwith {
		cursorTarget setVariable["blindfolded",true,true];
		[player] remoteExecCall ["CL_fnc_tieingb", cursorTarget];
	};
};

CL_action_inUse = false;
