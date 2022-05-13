/*
	File: fn_capZones.sqf

	Description:
	Handles the capture zones on the map.
*/
private _query = "SELECT list FROM zones WHERE id = '1'";
private _queryResult = [_query,2] call DB_fnc_asyncCall;

CL_capture_list = _queryResult select 0;
publicVariable "CL_capture_list";
{
	if ((CL_capture_list select _x) select 2 >= 0.99) then {
		_string = (CL_capture_list select _x) select 0;
		_marker = format ["capture_label_%1",(_x + 1)];
		_marker setMarkerText format["%1 - %2",(CL_capture_list select _x) select 1,_string];
	};
} forEach [0,1];

JS_fnc_handleCapture = {
	while {count list (_this select 0) > 0} do {
		_point = _this select 1;
		_groupsArr = [];
		uiSleep 35;
		_units = list (_this select 0); //Total units inside the zone
		_nonUnits = [];
		{
			if (!isPlayer _x || (((group _x) getVariable ["gang_name",""]) isEqualTo "") || ((primaryWeapon _x isEqualTo "") && (handgunWeapon _x isEqualTo ""))) then {_nonUnits pushBack _x};
		} forEach _units; //Remove non-units and non-gang players
		_units = _units - _nonUnits;
		if (count _units isEqualTo 0) exitWith {};
		//begin gathering information on different groups in the zone
		while {count _units > 0} do {
			_GroupName = (group (_units select 0)) getVariable ["gang_name",""];
			if(_GroupName != "") then {
				_Groupunits = units (_units select 0);
				_GroupCount = count _Groupunits;
				_units = _units - _Groupunits;
				_groupsArr pushBack [_GroupName,_GroupCount];
			};
		};
		highest = ((_groupsArr select 0) select 0);
		_highNum = ((_groupsArr select 0) select 1);
		for [{_x=0},{_x < count _groupsArr},{_x=_x+1}] do {
			if ((_groupsArr select _x) select 1 > _highNum) then {
				highest = ((_groupsArr select _x) select 0);
				_highNum = ((_groupsArr select _x) select 1);
			};
		};

		{
			if (_highNum == (_x select 1) && highest != (_x select 0)) exitWith {highest = "";};
		} forEach _groupsArr; //Check that 2 groups didn't tie in units

		if (!(highest isEqualTo "")) then {
			toModify = CL_capture_list select _point;
			if ((toModify) select 0 isEqualTo "Contested") then {
				toModify set[0,highest];
				toModify set[2,0.05];
			} else {
				if ((highest == (toModify select 0)) && !((toModify select 2) >= 0.99)) then {
					toModify set[2,((toModify select 2) + 0.05)];
					if ((toModify select 2) >= 0.99) then {
						toModify set[2,1];
						_winners = [];
						{
							if (group _x getVariable ["gang_name",""] == (toModify select 0)) then {
								_winners pushBack _x;
							};
						} forEach playableUnits;
						{
							[toModify select 1,true] remoteExec ["CL_fnc_captureAlert",_x];
						} forEach _winners;
						[0,format ["The gang %1 has successfully captured the %2!",(toModify select 0),(toModify select 1)]] remoteExec ["CL_fnc_broadcast",-2];
					};
				} else {
					if (highest != (toModify select 0) && !((toModify select 2) <= 0.01)) then {
						toModify set[2,((toModify select 2) - 0.05)];
						_group = grpNull;
						{if ((toModify select 0) == (_x getVariable ["gang_name",""])) exitWith {_group = _x};} forEach allGroups;
						if (!isNull _group) then {
							{
								[toModify select 1,false,highest] remoteExec ["CL_fnc_captureAlert",_x];
							} forEach (units _group);
						};
					};
				};
			};
			if (toModify select 2 <= 0.01) then {toModify set[0,"Contested"]; toModify set[2,0]};
			CL_capture_list set[_point,toModify];
			publicVariable "CL_capture_list";
			[] spawn {
				_query = format ["UPDATE zones SET list='%1' WHERE id='1'",CL_capture_list];
				[_query,1] call DB_fnc_asyncCall;
				{
					if (isPlayer _x) then {
						[nil] remoteExec ["CL_fnc_captureCartelUpdate",_x];
					};
				} forEach (list(_this select 0));
			};
		};
		_marker = format ["capture_label_%1",(_point + 1)];
		_string = "";
		if(((CL_capture_list select _point) select 2) >= 0.99) then {
			_string = (CL_capture_list select _point) select 0;
		} else {
			_string = "Contested";
		};
		_name = switch((CL_capture_list select _point) select 1) do {
			case "Arms Dealer": {format ["Arms Dealer - %1",_string]};
			case "Drug Cartel": {format ["Drug Cartel - %1",_string]};
		};
		_marker setMarkerText format["%1",_name];
	};
};

capturePoints = [capture_1,capture_2];
_exit = false;
_point = capture_1;
_pointNum = 0;

for "_i" from 0 to 1 step 0 do {
	for "_i" from 0 to 1 step 0 do {
		uiSleep 1;
		{
			if (count (list _x) > 0) exitWith {
				_exit = true;
				_point = _x;
				_pointNum = switch (_point) do {
					case capture_1: {0};
					case capture_2: {1};
				};
			};
		} forEach capturePoints;
		if (_exit) exitWith {_exit = false;};
	};

	capturePoints = capturePoints - [_point];
	[_point,_pointNum] spawn {
		_handle = [_this select 0,_this select 1] spawn JS_fnc_handleCapture;
		waitUntil {uiSleep 1; scriptDone _handle};
		capturePoints pushBack (_this select 0);
	};
};
