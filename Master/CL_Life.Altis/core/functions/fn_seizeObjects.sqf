/*
	File: fn_seizeObjects.sqf
	Author: Daniel "Skalicon" Larusso
	Edited By: Travis Boi
	Edited further by: Dark
	Description:
	Sieze's Objects or Weapons on Ground
*/
private _clear = nearestObjects [player,["WeaponHolder"],3];
_clear = _clear + nearestObjects [player,["GroundWeaponHolder"],3];
_clear = _clear + nearestObjects [player,["WeaponHolderSimulated"],3];
private _destroyed = 0;
for "_i" from 0 to count _clear - 1 do {
		_destroyed = _destroyed + 1;
		deleteVehicle (_clear select _i);
		uiSleep 0.056;
};
_destroyed = _destroyed - 1;
titleText [format ["Seized %1 ground objects in the vicinity.", _destroyed],"PLAIN"];
