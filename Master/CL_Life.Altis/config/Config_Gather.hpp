class CfgGather {
	//--- Gathering;
	class Resources {
		class peach {
			amount = 5;
			zones[] = { "peach_1", "peach_2", "peach_3", "peach_4" };
			item = "";
			zoneSize = 30;
		};

		class apple {
			amount = 5;
			zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
			item = "";
			zoneSize = 30;
		};

		class heroin_unprocessed {
			amount = 3;
			zones[] = { "heroin_1" };
			item = "";
			zoneSize = 30;
		};

		class cocaine_unprocessed {
			amount = 3;
			zones[] = { "cocaine_1" };
			item = "";
			zoneSize = 30;
		};

		class cannabis {
			amount = 3;
			zones[] = { "weed_1" };
			item = "";
			zoneSize = 30;
		};
		
		class gravel {
			amount = 3;
			zones[] = { "gravel_1" };
			item = "";
			zoneSize = 30;
		};

		class sugar_unprocessed {
			amount = 3;
			zones[] = { "sugar_1" };
			item = "";
			zoneSize = 30;
		};

		class mature_sugar {
			amount = 3;
			zones[] = { "mature_sugar_1" };
			item = "";
			zoneSize = 30;
		};
		//--- Crafting Items;
		class twigs {
			amount = 2;
			zones[] = { "twigs_1" };
			item = "";
			zoneSize = 30;
		};

		class hemp {
			amount = 2;
			zones[] = { "hemp_1" };
			item = "";
			zoneSize = 30;
		};

		class glass {
			amount = 2;
			zones[] = { "glass_1" };
			item = "";
			zoneSize = 30;
		};

		class spring {
			amount = 2;
			zones[] = { "spring_1" };
			item = "";
			zoneSize = 30;
		};

		class wheel {
			amount = 2;
			zones[] = { "wheel_1" };
			item = "";
			zoneSize = 30;
		};

		class pipe {
			amount = 2;
			zones[] = { "pipe_1" };
			item = "";
			zoneSize = 30;
		};
	};
	//--- Mining;
	class Minerals {
/*
This block can be set using percent,if you want players to mine only one resource ,just leave it as it is.
Example:
		class copper_unrefined
	{
			amount = 2;
		zones[] = { "copper_mine" };
		item = "pickaxe";
		mined[] = { "copper_unrefined" };
This will make players mine only copper_unrefined
Now let's go deeper
Example 2:
		class copper_unrefined
	{
			amount = 2;
		zones[] = { "copper_mine" };
		item = "pickaxe";
		mined[] = { {"copper_unrefined",0,25},{"iron_unrefined",25,95},{"diamond_uncut",95,100} };
	};
	This will give :
	25(±1)% to copper_unrefined;
	70(±1)% to iron_unrefined;
	5%(±1)% to diamond_uncut;

														! Watch Out !
If percents are used,you MUST put more than 1 resource in the mined parameter
mined[] = { {"copper_unrefined",0,25} }; NOT OK (But the script will work)
mined[] = { {"copper_unrefined",0,45 },{"iron_unrefined",45} };  NOT OK (The script won't work )
mined[] = { {"copper_unrefined",0,45},{"copper_unrefined",80,100} }; NOT OK
mined[] = { "copper_unrefined" }; OK
mined[] = { {"copper_unrefined",0,35} , { "iron_unrefined" ,35,100 } }; OK
*/
		class copper_unrefined {
			amount = 2;
			zones[] = { "copper_mine" };
			item = "pickaxe";
			mined[] = { {"copper_unrefined",0,98},{"amethyst",98,99},{"citrine",98,99},{"gravel",99,100} };
			zoneSize = 30;
		};

		class stone_unrefined {
			amount = 2;
			zones[] = { "stone_mine" };
			item = "pickaxe";
			mined[] = { { "stone_unrefined",0,97},{"amethyst",97,98},{"citrine",98,99},{"gravel",99,100} };
			zoneSize = 30;
		};

		class aluminium_unrefined {
			amount = 2;
			zones[] = { "aluminium_mine" };
			item = "pickaxe";
			mined[] = { { "aluminium_unrefined",0,93},{"topaz",93,94},{"amethyst",94,95},{"citrine",95,96},{"gravel",96,100} };
			zoneSize = 30;
		};

		class mahogany_unprocessed {
			amount = 2;
			zones[] = { "wood_mine" };
			item = "chainsaw";
			mined[] = { "mahogany_unprocessed" };
			zoneSize = 30;
		};

		class steel {
			amount = 2;
			zones[] = { "steel_mine" };
			item = "pickaxe";
			mined[] = { "steel" };
			zoneSize = 30;
		};

		class iron {
			amount = 2;
			zones[] = { "iron_mine" };
			item = "pickaxe";
			mined[] = { "iron" };
			zoneSize = 30;
		};

		class platinum_unrefined {
			amount = 2;
			zones[] = { "platinum_mine" };
			item = "pickaxe";
			mined[] = { { "platinum_unrefined",0,87},{"emerald",87,88},{"sapphire",88,89},{"ruby",89,90},{"topaz",90,91},{"amethyst",91,92},{"citrine",92,93},{"gravel",93,100} };
			zoneSize = 30;
		};

		class oil_unprocessed {
			amount = 2;
			zones[] = { "oil_mine" };
			item = "pickaxe";
			mined[] = { "oil_unprocessed" };
			zoneSize = 30;
		};

		class uranium_1 {
			amount = 1;
			zones[] = { "uranium_mine" };
			item = "pickaxe";
			mined[] = { "uraniumA" };
			zoneSize = 30;
		};
	};
};
