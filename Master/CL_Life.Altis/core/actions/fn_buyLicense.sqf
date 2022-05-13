#include "..\..\script_macros.hpp"
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when purchasing a license. May need to be revised.
*/
private _type = param [3];

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
private _displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
private _price = M_CONFIG(getNumber,"Licenses",_type,"price");
private _sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
private  _varName = LICENSE_VARNAME(_type,_sideFlag);

// Check to see if you are in a gang
if ((!isNil {(group player) getVariable "gang_owner"}) && (_type == "corp" || _type == "reb")) exitWith { 
	["You are currently in a Gang for your current faction? <BR/>Leave this gang before switching factions","Relinquish Error","OK"] call BIS_fnc_guiMessage; 
};

if (CL_cmoola < _price) exitWith {hint format [localize "STR_NOTF_NE_1",[_price] call CL_fnc_numberText,localize _displayName];};
CL_cmoola = CL_cmoola - _price;

[0] call SOCK_fnc_updatePartial;

titleText[format [localize "STR_NOTF_B_1", localize _displayName,[_price] call CL_fnc_numberText],"PLAIN"];
[format ["%1 (%2) purchased a %3 license for $%4.",profileName,getPlayerUID player,_displayName,[_price] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
missionNamespace setVariable [_varName,true];

if (_type == "reb") then {
	[5] call CL_fnc_removeLicenses;
};

if (_type == "corp") then {
	[4] call CL_fnc_removeLicenses;
};

[0] call SOCK_fnc_updatePartial;
[1] call SOCK_fnc_updatePartial;
[2] call SOCK_fnc_updatePartial;
