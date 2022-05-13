/*
	File: fn_safeZones.sqf
	Author: Jesse "tkcjesse" Schultz
	Edited: Dark
	Description:
	Safe Zone onFired Event Handler

	Safe Zones:
	1 = Police Station
	2 = Hospital
*/
private _weapon = _this select 1;
private _projectile = _this select 6;
private _safeZones = [["sz_1",40],["sz_2",35],["sz_3",70],["sz_4",50],["sz_5",40],["sz_6",55],["sz_7",70]];

if (playerSide isEqualTo civilian) then {
	if (CL_safezone_shots isEqualTo 9) exitWith {
		deleteVehicle _projectile;
		hint "Your weapon has been removed for firing in a safezone!";
		CL_safezone_shots = 0;
		player removeWeapon _weapon;
	};

	if ({player distance getMarkerPos (_x select 0) < _x select 1} count _safeZones > 0) then {
		deleteVehicle _projectile;
		systemChat "Your bullets do no harm! Do not shoot in safezones!";
		if (CL_safezone_shots isEqualTo 1 || CL_safezone_shots isEqualTo 3 || CL_safezone_shots isEqualTo 7) then
		{
			hint "Repeatedly shooting in the safezone will remove your weapon!";
		};
		CL_safezone_shots = CL_safezone_shots + 1;
	};
};
