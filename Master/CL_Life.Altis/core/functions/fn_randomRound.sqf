/*
	Rounded random
	
	INT roundRandom [min, max];

*/
private _min = _this select 0;
private _max = _this select 1;

private _ret = _min + random (_max - _min);
_ret = round _ret;

_ret;
