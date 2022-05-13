/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Dark
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
disableSerialization;

private _medicsOnline = ((findDisplay 7300) displayCtrl 7304);
private _medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {!isNil 'CL_corpse'};

waitUntil {
    private _nearby = 99999;
	{
		if (side _x == independent && alive _x && _x != player) then
		{
			_distance = (getPosATL CL_corpse) distance _x;
			if (_distance < _nearby) then {_nearby = _distance;};
		};
	} forEach playableUnits;

    _medicsOnline ctrlSetText format [localize "STR_Medic_Online",independent countSide playableUnits];

    if (_nearby == 99999) then {
		_medicsNear ctrlSetText format["Nearest Medic: None Near",_nearby];
	} else {
		_medicsNear ctrlSetText format["Nearest Medic: %1m",[(round _nearby)] call CL_fnc_numberText]; 
	};

	if (!(CL_bloodActionPlaying)) then {
		CL_bloodActionPlaying = true;
		[(floor(random (85))) + 5] call CL_fnc_deadBloodEffect;
	};

	uiSleep 1;
    (isNull (findDisplay 7300))
};
