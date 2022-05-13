/*
	File: fn_triggerBroadcast.sqf
*/
if ( !hasInterface ) exitWith {};

params [
	["_type",0, [0,[]]],
	["_message","", ["",[]]],
	["_title","", ["",[]]]
];

//--- Convert message to array
if ( typeName _message != typeName [] ) then { _message = [ _message ] };

//--- Localize message
if ( isLocalized ( _message select 0 ) ) then {

	_message set [ 0, localize ( _message select 0 ) ];

};

//--- Format
_message = format _message;

//--- Exit if no message
if ( _message == "" ) exitWith {};

//--- Convert type to array
if ( typeName _type != typeName [] ) then { _type = [ _type ] };

//--- Convert title to array
if ( typeName _title != typeName [] ) then { _title = [ _title ] };

//--- Parse title
if ( count _title > 0 ) then {
	private [ "_titleText", "_titleColor", "_titleSize" ];
	_titleText = [ _title, 0, "Message", [""] ] call BIS_fnc_param;
	_titleColor = [ _title, 1, "#ffffff", [""] ] call BIS_fnc_param;
	_titleSize = [ _title, 2, 1.6, [0] ] call BIS_fnc_param;

	//--- Localize title
	if ( isLocalized _titleText ) then {
		_title set [ 0, localize _titleText ];
	};

	//--- Set default color
	_title set [ 1, _titleColor ];

	//--- Set default size
	_title set [ 2, _titleSize ];

};
//--- Show message by type
{
	switch _x do {
		//--- System chat
		case 0: { systemChat _message };
		//--- Hint (structured text supported)
		case 1: {
			if ( count _title > 0 ) then {
				//--- Title
				if ( count _title > 0 ) then {
					hint parseText format [ "<t color='%1' shadow='0' size='%2'>%3</t><br />%4", _title select 1, _title select 2, _title select 0, _message ];
				} else {
					hint parseText format [ "%1", _message ];
				};
			} else {
				//--- No title
				hint parseText _message;
			};
		};
		//--- On screen text
		case 2: { titleText [ _message, "PLAIN" ] };
	};

} forEach _type;
