class VirtualShops {
/*
*	Format:
*		level: ARRAY (This is for limiting items to certain things)
*			0: Variable to read from
*			1: Variable Value Type (SCALAR / BOOL / EQUAL)
*			2: What to compare to (-1 = Check Disabled)
*			3: Custom exit message (Optional)
*/
	//--- Virtual Shops;
	class market {
		name = "STR_Shops_Market";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "rabbit", "redgull", "tbacon", "apple", "peach", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw" };
	};

	class hardware {
		name = "STR_Shops_Hardware";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "lockpick", "toolkit", "pickaxe", "fuelFull", "boltcutter", "storagesmall", "storagebig", "gravel", "chainsaw" };
	};

	class reb {
		name = "STR_Shops_Reb";
		side = "civ";
		license = "reb";
		level[] = { "", "", -1, "" };
		items[] = { "tbacon", "rabbit", "peach", "apple", "redgull", "waterBottle", "lockpick", "toolkit", "pickaxe", "chainsaw", "fuelFull", "boltcutter", "blastingCharge" };
	};

	class corp {
		name = "STR_Shops_Corp";
		side = "civ";
		license = "corp";
		level[] = { "", "", -1, "" };
		items[] = { "tbacon", "rabbit", "peach", "apple", "redgull", "waterBottle", "lockpick", "toolkit", "pickaxe", "chainsaw", "fuelFull" };
	};

	class mMarket {
		name = "STR_Shops_Med";
		side = "med";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "medicWater", "medicFood", "fuelFull", "skeletonKey", "toolkit", "defibrillator", "bloodbag", "kidney" };
	};

	class gang {
		name = "STR_Shops_Gang";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "toolkit", "pickaxe", "fuelFull", "peach", "boltcutter" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class black_market {
		name = "STR_Shops_Black_Market";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "kidney", "flesh", "scalpel", "speedbomb" };
	};

	class coffee {
		name = "STR_Shops_Coffee";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "rabbit" };
	};

	class f_station_coffee {
		name = "STR_Shop_Station_Coffee";
		side = "";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "rabbit", "redgull", "fuelFull", "toolkit" };
	};

	class drugdealer {
		name = "STR_Shops_DrugDealer";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "cocaine_processed", "heroin_processed", "marijuana", "cocaine_unprocessed", "heroin_unprocessed", "cannabis" };
	};

	class oil {
		name = "STR_Shops_Oil";
		side = "civ";
		license = "corp";
		level[] = { "", "", -1, "" };
		items[] = { "oil_processed", "oil_unprocessed", "pickaxe", "fuelFull" };
	};

	class fishmarket {
		name = "STR_Shops_FishMarket";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark" };
	};

	class stone  {
		name = "STR_Shops_Stone";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "stone_refined", "stone_unrefined" };
	};

	class gravel  {
		name = "STR_Shops_Gravel";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "refined_gravel" };
	};

	class aluminium  {
		name = "STR_Shops_Aluminium";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "aluminium_refined", "aluminium_unrefined" };
	};

	class mahogany  {
		name = "STR_Shops_Mahogany";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "mahogany_processed", "mahogany_unprocessed" };
	};

	class platinum  {
		name = "STR_Shops_Platinum";
		side = "civ";
		license = "corp";
		level[] = { "", "", -1, "" };
		items[] = { "platinum_refined" };
	};

	class uranium  {
		name = "STR_Shops_Uranium";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "uraniumA", "uraniumB", "uraniumC", "uraniumD", "uraniumP" };
	};

	class gemstone {
		name = "STR_Shops_Gemstone";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "emerald", "sapphire", "ruby", "topaz", "amethyst", "citrine", "blue_pearl", "white_pearl" };
	};

	class copper  {
		name = "STR_Shops_Copper";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "copper_refined", "copper_unrefined" };
	};

	class pub  {
		name = "STR_Shops_Pub";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "bottled_rum" };
	};

	class goldBar {
		name = "STR_Shops_Gold_Bar";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "goldBar" };
	};

	class treasure {
		name = "STR_Shops_Treasure";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "stonetablet", "carvedstone", "valuablecoins", "golddoubloon" };
	};

	class cop {
		name = "STR_Shops_Cop";
		side = "cop";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "donuts", "rabbit", "apple", "redgull",  "coffee", "toolkit", "fuelFull", "defusekit", "skeletonKey", "GPSTracker", "spikeStrip", "bloodbag", "defibrillator" };
	};

	class dirtymoney {
		name = "STR_Shops_DirtyMoney";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "briefcase" };
	};

	class sodiumhydroxide {
		name = "STR_Shops_sodium";
		side = "civ";
		license = "reb";
		level[] = { "", "", -1, "" };
		items[] = { "sodiumhydroxide" };
	};

	class ephedrine {
		name = "STR_Shops_eph";
		side = "civ";
		license = "reb";
		level[] = { "", "", -1, "" };
		items[] = { "ephedrine" };
	};

	class hydrochloricacid {
		name = "STR_Shops_hydro";
		side = "civ";
		license = "reb";
		level[] = { "", "", -1, "" };
		items[] = { "hydrochloricacid" };
	};

	class methamphetamine {
		name = "STR_Shops_DrugDealer";
		side = "civ";
		license = "reb";
		level[] = { "", "", -1, "" };
		items[] = { "methamphetamine" };
	};

	class crafting {
		name = "Crafting Store";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "engine_component", "firing_pin", "fabric" };
	};
};

