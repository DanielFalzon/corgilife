#define true 1
#define false 0

/*
	Master settings for various features and functionality
*/
class CL_Settings {
/* Logging and Security Settings*/
	/* Data Logging Settings */
	player_deathLog = false; //Logs victim and killer when someone dies. SEARCH USING: death_log

/* Database Related Configurations */
	/* Player Data Saving */
	save_virtualItems = true; //Save Virtual items (all sides)?
	saved_virtualItems[] = { "pickaxe","debitcard","fuelEmpty","fuelFull","spikeStrip","GPSTracker","skeletonKey","lockpick","defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","defibrillator","toolkit","bloodbag","chainsaw","medicWater","medicFood" };
	save_playerStats = true; //Save food, water and damage (all sides)?
	save_civilian_weapons = true; //Allow civilians to save weapons on them?
	save_civilian_position = true; //Save civilian location?
	save_civilian_position_restart = true; //Save civilian location only between restarts. After a server restart you'll have to spawn again.
	save_civilian_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.

	/* Vehicle Data Saving */
	save_vehicle_virtualItems = true; //Save Virtual items for vehicles (all sides)?
	save_vehicle_items[] = { "pickaxe","debitcard","fuelEmpty","fuelFull","spikeStrip","GPSTracker","lockpick","skeletonKey","defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","peach","apple","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","defibrillator","toolkit","bloodbag","chainsaw","medicWater","medicFood" };
	save_vehicle_inventory = false; //Save Gear for vehicles (all sides)?
	save_vehicle_fuel = true; //Save vehicle fuel level to the database (Impounded/Garaged).
	save_vehicle_damage = true; //Save vehicle damage to the database.
	save_vehicle_illegal = false; //This will allow cops to be advised when a vehicle, with illegal items in it, is impounded. This will also save illegal items as proof of crime, and needs "save_vehicle_virtualItems" set as true. Illegal items don't need to be set in save_vehicle_items[] for being saved, if it's enabled.

/* System Configurations */
	/* ATM & Federal Reserve System Configurations */
	global_ATM = true; //Allow users to access any ATM on the map.
	noatm_timer = 15; //Time in minutes that players won't be able to deposit his money after selling stolen gold bars.
	minimum_cops = 6; //Minimum cops required online to rob the Federal Reserve or break into the prison.
	debit_cost = 500; //Cost to purchase debit card.

	/*Death Configurations*/
	drop_weapons_onDeath = false; //Set true to enable weapon dropping on death. False (default) will delete player weapons on death, allowing them to be revived with them instead

	/* Robbery Configurations */
	copsHouseRaid = 4; //Minimum cops needed to be online for robbing houses
	minimum_civs_c = 15; //Minimum civs needed to be online for robbing the casino
	minimum_cops_g = 2; //Minimum cops needed to be online for robbing Gas Stations
	
	/* Airdrop Configurations */
	min_civs_airDrop = 1; //Minimum civs needed to be online for airdrops to succeed

	/* Basic System Configurations */
	donor_level = true; //Enable the donor level set in database (var = CL_donorlevel; levels = 0,1,2,3,4,5).
	enable_fatigue = false; //Set to false to disable the ARMA 3 fatigue system.
	total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
	respawn_timer = 60; //How many seconds a player should wait, before being able to respawn. Minimum 5 seconds.

	/* Channel 7 News Station Configurations */
	news_broadcast_cost = 10000; //Cost for a player to send a news station broadcast.
	news_broadcast_cooldown = 20; //Time in minutes that is required between news station broadcasts. (Default = 20 minutes)
	news_broadcast_header_length = 30; //Number of characters that a header can consist of. Anything over this may clip. This depends on the font size and various other factors. Adjust with caution.

