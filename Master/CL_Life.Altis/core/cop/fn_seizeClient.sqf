#include "..\..\script_macros.hpp"
/*
	File: fn_seizeClient.sqf
	Author: Daniel "Skalicon" Larusso
	Edited: Dark
	Description:
	Description: Takes a players weapons and mags, then drops them on the ground.
*/
private _safeItems = CL_Settings(getArray,"patdown_safeItems");
private _unit = player;
private _weps = [];
private _mags = magazinesAmmoFull player;
private _pwItems = primaryWeaponItems player;
private _swItems = secondaryWeaponItems player;
private _hgItems = handgunItems player;
private "_items";

[_unit,"patdown",5,1] remoteExec ["CL_fnc_say3D",RANY];
titleText [localize "STR_NOTF_SeizeIllegals","PLAIN"];

{
	player removeMagazine _x;
} forEach (magazines player);

if (primaryWeapon player != "") then {
	_weps pushBack (primaryWeapon player);
	player removeWeapon (primaryWeapon player);
};

if (secondaryWeapon player != "") then {
	_weps pushBack (secondaryWeapon player);
	player removeWeapon (secondaryWeapon player);
};

if (handgunWeapon player != "") then {
	_weps pushBack (handgunWeapon player);
	player removeWeapon (handgunWeapon player);
};


{
	_items = _x;
	{
		player unassignItem _x;
		player removeItem _x;
	} forEach _items;

} forEach [_hgItems, _pwItems, _swItems]; 

{
	if (!(_x in _safeItems)) then {
		player removeItem _x;
		_weps pushBack _x;
	};

} forEach (weapons player);

 private _holder = createVehicle [ "GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];

{
	_holder addWeaponCargoGlobal [_x,1];
} forEach _weps;

{
	_holder addMagazineCargoGlobal [_x select 0,1];
} forEach _mags;

{
	_items = _x;
	{
		_holder addItemCargoGlobal [_x,1];
	} forEach _items;
} forEach [_hgItems, _pwItems, _swItems];

call CL_fnc_saveGear;