//--- Virtual Items;
class VirtualItems {
/*
*	CLASS:
*		variable = Variable Name
*		displayName = Item Name
*		weight = Item Weight
*		buyPrice = Item Buy Price
*		sellPrice = Item Sell Price
*		illegal = Illegal Item
*		edible = Item Edible (-1 = Disabled)
*		icon = Item Icon
*		processedItem = Processed Item
*/
	//--- Misc;
	class zipties {
        variable = "zipties";
        displayName = "STR_Item_ZipTies";
        weight = 5;
        buyPrice = 5000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ziptie.paa";
    };
	
	class blindfold {
        variable = "blindfold";
        displayName = "STR_Item_Blindfold";
        weight = 0;
        buyPrice = 3000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\blindfold.paa";
    };

	class speedbomb {
		variable = "speedbomb";
		displayName = "STR_Item_SpeedBomb";
		weight = 15;
		buyPrice = 80000;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_speedbomb.paa";
	};

	class pickaxe {
		variable = "pickaxe";
		displayName = "STR_Item_Pickaxe";
		weight = 2;
		buyPrice = 120;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_pickaxe.paa";
	};

	class chainsaw {
		variable = "chainsaw";
		displayName = "STR_Item_chainsaw";
		weight = 5;
		buyPrice = 120;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_chainsaw.paa";
	};

	class gpstracker {
		variable = "gpstracker";
		displayName = "STR_Item_GPSTracker";
		weight = 1;
		buyPrice = 500;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_gpstracker.paa";
	};

	class defibrillator {
		variable = "defibrillator";
		displayName = "STR_Item_Defibrillator";
		weight = 4;
		buyPrice = 250;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_defibrillator.paa";
	};

	class bloodbag {
		variable = "bloodbag";
		displayName = "STR_Item_Bloodbag";
		weight = 2;
		buyPrice = 300;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_bloodBag.paa";
	};

	class toolkit {
		variable = "toolkit";
		displayName = "STR_Item_Toolkit";
		weight = 4;
		buyPrice = 50;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
	};

	class fuelEmpty {
		variable = "fuelEmpty";
		displayName = "STR_Item_FuelE";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fuelEmpty.paa";
	};

	class fuelFull {
		variable = "fuelFull";
		displayName = "STR_Item_FuelF";
		weight = 5;
		buyPrice = 80;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fuel.paa";
	};

