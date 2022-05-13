#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopClaim.sqf

	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private _control = CONTROL(39400,39402);
private _price = _control lbValue (lbCurSel _control);
private _vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
private _chopable = CL_Settings(getArray,"chopShop_vehicles");
private _nearVehicles = nearestObjects [getMarkerPos CL_chopShop,_chopable,25];
_vehicle = (_nearVehicles select _vehicle);
if (!(playerSide isEqualTo civilian)) exitWith {};
if (isNull _vehicle) exitWith {};
//_owners = _vehicle getVariable ["vehicle_info_owners", []];
//if (([getPlayerUID player, _owners] call TON_fnc_index) != -1) exitWith{hint "You cannot claim your own vehicle, silly!";};

if (CL_cmoola >= _price) then {
	hint "Claiming vehicle please wait....";
	CL_action_inUse = true;
	private _price2 = CL_cmoola - _price;
	[0] call SOCK_fnc_updatePartial;
	["VehicleClaimed"] spawn mav_ttm_fnc_addExp;

	if (CL_HC_isActive) then {
		[player,_vehicle,_price,_price2] remoteExecCall ["HC_fnc_chopShopClaim",HC_CL];
	} else {
		[player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopClaim",RSERV];
	};
	closeDialog 0;
	[format ["%1 (%2) claimed a %3 for %4",profileName,getPlayerUID player,_vehicle,_price],"VehicleLog"] remoteExecCall ["A3Log",2];
	[format ["%1 (%2) claimed a %3 for %4",profileName,getPlayerUID player,_vehicle,_price],"MoneyLog"] remoteExecCall ["A3Log",2];
} else {
	hint "You're broke nublet! Come back with some cash!";
	closeDialog 0;
};
