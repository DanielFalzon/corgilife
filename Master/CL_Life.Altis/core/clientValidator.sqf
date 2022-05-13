/*
	File: clientValidator.sqf
	Author:

	Description:
	Loops through a list of variables and checks whether
	or not they are defined, if they are defined then trigger
	custom checks and kick the client to the lobby.
*/
private _vars = [
	"CL_revive_fee","CL_gangPrice","CL_gangUpgradeBase","CL_enableFatigue","CL_paycheck_period","CL_vShop_rentalOnly","sell_array","buy_array",
	"CL_weapon_shop_array","CL_garage_prices","CL_garage_sell","CL_houseLimit","CL_gangUpgradeMultipler","CL_impound_car","CL_impound_boat",
	"CL_impound_air"
];

{
	if (!isNil {(missionNamespace getVariable _x)}) exitWith {
		uiSleep 0.5;
		failMission "ScriptKiddie";
	};
} forEach _vars;
