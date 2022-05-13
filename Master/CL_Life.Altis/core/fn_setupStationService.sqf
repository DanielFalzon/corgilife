/*
	File: fn_setupStationService.sqf
	Author: NiiRoZz

	Description:
	Add action fuel action in Station Service.

	put function in init file then execute it with:
	call getFuelpumps;
	getFuelpumps =
	{
		_pos = getArray(configFile >> "CfgWorlds" >> "CL" >> "centerPosition");
		_Station = nearestobjects [_pos,["Land_fs_feed_F","Land_FuelStation_Feed_F"], 25000];
		_br = toString [13, 10];
		_tab = toString [9];

		_TexteSortie = "_NiiRoZz_Station_Essence = [" + _br;

		{
			_Array = [getpos _x];
			_TexteSortie = _TexteSortie + _tab + (str _Array);
			_TexteSortie = if (_forEachIndex < ((count _Station) - 1)) then {_TexteSortie + ", " + _br} else {_TexteSortie + _br};
		} forEach _Station;
		_TexteSortie = _TexteSortie + "];";
		hint "Completed";
		copyToClipboard _TexteSortie;
	};
*/
private ["_NiiRoZz_Station_Essence","_pumpClass","_pump"];
_NiiRoZz_Station_Essence = [
	[5373.74,3565.51,0]
];

_pumpClass = "Land_fs_feed_F";
{
	_pump = (nearestObject [_x, _pumpClass]);
	_pump setFuelCargo 0;
	_pump addAction [localize "STR_Action_Pump", CL_fnc_fuelStatOpen, 1, 3, true, true, "", ' _this distance _target < 5 && cursorObject == _target '];
} forEach _NiiRoZz_Station_Essence;
