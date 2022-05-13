/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

// Configuration file for the weaponshop

class maverick_weaponshop_cfg {

	cashVar = "CL_cmoola";								//--- Cash Variable
	bankVar = "CL_bmoola";								//--- Bank Variable
	cashSymbol = "$"; 									//--- Currency Symbol
	rotationSpeed = 2; 									//--- Rotation speed for item in preview (1 - 10)
	saveFunction = "[] call SOCK_fnc_updateRequest"; 	//--- Function to save gear etc. once items are purchased

	class localization {
		//--- localization for hints etc.
		msgParamEmpty =						"Shop Parameter is empty!";
		msgInVehicle =						"You cannot be in a Vehicle!";
		msgShopExists =						"Shop doesn't Exist!";
		msgCondition =						"Not permitted to access this Shop!";
		msgCashOnHand =						"Cash on Hand - %1%2";
		msgCashOnBank =						"Cash in Bank - %1%2";
		msgCartTotal =						"Your Cart - %1%2";
		msgInfoTooltip =					"--> HOLD YOUR LEFT MOUSE BUTTON DOWN WHILE MOVING MOUSE TO ROTATE WEAPON.\n--> DOUBLE CLICK ON AN ITEM IN THE CART TO REMOVE IT.\n--> USE THE 'OVERRIDE GEAR' CHECKBOX TO REPLACE WEAPONS ON HAND WITH PURCHASED WEAPONS.";
		msgInfoTooltip2 = 					"--> DOUBLE CLICK ON AN ITEM IN THE CART TO REMOVE IT.\n--> USE THE 'OVERRIDE GEAR' CHECKBOX TO REPLACE WEAPONS ON HAND WITH PURCHASED WEAPONS.";
		msgEmptyShop = 						"Nothing Found...";
		msgInfoText	=						"<t color='#FFFFFF'>Price:</t> <t color='%1'>%3%2</t>";
		msgCartFull	=						"Cart is Full";
		msgCartEmpty =						"Cart is Empty";
		msgNotEnoughCash =					"Not enough Money for this Transaction";
		msgOverrideAlert =					"Use the override feature to override gear!";
		msgTransactionComplete =			"Purchase completed for %1%2";
		msgNotEnoughSpace =				 	"You didn't have enough space for all the items. You however only paid for those you had space for!";
		msgClear =							"Clear";
		msgSearch =							"Search";

		//--- localization for dialogs
		#define dialogTabWeapon				"Weapon"
		#define dialogTabMagazines			"Magazines"
		#define dialogTabAttachments		"Attachments"
		#define dialogTabOther				"Other"
		#define dialogAddBtn				"Add"
		#define dialogOverrideTooltip		"Override Gear"
		#define dialogCompleteBtn			"Complete"
		#define dialogCloseBtn 				"Close"
	};

	class shops {
		//--- Civ General Shop;
		class civ_gen_shop {
			title = "General Shop"; //--- Title of Shop
			condition = ""; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {};

			magazines[] = {};

			attachments[] = {};

			items[] = {
				{ "FirstAidKit", 80, "", "" },
				{ "Binocular", 150, "", "" },
				{ "ItemGPS", 250, "", "" },
				{ "ItemRadio", 100, "", "" },
				{ "ItemMap", 50, "", "" },
				{ "ItemCompass", 100, "", "" },
				{ "ItemWatch", 100, "", "" },
				{ "NVGoggles", 250, "", "" }
			};
		};
		//--- EMS General Shop;
		class ems_gen_shop {
			title = "General Shop"; //--- Title of Shop
			condition = "call CL_mediclevel >= 1"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {};

			magazines[] = {};

			attachments[] = {};

			items[] = {
				{ "FirstAidKit", 80, "call CL_mediclevel >= 1", "" },
				{ "Binocular", 150, "call CL_mediclevel >= 1", "" },
				{ "ItemGPS", 250, "call CL_mediclevel >= 1", "" },
				{ "ItemRadio", 100, "call CL_mediclevel >= 1", "" },
				{ "ItemMap", 50, "call CL_mediclevel >= 1", "" },
				{ "ItemCompass", 100, "call CL_mediclevel >= 1", "" },
				{ "ItemWatch", 100, "call CL_mediclevel >= 1", "" },
				{ "NVGoggles", 250, "call CL_mediclevel >= 1", "" }
			};
		};
		//--- Fuel Station General Shop;
		class fuel_gen_shop {
			title = "General Shop"; //--- Title of Shop
			condition = ""; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {};

