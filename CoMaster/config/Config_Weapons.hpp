class WeaponShops {
/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, conditionss etc,
*            in any combination. For example:
*                "call CL_coplevel && conditions_civ_someconditions"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
	//--- Gang Hideouts;
	class gang {
		name = "Gang Armament";
		side = "civ";
		conditions = "";
		items[] = {			
			{ "arifle_SDAR_F", "Poaching Rifle", 10000, 5000, "license_civ_rifle" },
			{ "hgun_Rook40_F", "", 5000, 2500, "" },
			{ "hgun_Pistol_heavy_02_F", "", 7500, 3000, "" },
			{ "hgun_ACPC2_F", "", 7500, 3000, "" },
			{ "hgun_PDW2000_F", "", 20000, 10000, "" }	
		};
		mags[] = {
			{ "20Rnd_556x45_UW_mag", "", 400, 200, "" },
			{ "16Rnd_9x21_Mag", "", 1000, 150, "" },
			{ "6Rnd_45ACP_Cylinder", "", 1500, 225, "" },	
			{ "9Rnd_45ACP_Mag", "", 1250, 190, "" },
			{ "30Rnd_9x21_Mag", "", 1500, 300, "" }
		};
		accs[] = {
			{ "optic_ACO_grn_smg", "SMG Green ACO", 150, 75, "" },
			{ "optic_Aco_smg", "SMG Red ACO", 150, 75, "" }
		};
	};
/* //--- Disabled for now - no need for it till further ideas crop up;
	//--- Crafting Village Mags;
	class all_mags {
		name = "All Magazines";
		side = "civ";
		conditions = "";
		items[] = {
			{ "KA_knife_blade", "Knife Blade", 250, 125, "" },
			{ "10Rnd_93x64_DMR_05_Mag", "Cyrus Mag", 250, 125, "" },
			{ "KA_40Rnd_46x30_FMJ", "MP7A1 Mag", 250, 125, "" },
			{ "MRC_492x34_B_skin1", "MRC Mag", 250, 125, "" },
			{ "KA_30Rnd_545x39_7U1_US", "AN94 Mag", 250, 125, "" },
			{ "KICKASS_2Rnd_Sawed_Off_Shotgun_Pellets", "Sawed Off Bucks", 250, 125, "" },
			{ "30Rnd_762x39_Mag_F", "", 250, 125, "" },
			{ "20Rnd_762x51_Mag", "", 250, 125, "" },
			{ "10Rnd_762x54_Mag", "", 250, 125, "" },
			{ "10Rnd_9x21_Mag", "", 100, 50, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_green", "", 250, 125, "" },
			{ "100Rnd_580x42_Mag_F", "", 700, 350, "" },
			{ "100Rnd_65x39_caseless_mag", "", 700, 350, "" },
			{ "30Rnd_65x39_caseless_mag", "", 240, 120, "" },
			{ "30Rnd_580x42_Mag_F", "", 200, 100, "" },
			{ "30Rnd_556x45_Stanag", "", 200, 100, "" },
			{ "30Rnd_545x39_Mag_F", "", 200, 100, "" },
			{ "11Rnd_45ACP_Mag", "", 150, 75, "" },
			{ "16Rnd_9x21_Mag", "", 150, 75, "" },
			{ "30Rnd_9x21_Mag", "", 200, 100, "" },
			{ "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
			{ "UGL_FlareWhite_F", "", 1500, 1000, "" },
			{ "UGL_FlareGreen_F", "", 1500, 1000, "" },
			{ "UGL_FlareRed_F", "", 1500, 1000, "" },
			{ "1Rnd_Smoke_Grenade_shell", "", 1500, 1000, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 1500, 1000, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 1500, 1000, "" },
			{ "10Rnd_50BW_Mag_F", "", 5000, 2500, "" },
			{ "150Rnd_556x45_Drum_Mag_F", "", 450, 225, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 180, 90, "" },
			{ "9Rnd_45ACP_Mag", "", 50, 25, "" },
			{ "200Rnd_556x45_Box_F", "Live", 100, 25, "" },
			{ "5Rnd_127x108_Mag", "Lynx Rounds", 200, 100, "" },
			{ "5Rnd_127x108_APDS_Mag", "Lynx APDS Rounds", 2000, 100, "" },
			{ "7Rnd_408_Mag", "LRR Rounds", 200, 100, "" },
			{ "10Rnd_338_Mag", "Live", 150, 75, "" },
			{ "30Rnd_556x45_Stanag", "", 100, 50, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 100, 50, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, 50, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 100, 50, "" },
			{ "30Rnd_556x45_Stanag_green", "", 100, 50, "" },
			{ "30Rnd_556x45_Stanag_red", "", 100, 50, "" },
			{ "200Rnd_556x45_Box_F", "", 100, 50, "" },
			{ "200Rnd_556x45_Box_Red_F", "", 100, 50, "" },
			{ "200Rnd_556x45_Box_Tracer_F", "", 100, 50, "" },
			{ "200Rnd_556x45_Box_Tracer_Red_F", "", 100, 50, "" },
			{ "150Rnd_556x45_Drum_Mag_F", "", 100, 50, "" },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "", 100, 50, "" },
			{ "150Rnd_762x51_Box", "", 500, 50, "" },
			{ "150Rnd_762x51_Box_Tracer", "", 500, 50, "" },
			{ "30Rnd_545x39_Mag_F", "", 100, 50, "" },
			{ "30Rnd_545x39_Mag_Green_F", "", 100, 50, "" },
			{ "30Rnd_545x39_Mag_Tracer_F", "", 100, 50, "" },
			{ "30Rnd_545x39_Mag_Tracer_Green_F", "", 100, 50, "" },
			{ "30Rnd_762x39_Mag_F", "", 500, 50, "" },
			{ "30Rnd_762x39_Mag_Green_F", "", 500, 50, "" },
			{ "30Rnd_762x39_Mag_Tracer_F", "", 500, 50, "" },
			{ "30Rnd_762x39_Mag_Tracer_Green_F", "", 500, 50, "" },
			{ "UGL_FlareWhite_F", "", 500, 50, "" },
			{ "UGL_FlareGreen_F", "", 500, 50, "" },
			{ "UGL_FlareRed_F", "", 500, 50, "" },
			{ "UGL_FlareYellow_F", "", 500, 50, "" },
			{ "UGL_FlareCIR_F", "", 500, 50, "" },
			{ "1Rnd_Smoke_Grenade_shell", "", 500, 50, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 500, 50, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 500, 50, "" },
			{ "1Rnd_SmokeYellow_Grenade_shell", "", 500, 50, "" },
			{ "1Rnd_SmokePurple_Grenade_shell", "", 500, 50, "" },
			{ "1Rnd_SmokeBlue_Grenade_shell", "", 500, 50, "" },
			{ "1Rnd_SmokeOrange_Grenade_shell", "", 500, 50, "" }
		};
	};
*/
};
