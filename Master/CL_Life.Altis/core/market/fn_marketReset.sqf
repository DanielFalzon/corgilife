/*

	Resets market by calling marketConfiguration

*/

[] call CL_fnc_marketConfiguration;

[0,format ["ADMIN: %1 has set the market prices to default."],name player] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

hint "Market prices reset.";
