#include "..\..\script_macros.hpp"
/*
	File : removeContainer.sqf
	Author: NiiRoZz

	Description:
	Delete Container from house storage
*/
params [
	["_container",objNull,[objNull]]
];

private _containerType = typeOf _container;
private _house = nearestObject [player, "House"];

if (!(_house in CL_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse";};
if (isNull _container) exitWith {};
private _containers = _house getVariable ["containers",[]];
closeDialog 0;

private _action = [
	format[localize "STR_House_DeleteContainerMSG"],localize "STR_pInAct_RemoveContainer",localize "STR_Global_Remove",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	private _box = switch (_containerType) do {
		case ("B_supplyCrate_F"): {"storagebig"};
		case ("Box_IND_Grenades_F"): {"storagesmall"};
		default {"None"};
	};
	if (_box == "None") exitWith {};

	private _diff = [_box,1,CL_carryWeight,CL_maxWeight] call CL_fnc_calWeightDiff;
	if (_diff isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};

	if (CL_HC_isActive) then {
		[_container] remoteExecCall ["HC_fnc_deleteDBContainer",HC_CL];
	} else {
		[_container] remoteExecCall ["TON_fnc_deleteDBContainer",RSERV];
	};

	{
		if (_x == _container) then {
			_containers deleteAt _forEachIndex;
		};
	} forEach _containers;
	_house setVariable ["containers",_containers,true];

	[true,_box,1] call CL_fnc_handleInv;
};
