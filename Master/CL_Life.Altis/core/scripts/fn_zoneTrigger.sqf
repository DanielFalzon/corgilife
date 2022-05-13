/*
File: fn_zoneTrigger.sqf
*/
params [
["_zone", "", [""]],
["_entity", objNull, [objNull]],
["_entered", true, [true]],
["_zoneName", "", [""]]
];

if (_zone == "") exitWith {};

//--- Zones
switch _zone do {
//--- Green
case "green": {
	if (playerSide == civilian) then {
		if (_entered) then {
			[1, "STR_IN_ZONES_ORANGE_ENTER", ["Warning", "#ff0000"]] call CL_fnc_triggerBroadcast;

				if (_entity isKindOf "Air") then {
					private _pilot = if (isNull driver _entity) then {effectiveCommander _entity} else {driver _entity};
					if (player == _pilot) then {
						[1, ["STR_IN_ZONES_ORANGE_ENTER_ASC", getText (configFile >> "CfgVehicles" >> typeOf _entity >> "displayName"), _zoneName], ["Alert", "#ff0000"]] remoteExec ["CL_fnc_triggerBroadcast", west];
					};
				};
		} else {
			[1, "STR_IN_ZONES_ORANGE_LEAVE", ["Notice", "#ff8800"]] call CL_fnc_triggerBroadcast;
		};
	};
};

/*
//--- No Fly
case "no_fly": {
	if (playerSide == civilian && {_entered} && {_entity isKindOf "Helicopter" || {_entity isKindOf "Plane"}}) then {
	[1, "STR_in_ZONES_NO_FLY", ["Warning", "#ff0000"]] call CL_fnc_triggerBroadcast;
	};
};

//--- 5.8 Warning
case "58_warning": {
	if (playerSide == civilian && {_entered} && {_entity isKindOf "Helicopter"}) then {
	[1, "STR_in_ZONES_58", ["Warning", "#ff0000"]] call CL_fnc_triggerBroadcast;
	};
};

//--- Oil Rig
case "oil_rig": {
	if (playerSide == civilian && {_entered} && {_entity isKindOf "Helicopter"} && {effectiveCommander vehicle player == player}) then {
	//--- Warn law enforcement
	private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _entity >> "displayName");
	[[1, ["STR_in_ZONES_OIL", _vehicleName], ["Alert", "#ff0000"]], "CL_fnc_triggerBroadcast", west] call CL_fnc_remoteExec;
	};
};
*/
default {};
};