	class spikeStrip {
		variable = "spikeStrip";
		displayName = "STR_Item_SpikeStrip";
		weight = 10;
		buyPrice = 250;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_spikeStrip.paa";
	};

	class lockpick {
		variable = "lockpick";
		displayName = "STR_Item_Lockpick";
		weight = 1;
		buyPrice = 30;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_lockpick.paa";
	};

	class skeletonKey {
		variable = "SkeletonKey";
		displayName = "STR_Item_SkeletonKey";
		weight = 1;
		buyPrice = 100;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_lockpick.paa";
	};

	class blastingcharge {
		variable = "blastingCharge";
		displayName = "STR_Item_BCharge";
		weight = 15;
		buyPrice = 120000;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_blastingCharge.paa";
	};

	class boltcutter {
		variable = "boltCutter";
		displayName = "STR_Item_BCutter";
		weight = 5;
		buyPrice = 2000;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_boltCutter.paa";
	};

	class defusekit {
		variable = "defuseKit";
		displayName = "STR_Item_DefuseKit";
		weight = 5;
		buyPrice = 1000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_defuseKit.paa";
	};

	class storagesmall {
		variable = "storageSmall";
		displayName = "STR_Item_StorageBS";
		weight = 5;
		buyPrice = 9000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_storageSmall.paa";
	};

	class storagebig {
		variable = "storageBig";
		displayName = "STR_Item_StorageBL";
		weight = 10;
		buyPrice = 15000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_storageBig.paa";
	};

	//--- Run Items (Unprocessed and Processed);
	
	//Misc
	class gravel {
		variable = "gravel";
		displayName = "STR_Item_Gravel";
		weight = 2;
		buyPrice = -1;
		sellPrice = 50;
		illegal = false;
		edible = -1;
		icon = "icons\ico_rock.paa";
	};
	
	class refined_gravel {
		variable = "refinedGravel";
		displayName = "STR_Item_rGravel";
		weight = 2;
		buyPrice = -1;
		sellPrice = 140;
		illegal = false;
		edible = -1;
		icon = "icons\ico_rock.paa";
	};
	
	
	//Tier 1
	class copper_unrefined {
		variable = "copperUnrefined";
		displayName = "STR_Item_CopperOre";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_copperOre.paa";
	};

	class copper_refined {
		variable = "copperRefined";
		displayName = "STR_Item_CopperIngot";
		weight = 2;
		buyPrice = -1;
		sellPrice = 160;
		illegal = false;
		edible = -1;
		icon = "icons\ico_copper.paa";
	};

	
	class stone_unrefined {
		variable = "stoneU";
		displayName = "STR_Item_StoneUnrefined";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_stoneUnrefined.paa";
	};

	class stone_refined {
		variable = "stoneR";
		displayName = "STR_Item_StoneConstructable";
		weight = 1;
		buyPrice = -1;
		sellPrice = 80;
		illegal = false;
		edible = -1;
		icon = "icons\ico_stoneRefined.paa";
	};
	
	
	class cannabis {
		variable = "cannabis";
		displayName = "STR_Item_Cannabis";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cannabis.paa";
		processedItem = "marijuana";
	};

	class marijuana {
		variable = "marijuana";
		displayName = "STR_Item_Marijuana";
		weight = 2;
		buyPrice = -1;
		sellPrice = 360;
		illegal = true;
		edible = -1;
		icon = "icons\ico_marijuana.paa";
	};
	
	
	//Tier 2
	class aluminium_unrefined {
		variable = "aluminiumU";
		displayName = "STR_Item_AluminiumOre";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_ironOre.paa";
	};

