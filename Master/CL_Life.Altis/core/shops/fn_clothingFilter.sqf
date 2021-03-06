#include "..\..\script_macros.hpp"
/*
	File: fn_clothingFilter.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Functionality for filtering clothing types in the menu.
*/

disableSerialization;

params [
	"", //Control
	["_selection", 0, [0]]
];

CL_clothing_filter = _selection;

switch (_selection) do {
	case 4: {
		CL_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
		CL_shop_cam camSetPos (player modelToWorld [1,-4,2]);
		CL_shop_cam camCommit 1;
	};

	case 0: {
		CL_shop_cam camSetTarget (player modelToWorld [0,0,1]);
		CL_shop_cam camSetPos (player modelToWorld [1,4,2]);
		CL_shop_cam camCommit 1;
	};

	case 3: {
		CL_shop_cam camSetTarget (player modelToWorld [0,0,1.4]);
		CL_shop_cam camSetPos (player modelToWorld [-.1,2,1.4]);
		CL_shop_cam camCommit 1;
	};

	default {
		CL_shop_cam camSetTarget (player modelToWorld [0,0,1.6]);
		CL_shop_cam camSetPos (player modelToWorld [-.5,1,1.6]);
		CL_shop_cam camCommit 1;
	};
};

if (isNull (findDisplay 3100)) exitWith {};

private _list = CONTROL(3100,3101);
lbClear _list;

private _configArray = switch (_selection) do {
	case 0: {M_CONFIG(getArray,"Clothing",CL_Clothing_store,"uniforms");};
	case 1: {M_CONFIG(getArray,"Clothing",CL_Clothing_store,"headgear");};
	case 2: {M_CONFIG(getArray,"Clothing",CL_Clothing_store,"goggles");};
	case 3: {M_CONFIG(getArray,"Clothing",CL_Clothing_store,"vests");};
	case 4: {M_CONFIG(getArray,"Clothing",CL_Clothing_store,"backpacks");};
};

private "_pic";
private "_details";

{
	_x params [
		["_className", "NONE", [""]],
		["_displayName", "", [""]],
		["_price", 1000, [0]]
	];

	if !(_className isEqualTo "NONE") then {
		_details = [_className] call CL_fnc_fetchCfgDetails;
		_pic = (_details select 2);
	};

	if ([_x] call CL_fnc_levelCheck) then {

		if (isNil "_details") then {
			_list lbAdd _displayName;
			_list lbSetData [(lbSize _list)-1,_className];
		} else {
			if (_displayName isEqualTo "") then {
				_list lbAdd (_details select 1);
			} else {
				_list lbAdd _displayName;
			};

			_list lbSetData [(lbSize _list)-1,_className];
			_list lbSetValue [(lbSize _list)-1,_price];
			_list lbSetPicture [(lbSize _list)-1,_pic];
		};
	};
	
	true

} count _configArray;
