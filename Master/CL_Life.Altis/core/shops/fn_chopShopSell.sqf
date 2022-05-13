#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine

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

hint localize "STR_Shop_ChopShopSelling";
CL_action_inUse = true;
private _price2 = CL_cmoola + _price;
[0] call SOCK_fnc_updatePartial;
["VehicleChopped"] spawn mav_ttm_fnc_addExp;

if (CL_HC_isActive) then {
	[player,_vehicle,_price,_price2] remoteExecCall ["HC_fnc_chopShopSell",HC_CL];
} else {
	[player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
};

[format [localize "STR_DL_AL_choppedVehicle",profileName,(getPlayerUID player),_vehicle,[_price] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];
[format [localize "STR_DL_AL_choppedVehicle",profileName,(getPlayerUID player),_vehicle,[_price] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText],"VehicleLog"] remoteExecCall ["A3Log",2];

closeDialog 0;
