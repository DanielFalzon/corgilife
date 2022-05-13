/*
	File: fn_metalDetector.sqf
	Author:
	Edited: Dark
	Description: Guess what.. it's a..... Metal Detector!!!
*/
if ((playerSide isEqualTo civilian) && (player distance (getMarkerPos "kavala_hq") < 100)) then {
	hint "You have entered a restricted area, your guns and ammo have been removed and stored in a safe area";
	private _currentweapons = weapons player;
	private _currentmags = magazines player;

	{
	copDetectorCase addWeaponCargoGlobal [_x, 1];
	} forEach _currentweapons;

	{
	copDetectorCase addMagazineCargoGlobal [_x, 1];
	} forEach _currentmags;

	removeAllWeapons player;

} else {

	if ((playerSide isEqualTo civilian) && (player distance (getMarkerPos "athira_police") < 100)) then {
	hint "You have entered a restricted area, your guns and ammo have been removed and stored in a safe area";
	private _currentweapons = weapons player;
	private _currentmags = magazines player;

	{
	sheriffDetectorCase addWeaponCargoGlobal [_x, 1];
	} forEach _currentweapons;

	{
	sheriffDetectorCase addMagazineCargoGlobal [_x, 1];
	} forEach _currentmags;

	removeAllWeapons player;
	};
};