			magazines[] = {};

			attachments[] = {};

			items[] = {
				{ "FirstAidKit", 80, "", "" },
				{ "Binocular", 150, "", "" },
				{ "ItemGPS", 250, "", "" },
				{ "ItemRadio", 100, "", "" },
				{ "ItemMap", 50, "", "" },
				{ "ItemCompass", 100, "", "" },
				{ "ItemWatch", 100, "", "" },
				{ "NVGoggles", 250, "", "" }
			};
		};
		//--- Civ Gun Shop;
		class civ_gun_shop {
			title = "Gun Shop"; //--- Title of Shop
			condition = "license_civ_gun"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name
				{ "arifle_SDAR_F", 10000, "license_civ_gun", "" },
				{ "hgun_PDW2000_F", 8500, "license_civ_gun", "" },
				{ "hgun_Pistol_heavy_02_F", 4000, "license_civ_gun", "" },
				{ "hgun_Pistol_heavy_01_F", 3500, "license_civ_gun", "" },
				{ "hgun_Pistol_01_F", 2000, "license_civ_gun", "" },
				{ "hgun_Rook40_F", 2000, "license_civ_gun", "" }
			};

			magazines[] = {
				{ "16Rnd_9x21_Mag", 500, "license_civ_gun", "" },
				{ "10Rnd_9x21_Mag", 500, "license_civ_gun", "" },
				{ "11Rnd_45ACP_Mag", 300, "license_civ_gun", "" },
				{ "6Rnd_45ACP_Cylinder", 300, "license_civ_gun", "" },
				{ "30Rnd_9x21_Mag", 300, "license_civ_gun", "" },
				{ "20Rnd_556x45_UW_mag", 400, "license_civ_gun", "" }
			};

			attachments[] = {
				{ "optic_ACO_grn_smg", 300, "license_civ_gun", "" },
				{ "optic_Aco_smg", 300, "license_civ_gun", "" },
				{ "optic_Yorris", 200, "license_civ_gun", "" },
				{ "optic_MRD", 200, "license_civ_gun", "" }
			};

			items[] = {
				{ "FirstAidKit", 80, "license_civ_gun", "" },
				{ "Binocular", 150, "license_civ_gun", "" },
				{ "ItemGPS", 250, "license_civ_gun", "" },
				{ "ItemRadio", 100, "license_civ_gun", "" },
				{ "ItemMap", 50, "license_civ_gun", "" },
				{ "ItemCompass", 100, "license_civ_gun", "" },
				{ "ItemWatch", 100, "license_civ_gun", "" },
				{ "NVGoggles", 250, "license_civ_gun", "" }
			};
		};
/*		//--- Gang Hideouts;
		class gang_gun_shop {
			title = "Gang Shop"; //--- Title of Shop
			condition = ""; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name				
				{ "arifle_SDAR_F", 10000, "", "Poaching Rifle" },
				{ "hgun_Rook40_F", 5000, "", "" },
				{ "hgun_Pistol_heavy_02_F", 7500, "", "" },
				{ "hgun_ACPC2_F", 7500, "", "" },
				{ "hgun_PDW2000_F", 20000, "", "" },
				{ "optic_ACO_grn_smg", 2500, "", "" }
			};

			magazines[] = {
				{ "20Rnd_556x45_UW_mag", 400, "", "" },
				{ "16Rnd_9x21_Mag", 1000, "", "" },
				{ "6Rnd_45ACP_Cylinder", 1500, "", "" },
				{ "9Rnd_45ACP_Mag", 1250, "", "" },
				{ "30Rnd_9x21_Mag", 1500, "", "" }
			};

			attachments[] = {	
				{ "optic_ACO_grn_smg", 150, "", "SMG Green ACO" },
				{ "optic_Aco_smg", 150, "", "SMG Red ACO" }
			};

			items[] = {};
		};*/
		//--- Rebel Gun Shop;
		class reb_gun_shop {
			title = "Rebel Shop"; //--- Title of Shop
			condition = "license_civ_reb"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name	
				{ "arifle_MX_F", 40000, "license_civ_reb", "" },
				{ "arifle_MXC_F", 35000, "license_civ_reb", "" },
				{ "arifle_Katiba_C_F", 40000, "license_civ_reb", "" },
				{ "arifle_CTAR_hex_F", 30000, "license_civ_reb", "" },
				{ "arifle_AKS_F", 20000, "license_civ_reb", "" },
				{ "arifle_TRG21_F", 25000, "license_civ_reb", "" },
				{ "arifle_Mk20_plain_F", 25000, "license_civ_reb", "" },
				{ "hgun_Pistol_heavy_01_F", 5000, "license_civ_reb", "" },
				{ "hgun_Pistol_heavy_02_F", 5000, "license_civ_reb", "" },
				{ "hgun_Pistol_01_F", 3000, "license_civ_reb", "" },
				{ "hgun_Rook40_F", 3000, "license_civ_reb", "" }
			};