	class aluminium_refined {
		variable = "aluminiumR";
		displayName = "STR_Item_AluminiumPlate";
		weight = 3;
		buyPrice = -1;
		sellPrice = 690;
		illegal = false;
		edible = -1;
		icon = "icons\ico_iron.paa";
	};
	
	
	class turtle_raw {
		variable = "turtleRaw";
		displayName = "STR_Item_TurtleRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 900;
		illegal = true;
		edible = -1;
		icon = "icons\ico_turtleRaw.paa";
	};

	
	class heroin_unprocessed {
		variable = "heroinUnprocessed";
		displayName = "STR_Item_HeroinU";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_heroinUnprocessed.paa";
		processedItem = "heroin_processed";
	};

	class heroin_processed {
		variable = "heroinProcessed";
		displayName = "STR_Item_HeroinP";
		weight = 2;
		buyPrice = -1;
		sellPrice = 650;
		illegal = true;
		edible = -1;
		icon = "icons\ico_heroinProcessed.paa";
	};
	
	
	//Tier 3
	class oil_unprocessed {
		variable = "oilUnprocessed";
		displayName = "STR_Item_OilU";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_oilUnprocessed.paa";
	};

	class oil_processed {
		variable = "oilProcessed";
		displayName = "STR_Item_OilP";
		weight = 3;
		buyPrice = -1;
		sellPrice = 840;
		illegal = false;
		edible = -1;
		icon = "icons\ico_oilProcessed.paa";
	};

	
	class mahogany_unprocessed {
		variable = "mahoganyU";
		displayName = "STR_Item_MahoganyLog";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_mahoganyUnprocessed.paa";
	};

	class mahogany_processed {
		variable = "mahoganyP";
		displayName = "STR_Item_MahoganyPlank";
		weight = 2;
		buyPrice = -1;
		sellPrice = 550;
		illegal = false;
		edible = -1;
		icon = "icons\ico_mahoganyProcessed.paa";
	};
	
	
	class cocaine_unprocessed {
		variable = "cocaineUnprocessed";
		displayName = "STR_Item_CocaineU";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cocaineUnprocessed.paa";
		processedItem = "cocaine_processed";
	};

	class cocaine_processed {
		variable = "cocaineProcessed";
		displayName = "STR_Item_CocaineP";
		weight = 2;
		buyPrice = -1;
		sellPrice = 900;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cocaineProcessed.paa";
	};

	
	//Tier 4
	class platinum_unrefined {
		variable = "platU";
		displayName = "STR_Item_platU";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_platinumUnrefined.paa";
	};

	class platinum_refined {
		variable = "platR";
		displayName = "STR_Item_platR";
		weight = 3;
		buyPrice = -1;
		sellPrice = 1800;
		illegal = false;
		edible = -1;
		icon = "icons\ico_platinumRefined.paa";
	};
	
	
	class sodiumhydroxide {
		variable = "sodiumhydroxide";
		displayName = "STR_Item_SodiumHydroxide";
		weight = 1;
		buyPrice = 100;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_sodiumhydroxide.paa";
	};

	class ephedrine {
		variable = "ephedrine";
		displayName = "STR_Item_ephedrine";
		weight = 1;
		buyPrice = 150;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_ephedrine.paa";
	};

	class hydrochloricacid {
		variable = "hydrochloricacid";
		displayName = "STR_Item_HydrochloricAcid";
		weight = 2;
		buyPrice = 200;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_hydrochloricacid.paa";
	};

	class methamphetamine {
		variable = "methamphetamine";
		displayName = "STR_Item_Methamphetamine";
		weight = 2;
		buyPrice = -1;
		sellPrice = 1800;
		illegal = true;
		edible = -1;
		icon = "icons\ico_methamphetamine.paa";
	};
	
	//Tier 5
	class uraniumA {
		variable = "uraniumA";
		displayName = "STR_Item_Uranium1";
		weight = 8;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uraniumA.paa";
	};

	class uraniumB {
		variable = "uraniumB";
		displayName = "STR_Item_Uranium2";
		weight = 7;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uraniumB.paa";
	};

	class uraniumC {
		variable = "uraniumC";
		displayName = "STR_Item_Uranium3";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uraniumC.paa";
	};

