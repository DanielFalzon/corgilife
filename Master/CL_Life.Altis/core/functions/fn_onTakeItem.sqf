#include "..\..\script_macros.hpp"
/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blocks the unit from taking something they should not have.
*/
params [
	["_unit",objNull,[objNull]],
	["_container",objNull,[objNull]],
	["_item","",[""]]
];

if (isNull _unit || _item isEqualTo "") exitWith {}; //Bad thingies?
private _restrictedClothing = CL_Settings(getArray,"restricted_uniforms");
private _restrictedWeapons = CL_Settings(getArray,"restricted_weapons");

switch (playerSide) do
{
	case west: {
		if (_item in ["U_Rangemaster"]) then {
			[] call CL_fnc_playerSkins;
		};
	};

	case civilian: {
		if (CL_Settings(getNumber,"restrict_clothingPickup") isEqualTo 1) then {
			if (_item in _restrictedClothing) then {
				[_item,false,false,false,false] call CL_fnc_handleItem;
			};
		};
		if (CL_Settings(getNumber,"restrict_weaponPickup") isEqualTo 1) then {
			if (_item in _restrictedWeapons) then {
				[_item,false,false,false,false] call CL_fnc_handleItem;
			};
		};
		if (_item in ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"]) then {
			[] call CL_fnc_playerSkins;
		};
	};

	case independent: {
		if (_item in ["U_Rangemaster"]) then {
			[] call CL_fnc_playerSkins;
		};
		// -- Restrict Weapons
		if (CL_Settings(getNumber,"restrict_medic_weapons") isEqualTo 1) then {
			// -- Check if the type is a weapon
			if (isClass (configFile >> "CfgWeapons" >> _item)) then { 
				// -- Remove all weapons from player (_unit)
				removeAllWeapons _unit;
			};
		};
	};
};
