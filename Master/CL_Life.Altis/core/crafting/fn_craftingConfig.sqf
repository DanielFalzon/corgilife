/*
	File: fn_craftingConfig.sqf
	Author:
	Description:
*/
private _item = _this;

_items = switch (_item) do {

	// Clothing
	case "U_B_FullGhillie_lsh": { [["fabric",20],["kevlar",2],["twigs",20],["hemp",20]] }; // Full Ghillie Lush NATO
	case "U_B_FullGhillie_sard": { [["fabric",20],["kevlar",2],["twigs",20],["hemp",20]] }; // Full Ghillie Semi-Arid NATO
	case "U_B_FullGhillie_ard": { [["fabric",20],["kevlar",2],["twigs",20],["hemp",20]] }; // Full Ghillie Arid NATO
	case "U_O_GhillieSuit": { [["fabric",20],["kevlar",1],["twigs",20],["hemp",20]] }; // Ghillie Suit CSAT
	case "U_O_T_FullGhillie_tna_F": { [["fabric",20],["kevlar",1],["twigs",20],["hemp",20]] }; // Full Ghillie Jugngle CSAT
	case "U_O_OfficerUniform_ocamo": { [["fabric",30]] }; // Officer Fatigues
	case "U_I_pilotCoveralls": { [["fabric",30]] }; // Pilot Coveralls AAF
	
	// Vests
	case "V_PlateCarrierSpec_blk": { [["fabric",10],["kevlar",15]] }; // Carrier Special Rig V
	case "V_PlateCarrierH_CTRG": { [["fabric",10],["kevlar",10]] }; // CTRG Plate Carrier MK2 IV
	case "V_PlateCarrier2_rgr_noflag_F": { [["fabric",10],["kevlar",10]] }; // Carrier Rig Green IV
	case "V_PlateCarrierIA2_dgtl": { [["fabric",10],["kevlar",5]] }; // GA Carrier Rig III
	case "V_PlateCarrierIAGL_oli": { [["fabric",10],["kevlar",5]] }; // GA Carrier Rig Blast Resist
	case "V_PlateCarrierIAGL_dgtl": { [["fabric",10],["kevlar",5]] }; // GA Carrier Rig Blast Resist
	
	// Helmets
	case "H_HelmetLeaderO_ocamo": { [["kevlar",10]] }; // Defender Helmet V
	case "H_HelmetSpecB_blk": { [["kevlar",7]] }; // Enhanced Combat IV
	case "H_PilotHelmetFighter_O": { [["kevlar",5]] }; // Pilot Helmet III
	case "H_PilotHelmetHeli_I": { [["kevlar",2]] }; // Heli Pilot II
	case "H_HelmetB_TI_tna_F": { [["kevlar",2]] }; // Stealth Combat II
	
	// Weapons
	
	// 7.62mm
	case "srifle_DMR_03_F": { [["polymer",16],["firing_pin",1],["pipe",2],["steel",7]] }; // MK-1 DMR
	case "arifle_SPAR_03_blk_F": { [["polymer",15],["firing_pin",1],["pipe",2],["steel",7]] }; // Spar-17
	case "srifle_EBR_F": { [["polymer",12],["firing_pin",1],["pipe",2],["steel",7]] }; // MK18 ABR
	case "arifle_AKM_F": { [["polymer",10],["firing_pin",1],["pipe",2],["steel",7]] }; // AKM
	case "srifle_DMR_06_camo_F": { [["polymer",10],["firing_pin",1],["pipe",2],["steel",7]] }; // MK-14
	case "srifle_DMR_01_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",7]] }; // Rahim
	
	// 6.5mm
	case "arifle_Katiba_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",5]] }; // Katiba - Long
	case "arifle_Katiba_C_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",5]] }; // Katiba - Short
	case "arifle_MX_SW_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",5]] }; //MXSW
	case "arifle_MXM_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",5]] }; // MXM
	case "arifle_MX_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",5]] }; // MX
	case "arifle_MXC_F": { [["polymer",7],["firing_pin",1],["pipe",2],["steel",5]] }; // MXC
	
	// 5.56
	case "arifle_Mk20_GL_F": { [["polymer",2],["firing_pin",1],["pipe",2],["steel",2]] }; // MK20-GL
	case "arifle_TRG21_GL_F": { [["polymer",2],["firing_pin",1],["pipe",2],["steel",2]] }; // TRG-21-GL
	
	// Silencers
	case "muzzle_snds_h": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_L": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_M": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_B": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_H_MG": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_acp": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_338_black": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_93mmg": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_H_khk_F": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_m_khk_F": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_58_blk_F": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_B_khk_F": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_65_TI_blk_F": { [["polymer",1],["pipe",2],["steel",2]] };
	case "muzzle_snds_H_MG_blk_F": { [["polymer",1],["pipe",2],["steel",2]] };
	
	// Helicopters
	case "B_Heli_Transport_01_F": { [["kevlar",50],["engine_component",5],["wheel",3],["pipe",10],["glass",5],["steel",30],["iron",10]] }; // Ghost Hawk
	case "B_Heli_Transport_03_unarmed_F": { [["kevlar",70],["engine_component",10],["wheel",4],["pipe",10],["glass",10],["steel",30],["iron",10]] }; // Huron
	case "O_T_VTOL_02_infantry_F": { [["kevlar",70],["engine_component",5],["wheel",4],["pipe",5],["glass",5],["steel",10],["iron",10]] }; // VTOL - Infantry
	case "O_T_VTOL_02_vehicle_hex_F": { [["kevlar",70],["engine_component",5],["wheel",4],["pipe",5],["glass",5],["steel",10],["iron",10]] }; // VTOL - Vehicle
	case "O_Heli_Transport_04_F": { [["kevlar",50],["engine_component",5],["wheel",3],["pipe",10],["glass",5],["steel",30],["iron",10]] }; // Taru
	case "O_Heli_Transport_04_covered_F": { [["kevlar",50],["engine_component",5],["wheel",3],["pipe",10],["glass",5],["steel",30],["iron",10]] }; // Taru Transport
	case "B_T_VTOL_01_infantry_F": { [["kevlar",70],["engine_component",5],["wheel",4],["pipe",5],["glass",5],["steel",10],["iron",10]] }; // Blackfish - Infantry
	case "B_T_VTOL_01_vehicle_F": { [["kevlar",70],["engine_component",5],["wheel",4],["pipe",5],["glass",5],["steel",10],["iron",10]] }; // Blackfish - Vehicle
	
	// Trucks
	case "B_Truck_01_box_F": { [["kevlar",10],["engine_component",15],["wheel",15],["pipe",10],["glass",5],["steel",15],["iron",10]] }; // HEMTT Box
	case "B_Truck_01_covered_F": { [["kevlar",7],["engine_component",15],["wheel",15],["pipe",10],["glass",5],["steel",15],["iron",10]] }; // HEMTT Covered
	case "B_Truck_01_transport_F": { [["kevlar",5],["engine_component",15],["wheel",15],["pipe",10],["glass",5],["steel",15],["iron",10]] }; // HEMTT Transport
	case "O_Truck_03_device_F": { [["kevlar",10],["engine_component",20],["wheel",15],["pipe",15],["glass",5],["steel",15],["iron",10]] }; // Tempest Device
	case "O_Truck_03_covered_F": { [["kevlar",7],["engine_component",7],["wheel",15],["pipe",5],["glass",5],["steel",5],["iron",10]] }; // Tempest Covered
	case "O_Truck_03_transport_F": { [["kevlar",5],["engine_component",7],["wheel",15],["pipe",5],["glass",5],["steel",5],["iron",10]] }; // Tempest Transport
	case "I_Truck_02_covered_F": { [["engine_component",5],["wheel",8],["pipe",8],["glass",5],["iron",10]] }; // ZAMAK Covered
	case "I_Truck_02_transport_F": { [["engine_component",5],["wheel",8],["pipe",8],["glass",5],["iron",10]] }; // ZAMAK Transport
	
	// Armored
	case "O_MRAP_02_F": { [["kevlar",70],["engine_component",15],["wheel",5],["pipe",5],["glass",15],["steel",15]] }; // IFRIT
	case "I_MRAP_03_F": { [["kevlar",70],["engine_component",15],["wheel",5],["pipe",5],["glass",15],["steel",15]] }; // STRIDER
	case "B_MRAP_01_F": { [["kevlar",70],["engine_component",15],["wheel",5],["pipe",5],["glass",15],["steel",15]] }; // HUNTER
};

_items;