	/* Clothing System Configurations */
	civ_skins = false; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)
	cop_extendedSkins = false; //Enable or disable cop skins by level. Before enabling, you must add all the EIGHT files to textures folder. (It must be named as: cop_uniform.jpg + cop_uniform_1.jpg, cop_uniform_2.jpg...cop_uniform_6.jpg, cop_uniform_7.jpg; meaning cop_uniform = CL_coplevel=0, cop_uniform_1 = CL_coplevel=1, cop_uniform_2 = CL_coplevel=2, etc...)
	clothing_noTP = true;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
	clothing_box = false; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
	clothing_masks[] = { "H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "U_O_GhillieSuit", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F", "H_Bandanna_gry", "KA_MCU", "G_Balaclava_TI_G_blk_F", "Masque_GdG", "Masque_Macrilleuse", "Masque_speedRunner", "Masque_Anonymous", "Masque_archNemesis", "Masque_Arnold", "Masque_Bonnie", "Masque_Bush", "Masque_Gombo", "Masque_Dallas", "Masque_Unic", "Masque_Metalhead", "Masque_Clinton", "Masque_Clover", "Masque_Lion", "Masque_Lincoln", "Masque_Mark", "Masque_Religieuse", "Masque_Momie", "Masque_Aubrey", "Masque_Optimiste", "Masque_Orc", "Masque_forceAlpha", "Masque_Incendiaire", "Masque_Alien1", "Masque_Fish", "Masque_Santa", "Masque_Mempo", "Masque_Wolfv2", "Masque_Smiley", "Masque_Hoxton", "Masque_Chuck", "Masque_Chains", "Masque_Hockey", "U_B_FullGhillie_lsh", "U_B_FullGhillie_sard" ,"U_B_FullGhillie_ard" ,"U_O_T_FullGhillie_tna_F" };

	/* Fuel System Configurations */
	Pump_service = true; //Allow users to use pump service on the map. Default = false
	fuel_cost = 50; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
	service_chopper = 100; //Cost to service chopper at chopper service station.
	fuelCan_refuel = 25; //Cost to refuel an empty fuel canister at the fuel station pumps. (Be wary of your buy/sell prices on fuel cans to prevent exploits...)

	/* Gang System Configurations */
	gang_price = 5000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 500; //The base cost for upgrading slots in a gang (base price * slot incriments * current slot size = amount)
	gang_slotIncrements = 2; //Slot upgrade increments
	gang_maxUpgradeMembers = 12; //Max gang members allowed

	/* Housing System Configurations */
	house_limit = 5; //Maximum number of houses a player can own.
	houseGarage_buyPrice = 100000;
	houseGarage_sellPrice = 35000;

	/* Hunting & Fishing System Configurations */
	animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" };
	animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" };

	/* Item-related Restrictions */
	restrict_medic_weapons = true; //Set to false to allow medics to use any weapon -true will remove ANY weapon they attempt to use (primary,secondary,launcher)
	restrict_clothingPickup = true; //Set to false to allow civilians to pickup/take any uniform (ground/crates/vehicles)
	restrict_weaponPickup = false; //Set to false to allow civilians to pickup/take any weapon (ground/crates/vehicles)
	restricted_uniforms[] = { "U_Rangemaster" };
	restricted_weapons[] = { "hgun_ACPC2_F", "arifle_MXC_Black_F", "arifle_MX_Black_F", "arifle_MXM_Black_F", "SMG_01_F", "arifle_SPAR_01_blk_F", "arifle_SPAR_03_blk_F", "arifle_MX_SW_Black_F", "srifle_GM6_F", "srifle_DMR_02_F", "srifle_DMR_03_F", "arifle_ARX_blk_F", "LMG_03_F", "SMG_05_F" };

	/* Jail System Configurations */
	jail_seize_vItems[] = { "gravel","refinedGravel","bloodbag","defibrillator","spikeStrip","GPSTracker","lockpick","skeletonKey","goldBar","blastingcharge","boltcutter","defusekit","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw","exotic_soup","ephedrine","hydrochloricacid","sodiumhydroxide","methamphetamine" };//Define VIRTUAL items you want to be removed from players upon jailing here. Use "jail_seize_inventory" for Arma inventory items.
	sendtoJail_locations[] = { "cop_jail_1" }; //Enter the variableName from the mission.sqm here to allow cops to send a person to jail at these locations.
	jail_forceWalk = true; // Stops a player from being able run around in jail.

	/* Medical System Configurations */
	revive_fee = 500; //Revive fee that players have to pay and medics / EMS are rewarded.
	hospital_heal_fee = 100; //Fee to heal at a hospital NPC

	/* Sky Diving Configurations */
	dive_price = 100;

	/* Paycheck & Bank System Configurations */
	bank_cop = 15000; //Amount of cash on bank for new cops
	bank_civ = 10000; //Amount of cash on bank for new civillians
	bank_med = 15000; //Amount of cash on bank for new medics

	paycheck_period = 5; //Scaled in minutes
	paycheck_cop = 500; //Payment for cops
	paycheck_civ = 250; //Payment for civillians
	paycheck_med = 500; //Payment for medics

	/* Player Job System Configurations */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
	FuelTank_WinMultiplier = 1; //Win Multiplier in FuelTank Missions. Increase for more Money! Default = 1

	/* Search & Seizure System Configurations */
	patdown_safeItems[] = { "FirstAidKit","tf_anprc152","ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","NVGoggles_tna_F","NVGoggles_INDEP","Rangefinder","Binocular" }; //Arma items that will not get seized from player inventories
	patdown_minimum_rank = 1; //Required minimum CopLevel to be able to seize items from players

	/* Revoking License Configuration */
	revoke_minimum_rank = 3; //Required minimum CopLevel to be able to revoke licenses from players
	
	/* Crushing License Configuration */
	crush_minimum_rank = 3; //Required minimum CopLevel to be able to crush vehicles

	/* Revoking License Configuration */
	license_minimum_rank = 8; //Required minimum CopLevel to be able to "restrain" other cops
	give_minimum_rank = 8; //Required minimum CopLevel to be able to give licenses to cops
	remove_minimum_rank = 8; //Required minimum CopLevel to be able to remove licenses from cops

	/* Utility Item Configurations */
	emp_light_list[] = { "Lamps_Base_F", "Land_LampAirport_F", "Land_LampSolar_F", "Land_LampStreet_F", "Land_LampStreet_small_F", "Land_LampDecor_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampShabby_F", "Land_PowerPoleWooden_L_F", "Land_NavigLight", "Land_runway_edgelight", "Land_runway_edgelight_blue_F", "Land_Flush_Light_green_F", "Land_Flush_Light_red_F", "Land_Flush_Light_yellow_F", "Land_Runway_PAPI", "Land_Runway_PAPI_2", "Land_Runway_PAPI_3", "Land_Runway_PAPI_4", "Land_fs_roof_F", "Land_fs_sign_F", "PowerLines_base_F", "PowerLines_Small_base_F", "PowerLines_Wires_base_F", "Land_PowerPoleWooden_F", "Land_PowerLine_01_pole_lamp_F" }; // Add lights here which you wish to be affected by the EMP Grenade

	/* Cop Undercover Configurations */
	uc_name_list[] = { "Todd", "Terry", "Barry", "Steve", "Dave", "Brent", "Francis", "Alexander", "Gene", "Tubby", "Lee", "Adam", "Paul", "Samuel", "Douglas", "Jumaane", "Thomas", "Joseph", "Drew", "Mr", "Gary", "Volkov", "Aleksei", "Ragnar", "Kalle", "Crazy", "Poor", "Serious", "Daniel", "Danne", "Hermando", "Hugo", "Timmy", "Trey", "Shorty", "Tiny", "Alvarez", "Berg", "Elliot", "Ghandi", "Unknown", "Williams", "Lavender", "Johnson", "Morgan", "Putin" }; // Name of UC Agent
	uc_surname_list[] = { "Gaming", "Poop", "Destroyer", "McGraff", "Betts", "Tafadzwa","Smith", "Hall", "Slapoffski", "Pinto", "Sawicki", "Gibbs", "Robson", "Sylvain", "Clément", "Sméagol Burrows", "Roper", "Randen", "Myrvold", "Costa", "Howell", "Norris", "Katatakato", "Rukimichimoshi", "Lung", "Bar", "Vogel", "Kastner", "Meyer", "Karlsen", "Nicholls", "Quinn", "kalashnikov" }; // Surname of UC Agent

	/* Vehicle System Configurations */
	chopShop_vehicles[] = { "Car", "Air" }; //Vehicles that can be chopped. (Can add: "Ship" and possibly more -> look at the BI wiki...)
	vehicle_infiniteRepair[] = {false, true, true, false}; //Set to true for unlimited repairs with 1 toolkit. False will remove toolkit upon use. civilian, west, independent, east
	vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "O_T_LSV_02_armed_F", "B_T_LSV_01_armed_F" };
	vehicleShop_3D = true; //Add preview 3D inside Shop vehicle.	   Default : False

	/* Vehicle Purchase Prices */
	vehicle_purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
	vehicle_purchase_multiplier_COP = .01; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
	vehicle_purchase_multiplier_MEDIC = .1; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
	vehicle_purchase_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

	/* Vehicle Purchase Prices */
	vehicle_rental_multiplier_CIVILIAN = .85; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
	vehicle_rental_multiplier_COP = .1; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
	vehicle_rental_multiplier_MEDIC = .1; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
	vehicle_rental_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

	/* Vehicle Sell Prices */
	vehicle_sell_multiplier_CIVILIAN = .15; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
	vehicle_sell_multiplier_COP = .01; //Cop Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
	vehicle_sell_multiplier_MEDIC = .1; //Medic Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
	vehicle_sell_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

	/* "Other" Vehicle Prices */
	vehicle_chopShop_multiplier = .15; //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
	vehicle_storage_fee_multiplier = .01; //Pull from garage cost --> Cost takes the playersides Buy Price * multiplier
	vehicle_cop_impound_multiplier = .01; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier

