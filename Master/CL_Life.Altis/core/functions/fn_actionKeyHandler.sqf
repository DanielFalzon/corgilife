#include "..\..\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private _curObject = cursorObject;
if (CL_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if (CL_interrupted) exitWith {CL_interrupted = false;};
private _isWater = surfaceIsWater (visiblePositionASL player);

if (playerSide isEqualTo west && {player getVariable ["isEscorting",false]}) exitWith {
	[] call CL_fnc_copInteractionMenu;
};

if (playerSide isEqualTo civilian && {player getVariable ["isEscorting",false]} && (!(_curObject getVariable ["restrained",false]))) exitWith {
    [] call CL_fnc_copInteractionMenu;
};

if (CL_Settings(getNumber,"global_ATM") isEqualTo 1) then{
	//Check if the player is near an ATM.
	if ((call CL_fnc_nearATM) && {!dialog}) exitWith {
		[] call CL_fnc_atmMenu;
	};
};

if (isNull _curObject) exitWith {
	if (_isWater) then {
		private _fish = (nearestObjects[player,(CL_Settings(getArray,"animaltypes_fish")),3]) select 0;
		if (!isNil "_fish") then {
			if (!alive _fish) then {
				[_fish] call CL_fnc_catchFish;
			};
		};
	} else {
		private _animal = (nearestObjects[player,(CL_Settings(getArray,"animaltypes_hunting")),3]) select 0;
		if (!isNil "_animal") then {
			if (!alive _animal) then {
				[_animal] call CL_fnc_gutAnimal;
			};
		} else {
			private "_handle";
			if (playerSide isEqualTo civilian && !CL_action_gathering) then {
		private _whatIsIt = [] call CL_fnc_whereAmI;
				if (CL_action_gathering) exitWith {};				 //Action is in use, exit to prevent spamming.
				switch (_whatIsIt) do {
					case "mine" : {
						_handle = [] spawn CL_fnc_mine;
						};
					default {
						_handle = [] spawn CL_fnc_gather;
						};
				};
				CL_action_gathering = true;
				waitUntil {scriptDone _handle};
				CL_action_gathering = false;
			};
		};
	};
};

if ((_curObject isKindOf "B_supplyCrate_F" || _curObject isKindOf "Box_IND_Grenades_F") && {player distance _curObject < 3} ) exitWith {
	if (alive _curObject) then {
		[_curObject] call CL_fnc_containerMenu;
	};
};

if(_curObject isKindOf "House_F" && {player distance _curObject < 12} || ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curObject || (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curObject || ((nearestObject [[20894.2,19226.8,0],"Land_Dome_Big_F"]) == _curObject))) exitWith {
	[_curObject] call CL_fnc_houseMenu;
};

if (dialog) exitWith {}; //Don't bother when a dialog is open.
if (vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
CL_action_inUse = true;

//Temp fail safe.
[] spawn {
	uiSleep 60;
	CL_action_inUse = false;
};

//Check if it's a dead body.
if (_curObject isKindOf "Man" && !(_curObject isKindOf "Animal") && {!alive _curObject} && !(_curObject getVariable ["Revive",false])) exitWith {
	if (playerSide isEqualTo independent) then {
		if (CL_inv_defibrillator > 0) then {
			[_curObject] call CL_fnc_revivePlayer;
		};
	} else {
		if ((playerSide isEqualTo west) && {(independent countSide playableUnits) < 3}) then {
			if (CL_inv_defibrillator > 0) then
			{
				[_curObject] call CL_fnc_revivePlayer;
			};
		} else {
			hint "You cannot revive someone whilst 3 or more medics are online.";
		};
	};
};

//If target is a player then check if we can use the cop menu.
if (isPlayer _curObject && _curObject isKindOf "Man") then {
	if ((_curObject getVariable ["restrained",false]) && !dialog && playerSide isEqualTo west) then {
		[_curObject] call CL_fnc_copInteractionMenu;
	};

	if ((!(_curObject getVariable ["restrained",false])) && !dialog && playerSide isEqualTo civilian) then {
        [_curObject] call CL_fnc_copInteractionMenu;
    };

	if ((_curObject getVariable ["licensed",false]) && !dialog && playerSide isEqualTo west) then {
		[_curObject] call CL_fnc_copLicenseMenu;
	};

} else {
	//OK, it wasn't a player so what is it?
	private _list = ["landVehicle","Ship","Air"];
	private _isVehicle = if (KINDOF_ARRAY(_curObject,_list)) then {true} else {false};
	private _miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];

	//It's a vehicle! open the vehicle interaction key!
	if (_isVehicle) then {
		if (!dialog) then {
			if (player distance _curObject < ((boundingBox _curObject select 1) select 0)+2 && (!(player getVariable ["restrained",false])) && (!(player getVariable ["playerSurrender",false])) && !CL_isdowned && !CL_isknocked && !CL_istazed) then {
				[_curObject] call CL_fnc_vInteractionMenu;
			};
		};
	} else {
		//OK, it wasn't a vehicle so let's see what else it could be?
		if ((typeOf _curObject) in _miscItems) then {
			[_curObject,player,false] remoteExecCall ["TON_fnc_pickupAction",RSERV];
		} else {
			//It wasn't a misc item so is it money?
			if ((typeOf _curObject) isEqualTo "Land_Money_F" && {!(_curObject getVariable ["inUse",false])}) then {
				[_curObject,player,true] remoteExecCall ["TON_fnc_pickupAction",RSERV];
			};
		};
	};
};
