/*
	Author: Maverick Applications
	Convoy sidemission for Altis Life servers
*/

class Maverick_ConvoySidemission
{
	class Config
	{
		ConfigPool[] 							= {"GoldBarTransport","WeaponTransport"};
		ForceConfigAtIndex 						= 1;
		SleepTime								= 1800;
		MakePlayersHostileFor					= 300;
		TimeoutBetweenMarkers					= 300;
		SidesNotAttackable[]					= {"west","independent"};
		AIDifficulty[] = {
												{"aimingAccuracy", 1},
												{"aimingShake", 1},
												{"aimingSpeed", 1},
												{"endurance", 1},
												{"spotDistance", 1},
												{"spotTime", 1},
												{"courage", 1},
												{"reloadSpeed", 1},
												{"commanding", 1},
												{"general", 1}
		};
	};
	class ConvoyConfigurationsPool
	{
		/*********************** EXAMPLE TRANSPORT FOR VIRTUAL ITEMS ***********************/
		class GoldBarTransport
		{
			class MapConfiguration
			{
				showMapMarker					= 1;
				text							= "Gold Transport";
			};

			class AIUnits
			{
				gear[] = {
												"H_MilCap_gen_F", // Headgear
												"", // Glasses
												"U_B_GEN_Soldier_F", // Uniform
												"V_TacVest_gen_F", // Vest
												"", // Backpack
												{"arifle_SPAR_01_blk_F", "30Rnd_556x45_Stanag", 10}, // Primary weapon, ammo and how many magazines
												{"", "", 5} // Secondary weapon, ammo and how many magazines
				};
			};

			class Messages
			{
				// Enable messages?
				enabled							= 1;

				// Mission started announcement
				startAnnouncementHeader			= "Gold Transport";
				startAnnouncementDescription	= "The Federal Reserve's guarded transporter is currently moving larger amounts of gold.";

				// Mission objective completed
				stoppedAnnouncementHeader		= "Gold Transporter disabled";
				stoppedAnnouncementDescription	= "The gold transporter has been disabled.";

				// Mission completed announcement
				endAnnouncementHeader			= "Gold Transport ended";
				endAnnouncementDescription  	= "The mission has ended.";
			};

			class Vehicles
			{
				// Vehicle configuration
				vehiclesInOrder[]				= {"O_T_LSV_02_armed_F","O_T_Truck_03_ammo_ghex_F","O_T_LSV_02_unarmed_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_gold_convoy_spawn1","mav_gold_convoy_spawn2","mav_gold_convoy_spawn3"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 1;
				maxSpeed						= 40;
				removeVehiclesAfterSeconds		= 900;
				additionalUnitsAmount			= 20;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_gold_convoy_waypoint1","mav_gold_convoy_waypoint2","mav_gold_convoy_waypoint3","mav_gold_convoy_waypoint4","mav_gold_convoy_waypoint5","mav_gold_convoy_waypoint6","mav_gold_convoy_waypoint7","mav_gold_convoy_waypoint8","mav_gold_convoy_waypoint9","mav_gold_convoy_waypoint10","mav_gold_convoy_waypoint11","mav_gold_convoy_waypoint12","mav_gold_convoy_waypoint13","mav_gold_convoy_waypoint14","mav_gold_convoy_waypoint15","mav_gold_convoy_waypoint16","mav_gold_convoy_waypoint17","mav_gold_convoy_waypoint18","mav_gold_convoy_waypoint19","mav_gold_convoy_waypoint20","mav_gold_convoy_waypoint21","mav_gold_convoy_waypoint22","mav_gold_convoy_waypoint23","mav_gold_convoy_waypoint24"};
			};

			class Loot
			{
				type 							= "virtual";
				container						= "O_T_Truck_03_ammo_ghex_F";
				data[] = {
												{"goldBar", 10},{"polymer", 10},{"kevlar", 10}
				};
			};
		};


		/*********************** EXAMPLE TRANSPORT FOR REAL ITEMS ***********************/
		class WeaponTransport
		{
			class MapConfiguration
			{
				showMapMarker					= 1;
				text							= "Weapon Transport";
			};

			class AIUnits
			{
				gear[] = {
												"H_MilCap_gen_F", // Headgear
												"", // Glasses
												"U_B_GEN_Soldier_F", // Uniform
												"V_TacVest_gen_F", // Vest
												"", // Backpack
												{"arifle_SPAR_01_blk_F", "30Rnd_556x45_Stanag", 10}, // Primary weapon, ammo and how many magazines
												{"", "", 5} // Secondary weapon, ammo and how many magazines
				};
			};

			class Messages
			{
				// Enable messages?
				enabled							= 1;

				// Mission started announcement
				startAnnouncementHeader			= "Weapon Transport";
				startAnnouncementDescription	= "The local army is currently transporting larger amounts of weapons through Tanoa with ground vehicles.";

				// Mission objective completed
				stoppedAnnouncementHeader		= "Weapon Transporter disabled";
				stoppedAnnouncementDescription	= "The Weapon transporter has been disabled.";

				// Mission completed announcement
				endAnnouncementHeader			= "Weapon Transport ended";
				endAnnouncementDescription  	= "The mission has ended.";
			};

			class Vehicles
			{
				// Vehicle configuration
				vehiclesInOrder[]				= {"O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F","O_T_Truck_03_ammo_ghex_F","O_T_LSV_02_unarmed_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_weapon_convoy_spawn1","mav_weapon_convoy_spawn2","mav_weapon_convoy_spawn3","mav_weapon_convoy_spawn4"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 2;
				maxSpeed						= 40;
				removeVehiclesAfterSeconds		= 900;
				additionalUnitsAmount			= 10;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_weapon_convoy_waypoint1","mav_weapon_convoy_waypoint2","mav_weapon_convoy_waypoint3","mav_weapon_convoy_waypoint4","mav_weapon_convoy_waypoint5","mav_weapon_convoy_waypoint6","mav_weapon_convoy_waypoint7","mav_weapon_convoy_waypoint8","mav_weapon_convoy_waypoint9","mav_weapon_convoy_waypoint10","mav_weapon_convoy_waypoint11","mav_weapon_convoy_waypoint12","mav_weapon_convoy_waypoint13","mav_weapon_convoy_waypoint14","mav_weapon_convoy_waypoint15","mav_weapon_convoy_waypoint16","mav_weapon_convoy_waypoint17","mav_weapon_convoy_waypoint18","mav_weapon_convoy_waypoint19","mav_weapon_convoy_waypoint20","mav_weapon_convoy_waypoint21","mav_weapon_convoy_waypoint22","mav_weapon_convoy_waypoint23","mav_weapon_convoy_waypoint24","mav_weapon_convoy_waypoint25","mav_weapon_convoy_waypoint26","mav_weapon_convoy_waypoint27","mav_weapon_convoy_waypoint28","mav_weapon_convoy_waypoint29","mav_weapon_convoy_waypoint30"};
			};

			class Loot
			{
				type 							= "real";
				container						= "B_CargoNet_01_ammo_F";
				data[] = {
												{"srifle_DMR_01_F", 2, "WEAPON"},
												{"optic_SOS", 2, "ITEM"},
												{"10Rnd_762x54_Mag", 6, "MAGAZINE"},
												{"B_Kitbag_mcamo", 2, "BACKPACK"}
				};
			};
		};
	};
};