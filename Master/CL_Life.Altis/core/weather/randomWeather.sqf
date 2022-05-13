/*

randomWeather.sqf v 0.8

- Multiplayer Mission Random Weather Generator
- By Meatball
- modified extensively by TinyBigJacko July-Nov 2016



Script Requirements:
1) Put this code/script in a file named "randomWeather.sqf" in root mission folder.
2) Create a call in init.sqf that will run for the server and all clients.

	execVM "randomWeather.sqf";

3) Have the following code in the "class Params" section of your description.ext to create weather as a selectable parameter for the players.

class Params

{
// paramsArray[0]
	class initialWeather {
		title = "Initial Weather (Bugged/Not Working When Hosted on a Dedicated Server)";
		values[] = {1,2,3,4,5,6,7};
		texts[] = {"Clear","Overcast","Light Rain","Heavy Rain","Light Fog","Heavy Fog","Random"};
		default = 1;
	};
};
*/

//Added a fog limiter for Wilco!
private _limiterFog = 0.1; //<<<<<SET IT HERE!! 0.2 is thick! 1 is impossibly solid fog!
private _chanceFog = 1; //1 in 24 chance of FOG 15min weather period (24 sessions per server session)
private _chanceOvercast = 0.5; //50% chance of overcast

// Initial Server Weather Setup

if(isServer) then {

	// Set initial weather values based on parameter choice.  Make sure the # in the select below matches what # in the order of parameters (starting with 0) your initialWeather class is defined in the description.ext
	/* NDJ 23/07/16 - No - we don't need or want any kind of user-selectable weather on our mission, so just set the server up to start with CLEAR weather.
	
	initialWeather = (paramsArray select 0);
	switch (initialWeather) do{
		case 1: {forecastOvercast = 0;forecastRain = 0;forecastFog = 0;forecastWindE = 1;forecastWindN = 1;};            // Clear
		case 2: {forecastOvercast = .45;forecastRain = .45;forecastFog = 0;forecastWindE = 2;forecastWindN = 2;};    // Overcast
		case 3: {forecastOvercast = .70;forecastRain = .70;forecastFog = .05;forecastWindE = 3;forecastWindN = 3;};    // Light Rain
		case 4: {forecastOvercast = 1;forecastRain = 1;forecastFog = .05;forecastWindE = 4;forecastWindN = 4;};        // Heavy Rain
		case 5: {forecastOvercast = .75;forecastRain = .10;forecastFog = .30;forecastWindE = 1;forecastWindN = 1;};    // Light Fog
		case 6: {forecastOvercast = .85;forecastRain = .20;forecastFog = .50;forecastWindE = 0;forecastWindN = 0;};    // Heavy Fog
		case 7: {forecastOvercast = random(1);forecastRain = random(1);forecastFog = random(.20);forecastWindE = (random(14)-7);forecastWindN = (random(14)-7);};    // Random
	};
	*/

	//NDJ 23/07/16 - manual fixed init, as explained above.
	forecastOvercast = 0;
	forecastRain = 0;
	forecastFog = 0;
	forecastWindE = 1;
	forecastWindN = 1;


	// Set up variable to track server weather updates. Increments once per cycle (15min).
	serverWeather = 0;

	// Broadcast initial weather settings that were set based on parameter choice (NDJ - or hardwired on server).
	publicVariable "forecastOvercast";
	publicVariable "forecastRain";
	publicVariable "forecastFog";
	publicVariable "forecastWindE";
	publicVariable "forecastWindN";
	publicVariable "serverWeather";
};

// Server and Client weather set based on initial weather parameter values.

waitUntil {!isNil "serverWeather"};

skipTime -24;
86400 setOvercast forecastOvercast;
86400 setFog forecastFog;
86400 setRain forecastRain;
setWind [forecastWindE,forecastWindN,true];
skipTime 24;
simulWeatherSync;

// Debug Hint

