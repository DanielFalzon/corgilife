/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],

////////////MAIN CONFIG

CL_market_resources = [

	//--- Mined / Gathered Goods;
	["oil_processed", 840, 700, 980, 3, 1, 
		[
			["copper_refined",1],
			["bottled_rum",1],
			["mahogany_processed",1],
			["aluminium_refined",1],
			["stone_refined",1],
			["refined_gravel",1],
			["gravel",1],
			["platinum_refined",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],

	["platinum_refined", 1800, 1600, 1950, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["refined_gravel",1],
			["copper_refined",1],
			["aluminium_refined",1],
			["stone_refined",1],
			["gravel",1],
			["mahogany_processed",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],
	
	["uraniumP", 3500, 2800, 3800, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["platinum_refined",1],
			["refined_gravel",1],
			["copper_refined",1],
			["aluminium_refined",1],
			["stone_refined",1],
			["gravel",1],
			["mahogany_processed",1]
		]
	],	

	["aluminium_refined", 690, 600, 800, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["refined_gravel",1],
			["copper_refined",1],
			["mahogany_processed",1],
			["stone_refined",1],
			["gravel",1],
			["platinum_refined",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],

	["mahogany_processed", 550, 400, 650, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["refined_gravel",1],
			["copper_refined",1],
			["aluminium_refined",1],
			["stone_refined",1],
			["gravel",1],
			["platinum_refined",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],

	["copper_refined", 160, 120, 200, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["mahogany_processed",1],
			["aluminium_refined",1],
			["stone_refined",1],
			["refined_gravel",1],
			["gravel",1],
			["platinum_refined",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],

	["refined_gravel", 140, 120, 160, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["copper_refined",1],
			["mahogany_processed",1],
			["aluminium_refined",1],
			["stone_refined",1],
			["gravel",1],
			["platinum_refined",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],

	["stone_refined", 80, 60, 100, 2, 1, 
		[
			["oil_processed",1],
			["bottled_rum",1],
			["refined_gravel",1],
			["copper_refined",1],
			["mahogany_processed",1],
			["aluminium_refined",1],
			["gravel",1],
			["platinum_refined",1],
			["uraniumP",1],
			["uraniumD",1],
			["uraniumC",1],
			["uraniumB",1]
		]
	],

	//--- Treasure Hunting;
	["stonetablet", 5000, 2000, 10000, 2, 1, 
		[
			["carvedstone",1],
			["valuablecoins",1],
			["golddoubloon",1]
		]
	],

	["carvedstone", 2000, 1250, 5000, 2, 1, 
		[
			["stonetablet",1],
			["valuablecoins",1],
			["golddoubloon",1]
		]
	],

	["valuablecoins", 125, 60, 500, 2, 1, 
		[
			["carvedstone",1],
			["stonetablet",1],
			["golddoubloon",1]
		]
	],

	["golddoubloon", 2100, 1230, 4000, 2, 1, 
		[
			["carvedstone",1],
			["valuablecoins",1],
			["stonetablet",1]
		]
	],

	//--- Other Illegal Goods;
	["briefcase", 25000, 12500, 50000, 2, 1, 
		[
			["goldbar",1],
			["turtle_soup",1],
			["kidney",1],
			["flesh",1],
			["cocaine_processed",1],
			["marijuana",1],
			["heroin_processed",1],
			["methamphetamine",1]
		]
	],

	["goldbar", 50000, 30000, 100000, 2, 1, 
		[
			["briefcase",1],
			["turtle_soup",1],
			["kidney",1],
			["flesh",1],
			["cocaine_processed",1],
			["marijuana",1],
			["heroin_processed",1],
			["methamphetamine",1]
		]
	],

	["kidney", 600, 300, 1200, 2, 1, 
		[
			["briefcase",1],
			["goldbar",1],
			["turtle_soup",1],
			["flesh",1],
			["cocaine_processed",1],
			["marijuana",1],
			["heroin_processed",1],
			["methamphetamine",1]
		]
	],

	["flesh", 300, 150, 600, 2, 1, 
		[
			["briefcase",1],
			["goldbar",1],
			["turtle_soup",1],
			["kidney",1],
			["cocaine_processed",1],
			["marijuana",1],
			["heroin_processed",1],
			["methamphetamine",1]
		]
	],

	//--- Gems;
	["emerald", 800, 650, 1000, 9, 7,   
		[
			["sapphire",1],
			["ruby",1],
			["topaz",1],
			["amethyst",1],
			["citrine",1],
			["blue_pearl",1],
			["white_pearl",1]
		]
	],

	["sapphire", 800, 650, 1000, 9, 7,   
		[
			["emerald",1],
			["ruby",1],
			["topaz",1],
			["amethyst",1],
			["citrine",1],
			["blue_pearl",1],
			["white_pearl",1]
		]
	],

	["ruby", 800, 650, 1000, 9, 7,   
		[
			["sapphire",1],
			["emerald",1],
			["topaz",1],
			["amethyst",1],
			["citrine",1],
			["blue_pearl",1],
			["white_pearl",1]
		]
	],

	["topaz", 500, 350, 700, 9, 7,   
		[
			["sapphire",1],
			["ruby",1],
			["emerald",1],
			["amethyst",1],
			["citrine",1],
			["blue_pearl",1],
			["white_pearl",1]
		]
	],

	["amethyst", 500, 350, 700, 9, 7,   
		[
			["sapphire",1],
			["ruby",1],
			["topaz",1],
			["emerald",1],
			["citrine",1],
			["blue_pearl",1],
			["white_pearl",1]
		]
	],

	["citrine", 500, 350, 700, 9, 7,   
		[
			["sapphire",1],
			["ruby",1],
			["topaz",1],
			["amethyst",1],
			["emerald",1],
			["blue_pearl",1],
			["white_pearl",1]
		]
	],

	["blue_pearl", 125, 63, 250, 9, 7,   
		[
			["sapphire",1],
			["ruby",1],
			["topaz",1],
			["amethyst",1],
			["citrine",1],
			["emerald",1],
			["white_pearl",1]
		]
	],

	["white_pearl", 150, 75, 300, 9, 7,   
		[
			["sapphire",1],
			["ruby",1],
			["topaz",1],
			["amethyst",1],
			["citrine",1],
			["blue_pearl",1],
			["emerald",1]
		]
	],

	//--- Drugs;
	["methamphetamine", 1800, 1650, 2000, 9, 7,   
		[
			["cocaine_processed",1],
			["marijuana",1],
			["heroin_processed",1],
			["briefcase",1],
			["goldbar",1],
			["turtle_soup",1],
			["kidney",1],
			["flesh",1]
		]
	],

	["marijuana", 360, 250, 400, 9, 6,   
		[
			["cocaine_processed",1],
			["methamphetamine",1],
			["heroin_processed",1],
			["briefcase",1],
			["goldbar",1],
			["turtle_soup",1],
			["kidney",1],
			["flesh",1]
		]
	],

	["cocaine_processed", 900, 750, 1000, 9, 7,   
		[
			["marijuana",1], 
			["methamphetamine",1], 
			["heroin_processed",1],
			["briefcase",1],
			["goldbar",1],
			["turtle_soup",1],
			["kidney",1],
			["flesh",1]
		]
	],

	["heroin_processed", 650, 500, 800, 9, 7,   
		[
			["marijuana",1], 
			["methamphetamine",1], 
			["cocaine_processed",1],
			["briefcase",1],
			["goldbar",1],
			["turtle_soup",1],
			["kidney",1],
			["flesh",1]
		]
	]
];

publicVariable "CL_market_resources";

////////////GENERATED CONFIG
//CL_market_changes = []; //[SHORTNAME,SELL,BUY]
CL_market_shortnames = []; //shortnames if in market
//CL_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	CL_market_shortnames set [count CL_market_shortnames, _x select 0];
	//CL_market_clampprices set [count CL_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//CL_market_changes set [count CL_market_changes, [_x select 0, _x select 4, _x select 5] ];
} forEach CL_market_resources;

publicVariable "CL_market_shortnames";
//publicVariable "CL_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("CL_market_prices")) then
//{
	CL_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		CL_market_prices set [count CL_market_prices, [_x select 0, _x select 1, 0, 0] ];
	} forEach CL_market_resources;

	publicVariable "CL_market_prices";

	systemChat "Market Prices Generated!";
//};
