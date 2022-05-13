#include "..\..\script_macros.hpp"
/*
	File: fn_craftingMenu.sqf
	Author:
	Description:
*/
private ["_manufacturer","_display","_craftClassnames","_craftList","_picture","_name"];
_manufacturer = _this select 3;

if (!dialog) then {
	createDialog "CL_crafting_menu";
};

disableSerialization;
_display = findDisplay 100200;
_craftList = _display displayCtrl 100201;
lbClear _craftList;

_name = switch (_manufacturer) do {
	case "weapons": {"Firearm Manufacturer"};
	case "vehicles": {"Vehicle Manufacturer"};
	case "equipment": {"Clothing Manufacturer"};
	case "attachments": {"Attachment Manufacturer"};
	default {"Item Manufacturer"};
};
(_display displayCtrl 100207) ctrlSetText _name;
ctrlEnable [100206,false];

_craftClassnames = _manufacturer call CL_fnc_craftingList;

{
	if (isClass (configFile >> "CfgVehicles" >> _x)) then {
		_name = getText(configFile >> "CfgVehicles" >> _x >> "displayName");
	} else {
		_name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
	};
	_craftList lbAdd _name;
	_craftList lbSetData [(lbSize _craftList)-1, _x];

	if (isClass (configFile >> "CfgVehicles" >> _x)) then {
		_picture = getText(configFile >> "CfgVehicles" >> _x >> "picture");
	} else {
		_picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");
	};
	_craftList lbSetPicture [(lbSize _craftList)-1,_picture];
} forEach _craftClassnames;

lbSetCurSel [100201,0];