diag_log "Initial Weather Setup";

// Server Loop to create a new weather forecast every 15 minutes.

if(isServer) then {

	while {serverWeather >= 0} do {  // This will always be true and it will run as long as server runs.

		randOCorRain = random (2);  // Pick a random number between 0 and 2 to update Overcast or Rain this cycle since you can't to both.  If random value is Less than or equal to 1 Overcast will be updated this cycle, if value is greater than 1, update rain this cycle.

	// Configure weather settings on server to match next 15 minute weather forecast.

		900 setFog forecastFog;
		if (randOCorRain <= 1) then {
			900 setOvercast forecastOvercast;
		} else {
			900 setRain forecastRain;
		};
//		if(serverWeather !=0) then { //don't sleep the first time round!
			uiSleep 900;
//		};

		setWind [forecastWindE,forecastWindN,true];



	// Create random numbers for next forecast.

	/* _randOvercast = (round((random(0.2)-0.1)*100))/100;
		_randRain = (round((random(0.2)-0.1)*100))/100;
		_randFog = (round((random(0.1)-0.05)*100))/100;
		_randWindE = (round((random(1)-0.5)*100))/100;
		_randWindN = (round((random(1)-0.5)*100))/100;
	*/

	//Let's try that again with some better random generators - NDJ 23/07/16
	private _randOvercast = random 1; //will give us figure between 0 and 1
	private _randRain = random 1;
	private _randFog = (random 1) * _limiterFog; //gives a figure between 0 and our foglimit, currently 0.13
	private _randWindE = (random 14) - 7; //gives us a figure between -14 and +14 - combined max vector of 19.8m/s, gale force 8, abt 38kts
	private _randWindN = (random 14) - 7;
	
	private _sdirWind = (_randWindE atan2 _randWindN); //gives range -180 to +180
	//if (_sdirWind < 0) then { _sdirWind = 360 + _sdirWind};
	
//	private _randWindDir = floor random 360; //gives 0 to 359 degrees
//	private _randWindStr = random 1;
	
	private _anyFog = random 1; //gives us a diceroll for fog y/n
	private _anyOvercast = random 1; //give us a diceroll for overcast y/n

	// Create next random overcast level and keep it between 0 and 1

	// forecastOvercast = forecastOvercast + _randOvercast;
	if (_anyOvercast < _chanceOvercast) then {
		forecastOvercast = _randOvercast;
	} else {
		forecastOvercast = 0
	};
	// Don't need these now if we're getting the randoms right from the beginning. Should speed things up a tad - NDJ 23/07/16
//	if (forecastOvercast > 1) then {forecastOvercast = forecastOvercast - (2*_randOvercast)};
//	if (forecastOvercast < 0) then {forecastOvercast = forecastOvercast + (abs(2*_randOvercast))};



	// Create next random rain level and keep it between 0 and 1

	// forecastRain = forecastRain + _randRain;
	forecastRain = _randRain;

//	if (forecastRain > 1) then {forecastRain = forecastRain - (2*_randRain)};
//	if (forecastRain < 0) then {forecastRain = forecastRain + (abs(2*_randRain))};



	// Create next random fog level and keep between 0 and 0.5

	if (_anyFog < _chanceFog) then {
	// forecastFog = forecastFog + _randFog;
		forecastFog = _randFog;
	} else {
		forecastFog = 0;
	};
//	if (forecastFog > 0.5) then {forecastFog = forecastFog - (2*_randFog)};
//	if (forecastFog < 0) then {forecastFog = forecastFog + (abs(2*_randFog))};



	// Create next random E-W Wind level and keep between -10 and 10

	//forecastWindE = forecastWindE + _randWindE;
	forecastWindE = _randWindE;

//	if (forecastWindE > 10) then {forecastWindE = forecastWindE - (2*_randWindE)};
//	if (forecastWindE < -10) then {forecastWindE = forecastWindE + (abs(2*_randWindE))};



	// Create next random N-S Wind level and keep between -10 and 10

	// forecastWindN = forecastWindN + _randWindN;
	forecastWindN = _randWindN;

//	if (forecastWindN > 10) then {forecastWindN = forecastWindN - (2*_randWindN)};
//	if (forecastWindN < -10) then {forecastWindN = forecastWindN + (abs(2*_randWindN))};



	// Increment variable to track updates to server weather

	serverWeather = serverWeather + 1;



	// Debug Hint - Show Current and Forecast Overcast, Humidity, Fog and Wind Levels on the Server.

	diag_log format ["Updating Server Forecast # %1 CO: %2 | CH: %3 | CR: %4 | CF: %5 |CW: %6 | FO: %7 | FH: %8 | FR: %9 | FF: %10 | FW: %11,%12 (%13mph/%14deg) | OCorRain: %15",serverWeather,Overcast,Humidity,Rain,Fog,wind,forecastOvercast,0,forecastRain,forecastFog,forecastWindE,forecastWindN,round(vectorMagnitude [forecastWindE,forecastWindN,0] * 2.23694),round _sdirWind, randOCorRain];



	// Broadcast server weather forecast information to clients.
	publicVariable "forecastOvercast";
	publicVariable "forecastRain";
	publicVariable "forecastFog";
	publicVariable "forecastWindE";
	publicVariable "forecastWindN";
	publicVariable "serverWeather";
	publicVariable "randOCorRain";
	};
};



