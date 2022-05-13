#include "..\..\script_macros.hpp"
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: TheReaper
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private _unit = _this select 0;
private _part = _this select 1;
private _damage = _this select 2;
private _source = _this select 3;
private _projectile = _this select 4;

_tazer = ["SMG_02_F","hgun_ACPC2_snds_F"];
_longrangetazermag = "30Rnd_9x21_Mag_SMG_02";

_rubbermag = ["30Rnd_65x39_caseless_mag_Tracer","30Rnd_556x45_Stanag_Tracer_Red"];
//_rubberprojectile = ["B_65x39_Caseless","B_65x39_Caseless_green","B_556x45_Ball_Tracer_Green"];

if (!isNull _source) then {
	if !(_source isEqualTo _unit) then {
		private _curWep = currentWeapon _source;
		private _curMag = currentMagazine _source;
		//Cops Friendly Fire
		if (side _source isEqualTo west && playerSide isEqualTo west)then {_damage = false;};
		//Groups Friendly Fire
		if (group _source isEqualTo group _unit) then { _damage = false;};
		//Handle the tazer first (Top-Priority).
		if (_curWep in _tazer) then {
			if ((side _source isEqualTo west) && !(playerSide isEqualTo west)) then {

				private _distance = if (_curMag isEqualTo _longrangetazermag) then {200} else {100};
				private _isVehicle = if !(vehicle player isEqualTo player) then {true} else {false};
				private _isQuad = if (_isVehicle) then { if (typeOf (vehicle player) isEqualTo "B_Quadbike_01_F") then {true} else {false}} else {false};
				private _isGoKart = if (_isVehicle) then { if ((unitAddons(typeOf(vehicle player)) find "A3_Soft_F_Kart_Kart_01") != -1) then {true} else {false}} else {false};
				_isQuad = if (_isQuad || _isGoKart) then {true} else {false};

				_damage = (damage player);
				if (playerSide isEqualTo civilian) then {
					if (_unit distance _source < _distance) then {
						if (alive player && !CL_istazed && !CL_isknocked && !CL_isdowned && !(_unit getVariable ["restrained",false])) then {
							if (_isVehicle) then {
								if (_isQuad) then {
									player action ["Eject",vehicle player];
									[_unit,_source] spawn CL_fnc_tazed;
								};
							} else {
								[_unit,_source] spawn CL_fnc_tazed;
							};
						};
					};
				};
			};
		};
		//rubber bullets
		if (_curMag in _rubbermag /*&& _projectile in _rubberprojectile*/) then {
			if ((side _source isEqualTo west) && !(playerSide isEqualTo west)) then {
				private ["_isVehicle","_isQuad"];
				_isVehicle = if !(vehicle player isEqualTo player) then {true} else {false};
				_isQuad = if (_isVehicle) then {if(typeOf(vehicle player) isEqualTo "B_Quadbike_01_F") then {true} else {false}} else {false};
				_isGoKart = if (_isVehicle) then {if((unitAddons(typeOf(vehicle player)) find "A3_Soft_F_Kart_Kart_01") != -1) then {true} else {false}} else {false};
				_isQuad = if (_isQuad || _isGoKart) then {true} else {false};

				_damage = (damage player);
				if (_isVehicle) then {
					if (_isQuad) then {
						player action ["Eject",vehicle player];
						[_unit,_source] spawn CL_fnc_handleDowned;
					} else {
						_damage = (damage player);
					};
				} else {
					[_unit,_source] spawn CL_fnc_handleDowned;
				};
			};

			if (side _source isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo independent)) then {
				_damage = (damage player);
			};
		};
	};
};

//private _safeZones = [["sz_1",150],["sz_2",40],["sz_3",60],["sz_4",50],["sz_5",120],["sz_6",85],["sz_7",50],["sz_8",50],["sz_9",60],["sz_10",60],["sz_11",75]];
//if ({player distance getMarkerPos (_x select 0) < _x select 1} count _safeZones > 0) then {_damage = 0;};

//Anti VDM
if (vehicle _unit isEqualTo _unit) then {
if ( _source isKindOf "Air" || _source isKindOf "Car" || _source isKindOf "Boat" ) then {
		_damage = (damage player);
		[_unit,_source] spawn CL_fnc_vdmed;
		//_Source is Vehicle, Not a player driving a vehicle
			} else {
			_vehicle = vehicle _source;
			if (driver _vehicle isEqualTo _source) then {
			if (_vehicle isKindOf "Air" || _vehicle isKindOf "Car" || _vehicle isKindOf "Boat") then {
			_damage = (damage player);
			[_unit,_source] spawn CL_fnc_vdmed;
			};
		};
	};
};

//Suicide vest
if (vest _unit isEqualTo "V_HarnessOGL_gry") then {
	if ((time - CL_action_delay) < 15) exitWith {hint localize "STR_NOTF_ActionDelay";};
	[_unit] spawn CL_fnc_jihad;
	CL_action_delay = time;
};

//SeatBelts
if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then {
	_damage = if (CL_seatbelt) then { _damage / 2 } else { _damage};
};

[] spawn CL_fnc_hudUpdate;
_damage;
