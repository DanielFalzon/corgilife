/*
	File: fn_playerCount.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrieves the amount of players on per side specified.
*/
params [
	["_faction",civilian,[independent]]
];

{side _x isEqualTo _faction} count playableUnits;
