#include "..\..\script_macros.hpp"
/*
	File: fn_copGiveLicenses.sqf
	Author: Dark
	Description:
	Used for giving certain licenses to cops at certain ranks.
*/
private _state = param [0,1,[0]];

switch (_state) do {
	case 0: {
		missionNamespace setVariable [LICENSE_VARNAME("cAirA","cop"),true];
		hint localize "STR_Cop_LicenseGive_1";
	};

	case 1: {
		missionNamespace setVariable [LICENSE_VARNAME("cAirB","cop"),true];
		hint localize "STR_Cop_LicenseGive_2";
	};

	case 2: {
		missionNamespace setVariable [LICENSE_VARNAME("cAirC","cop"),true];
		hint localize "STR_Cop_LicenseGive_3";
	};

	case 3: {
		missionNamespace setVariable [LICENSE_VARNAME("cCG","cop"),true];
		hint localize "STR_Cop_LicenseGive_4";
	};

	case 4: {
		missionNamespace setVariable [LICENSE_VARNAME("cBoat","cop"),true];
		hint localize "STR_Cop_LicenseGive_5";
	};

	case 5: {
		missionNamespace setVariable [LICENSE_VARNAME("cPTU","cop"),true];
		hint localize "STR_Cop_LicenseGive_6";
	};

	case 6: {
		missionNamespace setVariable [LICENSE_VARNAME("cUC","cop"),true];
		hint localize "STR_Cop_LicenseGive_7";
	};

	case 7: {
		missionNamespace setVariable [LICENSE_VARNAME("cSWAT","cop"),true];
		hint localize "STR_Cop_LicenseGive_8";
	};

	case 8: {
		missionNamespace setVariable [LICENSE_VARNAME("cSniper","cop"),true];
		hint localize "STR_Cop_LicenseGive_9";
	};
};

[2] call SOCK_fnc_updatePartial;
