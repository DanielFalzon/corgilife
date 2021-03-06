/*
	File: fn_updateGang.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the gang information?
*/
private ["_maxMembers","_members","_membersFinal","_query","_owner","_faction"];
params [
	["_mode",0,[0]],
	["_group",grpNull,[grpNull]]
];

if (isNull _group && !(_mode isEqualTo 5)) exitWith {};
private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1 && !(_mode isEqualTo 5)) exitWith {};

switch (_mode) do {
	case 0: {
		private _bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
		_maxMembers = _group getVariable ["gang_maxMembers",2];
		_members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
		_owner = _group getVariable ["gang_owner",""];
		_faction = _group getVariable ["gang_faction",""];
		if (_owner isEqualTo "") exitWith {};

		_query = format["UPDATE gangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID];
	};

	case 1: {
		_query = format["UPDATE gangs SET bank='%1' WHERE id='%2'",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
	};

	case 2: {
		_query = format["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",2]),_groupID];
	};

	case 3: {
		_owner = _group getVariable ["gang_owner",""];
		if (_owner isEqualTo "") exitWith {};
		_query = format["UPDATE gangs SET owner='%1' WHERE id='%2'",_owner,_groupID];
	};

	case 4: {
		_members = _group getVariable "gang_members";
		if (count _members > (_group getVariable ["gang_maxMembers",2])) then {
			_membersFinal = [];
			for "_i" from 0 to _maxMembers -1 do {
				_membersFinal pushBack (_members select _i);
			};
		} else {
			_membersFinal = _group getVariable "gang_members";
		};
		_membersFinal = [_membersFinal] call DB_fnc_mresArray;
		_query = format["UPDATE gangs SET members='%1' WHERE id='%2'",_membersFinal,_groupID];
	};

	case 5: {
		_gang = [_this,2,"",[""]] call BIS_fnc_param;
		_toAdd = [_this,3,0,[0]] call BIS_fnc_param;
		_query = format["UPDATE gangs SET bank = bank + %1 WHERE name='%2'",_toAdd,_gang];
		_group = grpNull;
		{if(_gang == (_x getVariable["gang_name",""])) exitWith {_group = _x}} forEach allGroups;
		if(!isNull _group) then { _group setVariable["gang_bank",((_group getVariable["gang_bank",0]) + _toAdd),true]; };
	};

	case 6: {
		_faction = _group getVariable ["gang_faction",""];
		if (_faction isEqualTo "") exitWith {};
		_query = format["UPDATE gangs SET faction='%1' WHERE id='%2'",_faction,_groupID];
	};
};

if (!isNil "_query") then {
	[_query,1] call DB_fnc_asyncCall;
};
