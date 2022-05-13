/*
	File: fn_captureAlert.sqf
	Author
	Description:
*/
private _zone = _this select 0;
private _win = [_this,1,false,[false]] call BIS_fnc_param;
private _enemy = [_this,2,"",[""]] call BIS_fnc_param;

if (_win) then {
	hint parseText format ["<t align='center'><t color='#00CC00'><t size='2'>Victory!</t></t><br/><br/>Your gang now controls %1!</t>",_zone];
} else {
	hint parseText format ["<t align='center'><t color='#FF0000'><t size='2'>Attention</t></t><br/><br/>Rival gang, %2, are attempting to take over %1!</t>",_zone,_enemy];
};