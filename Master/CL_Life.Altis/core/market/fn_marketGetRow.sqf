/*

	[MARKET-ROW] marketGetModifiers [SHORTNAME];

*/
private _shortname = _this select 0;
private _ret = [];

{
	if ((_x select 0) isEqualTo _shortname) exitWith {
		_ret = _x;
	};
} forEach CL_market_resources;

_ret;
