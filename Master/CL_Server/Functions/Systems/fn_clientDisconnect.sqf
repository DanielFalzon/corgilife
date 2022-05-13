#include "\CL_Server\script_macros.hpp"
/*
	File: fn_clientDisconnect.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house. Also, saves player infos & position.
*/
params [
	"_unit",
	"_id",
	"_uid",
	"_name"
];

if (isNull _unit) exitWith {};

private _side = side _unit;

private ["_alive","_position"];
//Save player info
if (isNil "HC_UID" || {!(_uid isEqualTo HC_UID)}) then {
	_position = getPosATL _unit;
	if ((getMarkerPos "respawn_civilian" distance _position) > 300) then {
		//Call UpdateRequest as unit
		[] remoteExecCall ["SOCK_fnc_updateRequest",_unit];

		//Civilian position
		if (CL_save_civilian_position && _side isEqualTo civilian) then {
			_alive = alive _unit;
			if (CL_HC_isActive) then {[_uid,_side,_alive,4,_position] remoteExec ["HC_fnc_updatePartial",HC_CL];} else {[_uid,_side,_alive,4,_position] spawn DB_fnc_updatePartial;};
		};
	};
};

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;
deleteVehicle _unit;

_uid spawn TON_fnc_houseCleanup;