if (!isServer) then {

	// Client Weather forecast loop.
	
	//initially turn it all off, except wind
	0 setFog 0;
	0 setRain 0;
	0 setOvercast 0;
	
	//Then do the magic trick, client side
	skipTime -24;
	86400 setOvercast 0;
	86400 setFog 0;
	86400 setRain 0;
	setWind [1,1,true];
	skipTime 24;
	simulWeatherSync;


	// Set up counter on client to compare local client weather serverWeather counter.

	clientWeather = 0;



	// Run a continuous loop on the client to look for updated weather values from the server every 10 seconds.

	while {clientWeather >= 0} do {

		uiSleep 10;

		// If client Weather is older than the server weather, set client 15 minute weather forecast to match server.

		if (clientWeather < serverWeather) then {

			// Set clientWeather counter to match serverWeather counter so local client weather will not update until next server weather update.

			clientWeather = serverweather;

			// Debug Hint - Show Current and Forecast Overcast, Humidity, Fog and Wind Levels on the Client

//			diag_log format ["Updated Client Forecast # %1 - CO: %2 | CH: %3 | CR: %4 | CF: %5 |CW: %6 | FO: %7 | FH: %8 | FR: %9 | FF: %10 | FW: %11,%12 | OCorRain: %13",clientWeather,Overcast,Humidity,Rain,Fog,wind,forecastOvercast,0,forecastRain,forecastFog,forecastWindE,forecastWindN,randOCorRain];
			private _dirWind = (forecastWindE atan2 forecastWindN); //gives range -180 to +180
			if (_dirWind < 0) then { _dirWind = 360 + _dirWind};
			hint parseText format ["<t>Weather Forecast for next 15 mins:<br />Cloud: %1% | Rain: %2% | Fog: %3%<br />Wind: %4mph, %5deg</t>",round(forecastOvercast*100),round(forecastRain*100),round(forecastFog*100), round(vectorMagnitude [forecastWindE,forecastWindN,0] * 2.23694), round _dirWind ];

			// Set 15 minute forecast for the client.

			900 setFog forecastFog;
			if (randOCorRain <= 1) then {
				900 setOvercast forecastOvercast;
			} else {
				900 setRain forecastRain;
			};

//			if ((clientweather != 0) && (clientweather == serverweather)) then {
				uiSleep 900;
//			};
			setWind [forecastWindE,forecastWindN,true];
		};
	};
};