	class uraniumD {
		variable = "uraniumD";
		displayName = "STR_Item_Uranium4";
		weight = 5;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uraniumC.paa";
	};

	class uraniumP {
		variable = "uraniumP";
		displayName = "STR_Item_PUranium";
		weight = 4;
		buyPrice = -1;
		sellPrice = 3500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uraniumP.paa";
	};


	//--- Alcoholic Stuff;
	class bottled_rum {
		variable = "rum";
		displayName = "STR_Item_RumBottled";
		weight = 4;
		buyPrice = -1;
		sellPrice = 120;
		illegal = false;
		edible = -1;
		icon = "icons\ico_rumBottle.paa";
	};

	//--- Gemstones;
	class emerald {
		variable = "emerald";
		displayName = "STR_Item_Emerald";
		weight = 2;
		buyPrice = -1;
		sellPrice = 800;
		illegal = false;
		edible = -1;
		icon = "icons\ico_emerald.paa";
	};

	class sapphire {
		variable = "sapphire";
		displayName = "STR_Item_Sapphire";
		weight = 2;
		buyPrice = -1;
		sellPrice = 800;
		illegal = false;
		edible = -1;
		icon = "icons\ico_sapphire.paa";
	};

	class ruby {
		variable = "ruby";
		displayName = "STR_Item_Ruby";
		weight = 2;
		buyPrice = -1;
		sellPrice = 800;
		illegal = false;
		edible = -1;
		icon = "icons\ico_ruby.paa";
	};

	class topaz {
		variable = "topaz";
		displayName = "STR_Item_Topaz";
		weight = 2;
		buyPrice = -1;
		sellPrice = 500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_topaz.paa";
	};

	class amethyst {
		variable = "amethyst";
		displayName = "STR_Item_Amethyst";
		weight = 2;
		buyPrice = -1;
		sellPrice = 500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_amethyst.paa";
	};

	class citrine {
		variable = "citrine";
		displayName = "STR_Item_Citrine";
		weight = 2;
		buyPrice = -1;
		sellPrice = 500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_citrine.paa";
	};

	class blue_pearl {
		variable = "bluePearl";
		displayName = "STR_Item_BluePearl";
		weight = 2;
		buyPrice = -1;
		sellPrice = 225;
		illegal = false;
		edible = -1;
		icon = "icons\ico_bluePearl.paa";
	};

	class white_pearl {
		variable = "whitePearl";
		displayName = "STR_Item_WhitePearl";
		weight = 2;
		buyPrice = -1;
		sellPrice = 250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_whitePearl.paa";
	};

	//--- Casino Money;
	class briefcase {
		variable = "briefcase";
		displayName = "STR_Item_Briefcase";
		weight = 2;
		buyPrice = -1;
		sellPrice = 50000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_briefcase.paa";
	};

	//--- Fed Money;
	class goldBar {
		variable = "goldBar";
		displayName = "STR_Item_GoldB";
		weight = 40;
		buyPrice = -1;
		sellPrice = 100000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_goldbar.paa";
	};

	//--- Drink;
	class redgull {
		variable = "redgull";
		displayName = "STR_Item_RedGull";
		weight = 1;
		buyPrice = 30;
		sellPrice = -1;
		illegal = false;
		edible = 100;
		icon = "icons\ico_redgull.paa";
	};

	class coffee {
		variable = "coffee";
		displayName = "STR_Item_Coffee";
		weight = 1;
		buyPrice = 15;
		sellPrice = -;
		illegal = false;
		edible = 100;
		icon = "icons\ico_coffee.paa";
	};

	class waterBottle {
		variable = "waterBottle";
		displayName = "STR_Item_WaterBottle";
		weight = 1;
		buyPrice = 10;
		sellPrice = -1;
		illegal = false;
		edible = 100;
		icon = "icons\ico_waterBottle.paa";
	};

