#include "..\..\script_macros.hpp"
/*
	File: fn_getCraftable.sqf
	Author:
	Description:
*/
private ["_display","_className","_items","_name","_color","_canCraft","_icon","_itemName","_description","_ctrl","_icon","_colorArray","_numberIndexColorArray","_req","_itemVarName","_itemVar","_equipmentArray"];

if (isNull (findDisplay 100200)) exitWith {};
disableSerialization;

ctrlEnable [100206,false];
_display = findDisplay 100200;
_requiredItems = _display displayCtrl 100202;
_description = _display displayCtrl 100209;
_className = lbData[100201,lbCurSel(100201)];
_name = "Item";
_desc = "No description is available.";
_items = _className call CL_fnc_craftingConfig;

if (isClass (configFile >> "CfgVehicles" >> _className)) then {
	_vehicleInfo = [_className] call CL_fnc_fetchVehInfo;
	_trunkSpace = [_className] call CL_fnc_vehicleWeightCfg;
	_icon = _vehicleInfo select 2;
	_name = _vehicleInfo select 3;
	_desc = format[
		"Max Speed: %1 km/h<br/>Horse Power: %2<br/>Passenger Seats: %3<br/>Trunk Capacity: %4<br/>Fuel Capacity: %5<br/>Armor Rating: %6",
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
		_vehicleInfo select 12,
		_vehicleInfo select 9
	];

	_ctrl = CONTROL(100200,100208);
	lbClear _ctrl;

	_colorArray = M_CONFIG(getArray,"CLCfgVehicles",_className,"textures");
	{
		_flag = (_x select 1);
		_textureName = (_x select 0);
		if (_flag in ["civ","reb","corp"]) then {
			_ctrl lbAdd _textureName;
			_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
		};
	} forEach _colorArray;

	_numberIndexColorArray = [];
	for "_i" from 0 to (count(_colorArray) - 1) do {
		_numberIndexColorArray pushBack _i;
	};
	_indexrandom = _numberIndexColorArray call BIS_fnc_selectRandom;
	_ctrl lbSetCurSel _indexrandom;

	if ((lbSize _ctrl)-1 != -1) then { ctrlShow[100208,true]; } else { ctrlShow[100208,false]; };
} else {
	_equipmentArray = ["U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_GhillieSuit","U_O_OfficerUniform_ocamo","U_O_T_FullGhillie_tna_F","U_I_pilotCoveralls",
		"V_PlateCarrierIAGL_oli","V_PlateCarrierIAGL_dgtl","V_PlateCarrierSpec_blk","V_PlateCarrierIA2_dgtl","V_PlateCarrierH_CTRG","V_PlateCarrier2_rgr_noflag_F",
		"H_PilotHelmetFighter_O","H_PilotHelmetHeli_I","H_HelmetB_TI_tna_F","H_HelmetLeaderO_ocamo","H_HelmetSpecB_blk"];
	if (_className in _equipmentArray) then {
		_desc = "This item will be applied automatically if you are not wearing a uniform. Otherwise it will placed in your backpack. Make sure you have space!";
		//ctrlShow [100200,100209];
	} else {
		_desc = format["Type: %1<br/>Max Range: %2m",
			getText (configFile >> "CfgWeapons" >> _className >> "descriptionShort"),
			getNumber (configFile >> "CfgWeapons" >> _className >> "maxRange")
		];
	};
};

_description ctrlSetStructuredText parseText _desc;

_canCraft = true;
lbClear _requiredItems;
{
	_req = _x select 1;
	_itemVarName = ITEM_VARNAME(_x select 0);
	_itemVar = missionNamespace getVariable _itemVarName;
	if (_itemVar >= _req) then {
		_color = [0, 1, 0, 1];
	} else {
		_color = [1, 0, 0, 1];
		_canCraft = false;
	};
	_itemName = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
	_requiredItems lbAdd format ["%1 - %2",_req,localize _itemName];
	_requiredItems lbSetColor [(lbSize _requiredItems)-1, _color];
} forEach _items;
if (count _items < 1) then {
	_canCraft = false;
	_requiredItems lbAdd "You do not know how to produce this item.";
};

ctrlEnable [100206, _canCraft];