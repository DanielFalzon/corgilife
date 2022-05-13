/*
	File: fn_gpsTracker.sqf

	Description: Attaches a gps tracker to selected vehicle
*/
params [
	["_unit",ObjNull,[ObjNull]]
];

if (isNull _unit) exitWith {};
if ((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "You cannot attach a GPS unit to this.";};
if (player distance _unit > 7) exitWith {hint "You need to be within 7 feet!";};
if (!([false,"gpstracker",1] call CL_fnc_handleInv)) exitWith {};
closeDialog 0;

CL_action_inUse = true;
player switchMove "hubFixingVehicleProne_idle1";
uiSleep 4;
CL_action_inUse = false;
if (player distance _unit > 7) exitWith {titleText["You are not in range!","PLAIN"];};
titleText["You have attached a tracking device to this vehicle.","PLAIN"];

player switchMove "amovppnemstpsraswrfldnon";

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_gpstracker",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	for "_i" from 0 to 1 step 0 do {
		if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
		_marker setMarkerPosLocal getPos _veh;
		uiSleep 1;
	};
};