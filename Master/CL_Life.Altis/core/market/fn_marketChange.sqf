#include "..\..\script_macros.hpp"
/*

	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];

_rand = [0,200] call CL_fnc_randomRound; //0-200

/*

	HINWEIS: obige Zahl in random erhöhen, um alle ereignisse seltener zu machen!
	
*/

diag_log "[MARKET] marketChange called.";

switch (true) do {
	case (_rand <= 30): //30% default market change value (strong version)
	{
		{
			if (random(10) <= 4) then //Random for each resource
			{
				/*_price = _x select 1;
				_globalchange = _x select 2;*/
				
				_modifier = [-20,20] call CL_fnc_randomRound; //Verkaufte/Gekaufte Items
				/*_modifier = _price * _modifier;
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				CL_market_prices set [_forEachIndex, [_x select 0, _price, _globalchange, _modifier] ];*/
				
				if (_modifier < 0) then {
					[_x select 0, -(_modifier), true] call CL_fnc_marketSell; 
				} else {
					[_x select 0, _modifier, true] call CL_fnc_marketBuy; 
				};
			};
		} forEach CL_market_prices;
	};
	case (_rand <= 36): //6% Drug price increase
	{
		[0,format["News: Drugs prices increased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		//Increase market price with marketSell

		["marijuana", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy; 
		["cocaine_processed", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["heroin_processed", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["sodiumhydroxide", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["ephedrine", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["hydrochloricacid", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["methamphetamine", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;

		diag_log "+Market+ Event drugp";
	};
	case (_rand <= 44): //8% Increase oil price
	{
		[0,format["News: Oil price increased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		["oil_processed", [20,40] call CL_fnc_randomRound, true] call CL_fnc_marketBuy; 

		diag_log "+Market+ Event oilp";
	};
	case (_rand <= 54): //10% Price of gravel + refined_gravel + stone_refined
	{
		[0,format["News: Gravel, Refined Gravel & Stone prices increased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		["gravel", [20,40] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["refined_gravel", [20,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["stone_unrefined", [25,35] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;

		diag_log "+Market+ Event wcc";
	};
	case (_rand <= 60): //4% Gold price drops
	{
		[0,format["News: Goldbar & Briefcase prices decreased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];
		
		["goldbar", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell; 
		["briefcase", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell; 

		diag_log "+Market+ Event goldm";
	};
	case (_rand <= 68): //8% Plat / aluminium prices increased
	{
		[0,format["News: Platinum & Aluminium prices increased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		["aluminium_refined", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["platinum_refined", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;

		diag_log "+Market+ Event copperp";
	};
	case (_rand <= 74): //6% Goldbar / briefcase prices increased
	{
		[0,format["News: Goldbar & Briefcase prices increased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		["goldbar", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;
		["briefcase", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;

		diag_log "+Market+ Event goldp";
	};
	case (_rand <= 80): //6% Drug price lower
	{
		[0,format["News: Drugs prices decreased."]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		//Increase market price with marketSell
		["marijuana", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;
		["cocaine_processed", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;
		["heroin_processed", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;
		["sodiumhydroxide", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;
		["ephedrine", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;
		["hydrochloricacid", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;
		["methamphetamine", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketSell;

		diag_log "+Market+ Event drugm";
	};
	case (_rand <= 90): //10% Turtles higher
	{
		[0,format["News: Turtle prices increased"]] remoteExecCall ["CL_fnc_broadcast",RCLIENT];

		//Erhöhe Marktpreis mit marketSell
		["turtle_soup", [15,30] call CL_fnc_randomRound, true] call CL_fnc_marketBuy;

		diag_log "+Market+ Event exampleitem";
	};
	default //market change: default version
	{
		//diag_log format["[MARKET] marketChange did nothing. Rand=%1", _rand];
		{
			//Get default price
			_defaultprice = 0;
			_shortname = _x select 0;
			_price = _x select 1;
			_globalchange = _x select 2;

			{
				if ((_x select 0) == _shortname) exitWith {
					_defaultprice = _x select 1;
				};
			} forEach CL_market_resources;

			if (_defaultprice > 0) then {
				//Get difference
				_difference = _defaultprice - _price; //Defaultprice - current price

				_modifier = _difference * (random 0.4);
				_modifier = round _modifier;

				//Protecting hard caps
				/*if( _modifier < -700) then {_modifier = -700;};
				if( _modifier > 700) then {_modifier = 700;};*/

				//_modifier = [-15,25] call CL_fnc_randomRound; //Verkaufte/Gekaufte Items

				/*if(_modifier < 0) then {
					[_x select 0, -(_modifier), true] call CL_fnc_marketSell; 
				} else {
					[_x select 0, _modifier, true] call CL_fnc_marketBuy; 
				};*/

				diag_log format ["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];

				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;

				//New price arr
				CL_market_prices set [_forEachIndex, [_shortname, _price,_globalchange,_modifier] ]; //set raw values

			} else {
				diag_log format["+Market+ Cannot correct market value of %1", _shortname];
			};
		} forEach CL_market_prices;
	};
};

publicVariable "CL_market_prices";
