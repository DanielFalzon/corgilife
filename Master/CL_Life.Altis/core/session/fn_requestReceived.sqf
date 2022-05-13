#include "..\..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
private _count = count _this;
CL_session_tries = CL_session_tries + 1;
if (CL_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (CL_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

[0, localize "STR_Session_Received"] call mav_introcam_fnc_updateCinematicStatus;
0 cutFadeOut 9999999;

//Error handling and junk..
if (isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (_this isEqualType "") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (count _this isEqualTo 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if ((_this select 0) isEqualTo "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (!(getPlayerUID player isEqualTo (_this select 0))) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if (!isServer && (!isNil "CL_adminlevel" || !isNil "CL_coplevel" || !isNil "CL_donorlevel")) exitWith {
	uiSleep 0.9;
	failMission "ScriptKiddie";
};

//Parse basic player information.
CL_cmoola = parseNumber (_this select 2);
CL_bmoola = parseNumber (_this select 3);
CONST(CL_adminlevel,(_this select 4));
if (CL_Settings(getNumber,"donor_level") isEqualTo 1) then {
	CONST(CL_donorlevel,(_this select 5));
} else {
	CONST(CL_donorlevel,0);
};

//Loop through licenses
if (count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_this select 6);
};

//Parse side specific information.
switch (playerSide) do {
	case west: {
		CONST(CL_coplevel,(_this select 7));
		CONST(CL_mediclevel,0);
		CL_blacklisted = _this select 9;
		if (CL_Settings(getNumber,"save_playerStats") isEqualTo 1) then {
			CL_hunger = ((_this select 10) select 0);
			CL_thirst = ((_this select 10) select 1);
			player setDamage ((_this select 10) select 2);
		};
	};

	case civilian: {
		CL_is_arrested = _this select 7;
		CONST(CL_coplevel, 0);
		CONST(CL_mediclevel, 0);
		CL_airDrops = _this select 12;
		CL_houses = _this select (_count - 3);
		if (CL_Settings(getNumber,"save_playerStats") isEqualTo 1) then {
			CL_hunger = ((_this select 9) select 0);
			CL_thirst = ((_this select 9) select 1);
			player setDamage ((_this select 9) select 2);
		};

		//Position
		if (CL_Settings(getNumber,"save_civilian_position") isEqualTo 1) then {
			CL_is_alive = _this select 10;
			CL_civ_position = _this select 11;
			if (CL_is_alive) then {
				if !(count CL_civ_position isEqualTo 3) then {diag_log format ["[requestReceived] Bad position received. Data: %1",CL_civ_position];CL_is_alive =false;};
				if (CL_civ_position distance (getMarkerPos "respawn_civilian") < 300) then {CL_is_alive = false;};
			};
		};

		{
			_house = nearestObject [(call compile format["%1",(_x select 0)]), "House"];
			CL_vehicles pushBack _house;
		} forEach CL_houses;

		CL_gangData = _this select (_count - 2);
		if !(count CL_gangData isEqualTo 0) then {
			[] spawn CL_fnc_initGang;
		};
		[] spawn CL_fnc_initHouses;
	};

	case independent: {
		CONST(CL_mediclevel,(_this select 7));
		CONST(CL_coplevel,0);
		if (CL_Settings(getNumber,"save_playerStats") isEqualTo 1) then {
			CL_hunger = ((_this select 9) select 0);
			CL_thirst = ((_this select 9) select 1);
			player setDamage ((_this select 9) select 2);
		};
	};
};

CL_gear = _this select 8;
[true] call CL_fnc_loadGear;

if (count (_this select (_count - 1)) > 0) then {
	{CL_vehicles pushBack _x;} forEach (_this select (_count - 1));
};

CL_session_completed = true;
