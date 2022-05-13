/*
	File: fn_civMarkers.sqf
	Author:

	Description:
	Add markers for civilians in groups.
*/
private _markers = [];
private _members = [];

uiSleep 0.5;
if !("ItemGPS" in (assignedItems player)) exitwith {};
if (visibleMap) then {
	_members = units (group player);
	{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorCivilian";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _x getVariable ["realname",name _x]];

			_markers pushBack [_marker,_x];
	} forEach _members;

	while {visibleMap} do {
		{
			private _unit = _x select 1;
			if (!isNil "_unit" && !isNull _unit) then {
				  (_x select 0) setMarkerPosLocal (visiblePosition _unit);
			};
		} forEach _markers;
		if (!visibleMap) exitWith {};
		uiSleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} forEach _markers;
	_markers = [];
	_members = [];
};
