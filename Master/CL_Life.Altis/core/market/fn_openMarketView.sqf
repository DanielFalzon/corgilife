/*

	Open pack-up dlg

*/

if (!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

waitUntil {!isnull (findDisplay 39000)};

//Refresh
[] spawn CL_fnc_refreshMarketView;
