#include "..\..\script_macros.hpp"
/*
	File: fn_updatePartial.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through remoteExec
*/
private _mode = param [0,0,[0]];
private _packet = [getPlayerUID player,playerSide,nil,_mode];
private _array = [];
private _flag = switch (playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

switch (_mode) do {
	case 0: {
		_packet set[2,CL_cmoola];
	};

	case 1: {
		_packet set[2,CL_bmoola];
	};

	case 2: {
		{
			_varName = LICENSE_VARNAME(configName _x,_flag);
			_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
		} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

		_packet set[2,_array];
	};

	case 3: {
		[] call CL_fnc_saveGear;
		_packet set[2,CL_gear];
	};

	case 4: {
		_packet set[2,CL_is_alive];
		_packet set[4,getPosATL player];
	};

	case 5: {
		_packet set[2,CL_is_arrested];
	};

	case 6: {
		_packet set[2,CL_cmoola];
		_packet set[4,CL_bmoola];
	};

	case 7: {
		// Tonic is using for keychain..?
	};

	case 8: {
		_packet set[2,CL_airDrops];
	};
};

if (CL_HC_isActive) then {
	_packet remoteExecCall ["HC_fnc_updatePartial",HC_CL];
} else {
	_packet remoteExecCall ["DB_fnc_updatePartial",RSERV];
};
