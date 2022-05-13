#include "..\..\script_macros.hpp"
/*
	File: fn_onFired.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4;
_projectile = _this select 6;

if (_ammoType isEqualTo "GrenadeHand_stone") then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			uiSleep 0.1;
		};
		[_position] remoteExec ["CL_fnc_flashbang",RCLIENT];
	};
};

if (_this select 5 == "B_IR_Grenade") then {
  _this spawn {
  _bullet = _this select 6;
  _newpos = getPosATL _bullet;

  while {(_newpos select 2) > .1} do {
	_newpos = getPos _bullet;
	uiSleep 0.1;
	};
	  [_bullet] remoteExec ["CL_fnc_empGrenade",RCLIENT];
	};
  };