	class medicWater {
		variable = "medicWater";
		displayName = "STR_Item_MedicWater";
		weight = 1;
		buyPrice = 10;
		sellPrice = -1;
		illegal = false;
		edible = 30;
		icon = "icons\ico_waterBottle.paa";
	};

	//--- Food;
	class peach {
		variable = "peach";
		displayName = "STR_Item_Peach";
		weight = 1;
		buyPrice = 40;
		sellPrice = 20;
		illegal = false;
		edible = 40;
		icon = "icons\ico_peach.paa";
	};

	class apple {
		variable = "apple";
		displayName = "STR_Item_Apple";
		weight = 1;
		buyPrice = 40;
		sellPrice = 20;
		illegal = false;
		edible = 30;
		icon = "icons\ico_apple.paa";
	};

	class tbacon {
		variable = "tbacon";
		displayName = "STR_Item_TBacon";
		weight = 1;
		buyPrice = 10;
		sellPrice = 10;
		illegal = false;
		edible = 40;
		icon = "icons\ico_tBacon.paa";
	};

	class donuts {
		variable = "donuts";
		displayName = "STR_Item_Donuts";
		weight = 1;
		buyPrice = 15;
		sellPrice = 15;
		illegal = false;
		edible = 30;
		icon = "icons\ico_donuts.paa";
	};

	class medicFood {
		variable = "medicFood";
		displayName = "STR_Item_MedicFood";
		weight = 1;
		buyPrice = 10;
		sellPrice = 10;
		illegal = false;
		edible = 30;
		icon = "icons\ico_rabbitRaw.paa";
	};

	//--- Animals;
	class rabbit_raw {
		variable = "rabbitRaw";
		displayName = "STR_Item_RabbitRaw";
		weight = 2;
		buyPrice = 10;
		sellPrice = 10;
		illegal = false;
		edible = -1;
		icon = "icons\ico_rabbitRaw.paa";
	};

	class rabbit {
		variable = "rabbit";
		displayName = "STR_Item_Rabbit";
		weight = 1;
		buyPrice = 15;
		sellPrice = 15;
		illegal = false;
		edible = 20;
		icon = "icons\ico_rabbit.paa";
	};

	class hen_raw {
		variable = "henRaw";
		displayName = "STR_Item_HenRaw";
		weight = 1;
		buyPrice = 10;
		sellPrice = 10;
		illegal = false;
		edible = -1;
		icon = "icons\ico_wholeChickenRaw.paa";
	};

	class hen {
		variable = "hen";
		displayName = "STR_Item_Hen";
		weight = 1;
		buyPrice = 15;
		sellPrice = 15;
		illegal = false;
		edible = 65;
		icon = "icons\ico_wholeChicken.paa";
	};

	class rooster_raw {
		variable = "roosterRaw";
		displayName = "STR_Item_RoosterRaw";
		weight = 1;
		buyPrice = 20;
		sellPrice = 20;
		illegal = false;
		edible = -1;
		icon = "icons\ico_chickenDrumstickRaw.paa";
	};

	class rooster {
		variable = "rooster";
		displayName = "STR_Item_Rooster";
		weight = 1;
		buyPrice = 25;
		sellPrice = 25;
		illegal = false;
		edible = 45;
		icon = "icons\ico_chickenDrumstick.paa";
	};

	class sheep_raw {
		variable = "sheepRaw";
		displayName = "STR_Item_SheepRaw";
		weight = 2;
		buyPrice = 50;
		sellPrice = 50;
		illegal = false;
		edible = -1;
		icon = "icons\ico_lambChopRaw.paa";
	};

	class sheep {
		variable = "sheep";
		displayName = "STR_Item_Sheep";
		weight = 2;
		buyPrice = 55;
		sellPrice = 55;
		illegal = false;
		edible = 100;
		icon = "icons\ico_lambChop.paa";
	};

