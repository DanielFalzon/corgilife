/*
	File: initServer.sqf
	Author:

	Description:
	Starts the initialization of the server.
*/
if (!(_this select 0)) exitWith {}; //Not server
[] call compile preprocessFileLineNumbers "\CL_server\init.sqf";
