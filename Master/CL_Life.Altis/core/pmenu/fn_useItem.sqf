#include "..\..\script_macros.hpp"
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if ((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull","medicWater"]): {
		if(([false,_item,1] call CL_fnc_handleInv)) then {
			CL_thirst = 100;
			if (CL_Settings(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 0;};
			if (_item isEqualTo "redgull" && {CL_Settings(getNumber,"enable_fatigue") isEqualTo 1}) then {
				[] spawn {
					CL_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - CL_redgull_effect) > (3 * 60))};
					player enableFatigue true;
				};
			};
		};
	};

	case (_item isEqualTo "boltcutter"): {
		[cursorObject] spawn CL_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item isEqualTo "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorObject] spawn CL_fnc_blastingCharge;
		closeDialog 0;
	};

	case (_item isEqualTo "defusekit"): {
		[cursorObject] spawn CL_fnc_defuseKit;
	};

	case (_item isEqualTo "storagesmall"): {
		[false] call CL_fnc_storageBox;
	};

	case (_item isEqualTo "storagebig"): {
		[true] call CL_fnc_storageBox;
	};

	case (_item isEqualTo "spikeStrip"): {
//		if !(playerSide isEqualTo west) exitWith {hint "Only police officers are allowed to use spikestrips.";};
		if(!isNull CL_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment";};
		if(([false,_item,1] call CL_fnc_handleInv)) then {
			[] spawn CL_fnc_spikeStrip;
		};
	};

	case (_item isEqualTo "fuelFull"): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle";};
		[] spawn CL_fnc_jerryRefuel;
		closeDialog 0;
	};

	case (_item isEqualTo "fuelEmpty"): {
		[] spawn CL_fnc_jerryCanRefuel;
		closeDialog 0;
	};

	case (_item isEqualTo "lockpick"): {
		[] spawn CL_fnc_lockpick;
		closeDialog 0;
	};

	case (_item isEqualTo "skeletonKey"): {
		[] spawn CL_fnc_skeletonKey;
		closeDialog 0;
	};

	case (_item isEqualTo "speedbomb"): {
		[] spawn CL_fnc_speedBomb;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach","medicFood","coconut","banana"]): {
		if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
			if ([false,_item,1] call CL_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = CL_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {CL_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {CL_hunger = 100;};
					default {CL_hunger = _sum;};
				};
			};
		};
	};

	case (_item isEqualTo "gpstracker"): {
		[cursorTarget] spawn CL_fnc_gpsTracker;
	};

	case (_item isEqualTo "heroin_processed"): {
		if ([false,_item,1] call CL_fnc_handleInv) then {
			[] spawn CL_fnc_heroine;
		};
	};

	case (_item isEqualTo "cocaine_processed"): {
		if ([false,_item,1] call CL_fnc_handleInv) then {
			[] spawn CL_fnc_cocaine;
		};
	};

	case (_item isEqualTo "methamphetamine"): {
		if ([false,_item,1] call CL_fnc_handleInv) then {
			[] spawn CL_fnc_moonshine;
		};
	};

	case (_item isEqualTo "marijuana"): {
		if( [false,_item,1] call CL_fnc_handleInv) then {
			[] spawn CL_fnc_weed;
		};
	};

	case (_item isEqualTo "bottled_rum"): {
		if( [false,_item,1] call CL_fnc_handleInv) then {
			[] spawn CL_fnc_rum;
		};
	};

	case (_item isEqualTo "kidney"):{
		if ([false,_item,1] call CL_fnc_handleInv) then {
			player setVariable ["missingOrgan",false,true];
			CL_thirst = 100;
			CL_hunger = 100;
			CL_max_health = 100;
			player setDamage 0;
			player setFatigue .5;
		};
	};

	case (_item isEqualTo "flesh"):{
		if ([false,_item,1] call CL_fnc_handleInv) then {
			player setVariable ["missingFlesh",false,true];
			CL_thirst = 100;
			CL_hunger = 100;
			CL_max_health = 100;
			player setDamage 0;
			player setFatigue .5;
		};
	};

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call CL_fnc_p_updateMenu;
[] call CL_fnc_hudUpdate;