	class goat_raw {
		variable = "goatRaw";
		displayName = "STR_Item_GoatRaw";
		weight = 2;
		buyPrice = 40;
		sellPrice = 40;
		illegal = false;
		edible = -1;
		icon = "icons\ico_muttonLegRaw.paa";
	};

	class goat {
		variable = "goat";
		displayName = "STR_Item_Goat";
		weight = 2;
		buyPrice = 45;
		sellPrice = 45;
		illegal = false;
		edible = 100;
		icon = "icons\ico_muttonLeg.paa";
	};

	//--- Fish;
	class salema_raw {
		variable = "salemaRaw";
		displayName = "STR_Item_SalemaRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 100;
		illegal = false;
		edible = -1;
		icon = "icons\ico_salemaRaw.paa";
	};

	class salema {
		variable = "salema";
		displayName = "STR_Item_Salema";
		weight = 1;
		buyPrice = -1;
		sellPrice = 200;
		illegal = false;
		edible = 30;
		icon = "icons\ico_cookedFish.paa";
	};

	class ornate_raw {
		variable = "ornateRaw";
		displayName = "STR_Item_OrnateRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 200;
		illegal = false;
		edible = -1;
		icon = "icons\ico_ornateRaw.paa";
	};

	class ornate {
		variable = "ornate";
		displayName = "STR_Item_Ornate";
		weight = 1;
		buyPrice = -1;
		sellPrice = 250;
		illegal = false;
		edible = 25;
		icon = "icons\ico_cookedFish.paa";
	};

	class mackerel_raw {
		variable = "mackerelRaw";
		displayName = "STR_Item_MackerelRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 100;
		illegal = false;
		edible = -1;
		icon = "icons\ico_mackerelRaw.paa";
	};

	class mackerel {
		variable = "mackerel";
		displayName = "STR_Item_Mackerel";
		weight = 2;
		buyPrice = -1;
		sellPrice = 100;
		illegal = false;
		edible = 30;
		icon = "icons\ico_cookedFish.paa";
	};

	class tuna_raw {
		variable = "tunaRaw";
		displayName = "STR_Item_TunaRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 150;
		illegal = false;
		edible = -1;
		icon = "icons\ico_tunaRaw.paa";
	};

	class tuna {
		variable = "tuna";
		displayName = "STR_Item_Tuna";
		weight = 3;
		buyPrice = -1;
		sellPrice = 450;
		illegal = false;
		edible = 100;
		icon = "icons\ico_cookedFish.paa";
	};

	class mullet_raw {
		variable = "mulletRaw";
		displayName = "STR_Item_MulletRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 150;
		illegal = false;
		edible = -1;
		icon = "icons\ico_mulletRaw.paa";
	};

	class mullet {
		variable = "mullet";
		displayName = "STR_Item_Mullet";
		weight = 2;
		buyPrice = -1;
		sellPrice = 300;
		illegal = false;
		edible = 80;
		icon = "icons\ico_cookedFish.paa";
	};

	class catshark_raw {
		variable = "catsharkRaw";
		displayName = "STR_Item_CatSharkRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 400;
		illegal = false;
		edible = -1;
		icon = "icons\ico_catsharkRaw.paa";
	};

	class catshark {
		variable = "catshark";
		displayName = "STR_Item_CatShark";
		weight = 3;
		buyPrice = -1;
		sellPrice = 500;
		illegal = false;
		edible = 100;
		icon = "icons\ico_cookedFish.paa";
	};


	class turtle_soup {
		variable = "turtleSoup";
		displayName = "STR_Item_TurtleSoup";
		weight = 2;
		buyPrice = -1;
		sellPrice = 500;
		illegal = true;
		edible = 100;
		icon = "icons\ico_turtleSoup.paa";
	};

	//--- Organs;
	class kidney {
		variable = "kidney";
		displayName = "STR_Item_Kidney";
		weight = 15;
		buyPrice = 600;
		sellPrice = 600;
		illegal = true;
		edible = -1;
		icon = "icons\ico_kidney.paa";
	};

