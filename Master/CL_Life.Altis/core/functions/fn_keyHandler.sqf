#include "..\..\script_macros.hpp"
/*
*	File: fn_keyHandler.sqf
*	Author: Bryan "Tonic" Boardwine
*
*	Description:
*	Main key handler for event 'keyDown'
*/
private ["_veh","_locked"];
private _ctrl = _this select 0;
private _code = _this select 1;
private _shift = _this select 2;
private _ctrlKey = _this select 3;
private _alt = _this select 4;
private _handled = false;

private _interactionKey = if (count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};

if (_code in (actionKeys "TacticalView")) exitWith {
	hint "You are not allowed to use Tactical View";
	true;
};

private _commandMode = actionKeys "forceCommandingMode";

if (_code in _commandMode) then {
	hint "You cannot use Command Mode.";
	_handled = true;
};

private _mapKey = (actionKeys "ShowMap" select 0);
//hint str _code;
private _interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || CL_isknocked || CL_istazed || CL_isdowned)) exitWith {
	true;
};

if (CL_is_arrested && {(_code in (actionKeys "GetOver") || {_code in (actionKeys "Prone")})}) exitWith {true;};

if (CL_action_inUse) exitWith {
	if (!CL_interrupted && _code in _interruptionKeys) then {
	CL_interrupted = true;
	};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(count (actionKeys "User10") isEqualTo 0) && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if (!CL_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn CL_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			CL_action_inUse = false;
		};
	};
	true;
};

if (CL_container_active) exitwith {
	//ignore movement actions
	private _allowedMoves = [
		"MoveForward",
		"MoveBack",
		"TurnLeft",
		"TurnRight",
		"MoveFastForward",
		"MoveSlowForward",
		"turbo",
		"TurboToggle",
		"MoveLeft",
		"MoveRight",
		"WalkRunTemp",
		"WalkRunToggle",
		"AdjustUp",
		"AdjustDown",
		"AdjustLeft",
		"AdjustRight",
		"Stand",
		"Crouch",
		"Prone",
		"MoveUp",
		"MoveDown",
		"LeanLeft",
		"LeanLeftToggle",
		"LeanRight",
		"LeanRightToggle"
	];
	if (({_code in (actionKeys _x)} count _allowedMoves) > 0) exitwith {
		false;
	};
	//handle other keys
	if (_code isEqualTo 57) then {//space key -> place
		CL_storagePlacing = 0 spawn CL_fnc_placestorage;
	} else { //other keys -> abort
		if (!isNull CL_storagePlacing) exitWith {}; //already placing down a box
		if (!isNull CL_container_activeObj) then {
			deleteVehicle CL_container_activeObj;
			titleText [localize "STR_NOTF_PlaceContainerAbort", "PLAIN"];
		};
		CL_container_active = false;
	};
	true;
};

// Spacebar (placeables)
if (CL_barrier_active) then {
	switch (_code) do {
		case 57: {
			[] spawn CL_fnc_placeablesPlaceComplete;
		};
	};
	true;
};

switch (_code) do {
	//Space key for Jumping
	case 57: {
		if (isNil "jumpActionTime") then {jumpActionTime = 0;};
		if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!CL_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player] remoteExec ["CL_fnc_jumpFnc",RANY]; //Global execution
			_handled = true;
		};
	};
