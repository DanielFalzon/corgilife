#include "..\..\script_macros.hpp"
/*
	File: fn_playSlotMachine.sqf
	Author: Steven for WolfPack Server
	Description:
	Master handling for processing casino slots
*/
private ["_ui","_cP","_cost","_winAmount","_rollA","_rollB","_rollC","_slots","_idxA","_idxB","_idxC"];
private _source = param [0,objNull,[objNull]];
private _type = [_this,3,-1,[0]] call BIS_fnc_param;

//Error check
if (isNull _source) exitWith {};

if (playerSide != civilian) exitWith {
	hint "You are not allowed to gamble whilst on duty."; 
	CL_action_inUse = false;
};

if (player distance _source > 3.5) exitWith {
	hint "You need to stay within 3.5m to play."; 
	CL_action_inUse = false;
};

if (CL_action_inUse) exitWith {
	hint "You need to wait a few seconds before playing again!";
};

switch (_type) do {
	case 0:{_cost = 100;};//penny snatcher's
	case 1:{_cost = 500;};//average joe's
	case 2:{_cost = 1000;};//high roller's
};

_winAmount = 0;

if (CL_cmoola >= _cost) then {
	//Setup our background
	disableSerialization;

	CL_cmoola = CL_cmoola - _cost;
	[player,"caching",10,1] remoteExec ["CL_fnc_say3D",RANY];

	createDialog "CL_slotmachine";
	_ui = uiNameSpace getVariable "CL_slotmachine";
	_rollA = _ui displayCtrl 38207;
	_rollB = _ui displayCtrl 38208;
	_rollC = _ui displayCtrl 38209;
	_cP = 0.0;

	_slots = ["textures\Slots\SlotMachine\cherry.jpg","textures\Slots\SlotMachine\leaf.jpg","textures\Slots\SlotMachine\plum.jpg","textures\Slots\SlotMachine\grapes.jpg","textures\Slots\SlotMachine\glass.jpg","textures\Slots\SlotMachine\bell.jpg","textures\Slots\SlotMachine\seven.jpg","textures\Slots\SlotMachine\bar.jpg"];

	disableUserInput true;
	CL_frozen = true;

	CL_action_inUse = true;;
	[player,"slot_spin",10,1] remoteExec ["CL_fnc_say3D",RANY];


	while {true} do {
		uiSleep  0.1;
		_cP = _cP + 0.02;
		if (_cp <= 0.5)then {
			_idxA = [] call CL_fnc_SlotMachineRandomizer; // Get random number
			_rollA ctrlSetText (_slots select _idxA); // Show final state.
		};
		if (_cp <= 0.7)then {
			_idxB = [] call CL_fnc_SlotMachineRandomizer; // Get random number
			_rollB ctrlSetText (_slots select _idxB); // Show final state.
		};
		if (_cp <= 0.9)then {
			_idxC = [] call CL_fnc_SlotMachineRandomizer; // Get random number
			_rollC ctrlSetText (_slots select _idxC); // Show final state.
		};
		if (_cP >= 1.1) exitWith {
		};
		if (player distance _source > 3.5) exitWith {};
	};
	if (player distance _source > 3.5) exitWith {
	hint "You need to stay within 3.5m to play.";
	"progressBar" cutText ["","PLAIN"];
	CL_action_inUse = false;};

	//At the moment results are calculated by the combination of the 3 end positions of the rolls
	_winAmount = [_idxA,_idxB,_idxC,_type] call CL_fnc_SlotMachineRewards; 

	//Now see if we won
	if (_winAmount > 0) then {
		CL_cmoola = CL_cmoola + _winAmount;
		if (_winAmount >= 10000) then {
			hint format ["You inserted $%1 and you have won the jackpot! ($%2)",_cost,_winAmount]; 
			//titleText[format["You have won the jackpot of $%1",_winAmount],"PLAIN"];
			[player,"slot_payoff",15,1] remoteExec ["CL_fnc_say3D",RANY];
			// Does this work?
			_cP = 0.01;
			while {true} do {
				uiSleep  0.3;
				_cP = _cP + 0.10;
				if (_cP >= 1) exitWith {};
			};
		} else {
			//Won back money
			if (_winAmount isEqualTo _cost) then {
				hint format ["You have won your money back. ($%1)",_winAmount];
			} else {
				hint format ["You have won! ($%1, profit: $%2)",_winAmount,(_winAmount - _cost)];
			};
		};
		uiSleep 5;
	} else {
		hint format ["You have lost your bet. ($%1)",_cost];
		uiSleep 5;
	};
	CL_action_inUse = false;
} else {
	hint (format ["You need $%1 to play this machine.",_cost]); 
	CL_action_inUse = false;
};

disableUserInput false;
CL_frozen = false;

closeDialog 0;
