/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Lists impounded vehicles.
	DUE TO BE REWROTE IN NEW SYSTEM
*/
if (!dialog) then {
	if (!(createDialog "CL_impound_menu")) exitWith {};
	CL_impound_yard = _this select 3;
};

disableSerialization;

private _display = findDisplay 2800;
if (isNull _display) exitWith {};
private _cars = _display displayCtrl 2801;
lbClear _cars;

for "_i" from 0 to (count CL_vehicles)-1 do {
	_veh = CL_vehicles select _i;
	if (_veh distance impound_obj < 50) then {
		private _price = [_veh] call CL_fnc_impoundPrice;
		switch (true) do {
			case (_veh isKindOf "Car") : {_price = _price + 100;};
			case (_veh isKindOf "Air") : {_price = _price + 650;};
			case (_veh isKindOf "Ship") : {_price = _price + 50;};
		};

		if (_price > CL_cmoola) then {
			_price = _price + 200;
		};
		private _color = [(typeOf _veh),(_veh getVariable "CL_VEH_color")] call CL_fnc_vehicleColorStr;
		private _text = format["(%1)",_color];
		if (_text == "()") then {
			_text = "";
		};

		private _name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		private _pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_cars lbAdd format["%1 %2 - Cost: $%3",_name,_text,[_price] call CL_fnc_numberText];
		_cars lbSetPicture [(lbSize _cars)-1,_pic];
		_cars lbSetData [(lbSize _cars)-1,str(_i)];
		_cars lbSetValue [(lbSize _cars)-1,_price];
	};
};
