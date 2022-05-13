/*
	File: statusBar.sqf
	Author;
	Edited: Dark
	Description: Status bar, maybe..
*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "osefStatusBarAdmin" call BIS_fnc_rscLayer;
_rscLayer cutRsc ["osefStatusBarAdmin","PLAIN"];

[] spawn {
	uiSleep 3;

	_colourDefault 	= parseText "#adadad";
	_colourCiv		= parseText "#54248f";
	_colour108		= parseText "#FF7000";
	_colour107		= parseText "#FF9000";
	_colour106		= parseText "#FFBB00";
	_colour105		= parseText "#FFCC00";
	_colour104		= parseText "#81CCDD";
	_colour103		= parseText	"#33AACC";
	_colour102		= parseText "#3388CC";
	_colour101		= parseText "#3366CC";
	_colour100 		= parseText "#336600";
	_colour90 		= parseText "#339900";
	_colour80 		= parseText "#33CC00";
	_colour70 		= parseText "#33FF00";
	_colour60 		= parseText "#66FF00";
	_colour50 		= parseText "#CCFF00";
	_colour40 		= parseText "#CCCC00";
	_colour30 		= parseText "#CC9900";
	_colour20 		= parseText "#CC6600";
	_colour10 		= parseText "#CC3300";
	_colour0 		= parseText "#CC0000";
	_colourDead 	= parseText "#000000";

	while {true} do {
		uiSleep 1;
		if(isNull ((uiNamespace getVariable "osefStatusBarAdmin") displayCtrl 55554)) then {
			disableSerialization;
			_rscLayer = "osefStatusBarAdmin" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["osefStatusBarAdmin","PLAIN"];
	};

	_unit = _this select 0;
	_damage = round ((1 - (damage player)) * 100);
	_cash = [CL_cmoola] call CL_fnc_numberText;
	_bank = [CL_bmoola] call CL_fnc_numberText;
	_hunger = round (CL_hunger);
	_thirst = round (CL_thirst);
	_serverFPS = round diag_fps;
	_pos = getPosATL player;
	_dir = round (getDir (vehicle player));
	_grid = mapGridPosition  player;
	_xx = (format[_grid]) select  [0,3];
	_yy = (format[_grid]) select  [3,3];
	_time = (round(360-(serverTime)/60));
	_hours = (floor(_time/60));
	_minutes = (_time - (_hours * 60));

	switch(_minutes) do {
		case 9: {_minutes = "09";};
		case 8: {_minutes = "08";};
		case 7: {_minutes = "07";};
		case 6: {_minutes = "06";};
		case 5: {_minutes = "05";};
		case 4: {_minutes = "04";};
		case 3: {_minutes = "03";};
		case 2: {_minutes = "02";};
		case 1: {_minutes = "01";};
		case 0: {_minutes = "00";};
	};

	_colourDamage = _colourDefault;
	switch true do {
		case(_damage >= 100) : {_colourDamage = _colour100;};
		case((_damage >= 90) && (_damage < 100)) : {_colourDamage =  _colour100;};
		case((_damage >= 80) && (_damage < 90)) : {_colourDamage =  _colour80;};
		case((_damage >= 70) && (_damage < 80)) : {_colourDamage =  _colour70;};
		case((_damage >= 60) && (_damage < 70)) : {_colourDamage =  _colour60;};
		case((_damage >= 50) && (_damage < 60)) : {_colourDamage =  _colour50;};
		case((_damage >= 40) && (_damage < 50)) : {_colourDamage =  _colour40;};
		case((_damage >= 30) && (_damage < 40)) : {_colourDamage =  _colour30;};
		case((_damage >= 20) && (_damage < 30)) : {_colourDamage =  _colour20;};
		case((_damage >= 10) && (_damage < 20)) : {_colourDamage =  _colour10;};
		case((_damage >= 1) && (_damage < 10)) : {_colourDamage =  _colour0;};
		case(_damage < 1) :{_colourDamage =  _colourDead;};
	};

	_colourHunger = _colourDefault;
	switch true do {
		case(_hunger >= 100) :{_colourHunger = _colour100;};
		case((_hunger >= 90) && (_hunger < 100)) : {_colourHunger =  _colour90;};
		case((_hunger >= 80) && (_hunger < 90)) : {_colourHunger =  _colour80;};
		case((_hunger >= 70) && (_hunger < 80)) : {_colourHunger =  _colour70;};
		case((_hunger >= 60) && (_hunger < 70)) : {_colourHunger =  _colour60;};
		case((_hunger >= 50) && (_hunger < 60)) : {_colourHunger =  _colour50;};
		case((_hunger >= 40) && (_hunger < 50)) : {_colourHunger =  _colour40;};
		case((_hunger >= 30) && (_hunger < 40)) : {_colourHunger =  _colour30;};
		case((_hunger >= 20) && (_hunger < 30)) : {_colourHunger =  _colour20;};
		case((_hunger >= 10) && (_hunger < 20)) : {_colourHunger =  _colour10;};
		case((_hunger >= 1) && (_hunger < 10)) : {_colourHunger =  _colour0;};
		case(_hunger < 1) :{_colourHunger =  _colourDead;};
	};

	_colourThirst = _colourDefault;
	switch true do {
		case(_thirst >= 100) : {_colourThirst = _colour101;};
		case((_thirst >= 90) && (_thirst < 100)) :  {_colourThirst =  _colour102;};
		case((_thirst >= 80) && (_thirst < 90)) :  {_colourThirst =  _colour103;};
		case((_thirst >= 70) && (_thirst < 80)) :  {_colourThirst =  _colour104;};
		case((_thirst >= 60) && (_thirst < 70)) :  {_colourThirst =  _colour105;};
		case((_thirst >= 50) && (_thirst < 60)) :  {_colourThirst =  _colour106;};
		case((_thirst >= 40) && (_thirst < 50)) :  {_colourThirst =  _colour107;};
		case((_thirst >= 30) && (_thirst < 40)) :  {_colourThirst =  _colour108;};
		case((_thirst >= 20) && (_thirst < 30)) :  {_colourThirst =  _colour20;};
		case((_thirst >= 10) && (_thirst < 20)) :  {_colourThirst =  _colour10;};
		case((_thirst >= 1) && (_thirst < 10)) :  {_colourThirst =  _colour0;};
		case(_thirst < 1) : {_colourThirst =  _colourDead;};
	};

	((uiNamespace getVariable "osefStatusBarAdmin") displayCtrl 55554) ctrlSetStructuredText parseText
	format["
		<t shadow='1' shadowColor='#000000' color='%10'><img size='1.0'  shadowColor='#000000' image='icons\statusBar\health.paa' color='%10'/>%3%1</t>
		<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='icons\statusBar\hunger.paa' color='%11'/>%5%1</t>
		<t shadow='1' shadowColor='#000000' color='%12'><img size='1.6'  shadowColor='#000000' image='icons\statusBar\thirst.paa' color='%12'/>%6%1</t>
		<t shadow='1' shadowColor='#000000' color='%9'><img size='1.0'  shadowColor='#000000' image='icons\statusBar\money.paa' color='%9'/>$%4</t>
		<t shadow='1' shadowColor='#000000' color='%9'><img size='1.0'  shadowColor='#000000' image='icons\statusBar\bank.paa' color='%9'/>$%8</t>
		<t shadow='1' shadowColor='#000000' color='%9'><img size='1.6'  shadowColor='#000000' image='icons\statusBar\restart.paa' color='%9'/>%14:%15</t>
		<t shadow='1' shadowColor='#000000' color='%9'> FPS: %7</t>
		<t shadow='1' shadowColor='#000000' color='%18'><img size='1.6'  shadowColor='#000000' image='icons\statusBar\playersCop.paa' color='%9'/>%2</t>
		<t shadow='1' shadowColor='#000000' color='%19'><img size='1.6'  shadowColor='#000000' image='icons\statusBar\playersCiv.paa' color='%9'/>%16</t>
		<t shadow='1' shadowColor='#000000' color='%20'><img size='1.6'  shadowColor='#000000' image='icons\statusBar\playersMed.paa' color='%9'/>%17</t>",
		"%", //--- 1
		west countSide playableUnits, //--- 2
		_damage, //--- 3
		_cash, //--- 4
		_hunger, //--- 5
		_thirst, //--- 6
		_serverFPS, //--- 7
		_bank, //--- 8
		_colourDefault, //--- 9
		_colourDamage, //--- 10
		_colourHunger, //--- 11
		_colourThirst, //--- 12
		format["%1/%2",_xx,_yy], //--- 13
		_hours, //--- 14
		_minutes, //--- 15
		civilian countSide playableUnits, //--- 16
		independent countSide playableUnits, //--- 17
		_colour102, //--- 18
		_colourCiv, //--- 19
		_colour90 //--- 20
		];
	};
};
