class Clothing {
/*
*	ARRAY FORMAT:
*		0: STRING (Classname)
*		1: STRING (Display Name, leave as "" for default)
*		2: SCALAR (Price)
*		3: STRING (Conditions) - Must return boolean :
*			String can contain any amount of conditions, aslong as the entire
*				string returns a boolean. This allows you to check any levels, licenses etc,
*				in any combination. For example:
*				"call CL_coplevel && license_civ_someLicense"
*				This will also let you call any other function.
*
*	Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*	Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
	class bruce {
		title = "STR_Shops_C_Bruce";
		license = "";
		side = "civ";
		uniforms[] = {		
			{ "U_C_Poloshirt_blue", "", 500, "" },
			{ "U_C_Poloshirt_burgundy", "", 500, "" },
			{ "U_C_Poloshirt_redwhite", "", 500, "" },
			{ "U_C_Poloshirt_salmon", "", 500, "" },
			{ "U_C_Poloshirt_stripped", "", 500, "" },
			{ "U_C_Poloshirt_tricolour", "", 500, "" },
			{ "U_C_HunterBody_grn", "", 800, "" },
			{ "U_OrestesBody", "", 1000, "" },
			{ "U_C_Journalist", "", 1000, "" },
			{ "U_C_man_sport_1_F", "", 300, "" },
			{ "U_C_man_sport_2_F", "", 300, "" },
			{ "U_C_man_sport_3_F", "", 300, "" },
			{ "U_C_Man_casual_1_F", "", 300, "" },
			{ "U_C_Man_casual_2_F", "", 300, "" },
			{ "U_C_Man_casual_3_F", "", 300, "" },
			{ "U_C_Man_casual_4_F", "", 300, "" },
			{ "U_C_Man_casual_5_F", "", 300, "" },
			{ "U_C_Man_casual_6_F", "", 300, "" },
			{ "U_B_survival_uniform", "Diving Fatigues", 15, "" }	
		};

		headgear[] = {
			{ "H_Bandanna_camo", "Camo Bandanna", 5, "" },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 5, "" },
			{ "H_Bandanna_gry", "Grey Bandanna", 5, "" },
			{ "H_Bandanna_cbr", "", 5, "" },
			{ "H_Bandanna_surfer", "", 5, "" },
			{ "H_Bandanna_khk", "Khaki Bandanna", 5, "" },
			{ "H_Bandanna_sgg", "Sage Bandanna", 5, "" },
			{ "H_StrawHat", "Straw Fedora", 10, "" },
			{ "H_BandMask_blk", "Hat & Bandanna", 5, "" },
			{ "H_Booniehat_tan", "", 5, "" },
			{ "H_Hat_blue", "", 5, "" },
			{ "H_Hat_brown", "", 5, "" },
			{ "H_Hat_checker", "", 5, "" },
			{ "H_Hat_grey", "", 5, "" },
			{ "H_Hat_tan", "", 5, "" },
			{ "H_Cap_blu", "", 5, "" },
			{ "H_Cap_grn", "", 5, "" },
			{ "H_Cap_grn_BI", "", 5, "" },
			{ "H_Cap_oli", "", 5, "" },
			{ "H_Cap_red", "", 5, "" },
			{ "H_Cap_tan", "", 5, "" },
			{ "H_Cap_surfer", "", 5, "" }

		};

		goggles[] = {
			{ "G_Shades_Black", "", 4, "" },
			{ "G_Shades_Blue", "", 3, "" },
			{ "G_Sport_Blackred", "", 3, "" },
			{ "G_Sport_Checkered", "", 3, "" },
			{ "G_Sport_Blackyellow", "", 3, "" },
			{ "G_Sport_BlackWhite", "", 3, "" },
			{ "G_Squares", "", 2, "" },
			{ "G_Aviator", "", 5, "" },
			{ "G_Lady_Mirror", "", 2, "" },
			{ "G_Lady_Dark", "", 2, "" },
			{ "G_Lady_Blue", "", 2, "" },
			{ "G_Lowprofile", "", 4, "" },
			{ "G_Combat", "", 7, "" }
		};

		vests[] = {};

		backpacks[] = {
			{ "B_AssaultPack_cbr", "", 5000, "" },
			{ "B_AssaultPack_blk", "", 5000, "" },
			{ "B_Kitbag_mcamo", "", 5000, "" },
			{ "B_TacticalPack_oli", "", 5000, "" },
			{ "B_FieldPack_ocamo", "", 5000, "" },
			{ "B_Bergen_sgg", "", 8000, "" },
			{ "B_Kitbag_cbr", "", 8000, "" },
			{ "B_ViperHarness_ghex_F", "", 10000, "" },
			{ "B_ViperHarness_oli_F", "", 10000, "" },
			{ "B_ViperHarness_khk_F", "", 10000, "" },
			{ "B_ViperHarness_hex_F", "", 10000, "" },
			{ "B_Carryall_khk", "", 20000, "" },
			{ "B_Carryall_oli", "", 20000, "" },
			{ "B_Carryall_ghex_F", "", 20000, "" },
			{ "B_Carryall_mcamo", "", 20000, "" },
			{ "B_Carryall_oucamo", "", 20000, "" },
			{ "B_Bergen_dgtl_F", "", 25000, "" },
			{ "B_Bergen_hex_F", "", 25000, "" },
			{ "B_Bergen_mcamo_F", "", 25000, "" },
			{ "B_Bergen_tna_F", "", 25000, "" }		
		};
	};

	class press {
		title = "Press Clothing Store";
		license = "press";
		side = "civ";
		uniforms[] = {};

		headgear[] = {
			{ "H_Cap_press", "", 5, "" }
		};

		goggles[] = {};

		vests[] = {
			{ "V_Press_F", "", 150, "" }
		};

		backpacks[] = {};
	};

	class med_clothing {
		title = "EMS Clothing Store";
		license = "";
		side = "med";
		uniforms[] = {
			{ "U_C_Paramedic_01_F", "Paramedic Uniform", 100, "" },
			{ "U_B_CombatUniform_mcam", "Paramedic Uniform", 100, "" }

		};

		headgear[] = {
			{ "H_PilotHelmetHeli_B", "Pilot Helmet", 0, "license_med_mAir" },
			{ "H_Cap_blu", "Standard Medic Cap", 0, "" },
			{ "H_Cap_marshal", "Medic Cap (Ear Protectors)", 0, "" },
			{ "H_Cap_red", "Red Medic Cap", 0, "" },
			{ "H_Watchcap_blk", "Paramedic Beanie", 0, "" },
			{ "H_Construction_headset_red_F", "Red Safety Helmet", 0, "" }
		};

		goggles[] = {
			{ "G_Diving", "Diving Goggles", 0, "license_med_mSR" },
			{ "G_Respirator_blue_F", "", 0, "" },
			{ "G_Shades_Red", "", 0, "" },
			{ "G_Shades_Green", "", 0, "" },
			{ "G_Shades_Blue", "", 0, "" },
			{ "G_Shades_Black", "", 0, "" },
			{ "G_Aviator", "", 0, "license_med_mSR" },
			{ "G_Tactical_Clear", "", 0, "license_med_mCM" }
		};

		vests[] = {
			{ "V_RebreatherIR", "Rebreather", 0, "license_med_mSR" },
			{ "V_PlateCarrierSpec_blk", "Combat Vest", 0, "license_med_mCM" }
		};

		backpacks[] = {
			{ "B_Carryall_cbr", "Standard Medic Backpack", 0, "" }
		};
	};

	class gun_clothing {
		title = "STR_Shops_C_Gun";
		license = "gun";
		side = "civ";
		uniforms[] = {};

		headgear[] = {};

		goggles[] = {};

		vests[] = {
			{ "V_Rangemaster_belt", "", 500, "" },
			{ "V_Rangemaster_belt", "V_TacVest_camo", 2000, "" },
			{ "V_Rangemaster_belt", "k_rebel_2", 2000, "" }
		};

		backpacks[] = {};
	};

	class cop_clothing {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";
		uniforms[] = {
			{ "U_Rangemaster", "Police Uniform", 0, "call CL_coplevel >= 1" },
			{ "U_B_GEN_Soldier_F", "Police Uniform", 0, "call CL_coplevel >= 8" },
			{ "U_B_HeliPilotCoveralls", "Pilot Uniform", 0, "license_cop_cAirA" },
			{ "U_B_CombatUniform_mcam", "(SWAT)Standard Uniform", 0, "license_cop_cSWAT" },
			{ "U_B_Wetsuit", "(SWAT)Diving Wetsuit", 0, "license_cop_cSWAT" },
			{ "U_C_Poloshirt_blue", "(UC)Bender Shirt", 0, "license_cop_cUC" },
			{ "U_C_Poloshirt_burgundy", "(UC)Homer Shirt", 0, "license_cop_cUC" },
			{ "U_IG_Guerilla3_1", "(UC)Brown Jacket & Pants", 0, "license_cop_cUC" },
			{ "U_IG_Guerilla2_3", "(UC)The Outback Rangler", 0, "license_cop_cUC" },
			{ "U_C_HunterBody_grn", "(UC)The Hunters Look", 0, "license_cop_cUC" }
		};

		headgear[] = {
			{ "H_Cap_police", "Police Hat", 0, "call CL_coplevel >= 1" },
			{ "H_Beret_blk", "Sergeant Beret", 0, "call CL_coplevel >= 4" },
			{ "H_Beret_02", "Superintendant Beret", 0, "call CL_coplevel >= 6" },
			{ "H_Beret_Colonel", "Command Beret", 0, "call CL_coplevel >= 7" },
			{ "H_Beret_gen_F", "Commisioner Beret", 0, "call CL_coplevel >= 8" },
			{ "H_Watchcap_blk", "(SWAT)Beanie", 0, "license_cop_cSWAT" },
			{ "H_PASGT_basic_black_F", "(SWAT)Helmet", 0, "license_cop_cSWAT" },
			{ "H_CrewHelmetHeli_B", "(SWAT)Gas Mask", 0, "license_cop_cSWAT" },
			{ "H_PilotHelmetHeli_B", "Pilot Helmet", 0, "license_cop_cAirA" },
			{ "H_Watchcap_blk", "(UC)Beanie", 0, "license_cop_cUC" },
			{ "H_Cap_blk", "(UC)Cap(Black)", 0, "license_cop_cUC" },
			{ "H_Hat_brown", "(UC)Fedora(Brown)", 0, "license_cop_cUC" },
			{ "H_Hat_tan", "(UC)Fedora(Tan)", 0, "license_cop_cUC" },
			{ "H_ShemagOpen_tan", "(UC)Shemag(Tan)", 0, "license_cop_cUC" },
			{ "H_Booniehat_khk_hs", "(UC)Boonie", 0, "license_cop_cUC" }
		};

		goggles[] = {
			{ "G_Aviator", "Aviators", 0, "call CL_coplevel >= 1" },
			{ "G_Squares", "Spectacles", 0, "call CL_coplevel >= 1" },
			{ "G_Spectacles", "Spectacles", 0, "call CL_coplevel >= 1" },
			{ "G_Tactical_Clear", "Training Glasses", 0, "call CL_coplevel >= 4" },
			{ "G_Tactical_Black", "Training Shades", 0, "call CL_coplevel >= 4" },
			{ "G_Diving", "Diving Mask", 0, "license_cop_cSWAT" },
			{ "G_Balaclava_blk", "(SWAT)Balaclava", 0, "license_cop_cSWAT" },
			{ "G_Bandanna_aviator", "(UC)Aviator Bandana", 0, "license_cop_cUC" },
			{ "G_Bandanna_blk", "(UC)Black Bandana", 0, "license_cop_cUC" },
			{ "G_Bandanna_khk", "(UC)Khaki Bandana", 0, "license_cop_cUC" },
			{ "G_Bandanna_oli", "(UC)Olive Bandana", 0, "license_cop_cUC" },
			{ "G_Bandanna_shades", "(UC)Shades Bandana", 0, "license_cop_cUC" },
			{ "G_Bandanna_blk", "(UC)Black Bandana", 0, "license_cop_cUC" }
		};

		vests[] = {
			{ "V_Rangemaster_belt", "Police Utility Belt", 0, "call CL_coplevel >= 1" },
			{ "V_TacVest_blk_POLICE", "Police Vest", 0, "call CL_coplevel >= 2" },
			{ "V_PlateCarrier1_blk", "Plate Vest", 0, "call CL_coplevel >= 5" },
			{ "V_TacVest_gen_F", "Commisioner Vest", 0, "call CL_coplevel >= 9" },
			{ "V_RebreatherB", "(SWAT)Diving Rebreather", 0, "license_cop_cSWAT" },
			{ "V_PlateCarrier2_blk", "(SWAT)Standard Vest", 0, "license_cop_cSWAT" },
			{ "V_PlateCarrierSpec_blk", "(SWAT)Balistic Vest", 0, "license_cop_cSWAT" },
			{ "V_PlateCarrierGL_blk", "(SWAT)Anti-Explosives Vest", 0, "license_cop_cSWAT" },
			{ "V_TacVest_khk", "(UC) Light Rebel Vest", 0, "license_cop_cUC" }
		};

		backpacks[] = {
			{ "B_Carryall_cbr", "Standard Issue Backpack", 150, "call CL_coplevel >= 1" },
			{ "B_FieldPack_blk", "(UC) Field Pack (Black)", 150, "license_cop_cUC" },
			{ "B_FieldPack_khk", "(UC) Field Pack (Khaki)", 150, "license_cop_cUC" },
			{ "B_Bergen_hex_F", "(UC) Bergen (Hex)", 150, "license_cop_cUC" },
			{ "B_Carryall_khk", "(UC) Carryall (Khaki)", 150, "license_cop_cUC" }
		};
	};

	class dive {
		title = "STR_Shops_C_Diving";
		license = "dive";
		side = "civ";
		uniforms[] = {
			{ "U_B_Wetsuit", "", 150, "" }
		};

		headgear[] = {};

		goggles[] = {
			{ "G_Diving", "", 50, "" }
		};

		vests[] = {
			{ "V_RebreatherB", "", 200, "" }
		};

		backpacks[] = {};
	};

	class reb {
		title = "STR_Shops_C_Rebel";
		license = "reb";
		side = "civ";
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, "" },
			{ "U_IG_Guerilla1_1", "", 606, "" },
			{ "U_I_G_Story_Protagonist_F", "", 606, "" },
			{ "U_I_G_resistanceLeader_F", "", 660, "" },
			{ "U_IG_leader", "Guerilla Leader", 600, "" },
			{ "U_O_PilotCoveralls", "", 600, "" },
			{ "U_O_SpecopsUniform_ocamo", "", 600, "" },
			{ "U_B_T_Soldier_F", "", 600, "" }, //Apex DLC
			{ "U_I_C_Soldier_Bandit_1_F", "", 700, "" },
			{ "U_I_C_Soldier_Bandit_2_F", "", 700, "" }, //Apex DLC
			{ "U_I_C_Soldier_Bandit_3_F", "", 700, "" }, //Apex DLC
			{ "U_I_C_Soldier_Bandit_4_F", "", 700, "" }, //Apex DLC
			{ "U_I_C_Soldier_Bandit_5_F", "", 700, "" }, //Apex DLC
			{ "U_I_C_Soldier_Camo_F", "", 700, "" }, //Apex DLC
			{ "U_BG_Guerrilla_6_1", "", 600, "" },
			{ "U_BG_Guerilla2_2", "", 600, "" },
			{ "U_BG_Guerilla2_1", "", 600, "" },
			{ "U_BG_Guerilla2_3", "", 600, "" },
			{ "U_I_C_Soldier_Para_2_F", "", 600, "" },
			{ "U_I_C_Soldier_Para_3_F", "", 600, "" },
			{ "U_I_C_Soldier_Para_4_F", "", 600, "" },
			{ "U_I_C_Soldier_Para_1_F", "", 600, "" },
			{ "U_O_OfficerUniform_ocamo", "", 700, "" },
			{ "U_O_T_Officer_F", "", 700, "" },
			{ "U_B_GhillieSuit", "", 20000, "" }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, "" },
			{ "H_Bandanna_camo", "", 120, "" },
			{ "H_ShemagOpen_khk", "", 122, "" },
			{ "H_ShemagOpen_tan", "", 123, "" },
			{ "H_Shemag_olive", "", 124, "" }				
		};

		goggles[] = {
			{ "G_Shades_Black", "", 5, "" },
			{ "G_Shades_Blue", "", 5, "" },
			{ "G_Sport_Blackred", "", 5, "" },
			{ "G_Sport_Checkered", "", 5, "" },
			{ "G_Sport_Blackyellow", "", 5, "" },
			{ "G_Sport_BlackWhite", "", 5, "" },
			{ "G_Squares", "", 5, "" },
			{ "G_Lowprofile", "", 150, "" },
			{ "G_Combat", "", 150, "" },
			{ "G_Balaclava_blk", "", 150, "" },
			{ "G_Balaclava_combat", "", 150, "" },
			{ "G_Balaclava_lowprofile", "", 150, "" },
			{ "G_Balaclava_oli", "", 150, "" },
			//--- BI;
			{ "G_Bandanna_aviator", "", 150, "" },
			{ "G_Bandanna_beast", "", 150, "" },
			{ "G_Bandanna_blk", "", 150, "" },
			{ "G_Bandanna_khk", "", 150, "" },
			{ "G_Bandanna_oli", "", 150, "" },
			{ "G_Bandanna_shades", "", 150, "" },
			{ "G_Bandanna_sport", "", 150, "" },
			{ "G_Bandanna_tan", "", 150, "" }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, "" },
			{ "V_BandollierB_cbr", "Slash Bandolier", 1000, "" },
			{ "V_HarnessO_brn", "LBV Harness", 2000, "" },
			{ "V_TacVest_khk", "Tactical Vest Khaki", 10000, "" },
			{ "V_TacVest_camo", "Tactical Vest Camo", 10000, "" },
			{ "V_PlateCarrier1_rgr_noflag_F", "", 60000, "" }
		};

		backpacks[] = {
			{ "B_AssaultPack_cbr", "", 5000, "" },
			{ "B_AssaultPack_blk", "", 5000, "" },
			{ "B_AssaultPack_blk", "", 5000, "" },
			{ "B_Kitbag_mcamo", "", 8000, "" },
			{ "B_Kitbag_cbr", "", 8000, "" },
			{ "B_TacticalPack_oli", "", 5000, "" },
			{ "B_FieldPack_ocamo", "", 6000, "" },
			{ "B_Bergen_sgg", "", 8000, "" },
			{ "B_HuntingBackpack", "", 10000, "" },
			{ "B_ViperHarness_ghex_F", "Slim Backpack Green Hex", 10000, "" },
			{ "B_ViperHarness_oli_F", "Slim Backpack Olive", 10000, "" },
			{ "B_ViperHarness_khk_F", "Slim Backpack Khaki", 10000, "" },
			{ "B_ViperHarness_hex_F", "Slim Backpack Hex", 10000, "" },
			{ "B_Carryall_oli", "", 300, "" },
			{ "B_Carryall_mcamo", "", 20000, "" },
			{ "B_Carryall_oucamo", "",20000, "" },
			{ "B_Carryall_ocamo", "", 20000, "" },
			{ "B_Carryall_khk", "", 20000, "" },
			{ "B_Bergen_dgtl_F", "", 25000, "" },
			{ "B_Bergen_hex_F", "", 25000, "" },
			{ "B_Bergen_mcamo_F", "", 25000, "" }
		};
	};

	class black_market {
		title = "STR_Shops_Black_Market";
		license = "advreb";
		side = "civ";
		uniforms[] = {};

		headgear[] = {
			{ "H_Shemag_olive_hs", "Headset Shemag", 2500, "" }
		};

		goggles[] = {};

		vests[] = {
			{ "V_HarnessOGL_gry", "Suicide Vest", 50000, "" }
		};

		backpacks[] = {};
	};

	class gang_clothing {
		title = "STR_Shops_C_Gang";
		license = "";
		side = "civ";
		uniforms[] = {};

		headgear[] = {};

		goggles[] = {};

		vests[] = {
			{ "V_Rangemaster_belt", "", 450, "" }
		};

		backpacks[] = {};
	};

	class air_clothing {
		title = "STR_Shops_C_Air";
		license = "pilot";
		side = "civ";
		uniforms[] = {
			{ "U_B_HeliPilotCoveralls", "Jump Suit", 300, "" }
		};

		headgear[] = {};

		goggles[] = {
			{ "G_Aviator", "Aviators", 15, "" }
		};

		vests[] = {};

		backpacks[] = {
			{ "B_Parachute", "Parachute", 500, "" }
		};
	};

	class corp {
		title = "STR_Shops_C_Corp";
		license = "corp";
		side = "civ";
		uniforms[] = {
			{ "U_B_T_Soldier_F", "", 2000, "" },
			{ "U_B_T_Soldier_AR_F", "", 2000, "" },			
			{ "U_I_OfficerUniform", "", 5000, "" },
			{ "U_I_CombatUniform_shortsleeve", "", 2000, "" },
			{ "U_B_T_Sniper_F", "", 50000, "" },
			{ "U_B_T_Soldier_SL_F", "", 2000, "" },
			{ "U_I_pilotCoveralls", "Anti-Radioactive Suit", 30000, "" },
			{ "U_B_CTRG_Soldier_3_F", "", 50000, "license_civ_trustcorp" },
			{ "U_B_CTRG_Soldier_2_F", "", 20000, "license_civ_trustcorp" }
		};

		headgear[] = {
			{ "H_Booniehat_tna_F", "", 5, "" },
			{ "H_Booniehat_dgtl", "", 5, "" },
			{ "H_Watchcap_camo", "", 5, "" },
			{ "H_MilCap_tna_F", "", 15, "" },
			{ "H_Cap_headphones", "", 15, "" },
			{ "H_Cap_khaki_specops_UK", "", 20, "" },
			{ "H_Cap_usblack", "", 20, "" },
			{ "H_Cap_tan_specops_US", "", 20, "" },
			{ "H_Cap_blk_Raven", "", 20, "" },
			{ "H_Cap_brn_SPECOPS", "", 20, "" },
			{ "H_HelmetB", "", 500, "" },
			{ "H_HelmetB_black", "", 500, "" },
			{ "H_HelmetB_snakeskin", "", 500, "" },
			{ "H_HelmetB_tna_F", "", 500, "" },
			{ "H_HelmetSpecB", "", 600, "" },
			{ "H_PilotHelmetHeli_B", "", 600, "" },
			{ "H_HelmetB_sand", "", 600, "" },
			{ "H_PilotHelmetFighter_O", "Anti-Radioactive Helmet", 10000, "license_civ_trustcorp" }
			
		};

		goggles[] = {
			{ "G_Shades_Black", "", 30, "" },
			{ "G_Shades_Blue", "", 30, "" },
			{ "G_Sport_Blackred", "", 30, "" },
			{ "G_Sport_Checkered", "", 30, "" },
			{ "G_Sport_Blackyellow", "", 30, "" },
			{ "G_Sport_BlackWhite", "", 30, "" },
			{ "G_Squares", "", 200, "" },
			{ "G_Lowprofile", "", 400, "" },
			{ "G_Combat", "", 700, "" }
			
		};

		vests[] = {
			{ "V_BandollierB_oli", "Slash Bandolier Olive", 1000, "" },
			{ "V_HarnessOGL_ghex_F", "LBV Harness Green Hex", 2000, "" },
			{ "V_Chestrig_oli", "Chest Rig Olive", 2000, "" },		
			{ "V_TacVest_oli", "Tactical Vest Olive", 10000, "" },	
			{ "V_PlateCarrier1_rgr", "Carrier Lite", 70000, "" },
			{ "V_PlateCarrier1_tna_F", "Carrier Lite", 70000, "" },
			{ "V_PlateCarrierIA1_dgtl", "GA Carrier Lite", 60000, "" },
			{ "V_PlateCarrier2_rgr", "Carrier Lite", 100000, "license_civ_trustcorp" },
			{ "V_PlateCarrier2_tna_F", "Carrier Lite", 100000, "license_civ_trustcorp" },
			{ "V_PlateCarrierIA2_dgtl", "Carrier Lite", 90000, "license_civ_trustcorp" }	
		};

		backpacks[] = {
			{ "B_AssaultPack_cbr", "", 5000, "" },
			{ "B_AssaultPack_blk", "", 5000, "" },
			{ "B_TacticalPack_oli", "", 5000, "" },
			{ "B_FieldPack_ocamo", "", 5000, "" },
			{ "B_Bergen_sgg", "", 8000, "" },
			{ "B_Kitbag_cbr", "", 8000, "" },
			{ "B_Kitbag_mcamo", "", 8000, "" },
			{ "B_HuntingBackpack", "", 10000, "" },
			{ "B_ViperHarness_ghex_F", "Slim Backpack Green Hex", 10000, "" },
			{ "B_ViperHarness_oli_F", "Slim Backpack Olive", 10000, "" },
			{ "B_ViperHarness_khk_F", "Slim Backpack Khaki", 10000, "" },
			{ "B_ViperHarness_hex_F", "Slim Backpack Hex", 10000, "" },
			{ "B_Carryall_oli", "", 20000, "" },
			{ "B_Carryall_mcamo", "", 20000, "" },
			{ "B_Carryall_oucamo", "", 20000, "" },
			{ "B_Carryall_ocamo", "", 20000, "" },
			{ "B_Carryall_khk", "", 20000, "" },
			{ "B_Bergen_dgtl_F", "", 25000, "" },
			{ "B_Bergen_hex_F", "", 25000, "" },
			{ "B_Bergen_mcamo_F", "", 25000, "" },
			{ "B_Bergen_tna_F", "", 25000, "" }
		};
	};

	class kart {
		title = "STR_Shops_C_Kart";
		license = "";
		side = "civ";
		uniforms[] = {
			{ "U_C_Driver_1_black", "", 100, "" },
			{ "U_C_Driver_1_blue", "", 100, "" },
			{ "U_C_Driver_1_red", "", 100, "" },
			{ "U_C_Driver_1_orange", "", 100, "" },
			{ "U_C_Driver_1_green", "", 100, "" },
			{ "U_C_Driver_1_white", "", 100, "" },
			{ "U_C_Driver_1_yellow", "", 100, "" },
			{ "U_C_Driver_2", "", 100, "" },
			{ "U_C_Driver_1", "", 100, "" },
			{ "U_C_Driver_3", "", 100, "" },
			{ "U_C_Driver_4", "", 100, "" }
		};

		headgear[] = {
			{ "H_RacingHelmet_1_black_F", "", 15, "" },
			{ "H_RacingHelmet_1_red_F", "", 15, "" },
			{ "H_RacingHelmet_1_white_F", "", 15, "" },
			{ "H_RacingHelmet_1_blue_F", "", 15, "" },
			{ "H_RacingHelmet_1_yellow_F", "", 15, "" },
			{ "H_RacingHelmet_1_green_F", "", 15, "" },
			{ "H_RacingHelmet_1_F", "", 15, "" },
			{ "H_RacingHelmet_2_F", "", 15, "" },
			{ "H_RacingHelmet_3_F", "", 15, "" },
			{ "H_RacingHelmet_4_F", "", 15, "" }
		};

		goggles[] = {};

		vests[] = {};

		backpacks[] = {};
	};

	class admin {
		title = "STR_Shops_Admin";
		license = "";
		side = "";
		uniforms[] = {};

		headgear[] = {};

		goggles[] = {};

		vests[] = {};

		backpacks[] = {};
	};
};
