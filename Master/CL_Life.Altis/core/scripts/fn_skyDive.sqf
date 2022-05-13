#include "..\..\script_macros.hpp"
/*
	File: fn_skyDiving.sqf
	Author: Ciaran Langton
	Edited: Dark
	Desc: Makes the player skydive.
*/
private _divePrice = CL_Settings(getNumber,"dive_price");

if (CL_cmoola < _divePrice) exitWith {hint format ["You do not have $%1 to skydive!",_divePrice];};
CL_cmoola = CL_cmoola - _divePrice;

if (CL_action_inUse) exitWith {};
CL_action_inUse = true;
//Save these two vars.
CL_skydive_backpack = backpack player;
CL_skydive_backpackItems = backpackItems player;

private _landingPos = getPosATL player; // was getPosATL player;

private _dropPos = _landingPos;
_dropPos set [2,6000]; //Drop from 6000m.

cutText ["", "BLACK OUT", 5];
uiSleep 3;
cutText ["You are now arriving at the drop zone. Please prepare to jump!", "BLACK FADED"];
0 cutFadeOut 999999;
uiSleep 1;
//SETUP SIM OF PLANE
player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian"); //Send them to a island to play the audio to simulate the plane.
player addBackpack "B_Parachute";
//Now play our audio
for "_i" from 0 to 3 do {
	playSound "airplane";
	uiSleep 2.2;
};
uiSleep 5;
player setPosATL _dropPos; //Set their position
_currentView = viewDistance;
setViewDistance 12000; //Up the view distance
cutText ["","PLAIN"];

waitUntil {isTouchingGround player;}; //wait for ground contact,
// OR (velocity player select 2 < 0.1) //or vertical speed less than 0.1m/sec (0.36km/h)

uiSleep 5; //wait 5 seconds for the XP hint to show
removeBackpack player;
player addBackpack CL_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,true] call CL_fnc_handleItem;
} forEach CL_skydive_backpackItems;
hint "You're done with the chute now, so here's your own backpack, come again soon!";

setViewDistance _currentView;
CL_action_inUse = false;
