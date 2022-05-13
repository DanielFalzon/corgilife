#include "..\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	All survival? things merged into one thread.
*/
private _fnc_food =  {
	if (CL_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
	else
	{
		CL_hunger = CL_hunger - 10;
		[] call CL_fnc_hudUpdate;
		if (CL_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch (CL_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {
				hint localize "STR_NOTF_EatMSG_3";
				if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
			};
		};
	};
};

private _fnc_water = {
	if (CL_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
	else
	{
		CL_thirst = CL_thirst - 10;
		[] call CL_fnc_hudUpdate;
		if (CL_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		switch (CL_thirst) do  {
			case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
			case 20: {
				hint localize "STR_NOTF_DrinkMSG_2";
				if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
			};
			case 10: {
				hint localize "STR_NOTF_DrinkMSG_3";
				if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
			};
		};
	};
};

[] spawn  {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {(player getVariable "missingOrgan")};
		CL_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			CL_thirst = 50;
			CL_hunger = 50;
			if(damage player < (1 - CL_max_health)) then {player setDamage (1 - CL_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			uiSleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		CL_max_health = 1;
	};
};

[] spawn  {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {(player getVariable "missingFlesh")};
		CL_max_health = .50;
		while{(player getVariable "missingFlesh")} do {
			CL_thirst = 50;
			CL_hunger = 50;
			if(damage player < (1 - CL_max_health)) then {player setDamage (1 - CL_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			uiSleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		CL_max_health = 1;
	};
};

//Setup the time-based variables.
private _foodTime = time;
private _waterTime = time;
private _walkDis = 0;
private _bp = "";
private _lastPos = visiblePosition player;
_lastPos = (_lastPos select 0) + (_lastPos select 1);
_lastState = vehicle player;

for "_i" from 0 to 1 step 0 do {
	/* Thirst / Hunger adjustment that is time based */
	if ((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
	if ((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};

	/* Adjustment of carrying capacity based on backpack changes */
	if (backpack player isEqualTo "") then {
		CL_maxWeight = CL_Settings(getNumber,"total_maxWeight");
		_bp = backpack player;
	} else {
		if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
			_bp = backpack player;
			CL_maxWeight = CL_Settings(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
		};
	};

	/* Check if the player's state changed? */
	if (vehicle player != _lastState || {!alive player}) then {
		[] call CL_fnc_updateViewDistance;
		_lastState = vehicle player;
	};

	/* Check if the weight has changed and the player is carrying to much */
	if (CL_carryWeight > CL_maxWeight && {!isForcedWalk player}) then {
		player forceWalk true;
		if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
		hint localize "STR_NOTF_MaxWeight";
	} else {
		if (isForcedWalk player) then {
			player forceWalk false;
		};
	};

	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if (!alive player) then {_walkDis = 0;} else {
		private _curPos = visiblePosition player;
		_curPos = (_curPos select 0) + (_curPos select 1);
		if (!(_curPos isEqualTo _lastPos) && {(isNull objectParent player)}) then {
			_walkDis = _walkDis + 1;
			if (_walkDis isEqualTo 650) then {
				_walkDis = 0;
				CL_thirst = CL_thirst - 5;
				CL_hunger = CL_hunger - 5;
				[] call CL_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (_lastPos select 0) + (_lastPos select 1);
	};

	//--- Gold Bar Weight;
	if (CL_inv_goldBar > 0) then {
		player forceWalk true;
		//player setFatigue 1;
		hint "You cannot run whilst carrying gold bars, they are too heavy!";
	} else {
		if (isForcedWalk player) then {
			player forceWalk false;
		};
	};

	if (player distance (getMarkerPos "uranium_area") < 300) then {
		if ((uniform player isEqualTo "U_I_pilotCoveralls") && (headgear player isEqualTo "H_PilotHelmetFighter_O")) then {
			hintSilent "";
		} else {
			hint "You are in a Radio-Active Zone! You are taking Radiation Damage! Find a Radiation Suit or leave the area!";
			private _damage = damage player;
			_damage = _damage + 0.02;
			[player,_damage] remoteExec ["CL_fnc_setDamage",RCLIENT];
			[] call CL_fnc_hudUpdate;
		};
	};
	uiSleep 1;
};

[] spawn {
for "_i" from 0 to 1 step 0 do {
	enableSentences false;
	uiSleep 20;
	};
};
