/*
	File: fn_prisonFood.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.co.uk)
	Edited: Dark
	Description:
	Script for giving out prison food
*/
private _food = param [3,"",[""]];

switch (_food) do {
	case "Gruel": {
		player say3D "omnomnom";
		private _sum = CL_hunger + 75;
		if (_sum > 100) then {
			_sum = 100;
		};
		CL_hunger = _sum;
		titleText ["Your starvation has subsided.","PLAIN"];
	};

	case "DirtyWater": {
		player say3D "drink";
		private _sum = CL_thirst + 100;
		if (_sum > 100) then {
			_sum = 100;
		};
		CL_thirst = _sum;
		titleText ["You have quenched your thirst.","PLAIN"];
	};
};

[] call CL_fnc_hudUpdate;
