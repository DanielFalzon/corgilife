/*
	File: fn_getFaction.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.co.uk)
	Edited: Dark
	Description:
	Gets players faction (civ, rebel or corp)
*/
private _return = "";

if (!license_civ_reb && !license_civ_corp) then {
	_return = "civ";
} else {
	if (license_civ_reb) then {
		_return = "reb";
	};

	if (license_civ_corp) then {
		_return = "corp";
	};
};

_return;
