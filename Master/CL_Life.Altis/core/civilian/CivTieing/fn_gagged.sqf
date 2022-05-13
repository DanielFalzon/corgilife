/*
    File: fn_gagged.sqf
    Author: Lowheartrate & Panda
*/
params [
	["_gagger",objNull,[objNull]]
];

hint format ["You have been gagged by %1.", _gagger getVariable["realname",_gagger]];
titleText ["You have a gag over your mouth, you can no longer talk!", "PLAIN"];
enableRadio false;
5 enableChannel false;
3 enableChannel false;
4 enableChannel false;
waitUntil{!(player getVariable ["gagged",false]) || !(player getVariable ["tied",false])};
hint format ["The gag has been removed, you can talk again!"];
titleText ["You are no longer gagged", "PLAIN"];
enableRadio true;
5 enableChannel true;
3 enableChannel true;
4 enableChannel true;
