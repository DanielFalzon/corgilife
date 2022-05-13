/*

	[] fnc [SHORTNAME, [PRICEROW], (send?)];

*/
private _shortname = _this select 0;
private _price = _this select 1;
private _send = [_this,2,true] call BIS_fnc_param;

{
	if ((_x select 0) isEqualTo _shortname) exitWith {
		CL_market_prices set [_forEachIndex, _price];
	};
} forEach CL_market_prices;

if (_send) then {publicVariable "CL_market_prices";};
