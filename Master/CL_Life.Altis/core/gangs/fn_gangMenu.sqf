#include "..\..\script_macros.hpp"
/*
	File: fn_gangMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	31 hours of no uiSleep screw your description.
*/
disableSerialization;
if (isNull (findDisplay 2620)) then {
	if (!(createDialog "CL_My_Gang_Diag")) exitWith {};
};

private _ownerID = group player getVariable ["gang_owner",""];
if (_ownerID isEqualTo "") exitWith {closeDialog 0;};

private _gangName = group player getVariable "gang_name";
private _gangBank = GANG_FUNDS;
private _gangMax = group player getVariable "gang_maxMembers";

if (_ownerID != getPlayerUID player) then {
	(CONTROL(2620,2622)) ctrlEnable false; //--- Upgrade;
	(CONTROL(2620,2624)) ctrlEnable false; //--- Kick;
	(CONTROL(2620,2625)) ctrlEnable false; //--- Set New Leader;
	(CONTROL(2620,2630)) ctrlEnable false; //--- Invite Player;
	(CONTROL(2620,2631)) ctrlEnable false; //--- Disband Gang;
};

(CONTROL(2620,2629)) ctrlSetText _gangName;
(CONTROL(2620,601)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " $%1",[_gangBank] call CL_fnc_numberText];

//--- Loop through the players;
private _members = CONTROL(2620,2621);
lbClear _members;
{
	if ((getPlayerUID _x) == _ownerID) then {
		_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),(_x getVariable ["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} else {
		_members lbAdd format["%1",(_x getVariable ["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} forEach (units group player);

_grpMembers = units group player;
private _allUnits = playableUnits;

//--- Clear out the list;
{
	if (_x in _grpMembers || side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits deleteAt _forEachIndex;
	};
} forEach _allUnits;

private _ctrl = CONTROL(2620,2632);
lbClear _ctrl; //--- Purge the list;
{
	_ctrl lbAdd format["%1",_x getVariable ["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} forEach _allUnits;
