#include "..\..\script_macros.hpp"
/*
	File: fn_openMainMenu.sqf
	Author: Bryan "Tonic" Boardwine
*/
if (!alive player || dialog) exitWith {};

createDialog "CL_main_menu";
disableSerialization;

switch (playerSide) do {
	case west: {
		ctrlShow[1211,false]; //--- Gang Picture
		ctrlShow[2011,false]; //--- Gang Button
		ctrlShow[1216,false]; //--- Airdrop Picture
		ctrlShow[1030,false]; //--- Airdrop Button
		ctrlShow[1219,false]; //--- Taxi Picture
		ctrlShow[20005,false]; //--- Taxi Button
	};

	case civilian: {
		ctrlShow[1212,false]; //--- Wanted List Picture
		ctrlShow[2012,false]; //--- Wanted List Button
		ctrlShow[1215,false]; //--- Placeables Picture
		ctrlShow[20003,false]; //--- Placeables Button
		ctrlShow[1213,false]; //--- Sync Data Button
	};

	case independent: {
		ctrlShow[1211,false]; //--- Gang Picture
		ctrlShow[2011,false]; //--- Gang Button
		ctrlShow[1212,false]; //--- Wanted List Picture
		ctrlShow[2012,false]; //--- Wanted List Button
		ctrlShow[1216,false]; //--- Airdrop Picture
		ctrlShow[1030,false]; //--- Airdrop Button
		ctrlShow[1219,false]; //--- Taxi Picture
		ctrlShow[20005,false]; //--- Taxi Button
	};
};

if (FETCH_CONST(CL_adminlevel) < 1) then {
	ctrlShow[1218,false]; //--- Admin Picture
	ctrlShow[2021,false]; //--- Admin Button
};