			magazines[] = {
				{ "30Rnd_762x39_Mag_F", 250, "license_civ_reb", "" },
				{ "20Rnd_762x51_Mag", 250, "license_civ_reb", "" },
				{ "10Rnd_762x54_Mag", 250, "license_civ_reb", "" },
				{ "10Rnd_9x21_Mag", 100, "license_civ_reb", "" },
				{ "20Rnd_650x39_Cased_Mag_F", 250, "license_civ_reb", "" },
				{ "30Rnd_65x39_caseless_green", 250, "license_civ_reb", "" },
				{ "100Rnd_580x42_Mag_F", 700, "license_civ_reb", "" },
				{ "100Rnd_65x39_caseless_mag", 700, "license_civ_reb", "" },
				{ "30Rnd_65x39_caseless_mag", 240, "license_civ_reb", "" },
				{ "30Rnd_580x42_Mag_F", 200, "license_civ_reb", "" },
				{ "30Rnd_556x45_Stanag", 200, "license_civ_reb", "" },
				{ "30Rnd_65x39_caseless_green", 250, "license_civ_reb", "" },
				{ "30Rnd_545x39_Mag_F", 200, "license_civ_reb", "" },
				{ "11Rnd_45ACP_Mag", 150, "license_civ_reb", "" },
				{ "16Rnd_9x21_Mag", 150, "license_civ_reb", "" },
				{ "30Rnd_9x21_Mag", 200, "license_civ_reb", "" },
				{ "6Rnd_45ACP_Cylinder", 150, "license_civ_reb", "" },
				{ "UGL_FlareWhite_F", 1500, "license_civ_reb", "" },
				{ "UGL_FlareGreen_F", 1500, "license_civ_reb", "" },
				{ "UGL_FlareRed_F", 1500, "license_civ_reb", "" },
				{ "1Rnd_Smoke_Grenade_shell", 1500, "license_civ_reb", "" },
				{ "1Rnd_SmokeRed_Grenade_shell", 1500, "license_civ_reb", "" },
				{ "1Rnd_SmokeGreen_Grenade_shell", 1500, "license_civ_reb", "" }
			};

			attachments[] = {
				{ "optic_MRD", 200, "license_civ_reb", "" },
				{ "optic_Yorris", 200, "license_civ_reb", "" },
				{ "optic_Aco", 300, "license_civ_reb", "" },
				{ "optic_Holosight", 500, "license_civ_reb", "" },
				{ "optic_MRCO", 1000, "license_civ_reb", "" },
				{ "optic_Hamr", 1000, "license_civ_reb", "" },
				{ "optic_Arco", 1000, "license_civ_reb", "" },
				{ "optic_Arco_blk_F", 1000, "license_civ_reb", "" },
				{ "optic_ERCO_snd_F", 1000, "license_civ_reb", "" }
			};

			items[] = {
				{ "FirstAidKit", 80, "license_civ_reb", ""},
				{ "Binocular", 60, "license_civ_reb", "" },
				{ "ItemGPS", 250, "license_civ_reb", "" },
				{ "ItemRadio", 100, "license_civ_reb", "" },
				{ "ItemMap", 10, "license_civ_reb", "" },
				{ "ItemCompass", 10, "license_civ_reb", "" },
				{ "ItemWatch", 10, "license_civ_reb", "" },
				{ "NVGoggles", 100, "license_civ_reb", "" }
			};
		};
