 /*
    File: init.sqf
    Author:
    Description:
*/
StartProgress = false;

/*
if (!hasInterface) exitWith {
	StartProgress = true;
};
*/

[] execVM "KRON_Strings.sqf";
[] execVM "core\weather\randomWeather.sqf";

//--- Dynamic Market
if (isDedicated && isNil("CL_market_prices")) then {
	[] call CL_fnc_marketConfiguration;
	diag_log "Market prices generated!";
 
	"CL_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};

	//--- Start server fsm
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};

StartProgress = true;
