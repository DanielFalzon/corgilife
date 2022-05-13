#include "..\..\script_macros.hpp"
/*
	File: fn_removeLicenses.sqf
	Author: Dark
	Description:
	Used for removing certain licenses from cops at certain ranks.
*/
private _state = param [0,1,[0]];

switch (_state) do {
	case 0: {
		missionNamespace setVariable [LICENSE_VARNAME("cAirA","cop"),false];
		hint localize "STR_Cop_LicenseRemove_1";
	};

	case 1: {
		missionNamespace setVariable [LICENSE_VARNAME("cAirB","cop"),false];
		hint localize "STR_Cop_LicenseRemove_2";
	};

	case 2: {
		missionNamespace setVariable [LICENSE_VARNAME("cAirC","cop"),false];
		hint localize "STR_Cop_LicenseRemove_3";
	};

	case 3: {
		missionNamespace setVariable [LICENSE_VARNAME("cCG","cop"),false];
		hint localize "STR_Cop_LicenseRemove_4";
	};

	case 4: {
		missionNamespace setVariable [LICENSE_VARNAME("cBoat","cop"),false];
		hint localize "STR_Cop_LicenseRemove_5";
	};

	case 5: {
		missionNamespace setVariable [LICENSE_VARNAME("cPTU","cop"),false];
		hint localize "STR_Cop_LicenseRemove_6";
	};

	case 6: {
		missionNamespace setVariable [LICENSE_VARNAME("cUC","cop"),false];
		hint localize "STR_Cop_LicenseRemove_7";
	};

	case 7: {
		missionNamespace setVariable [LICENSE_VARNAME("cSWAT","cop"),false];
		hint localize "STR_Cop_LicenseRemove_8";
	};

	case 8: {
		missionNamespace setVariable [LICENSE_VARNAME("cSniper","cop"),false];
		hint localize "STR_Cop_LicenseRemove_9";
	};
};

[2] call SOCK_fnc_updatePartial;
