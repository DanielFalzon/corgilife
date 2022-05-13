#include "..\..\script_macros.hpp"
/*
	File: fn_craftItem.sqf
	Author:
	Description:
*/
private ["_className","_items","_itemVar","_itemVarName","_vehicleColor","_spawnPoint","_vehicle","_displayName","_exit"];

disableSerialization;
if (isNull (findDisplay 100200)) exitWith {};
_className = lbData[100201,lbCurSel(100201)];
_items = _className call CL_fnc_craftingConfig;

_canCraft = true;
{
	_req = _x select 1;
	_itemVarName = ITEM_VARNAME(_x select 0);
	_itemVar = missionNamespace getVariable _itemVarName;
	if (_itemVar < _req) then {
		_canCraft = false;
	};
} forEach _items;
if (!(_canCraft)) exitWith {
	hint "You do not have the materials required to craft this item.";
};

_exit = false;
if (isClass (configFile >> "CfgVehicles" >> _className)) then {
	if (count(nearestObjects [getMarkerPos ("craft_vehicle_spawn"),["Car","Air"],5]) > 0) then {_exit = true;};
};
if (_exit) exitWith {
	hint "There is a vehicle on or near the spawn point.";
};

{
	[false,_x select 0,_x select 1] call CL_fnc_handleInv;
} forEach _items;

if (isClass (configFile >> "CfgVehicles" >> _className)) then {
	_vehicleColor = 0;
	if((lbSize 100208)-1 != -1) then {
		_vehicleColor = lbValue [100208,lbCurSel 100208];
	};
	_spawnPoint = getMarkerPos "craft_vehicle_spawn";
	_vehicle = createVehicle [_className,_spawnPoint,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos (_spawnPoint);
	_vehicle setVectorUp (surfaceNormal _spawnPoint);
	_vehicle lock 2;
	[_vehicle,_vehicleColor] call CL_fnc_colorVehicle;
	[_vehicle] call CL_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
	_vehicle disableTIEquipment true;

	_vehicle allowDamage true;
	CL_vehicles pushBack _vehicle;
	[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

	if (CL_HC_isActive) then {
		[(getPlayerUID player),playerSide,_vehicle,_vehicleColor] remoteExecCall ["HC_fnc_vehicleCreate",HC_CL];
	} else {
		[(getPlayerUID player),playerSide,_vehicle,_vehicleColor] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
	};

	_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
	hint format ["You have crafted a %1 with your items and have keys to the vehicle. You can find the vehicle on the nearby spawnpoint.",_displayName];
} else {
	if (player distance (getMarkerPos "craft_weapon_marker") < 15) then {
		[_className,true,false,true,false] call CL_fnc_handleItem;
	} else {
		if (uniform player isEqualTo "") then {
			player forceAddUniform _className;
		} else {
			player addItemToBackpack _className;
		};

		if (currentWeapon player isEqualTo "") then {
			player addWeapon _className;
		} else {
			player addItemToBackpack _className;
		};
	};

	_displayName = getText(configFile >> "CfgWeapons" >> _className >> "displayName");
	hint format ["You have crafted a %1 with your items. It has been given to you or placed in your backpack.",_displayName];
};
["ItemCrafted"] spawn mav_ttm_fnc_addExp;
[format ["%1 (%2) crafted a %3.",profileName,getPlayerUID player,_displayName],"AdminLog"] remoteExecCall ["A3Log",2];

closeDialog 0;
true;