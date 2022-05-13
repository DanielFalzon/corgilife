/*
	File: fn_copDoors.sqf
	Author:
	Edited: Dark
	Description: Auto opens doors for cops
*/

if (playerSide isEqualTo west) then {
	[] spawn {
		_copDome = nearestObject [[20832.842,7266.885,0],"Land_Dome_Small_F"];
		_copDome animate ["door_1A_move",1]; _copDome animate ["door_1B_move",1];
		uiSleep 2.0;
		_copDome animate ["door_1A_move",0]; _copDome animate ["door_1B_move",0];
	};
};