/*
		//--- Black Market;
		class black_market_shop {
			title = "Black Market Shop"; //--- Title of Shop
			condition = "license_civ_reb"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name	
				{ "launch_RPG7_F", 500000, "license_civ_reb" "RPG" }
			};

			magazines[] = {	
				{ "RPG7_F", 10000, "license_civ_reb", "RPG Ammo" }
			};

			attachments[] = {
				{ "optic_ACO_grn", 200, "license_civ_reb", "" },
				{ "optic_Hamr", 350, "license_civ_reb", "" },
				{ "optic_Arco_blk_F", 400, "license_civ_reb", "" }
			};

			items[] = {
				{ "FirstAidKit", 80, "license_civ_reb", ""},
				{ "Binocular", 60, "license_civ_reb", "" },
				{ "ItemGPS", 250, "license_civ_reb", "" },
				{ "ItemRadio", 100, "license_civ_reb", "" },
				{ "ItemMap", 10, "license_civ_reb", "" },
				{ "ItemCompass", 10, "license_civ_reb", "" },
				{ "ItemWatch", 10, "license_civ_reb", "" },
				{ "NVGoggles", 100, "license_civ_reb", "" }
			};
		};
*/
		//--- Corp Gun Shop;
		class corp_gun_shop {
			title = "Corp Shop"; //--- Title of Shop
			condition = "license_civ_corp"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name	
				{ "arifle_ARX_ghex_F", 80000, "license_civ_corp", "" },
				{ "arifle_MXM_khk_F", 80000, "license_civ_corp", "" },
				{ "arifle_MX_khk_F", 40000, "license_civ_corp", "" },
				{ "arifle_MXC_khk_F", 35000, "license_civ_corp", "" },
				{ "arifle_SPAR_03_khk_F", 50000, "license_civ_corp", "" },
				{ "arifle_SPAR_01_khk_F", 30000, "license_civ_corp", "" },
				{ "arifle_Mk20_GL_F", 40000, "license_civ_corp", "" },
				{ "arifle_Mk20C_F", 25000, "license_civ_corp", "" },
				{ "SMG_02_F", 24000, "license_civ_corp", "" },
				{ "hgun_Pistol_heavy_01_F", 10000, "license_civ_corp", "" },
				{ "hgun_Pistol_heavy_02_F", 10000, "license_civ_corp", "" },
				{ "hgun_Pistol_01_F", 7000, "license_civ_corp", "" },
				{ "hgun_P07_khk_F", 5000, "license_civ_corp", "" },
				{ "hgun_Rook40_F", 5000, "license_civ_corp", "" }
			};

			magazines[] = {	
				{ "10Rnd_50BW_Mag_F", 5000, "license_civ_corp", "" },
				{ "20Rnd_762x51_Mag", 500, "license_civ_corp", "" },
				{ "100Rnd_65x39_caseless_mag", 450, "license_civ_corp", "" },
				{ "150Rnd_556x45_Drum_Mag_F", 450, "license_civ_corp", "" },
				{ "10Rnd_9x21_Mag", 100, "license_civ_corp", "" },
				{ "30Rnd_65x39_caseless_green", 250, "license_civ_corp", "" },
				{ "30Rnd_556x45_Stanag", 180, "license_civ_corp", "" },
				{ "30Rnd_65x39_caseless_mag", 240, "license_civ_corp", "" },
				{ "30Rnd_9x21_Mag_SMG_02", 180, "license_civ_corp", "" },
				{ "30Rnd_9x21_Mag", 90, "license_civ_corp", "" },
				{ "16Rnd_9x21_Mag", 50, "license_civ_corp", "" },
				{ "11Rnd_45ACP_Mag", 50, "license_civ_corp", "" },
				{ "9Rnd_45ACP_Mag", 50, "license_civ_corp", "" },
				{ "6Rnd_45ACP_Cylinder", 50, "license_civ_corp", "" },
				{ "UGL_FlareWhite_F", 1500, "license_civ_corp", "" },
				{ "UGL_FlareGreen_F", 1500, "license_civ_corp", "" },
				{ "UGL_FlareRed_F", 1500, "license_civ_corp", "" },
				{ "1Rnd_Smoke_Grenade_shell", 1500, "license_civ_corp", "" },
				{ "1Rnd_SmokeRed_Grenade_shell", 1500, "license_civ_corp", "" },
				{ "1Rnd_SmokeGreen_Grenade_shell", 1500, "license_civ_corp", "" }
			};

			attachments[] = {
				{ "optic_Yorris", 200, "license_civ_corp", "" },
				{ "optic_MRD", 200, "license_civ_corp", "" },
				{ "optic_ACO_grn_smg", 300, "license_civ_corp", "" },
				{ "optic_Aco_smg", 300, "license_civ_corp", "" },
				{ "optic_Aco", 300, "license_civ_corp", "" },
				{ "optic_ACO_grn", 300, "license_civ_corp", "" },
				{ "optic_Holosight_smg", 500, "license_civ_corp", "" },
				{ "optic_Holosight", 500, "license_civ_corp", "" },
				{ "optic_Holosight_khk_F", 500, "license_civ_corp", "" },
				{ "optic_MRCO", 1000, "license_civ_corp", "" },
				{ "optic_Hamr", 1000, "license_civ_corp", "" },
				{ "optic_Hamr_khk_F", 1000, "license_civ_corp", "" },
				{ "optic_Arco_blk_F", 1000, "license_civ_corp", "" },
				{ "optic_Arco_ghex_F", 1000, "license_civ_corp", "" },
				{ "optic_ERCO_blk_F", 1000, "license_civ_corp", "" },
				{ "optic_ERCO_khk_F", 1000, "license_civ_corp", "" }
			};

			items[] = {
				{ "FirstAidKit", 80, "license_civ_corp", ""},
				{ "Binocular", 60, "license_civ_corp", "" },
				{ "ItemGPS", 250, "license_civ_corp", "" },
				{ "ItemRadio", 100, "license_civ_corp", "" },
				{ "ItemMap", 10, "license_civ_corp", "" },
				{ "ItemCompass", 10, "license_civ_corp", "" },
				{ "ItemWatch", 10, "license_civ_corp", "" },
				{ "NVGoggles_tna_F", 100, "license_civ_corp", "" },
				{ "NVGoggles_INDEP", 100, "license_civ_corp", "" }
			};
		};
		//--- Cop Weapon Shops;
		class cop_gun_shop {
			title = "Cop Armoury"; //--- Title of Shop
			condition = "call CL_coplevel >= 1"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name	
				//--- Cop Weapons;
				{ "hgun_Rook40_snds_F", 100, "call CL_coplevel >= 1", "Taser" },
				{ "SMG_01_F", "Taser SMG", 1000, "call in_coplevel >= 1", "" },
				{ "arifle_MXC_Black_F", 1500, "call in_coplevel >= 2", "" },
				{ "arifle_MX_Black_F", 2000, "call in_coplevel >= 3", "" },
				{ "arifle_MXM_Black_F", 2500, "call in_coplevel >= 4", "" },
				{ "hgun_Pistol_heavy_02_F", 1000, "call in_coplevel >= 5", "" },
				{ "arifle_SPAR_01_blk_F",  1500, "call in_coplevel >= 6", "" },
				{ "arifle_MX_SW_Black_F", 3000, "call in_coplevel >= 7", "" },
				{ "arifle_SPAR_03_blk_F", 2500, "call in_coplevel >= 8", "" },
				//--- SWAT Weapons;
				{ "arifle_SPAR_03_blk_F", 5000, "license_cop_cSWAT", "" },
				{ "LMG_03_F", 5000, "license_cop_cSWAT", "" },
				{ "arifle_MX_SW_Black_F", 5000, "license_cop_cSWAT", "" },
				{ "arifle_Katiba_F", 5000, "license_cop_cSWAT", "" },
				{ "arifle_ARX_blk_F", 3000, "license_cop_cSWAT", "" },
				{ "arifle_SPAR_01_blk_F", 3000, "license_cop_cSWAT", "" },
				//--- SWAT Sniper Weapons;
				{ "srifle_GM6_F", 20000, "license_cop_cSniper", "" },
				{ "srifle_LRR_F", 20000, "license_cop_cSniper", "" },
				{ "srifle_DMR_02_F", 10000, "license_cop_cSniper", "" },
				{ "srifle_DMR_03_F", 3000, "license_cop_cSniper", "" },
				//--- UC Weapons;
				{ "srifle_DMR_07_hex_F", 6000, "license_cop_cUC", "" },
				{ "arifle_MXM_F", 6000, "license_cop_cUC", "" },
				{ "arifle_MX_F", 3000, "license_cop_cUC", "" },
				{ "arifle_MXC_F", 2500, "license_cop_cUC", "" },
				{ "arifle_CTAR_hex_F", 2000, "license_cop_cUC", "" },
				{ "SMG_05_F", 1500, "license_cop_cUC", "" }
			};

			magazines[] = {
				//--- Cop Magazines;
				{ "16Rnd_9x21_Mag", 30, "call CL_coplevel >= 1", "" },
				{ "20Rnd_762x51_Mag", 150, "call CL_coplevel >= 1", "" },
				{ "100Rnd_65x39_caseless_mag", 120, "call in_coplevel >= 7", "" },
				{ "30Rnd_65x39_caseless_mag_Tracer", 80, "call in_coplevel >= 2", "" },
				{ "30Rnd_65x39_caseless_mag", 100, "call in_coplevel >= 3", "" },
				{ "30Rnd_556x45_Stanag", 150, "call in_coplevel >= 6", "" },
				{ "30Rnd_556x45_Stanag_Tracer_Green", 80, "call in_coplevel >= 6", "" },
				{ "6Rnd_45ACP_Cylinder", 100, "call in_coplevel >= 5", "" },
				{ "30Rnd_45ACP_Mag_SMG_01", 50, "call CL_coplevel >= 1", "" },
				//--- SWAT Magazines;
				{ "20Rnd_762x51_Mag", 100, "license_cop_cSWAT", "" },
				{ "30Rnd_65x39_caseless_green", 80, "license_cop_cSWAT", "" },
				{ "30Rnd_556x45_Stanag", 80, "license_cop_cSWAT", "" },
				{ "30Rnd_556x45_Stanag_Tracer_Green", 80, "license_cop_cSWAT", "" },
				{ "200Rnd_556x45_Box_F", 100, "license_cop_cSWAT", "" },
				{ "100Rnd_65x39_caseless_mag", 100, "license_cop_cSWAT", "" },
				{ "10Rnd_50BW_Mag_F", 200, "license_cop_cSWAT", "" },
				{ "B_IR_Grenade", 20, "license_cop_cSWAT", "" },
				{ "HandGrenade_Stone", 20, "license_cop_cSWAT", "" },
				{ "SmokeShellOrange", 20, "license_cop_cSWAT", "" },
				//--- SWAT Sniper Magazines;
				{ "5Rnd_127x108_Mag", 200, "license_cop_cSniper", "" },
				{ "5Rnd_127x108_APDS_Mag", 200, "license_cop_cSniper", "" },
				{ "7Rnd_408_Mag", 200, "license_cop_cSniper", "" },
				{ "10Rnd_338_Mag", 150, "license_cop_cSniper", "" },
				{ "20Rnd_762x51_Mag", 100, "license_cop_cSniper", "" },
				{ "30Rnd_65x39_caseless_green", 80, "license_cop_cSniper", "" },
				{ "10Rnd_50BW_Mag_F", 200, "license_cop_cSniper", "" },
				{ "B_IR_Grenade", 20, "license_cop_cSniper", "" },
				{ "HandGrenade_Stone", 20, "license_cop_cSniper", "" },
				{ "SmokeShellOrange", 20, "license_cop_cSniper", "" },
				//--- Undercover Magazines;
				{ "20Rnd_650x39_Cased_Mag_F", 1000, "license_cop_cUC", "" },
				{ "30Rnd_65x39_caseless_mag_Tracer", 100, "license_cop_cUC", "" },
				{ "30Rnd_65x39_caseless_mag", 200, "license_cop_cUC", "" },
				{ "30Rnd_580x42_Mag_F", 200, "license_cop_cUC", "" },
				{ "30Rnd_9x21_Mag_SMG_02", 50, "license_cop_cUC", "" }
			};

			attachments[] = {
				//--- Cop Attachments;
				{ "bipod_01_F_blk", 50, "call CL_coplevel >= 3", "" },
				{ "acc_flashlight", 20, "call in_coplevel >= 3", "" },
				{ "acc_pointer_IR", 20, "call in_coplevel >= 4", "" },
				{ "optic_DMS", 300, "call in_coplevel >= 4", "" },
				{ "optic_SOS", 300, "call in_coplevel >= 4", "" },
				{ "optic_NVS", 300, "call in_coplevel >= 4", "" },
				{ "optic_MRCO", 200, "call CL_coplevel >= 3", "" },
				{ "optic_Arco_blk_F", 200, "call CL_coplevel >= 2", "" },
				{ "optic_Hamr", 200, "call CL_coplevel >= 3", "" },
				{ "optic_Holosight_blk_F", 150, "call CL_coplevel >= 2", "" },
				{ "optic_ACO_grn_smg", 100, "call CL_coplevel >= 2", "" },
				{ "optic_Aco_smg", 100, "call CL_coplevel >= 2", "" },
				{ "optic_Holosight_smg_blk_F", 100, "call CL_coplevel >= 2", "" },
				{ "optic_Aco", 100, "call CL_coplevel >= 2", "" },
				{ "optic_Yorris", 100, "call in_coplevel >= 5", "" },
				//--- SWAT Attachments;
				{ "bipod_01_F_blk", 300, "license_cop_cSWAT", "" },
				{ "muzzle_snds_65_TI_blk_F", 300, "license_cop_cSWAT", "" },
				{ "muzzle_snds_M", "5.56 Silencer", 300, "license_cop_cSWAT", "" },
				{ "muzzle_snds_L", "9mm Silencer", 300, "license_cop_cSWAT", "" },
				{ "optic_NVS", "NVS", 300, "license_cop_cSWAT", "" },
				{ "optic_MRCO", "MRCO", 200, "license_cop_cSWAT", "" },
				{ "optic_Arco_blk_F", 200, "license_cop_cSWAT", "" },
				{ "optic_Hamr", "RCO", 200, "license_cop_cSWAT", "" },
				{ "optic_Holosight_blk_F", "HOLO", 200, "license_cop_cSWAT", "" },
				{ "optic_Aco", "ACO", 100, "license_cop_cSWAT", "" },
				{ "acc_flashlight", "Flashlight", 20, "license_cop_cSWAT", "" },
				{ "acc_pointer_IR", "Laser Pointer", 20, "license_cop_cSWAT", "" },
				//--- SWAT Sniper Attachments;
				{ "bipod_01_F_blk", 300, "license_cop_cSniper", "" },
				{ "muzzle_snds_338_black", 300, "license_cop_cSniper", "" },
				{ "muzzle_snds_B", 300, "license_cop_cSniper", "" },
				{ "muzzle_snds_65_TI_hex_F", 300, "license_cop_cSniper", "" },
				{ "optic_DMS", 300, "license_cop_cSniper", "" },
				{ "optic_SOS", 300, "license_cop_cSniper", "" },
				{ "optic_NVS", 300, "license_cop_cSniper", "" },
				{ "optic_LRPS", 400, "license_cop_cSniper", "" },
				{ "optic_AMS", 300, "license_cop_cSniper", "" },
				{ "optic_KHS_blk", 300, "license_cop_cSniper", "" },
				{ "optic_MRCO", 200, "license_cop_cSniper", "" },
				{ "optic_Arco_blk_F", 200, "license_cop_cSniper", "" },
				{ "optic_Hamr", 200, "license_cop_cSniper", "" },
				{ "optic_Holosight_blk_F", 200, "license_cop_cSniper", "" },
				{ "acc_flashlight", 20, "license_cop_cSniper", "" },
				{ "acc_pointer_IR", 20, "license_cop_cSniper", "" },
				//--- UC Attachments;
				{ "optic_AMS", 3000, "license_cop_cUC", "" },
				{ "optic_DMS", 3000, "license_cop_cUC", "" },
				{ "optic_MRCO", 200, "license_cop_cUC", "" },
				{ "optic_Hamr", 200, "license_cop_cUC", "" },
				{ "optic_Holosight", 100, "license_cop_cUC", "" },
				{ "bipod_01_F_blk", 50, "license_cop_cUC", "" },
				{ "acc_flashlight", 20, "license_cop_cUC", "" },
				{ "acc_pointer_IR", 20, "license_cop_cUC", "" }
			};

			items[] = {
				//--- Cop Items;
				{ "FirstAidKit", 80, "call CL_coplevel >= 1", "" },
				{ "Binocular", 50, "call CL_coplevel >= 1", "" },
				{ "ItemGPS", 250, "call CL_coplevel >= 1", "" },
				{ "ItemRadio", 50, "call CL_coplevel >= 1", "" },
				{ "ItemMap", 10, "call CL_coplevel >= 1", "" },
				{ "ItemCompass", 10, "call CL_coplevel >= 1", "" },
				{ "ItemWatch", 10, "call CL_coplevel >= 1", "" },
				{ "NVGoggles", 100, "call CL_coplevel >= 1", "" }
			};
		};
	};
};

#include "gui\weapon_gui_master.cpp"
