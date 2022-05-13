#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens & initializes the chop shop menu.
*/
private["_control","_price","_nearVehicles","_chopMultiplier","_chopable","_nearUnits"];
if (CL_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc";};
if (playerSide != civilian) exitWith {hint localize "STR_NOTF_notAllowed";};
disableSerialization;
_chopable = CL_Settings(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),_chopable,25];
_nearUnits = (nearestObjects[player,["Man"],25]) arrayIntersect playableUnits;
if (count _nearUnits > 1) exitWith {hint localize "STR_NOTF_PlayerNear";};

CL_chopShop = _this select 3;
//Error check
if (count _nearVehicles isEqualTo 0) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
if (!(createDialog "Chop_Shop")) exitWith {hint localize "STR_Shop_ChopShopError";};

_control = CONTROL(39400,39402);
{
	if (alive _x) then {
		_className = typeOf _x;
		_classNamein = _className;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

		if (!isClass (missionConfigFile >> "CLCfgVehicles" >> _classNamein)) then {
			_classNamein = "Default"; //Use Default class if it doesn't exist
			diag_log format["%1: CLCfgVehicles class doesn't exist",_className];
		};

		_price = M_CONFIG(getNumber,"CLCfgVehicles",_classNamein,"price");
		_chopMultiplier = CL_Settings(getNumber,"vehicle_chopShop_multiplier");

		_price = _price * _chopMultiplier;
		if (!isNil "_price" && count crew _x isEqualTo 0) then {
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} forEach _nearVehicles;