	class flesh {
		variable = "flesh";
		displayName = "STR_Item_Flesh";
		weight = 15;
		buyPrice = 300;
		sellPrice = 300;
		illegal = true;
		edible = -1;
		icon = "icons\ico_flesh.paa";
	};

	class scalpel {
		variable = "scalpel";
		displayName = "STR_Item_Scalpel";
		weight = 2;
		buyPrice = 800;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_scalpel.paa";
	};

	//--- Treasure Hunting;
	class roundobject {
		variable = "roundobject";
		displayName = "STR_Item_RoundObject";
		weight = 8;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_roundobject.paa";
	};

	class squareobject {
		variable = "squareobject";
		displayName = "STR_Item_SquareObject";
		weight = 10;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_squareobject.paa";
	};

	class coins {
		variable = "coins";
		displayName = "STR_Item_Coins";
		weight = 5;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_coins.paa";
	};

	class stonetablet {
		variable = "stonetablet";
		displayName = "STR_Item_StoneTablet";
		weight = 5;
		buyPrice = -1;
		sellPrice = 10000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_stonetablet.paa";
	};

	class carvedstone {
		variable = "carvedstone";
		displayName = "STR_Item_CarvedStone";
		weight = 2;
		buyPrice = -1;
		sellPrice = 5000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_carvedstone.paa";
	};

	class valuablecoins {
		variable = "valuablecoins";
		displayName = "STR_Item_ValuableCoins";
		weight = 10;
		buyPrice = -1;
		sellPrice = 500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_scalpel.paa";
	};

	class doubloon {
		variable = "doubloon";
		displayName = "STR_Item_Doubloon";
		weight = 15;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_dirtydoubloon.paa";
	};

	class golddoubloon {
		variable = "golddoubloon";
		displayName = "STR_Item_GoldDoubloon";
		weight = 20;
		buyPrice = -1;
		sellPrice = 4000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_dirtydoubloon.paa";
	};

	//--- Crafting Items;
	class steel {
		variable = "steel";
		displayName = "STR_Item_Steel";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_steel.paa";

	};

	class iron {
		variable = "iron";
		displayName = "STR_Item_Iron";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_iron.paa";
	};

	class twigs {
		variable = "twigs";
		displayName = "STR_Item_Twigs";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_twig.paa";
	};

	class hemp {
		variable = "hemp";
		displayName = "STR_Item_Hemp";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_hemp.paa";
	};

	class engine_component {
		variable = "engineComponent";
		displayName = "STR_Item_EngineComponent";
		weight = 1;
		buyPrice = 3500;
		sellPrice = 1750;
		illegal = false;
		edible = -1;
		icon = "icons\ico_enginec.paa";
	};
	
	class wheel {
		variable = "wheel";
		displayName = "STR_Item_Wheel";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_tire.paa";
	};
	
	class pipe {
		variable = "pipe";
		displayName = "STR_Item_Metal_Pipe";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_pipe.paa";
	};
	
	class polymer {
		variable = "polymer";
		displayName = "STR_Item_Polymer";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_polymer.paa";
	};
	
	class firing_pin {
		variable = "firingPin";
		displayName = "STR_Item_FiringPin";
		weight = 1;
		buyPrice = 3000;
		sellPrice = 2000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_firingpin.paa";
	};
	
	class spring {
		variable = "spring";
		displayName = "STR_Item_Spring";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_spring.paa";
	};
	
	class fabric {
		variable = "fabric";
		displayName = "STR_Item_Fabric";
		weight = 1;
		buyPrice = 3000;
		sellPrice = 2000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fabric.paa";
	};
	
	class kevlar {
		variable = "kevlar";
		displayName = "STR_Item_Kevlar";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kevlar.paa";
	};
	
	class glass {
		variable = "glass";
		displayName = "STR_Item_Glass";
		weight = 1;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_glass.paa";
	};
};
