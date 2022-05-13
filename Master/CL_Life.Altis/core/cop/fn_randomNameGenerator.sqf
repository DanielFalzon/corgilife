#include "..\..\script_macros.hpp"
/*
	File: fn_randomNameGenerator.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.co.uk)
	Edited: Dark
	Description:
	Generates a random name / surname for the police undercover script
*/
private _return = "";
private _firstnames = CL_Settings(getArray,"uc_name_list");
private _surnames = CL_Settings(getArray,"uc_surname_list");

_return = format [ "%1 %2", _firstnames call BIS_fnc_selectRandom, _surnames call BIS_fnc_selectRandom ];

_return;
