#include "..\..\script_macros.hpp"
/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Dark
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private _state = param [0,1,[0]];

switch (_state) do {
	//Death while being wanted
	case 0: {
		//missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
		//missionNamespace setVariable [LICENSE_VARNAME("heroin","civ"),false];
		//missionNamespace setVariable [LICENSE_VARNAME("marijuana","civ"),false];
		//missionNamespace setVariable [LICENSE_VARNAME("cocaine","civ"),false];
		//hint localize "STR_Civ_LicenseRemove_1";
	};

	//Jail licenses
	case 1: {
		missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("rifle","civ"),false];
		//missionNamespace setVariable [LICENSE_VARNAME("corp","civ"),false];
		//missionNamespace setVariable [LICENSE_VARNAME("reb","civ"),false];
		//missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
		hint localize "STR_Civ_LicenseRemove_2";
	};

	//Remove motor vehicle licenses
	case 2: {
		//if (missionNamespace getVariable LICENSE_VARNAME("driver","civ") || missionNamespace getVariable LICENSE_VARNAME("pilot","civ") || missionNamespace getVariable LICENSE_VARNAME("trucking","civ") || missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
			//missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
			//missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
			//missionNamespace setVariable [LICENSE_VARNAME("trucking","civ"),false];
			//missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
			//hint localize "STR_Civ_LicenseRemove_3";
		//};
	};

	//Killing someone while owning a gun license
	case 3: {
		//if (missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
			//missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
			//hint localize "STR_Civ_LicenseRemove_4";
		//};
	};

	if (_state == 4) then {
		//You joined the Corporation.
		missionNamespace setVariable [LICENSE_VARNAME("reb","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("methamphetamine","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("heroin","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("marijuana","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("cocaine","civ"),false];
		hint localize "STR_Civ_LicenseRemove_5";
	};

	if (_state == 5) then {
		//You joined the Rebel.
		missionNamespace setVariable [LICENSE_VARNAME("corp","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("platinum","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("oil","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumA","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumB","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumC","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumD","civ"),false];
		hint localize "STR_Civ_LicenseRemove_6";
	};

	//Revoke Licenses - Illegal
	case 6: {
		missionNamespace setVariable [LICENSE_VARNAME("methamphetamine","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("heroin","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("marijuana","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("cocaine","civ"),false];
		hint localize "STR_Civ_LicenseRemove_7";
	};

	//Revoke Licenses - Legal
	case 7: {
		missionNamespace setVariable [LICENSE_VARNAME("platinum","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("oil","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumA","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumB","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumC","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("uraniumD","civ"),false];
		hint localize "STR_Civ_LicenseRemove_8";
	};

	//Revoke Licenses - Faction - Reb
	case 8: {
		missionNamespace setVariable [LICENSE_VARNAME("reb","civ"),false];
		hint localize "STR_Civ_LicenseRemove_9";
	};

	//Revoke Licenses - Faction - Corp
	case 9: {
		missionNamespace setVariable [LICENSE_VARNAME("corp","civ"),false];
		hint localize "STR_Civ_LicenseRemove_10";
	};

	case 10: {
		//hint localize "STR_Civ_LicenseRemove_11";
	};

	//Revoke Drivers License
	case 11: {
		missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
		hint localize "STR_Civ_LicenseRemove_12";
	};

	//Revoke Trucking License
	case 12: {
		missionNamespace setVariable [LICENSE_VARNAME("trucking","civ"),false];
		hint localize "STR_Civ_LicenseRemove_13";
	};

	//Revoke Boating License
	case 13: {
		missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
		hint localize "STR_Civ_LicenseRemove_14";
	};

	//Revoke Firearms License
	case 14: {
		missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("rifle","civ"),false];
		hint localize "STR_Civ_LicenseRemove_15";
	};

	case 15: {
		//hint localize "STR_Civ_LicenseRemove_16";
	};

	//Revoke Pilot License
	case 16: {
		missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
		hint localize "STR_Civ_LicenseRemove_17";
	};
};

[2] call SOCK_fnc_updatePartial;
