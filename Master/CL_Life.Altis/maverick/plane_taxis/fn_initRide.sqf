scriptName "fn_initRide";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_initRide.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_initRide.sqf"

// Params
_fromCfg = param[0,"",[""]];
_toCfg = param[1,"",[""]];
_price = param[2,0,[0]];

// Get entry exit points and landing ID and money variable
_entryData = getArray (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> _fromCfg >> "entryPosition");
_inAir = getNumber (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> _fromCfg >> "inAir");
_exitData = getArray (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> _toCfg >> "exitPosition");
_destID = getNumber (missionConfigFile >> "Maverick_PlaneTaxis" >> "Airports" >> "CL" >> _toCfg >> "id");
_moneyVar = getText (missionConfigFile >> "Maverick_PlaneTaxis" >> "Costs" >> "moneyVariable");

// Money check
if ((missionNamespace getVariable [_moneyVar, 0]) < _price) exitWith {
	hint (getText (missionConfigFile >> "Maverick_PlaneTaxis" >> "Messages" >> "notEnoughMoney"));
};
CL_bmoola = CL_bmoola - _price;

// Get vehicle data
_classname = getText (missionConfigFile >> "Maverick_PlaneTaxis" >> "Vehicle" >> "classname");

// Check if area around spawn is empty
_isEmpty = ((nearestObjects [_entryData select 0, ["Air","LandVehicle","Ship"], 15]) isEqualTo []);

// Not empty?
if (!_isEmpty) exitWith {
	hint (getText (missionConfigFile >> "Maverick_PlaneTaxis" >> "Messages" >> "noSpaceForPlane"));
};

// We are now flying! yay
mav_pt_inPlane = true;

// Lets fade in
50000 cutRsc ["mav_pt_transition","PLAIN"];
1.1 fadeSound 0;
uiSleep 1.1;
1.1 fadeSound 1;

// Create vehicle
_veh = if (_inAir == 1) then {
	createVehicle [_classname, _entryData select 0, [], _entryData select 1, "FLY"];
} else {
	createVehicle [_classname, _entryData select 0, [], _entryData select 1, "CAN_COLLIDE"];
};
_veh setPos (_entryData select 0);
_veh setDir (_entryData select 1);
_grp = createGroup independent;

createVehicleCrew _veh;
_crew = crew _veh;
_crew joinSilent _grp;
_grp addVehicle _veh;
_grp selectLeader (commander _veh);

// Lock vehicle
_veh lock 2;

// Move in cargo
player moveInCargo _veh;

if (_inAir != 1) then {
	// Wait until the plane is in the air
	waitUntil {((getPos _veh) select 2) > 10};

	while {((getPos _veh) select 2) < 60} do {
		uiSleep 3;
		_veh landAt _destID;
	};
} else {
	// Long transition
	//500000 cutRsc ["mav_pt_transition_long","PLAIN"];

	_pos = [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 300];
	_veh setPosATL _pos;

	_vel = velocity _veh;
	_dir = direction _veh;
	_speed = 200;
	_veh setVelocity [
		(_vel select 0) + (sin _dir * _speed),
		(_vel select 1) + (cos _dir * _speed),
		(_vel select 2)
	];

	for "_i" from 1 to 10 step 1 do
	{
		uiSleep 1;
		_veh landAt _destID;
		//_veh setVectorUp [0,0,1];
		//_veh setPosATL _pos;
	};
};

// Wait until the plane has landed or something else has happened
waitUntil {((getPos _veh) select 2) < 10 || !alive _veh || !alive player || (vehicle player) == player};

// Wait some seconds
uiSleep 20;

// Player or plane ded or not in plane?
if (!alive player || !alive _veh || (vehicle player == player)) exitWith {
	{
		deleteVehicle _x;
	} forEach (crew _veh);
	deleteVehicle _veh;
	mav_pt_inPlane = false;
};

// Exit
50000 cutRsc ["mav_pt_transition","PLAIN"];
1.1 fadeSound 0;
uiSleep 1.1;
1.1 fadeSound 1;

// Delete vehicle and eject
{
	deleteVehicle _x;
} forEach (crew _veh);
deleteVehicle _veh;

// set player pos to exit pos
player setVelocity [0, 0, 0];
player setPosATL (_exitData select 0);

// Nijet flying
mav_pt_inPlane = false;