/*
	//F1 Admin Menu (Admin Only)
	case 62: {
		if (FETCH_CONST(CL_adminlevel) isEqualTo 0) exitWith {};
		if (!dialog && (FETCH_CONST(CL_adminlevel) > 0)) then {
			[] spawn CL_fnc_adminInteractionMenu;
		};
		_handled = true;
	};
*/
	//EMP Key (EMP for Cops)
	case 37: {
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Light_01_F"])) then {
			[] call CL_fnc_openEmpMenu; [_this] call CL_fnc_isEmpOperator;
		};
	};

	//Surrender (Shift + B)
	case 48: {
		if (_shift) then {
			if (player getVariable ["playerSurrender",false]) then {
				player setVariable ["playerSurrender",false,true];
			} else {
				[] spawn CL_fnc_surrender;
			};
			_handled = true;
		};
	};

	case 15: {
		if (!_alt && !_ctrlKey && playerSide == west) then {
			[] call CL_fnc_radar;
		};
	};

	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if (!visibleMap) then {[] spawn CL_fnc_copMarkers;}};
			case independent: {if (!visibleMap) then {[] spawn CL_fnc_medicMarkers;}};
			case civilian: {if (!visibleMap) then {[] spawn CL_fnc_civMarkers;}};
		};
	};

	//Holster / recall weapon. (Shift + H)
	case 35: {
		if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
			CL_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};

		if (!_shift && _ctrlKey && !isNil "CL_curWep_h" && {!(CL_curWep_h isEqualTo "")}) then {
			if (CL_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon CL_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if (!CL_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn CL_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				CL_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case 19: {
		if (_shift) then {_handled = true;};
		if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
			[] call CL_fnc_restrainAction;
		};
		// Cop on Cop restraining for license addition / removal
		private _licenseRank = CL_Settings(getNumber,"license_minimum_rank");
		if (FETCH_CONST(CL_coplevel) >= _licenseRank) then {
		if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject isEqualTo west)} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "licensed")} && {speed cursorObject < 1}) then {
				[] call CL_fnc_copRestrainAction;
			};
		};
	};

	//Knock out, this is experimental and yeah... (Shift + G)
	case 34: {
		if (_shift) then {_handled = true;};
		if (_shift && playerSide in [west,civilian] && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
			if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !CL_knockout && !(player getVariable ["restrained",false]) && !CL_istazed && !CL_isknocked) then {
				[cursorObject] spawn CL_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if (!_alt && !_ctrlKey && !dialog && {!CL_action_inUse}) then {
			if (vehicle player != player && alive vehicle player) then {
				if ((vehicle player) in CL_vehicles) then {
					[vehicle player] spawn CL_fnc_openInventory;
				};
			} else {
				private "_list";
				_list = ((ASLtoATL (getPosASL player)) nearEntities [["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5]) select 0;
				if (!(isNil "_list")) then {
					_house = nearestObject [(ASLtoATL (getPosASL _list)), "House"];
					if (_house getVariable ["locked", false]) then {
						hint localize "STR_House_ContainerDeny";
					} else {
						[_list] spawn CL_fnc_openInventory;
					};
				} else {
					_list = ["landVehicle","Air","Ship"];
					if (KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {isNull objectParent player} && {alive cursorObject} && {!CL_action_inUse}) then {
						if (cursorObject in CL_vehicles || {locked cursorObject isEqualTo 0}) then {
							[cursorObject] spawn CL_fnc_openInventory;
						};
					};
				};
			};
		};
	};

	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if (_shift && playerSide in [west,independent]) then {
			if (vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_02_unarmed_F","B_T_LSV_01_unarmed_F","I_MRAP_03_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
				if (!isNil {vehicle player getVariable "lights"}) then {
					if (playerSide isEqualTo west) then {
						[vehicle player] call CL_fnc_sirenLights;
					} else {
						[vehicle player] call CL_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
	};

	//Tab (RADAR)
	case 15: {
		if( !_alt && !_ctrlKey) then {
			[] call CL_fnc_radar;
		};
	};

	//Y Player Menu
	case 21: {
		if !("ItemRadio" in (assignedItems player)) then {
			hint "You must have a radio to use this feature.";
		} else {
			if (!_alt && !_ctrlKey && !dialog && !(player getVariable ["restrained",false]) && {!CL_action_inUse}) then {
				[] call CL_fnc_openMainMenu;
			};
			
			if (_ctrlKey && !dialog && !(player getVariable ["restrained",false]) && {!CL_action_inUse}) then {
				[] call CL_fnc_p_openMenu;				
			};
		};
	};

	//F Key (Yelp & Sirens)
	case 33: {
		if (!_shift) then {
			if (playerSide in [west] && {vehicle player != player} && {!CL_siren2_active} && {((driver vehicle player) == player)}) then {
				[] spawn {
					CL_siren2_active = true;
					uiSleep 1.2;
					CL_siren2_active = false;
				};
				_veh = vehicle player;
				if (isNil {_veh getVariable "siren2"}) then {_veh setVariable ["siren2",false,true];};
				if ((_veh getVariable "siren2")) then {
					titleText ["Yelp Off","PLAIN"];
					_veh setVariable["siren2",false,true];
				} else {
					titleText ["Yelp On","PLAIN"];
					_veh setVariable["siren2",true,true];
					[_veh] remoteExec ["CL_fnc_copsiren2",RCLIENT];
				};
			};
		};

			if (_shift) then {
			if (playerSide in [west,independent] && {vehicle player != player} && {!CL_siren_active} && {((driver vehicle player) == player)}) then {
				[] spawn {
					CL_siren_active = true;
					uiSleep 4.7;
					CL_siren_active = false;
				};

				_veh = vehicle player;
				if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
				if ((_veh getVariable "siren")) then {
					titleText [localize "STR_MISC_SirensOFF","PLAIN"];
					_veh setVariable ["siren",false,true];
				} else {
					titleText [localize "STR_MISC_SirensON","PLAIN"];
					_veh setVariable ["siren",true,true];
					if(playerSide isEqualTo west) then {
						[_veh] remoteExec ["CL_fnc_copSiren",RCLIENT];
					} else {
						[_veh] remoteExec ["CL_fnc_medicSiren",RCLIENT];
					};
				};
			};
		};
	};

	// O Key (Not in use)
	case 24: {};

	//P Key (Suicide Vest)
	case 25: {
			if (!_alt && !_ctrlKey && !dialog) then {
					if ((time - CL_action_delay) < 15) exitWith {hint localize "STR_NOTF_ActionDelay";};
					[player] spawn CL_fnc_jihad;
					CL_action_delay = time;
			};
		};

	// F2
	case 60: {
		[] spawn CL_fnc_earPlugs;
		_handled = true;
	};

	// F5
	case 63: {
		if ((license_cop_cUC) && (playerside == west)) then {
			[] spawn CL_fnc_undercover;
			_handled = true;
		};
	};
	// Home (Ten Codes)
	case 199: {
		if (playerSide isEqualTo west) then {
			titleRsc ["RscDisplayTenCodes", "Plain"];
		};
	};

	//U Key
	case 22: {
		if (!_alt && !_ctrlKey) then {
			if (isNull objectParent player) then {
				_veh = cursorObject;
			} else {
				_veh = vehicle player;
			};

			if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
				if (_veh in CL_vehicles && {player distance _veh < 20}) then {
					_door = [_veh] call CL_fnc_nearestDoor;
					if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

					if (_locked isEqualTo 0) then {
						_veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
						_veh animateSource [format ["Door_%1_source",_door], 0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
						_veh animateSource [format ["Door_%1_source",_door], 1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if (_veh in CL_vehicles && {player distance _veh < 20}) then {
					if (_locked isEqualTo 2) then {
						if (local _veh) then {
							_veh lock 0;

							// BI
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_L_source',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_rear_source',1];
							_veh animateDoor ['Door_1_source',1];
							_veh animateDoor ['Door_2_source',1];
							_veh animateDoor ['Door_3_source',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							_veh animateDoor ['DoorL_Front_Open',1];
							_veh animateDoor ['DoorR_Front_Open',1];
							_veh animateDoor ['DoorL_Back_Open',1];
							_veh animateDoor ['DoorR_Back_Open ',1];
						} else {
							[_veh,0] remoteExecCall ["CL_fnc_lockVehicle",_veh];

							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_L_source',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_rear_source',1];
							_veh animateDoor ['Door_1_source',1];
							_veh animateDoor ['Door_2_source',1];
							_veh animateDoor ['Door_3_source',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							_veh animateDoor ['DoorL_Front_Open',1];
							_veh animateDoor ['DoorR_Front_Open',1];
							_veh animateDoor ['DoorL_Back_Open',1];
							_veh animateDoor ['DoorR_Back_Open ',1];
						};
						systemChat localize "STR_MISC_VehUnlock";
						[_veh,"unlockCarSound",50,1] remoteExec ["CL_fnc_say3D",RANY];
					} else {
						if(local _veh) then {
							_veh lock 2;

							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_L_source',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_rear_source',0];
							_veh animateDoor ['Door_1_source',0];
							_veh animateDoor ['Door_2_source',0];
							_veh animateDoor ['Door_3_source',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							_veh animateDoor ['DoorL_Front_Open',0];
							_veh animateDoor ['DoorR_Front_Open',0];
							_veh animateDoor ['DoorL_Back_Open',0];
							_veh animateDoor ['DoorR_Back_Open ',0];
						} else {
							[_veh,2] remoteExecCall ["CL_fnc_lockVehicle",_veh];

							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_L_source',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_rear_source',0];
							_veh animateDoor ['Door_1_source',0];
							_veh animateDoor ['Door_2_source',0];
							_veh animateDoor ['Door_3_source',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							_veh animateDoor ['DoorL_Front_Open',0];
							_veh animateDoor ['DoorR_Front_Open',0];
							_veh animateDoor ['DoorL_Back_Open',0];
							_veh animateDoor ['DoorR_Back_Open ',0];
						};
						systemChat localize "STR_MISC_VehLock";
						[_veh,"lockCarSound",50,1] remoteExec ["CL_fnc_say3D",RANY];
					};
				};
			};
		};
	};
};

_handled;