/* Wanted System related settings */
	/* crimes[] = {String, Bounty, Code} */
	crimes[] = {
		{"STR_Crime_187V","650","187V"},
		{"STR_Crime_187","2000","187"},
		{"STR_Crime_901","450","901"},
		{"STR_Crime_215","200","215"},
		{"STR_Crime_213","1000","213"},
		{"STR_Crime_211","100","211"},
		{"STR_Crime_207","350","207"},
		{"STR_Crime_207A","200","207A"},
		{"STR_Crime_390","1500","390"},
		{"STR_Crime_487","150","487"},
		{"STR_Crime_488","70","488"},
		{"STR_Crime_480","100","480"},
		{"STR_Crime_481","100","481"},
		{"STR_Crime_482","500","482"},
		{"STR_Crime_483","950","483"},
		{"STR_Crime_459","650","459"},
		{"STR_Crime_666","200","666"},
		{"STR_Crime_667","4500","667"},
		{"STR_Crime_668","150","668"},
		{"STR_Crime_919","20000","919"},
		{"STR_Crime_920","20000","920"},
		{"STR_Crime_1","250","1"},
		{"STR_Crime_2","200","2"},
		{"STR_Crime_3","150","3"},
		{"STR_Crime_4","250","4"},
		{"STR_Crime_5","100","5"},
		{"STR_Crime_6","80","6"},
		{"STR_Crime_7","150","7"},
		{"STR_Crime_8","5000","8"},
		{"STR_Crime_9","5000","9"},
		{"STR_Crime_10","15000","10"},
		{"STR_Crime_11","10000","11"},
		{"STR_Crime_12","2500","12"},
		{"STR_Crime_13","1500","13"},
		{"STR_Crime_14","500","14"},
		{"STR_Crime_15","2500","15"},
		{"STR_Crime_16","1500","16"},
		{"STR_Crime_17","100","17"},
		{"STR_Crime_18","1500","18"},
		{"STR_Crime_19","2500","19"},
		{"STR_Crime_20","500","20"},
		{"STR_Crime_21","500","21"},
		{"STR_Crime_22","2000","22"},
		{"STR_Crime_23","5000","23"},
		{"STR_Crime_24","10000","24"},
		{"STR_Crime_25","20000","25"}
	};
};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"
#include "Config_Process.hpp"
#include "Config_CellPhone.hpp"
#include "Config_Housing.hpp"
#include "Config_Garages.hpp"
//#include "Config_Map.hpp"
