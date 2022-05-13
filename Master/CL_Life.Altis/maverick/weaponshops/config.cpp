/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

// Configuration file for the weaponshop

class maverick_weaponshop_cfg {

	cashVar = "CL_cmoola";								//--- Cash Variable
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
				{ "FirstAidKit", 80, "call CL_mediclevel >= 0", "" },
				{ "Binocular", 150, "call CL_mediclevel >= 0", "" },
				{ "ItemGPS", 250, "call CL_mediclevel >= 0", "" },
				{ "ItemRadio", 100, "call CL_mediclevel >= 0", "" },
				{ "ItemMap", 50, "", "call CL_mediclevel >= 0" },
				{ "ItemCompass", 100, "call CL_mediclevel >= 0", "" },
				{ "ItemWatch", 100, "call CL_mediclevel >= 0", "" },
				{ "NVGoggles", 250, "call CL_mediclevel >= 0", "" }
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
				{ "FirstAidKit", 0, "call CL_mediclevel >= 1", "" },
				{ "Binocular", 0, "call CL_mediclevel >= 1", "" },
				{ "ItemGPS", 0, "call CL_mediclevel >= 1", "" },
				{ "ItemRadio", 0, "call CL_mediclevel >= 1", "" },
				{ "ItemMap", 0, "call CL_mediclevel >= 1", "" },
				{ "ItemCompass", 0, "call CL_mediclevel >= 1", "" },
				{ "ItemWatch", 0, "call CL_mediclevel >= 1", "" },
				{ "NVGoggles", 0, "call CL_mediclevel >= 1", "" }
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
				{ "FirstAidKit", 80, "call CL_mediclevel >= 0", "" },
				{ "Binocular", 150, "call CL_mediclevel >= 0", "" },
				{ "ItemGPS", 250, "call CL_mediclevel >= 0", "" },
				{ "ItemRadio", 100, "call CL_mediclevel >= 0", "" },
				{ "ItemMap", 50, "call CL_mediclevel >= 0", "" },
				{ "ItemCompass", 100, "call CL_mediclevel >= 0", "" },
				{ "ItemWatch", 100, "call CL_mediclevel >= 0", "" },
				{ "NVGoggles", 250, "call CL_mediclevel >= 0", "" }
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
				{ "hgun_PDW2000_F", 60000, "license_civ_gun", "" },
				{ "hgun_Pistol_heavy_02_F", 40000, "license_civ_gun", "" },
				{ "hgun_Pistol_heavy_01_F", 35000, "license_civ_gun", "" },
				{ "hgun_Pistol_01_F", 25000, "license_civ_gun", "" },
				{ "hgun_Rook40_F", 30000, "license_civ_gun", "" }
			};

			magazines[] = {
				{ "16Rnd_9x21_Mag", 500, "license_civ_gun", "" },
				{ "10Rnd_9x21_Mag", 500, "license_civ_gun", "" },
				{ "11Rnd_45ACP_Mag", 300, "license_civ_gun", "" },
				{ "6Rnd_45ACP_Cylinder", 300, "license_civ_gun", "" },
				{ "30Rnd_9x21_Mag", 300, "license_civ_gun", "" }
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
		//--- Gang Hideouts;
		class gang_gun_shop {
			title = "Gang Shop"; //--- Title of Shop
			condition = ""; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name				
				{ "arifle_SDAR_F", 55000, "call CL_mediclevel >= 0", "Poaching Rifle" },
				{ "hgun_PDW2000_F", 40000, "call CL_mediclevel >= 0", "" },
				{ "hgun_Rook40_F", 5000, "call CL_mediclevel >= 0", "" },
				{ "hgun_Pistol_heavy_02_F", 30000, "call CL_mediclevel >= 0", "" },
				{ "optic_ACO_grn_smg", 2500, "call CL_mediclevel >= 0", "" }
			};

			magazines[] = {
				{ "20Rnd_556x45_UW_mag", 400, "call CL_mediclevel >= 0", "" },
				{ "16Rnd_9x21_Mag", 1000, "call CL_mediclevel >= 0", "" },
				{ "6Rnd_45ACP_Cylinder", 1500, "call CL_mediclevel >= 0", "" },
				{ "9Rnd_45ACP_Mag", 1250, "call CL_mediclevel >= 0", "" },
				{ "30Rnd_9x21_Mag", 1500, "call CL_mediclevel >= 0", "" }
			};

			attachments[] = {	
				{ "optic_ACO_grn_smg", 150, "call CL_mediclevel >= 0", "SMG Green ACO" },
				{ "optic_Aco_smg", 150, "call CL_mediclevel >= 0", "SMG Red ACO" }
			};

			items[] = {};
		};
		//--- Rebel Gun Shop;
		class reb_gun_shop {
			title = "Rebel Shop"; //--- Title of Shop
			condition = "license_civ_reb"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name			
				{ "arifle_CTARS_hex_F", 200000, "license_civ_reb", "" },
				{ "arifle_CTAR_hex_F", 100000, "license_civ_reb", "" },
				{ "arifle_SPAR_01_snd_F", 80000, "license_civ_reb", "" },
				{ "arifle_TRG21_F", 60000, "license_civ_reb", "" },
				{ "arifle_Mk20_plain_F", 60000, "license_civ_reb", "" },
				{ "arifle_SDAR_F", 55000, "", "" },
				{ "arifle_AKS_F", 50000, "license_civ_reb", "" },
				{ "SMG_01_F", 30000, "license_civ_reb", "" },
				{ "hgun_Pistol_heavy_01_F", 30000, "license_civ_reb", "" },
				{ "hgun_Pistol_heavy_02_F", 30000, "license_civ_reb", "" },
				{ "hgun_Pistol_01_F", 20000, "license_civ_reb", "" },
				{ "hgun_Rook40_F", 30000, "license_civ_reb", "" }
			};

			magazines[] = {
				{ "10Rnd_9x21_Mag", 100, "license_civ_reb", "" },		
				{ "30Rnd_762x39_Mag_F", 1500, "license_civ_reb", "" },
				{ "20Rnd_762x51_Mag", 1500, "license_civ_reb", "" },
				{ "100Rnd_65x39_caseless_mag", 2000, "license_civ_reb", "" },
				{ "30Rnd_65x39_caseless_green", 1000, "license_civ_reb", "" },
				{ "30Rnd_65x39_caseless_mag", 1000, "license_civ_reb", "" },
				{ "10Rnd_762x54_Mag", 1000, "license_civ_reb", "" },
				{ "100Rnd_580x42_Mag_F", 700, "license_civ_reb", "" },
				{ "30Rnd_580x42_Mag_F", 200, "license_civ_reb", "" },
				{ "30Rnd_556x45_Stanag", 200, "license_civ_reb", "" },
				{ "20Rnd_556x45_UW_mag", 200, "license_civ_reb", "" },
				{ "30Rnd_545x39_Mag_F", 200, "license_civ_reb", "" },
				{ "30Rnd_545x39_Mag_F", 200, "license_civ_reb", "" },
				{ "11Rnd_45ACP_Mag", 150, "license_civ_reb", "" },
				{ "16Rnd_9x21_Mag", 150, "license_civ_reb", "" },
				{ "30Rnd_9x21_Mag", 200, "license_civ_reb", "" },
				{ "30Rnd_45ACP_Mag_SMG_01", 200, "license_civ_reb", "" },
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

		//--- Black Market;
		class black_market_shop {
			title = "Black Market Shop"; //--- Title of Shop
			condition = "license_civ_advreb"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name	
				{ "launch_RPG7_F", 500000, "license_civ_advreb", "RPG" }
			};

			magazines[] = {	
				{ "RPG7_F", 100000, "license_civ_advreb", "RPG Ammo" },
				{ "1Rnd_HE_Grenade_shell", 10000, "license_civ_advreb", "RPG Ammo" }
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
				{ "optic_ERCO_snd_F", 1000, "license_civ_reb", "" },
				{ "optic_AMS_snd", 15000, "license_civ_reb", "" },
				{ "optic_DMS", 15000, "license_civ_reb", "" },
				{ "optic_KHS_old", 10000, "license_civ_reb", "" },
				{ "optic_Nightstalker", 30000, "license_civ_reb", "" }
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

		//--- Corp Gun Shop;
		class corp_gun_shop {
			title = "Corp Shop"; //--- Title of Shop
			condition = "license_civ_corp"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name	
				{ "arifle_ARX_ghex_F", 80000, "license_civ_trustcorp", "" },
				{ "arifle_MXM_khk_F", 80000, "license_civ_trustcorp", "" },
				{ "arifle_MX_khk_F", 40000, "license_civ_trustcorp", "" },
				{ "arifle_MXC_khk_F", 35000, "license_civ_trustcorp", "" },
				{ "arifle_SPAR_03_khk_F", 50000, "license_civ_trustcorp", "" },
				{ "arifle_SPAR_02_khk_F", 200000, "license_civ_corp", "" },
				{ "arifle_SPAR_01_khk_F", 80000, "license_civ_corp", "" },
				{ "arifle_Mk20_GL_F", 80000, "license_civ_corp", "" },
				{ "arifle_TRG21_F", 60000, "license_civ_corp", "" },
				{ "arifle_Mk20C_F", 60000, "license_civ_corp", "" },
				{ "SMG_02_F", 30000, "license_civ_corp", "" },
				{ "hgun_Pistol_heavy_01_F", 30000, "license_civ_corp", "" },
				{ "hgun_Pistol_heavy_02_F", 30000, "license_civ_corp", "" },
				{ "hgun_Pistol_01_F", 20000, "license_civ_corp", "" },
				{ "hgun_P07_khk_F", 20000, "license_civ_corp", "" },
				{ "hgun_Rook40_F", 30000, "license_civ_corp", "" }
			};

			magazines[] = {	
				{ "10Rnd_50BW_Mag_F", 5000, "license_civ_trustcorp", "" },
				{ "20Rnd_762x51_Mag", 500, "license_civ_trustcorp", "" },
				{ "100Rnd_65x39_caseless_mag", 450, "license_civ_trustcorp", "" },
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
				{ "hgun_ACPC2_snds_F", 0, "call CL_coplevel >= 1", "Taser" },
				{ "SMG_02_F", 0, "call CL_coplevel >= 1", "Taser SMG" },
				{ "arifle_Mk20C_plain_F", 0, "call CL_coplevel >= 2", "MK20C" },
				{ "arifle_Mk20_plain_F", 0, "call CL_coplevel >= 3", "MK20" },
				{ "arifle_SPAR_01_blk_F", 0, "call CL_coplevel >= 3", "SPAR-16" },
				{ "arifle_MXC_Black_F", 0, "call CL_coplevel >= 5", "MXC" },
				{ "hgun_Pistol_heavy_02_F", 0, "call CL_coplevel >= 5", "Zubr" },
				{ "arifle_MX_Black_F", 0, "call CL_coplevel >= 6", "MX" },
				{ "arifle_MXM_Black_F", 0, "call CL_coplevel >= 7", "MXM" }
			};

			magazines[] = {
				//--- Cop Magazines;	
				{ "9Rnd_45ACP_Mag", 0, "call CL_coplevel >= 1", "Taser Pistol Round .45" },
				{ "16Rnd_9x21_red_Mag", 0, "call CL_coplevel >= 1", "Taser Rounds(9mm)" },
				{ "30Rnd_9x21_Mag_SMG_02", 0, "call CL_coplevel >= 1", "Taser Rounds x30 (9mm)" },
				{ "30Rnd_556x45_Stanag_Tracer_Red", 0, "call CL_coplevel >= 2", "Rubber Bullets (5.56)" },
				{ "30Rnd_556x45_Stanag", 0, "call CL_coplevel >= 4", "Live Rounds (5.56)" },
				{ "6Rnd_45ACP_Cylinder", 0, "call CL_coplevel >= 5", "Rubber Bullets (6.5)" },
				{ "30Rnd_65x39_caseless_mag_Tracer", 0, "call CL_coplevel >= 5", "Rubber Bullets (6.5)" },
				{ "30Rnd_65x39_caseless_mag", 0, "call CL_coplevel >= 6", "Live Rounds (6.5)" }
			};

			attachments[] = {
				//--- COP Scopes;
				{ "optic_ACO_grn", 0, "call CL_coplevel >= 1", "" },
				{ "optic_ACO_grn_smg", 0, "call CL_coplevel >= 1", "" },
				{ "optic_Holosight_smg", 0, "call CL_coplevel >= 1", "SMG Holo" },
				{ "optic_Holosight_smg_blk_F", 0, "call CL_coplevel >= 1", "SMG Holo (Black)" },
				{ "optic_Holosight", 0, "call CL_coplevel >= 2", "Rifle Holo" },
				{ "optic_Holosight_blk_F", 0, "call CL_coplevel >= 2", "Rifle Holo (Black)" },
				{ "optic_MRCO", 0, "call CL_coplevel >= 3", "MRCO" },
				{ "optic_Hamr", 0, "call CL_coplevel >= 3", "RCO" },
				{ "optic_ERCO_blk_F", 0, "call CL_coplevel >= 3", "ERCO (Black)" },
				{ "optic_ERCO_snd_F", 0, "call CL_coplevel >= 3", "ERCO (Sand)" },
				{ "optic_Arco_blk_F", 0, "call CL_coplevel >= 3", "ARCO (Black)" },
				{ "optic_Arco", 0, "call CL_coplevel >= 3", "ARCO (Sand)" },
				{ "optic_KHS_blk", 0, "call CL_coplevel >= 7", "" },
				{ "optic_DMS", 0, "call CL_coplevel >= 7", "" },
				{ "optic_AMS", 0, "call CL_coplevel >= 7", "" },
				{ "optic_NVS", 0, "call CL_coplevel >= 7", "" },
				// --- Items
				{ "muzzle_snds_L", 0, "call CL_coplevel >= 1", "Suppressor (9mm)" },
				{ "muzzle_snds_M", 0, "call CL_coplevel >= 4", "Suppressor (5.56)" },
				{ "muzzle_snds_H", 0, "call CL_coplevel >= 7", "Suppressor (6.5)" },
				{ "bipod_01_F_blk", 0, "call CL_coplevel >= 6", "Bipod" },
				{ "acc_flashlight", 0, "call CL_coplevel >= 1", "" },
				{ "acc_pointer_IR", 0, "call CL_coplevel >= 2", "" }
			};

			items[] = {
				//--- Cop Items;
				{ "FirstAidKit", 0, "call CL_coplevel >= 1", "" },
				{ "Binocular", 0, "call CL_coplevel >= 1", "" },
				{ "ItemGPS", 0, "call CL_coplevel >= 1", "" },
				{ "ItemRadio", 0, "call CL_coplevel >= 1", "" },
				{ "ItemMap", 0, "call CL_coplevel >= 1", "" },
				{ "ItemCompass", 0, "call CL_coplevel >= 1", "" },
				{ "ItemWatch", 0, "call CL_coplevel >= 1", "" },
				{ "NVGoggles_OPFOR", 0, "call CL_coplevel >= 1", "" }
			};
		};
		
		class swat_gun_shop {
			title = "SWAT Armoury"; //--- Title of Shop
			condition = "license_cop_cSWAT"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				{ "hgun_ACPC2_snds_F", 0, "license_cop_cSWAT", "Taser Pistol" },
				{ "arifle_SPAR_01_blk_F", 0, "license_cop_cSWAT", "SPAR-16" },
				{ "arifle_Katiba_F", 0, "license_cop_cSWAT", "Katiba" },				
				{ "arifle_MX_Black_F", 0, "license_cop_cSWAT", "MX" },
				{ "arifle_MXM_Black_F", 0, "license_cop_cSWAT", "MXM" },
				{ "arifle_MX_SW_Black_F", 0, "license_cop_cSWAT", "MX-SW" },
				{ "arifle_SPAR_03_blk_F", 0, "license_cop_cSWAT", "SPAR-17" },
				{ "srifle_DMR_03_F", 0, "license_cop_cSWAT", "SPAR-17" },
				{ "arifle_AK12_F", 0, "license_cop_cSWAT", "AK-Fucked" }			
			};

			magazines[] = {
				{ "16Rnd_9x21_red_Mag", 0, "license_cop_cSWAT", "Live Rounds (5.56)" },
				{ "30Rnd_556x45_Stanag", 0, "license_cop_cSWAT", "Live Rounds (5.56)" },
				{ "30Rnd_65x39_caseless_green", 0, "license_cop_cSWAT", "Live Rounds (Katiba)" },
				{ "30Rnd_65x39_caseless_mag", 0, "license_cop_cSWAT", "Live Rounds (6.5)" },
				{ "100Rnd_65x39_caseless_mag", 0, "license_cop_cSWAT", "Live Rounds (LMG 6.5)" },
				{ "20Rnd_762x51_Mag", 0, "license_cop_cSWAT", "Live Rounds (7.62)" },					
				{ "30Rnd_762x39_Mag_F", 0, "license_cop_cSWAT", "Live Rounds (AK-12)" },	
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
				{ "SmokeShellOrange", 20, "license_cop_cSniper", "" }
			};

			attachments[] = {
				//--- COP Scopes;
				{ "optic_ACO_grn", 0, "license_cop_cSWAT", "" },
				{ "optic_ACO_grn_smg", 0, "license_cop_cSWAT", "" },
				{ "optic_Holosight_smg", 0, "license_cop_cSWAT", "SMG Holo" },
				{ "optic_Holosight_smg_blk_F", 0, "license_cop_cSWAT", "SMG Holo (Black)" },
				{ "optic_Holosight", 0, "license_cop_cSWAT", "Rifle Holo" },
				{ "optic_Holosight_blk_F", 0, "license_cop_cSWAT", "Rifle Holo (Black)" },
				{ "optic_MRCO", 0, "license_cop_cSWAT", "MRCO" },
				{ "optic_Hamr", 0, "license_cop_cSWAT", "RCO" },
				{ "optic_ERCO_blk_F", 0, "license_cop_cSWAT", "ERCO (Black)" },
				{ "optic_ERCO_snd_F", 0, "license_cop_cSWAT", "ERCO (Sand)" },
				{ "optic_Arco_blk_F", 0, "license_cop_cSWAT", "ARCO (Black)" },
				{ "optic_Arco", 0, "license_cop_cSWAT", "ARCO (Sand)" },
				{ "optic_KHS_blk", 0, "license_cop_cSWAT", "" },
				{ "optic_DMS", 0, "license_cop_cSWAT", "" },
				{ "optic_AMS", 0, "license_cop_cSWAT", "" },
				{ "optic_NVS", 0, "license_cop_cSWAT", "" },
				// --- Items
				{ "muzzle_snds_L", 0, "license_cop_cSWAT", "Suppressor (9mm)" },
				{ "muzzle_snds_M", 0, "license_cop_cSWAT", "Suppressor (5.56)" },
				{ "muzzle_snds_H", 0, "license_cop_cSWAT", "Suppressor (6.5)" },
				{ "muzzle_snds_B", 0, "license_cop_cSWAT", "Suppressor (7.62)" },		
				{ "bipod_01_F_blk", 0, "license_cop_cSWAT", "Bipod" },
				{ "acc_flashlight", 0, "license_cop_cSWAT", "" },
				{ "acc_pointer_IR", 0, "license_cop_cSWAT", "" },
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
				{ "acc_pointer_IR", 20, "license_cop_cSniper", "" }
			};

			items[] = {
				//--- Cop Items;
				{ "FirstAidKit", 0, "call CL_coplevel >= 1", "" },
				{ "Binocular", 0, "call CL_coplevel >= 1", "" },
				{ "ItemGPS", 0, "call CL_coplevel >= 1", "" },
				{ "ItemRadio", 0, "call CL_coplevel >= 1", "" },
				{ "ItemMap", 0, "call CL_coplevel >= 1", "" },
				{ "ItemCompass", 0, "call CL_coplevel >= 1", "" },
				{ "ItemWatch", 0, "call CL_coplevel >= 1", "" },
				{ "NVGogglesB_blk_F", 0, "call CL_coplevel >= 1", "" }
			};
		};
	};
};

#include "gui\weapon_gui_master.cpp"
