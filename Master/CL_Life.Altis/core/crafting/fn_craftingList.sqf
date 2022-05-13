/*
	File: fn_craftingList.sqf
	Author:
	Edited: Dark
	Description:
*/
private _manufacturer = _this;
private _craftableItems = [];

_craftableItems = switch (_manufacturer) do {
	case "vehicles": {
		[
		"B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_hex_F","O_Heli_Transport_04_F","O_Heli_Transport_04_covered_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F",
		"B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","O_Truck_03_device_F","O_Truck_03_covered_F","O_Truck_03_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F",
		"O_MRAP_02_F","I_MRAP_03_F","B_MRAP_01_F"
		]
	};

	case "equipment": {
		[
		"U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_GhillieSuit","U_O_OfficerUniform_ocamo","U_O_T_FullGhillie_tna_F","U_I_pilotCoveralls",
		"V_PlateCarrierIAGL_oli","V_PlateCarrierIAGL_dgtl","V_PlateCarrierSpec_blk","V_PlateCarrierIA2_dgtl","V_PlateCarrierH_CTRG","V_PlateCarrier2_rgr_noflag_F",
		"H_PilotHelmetFighter_O","H_PilotHelmetHeli_I","H_HelmetB_TI_tna_F","H_HelmetLeaderO_ocamo","H_HelmetSpecB_blk"
		]
	};

	case "weapons": {
		[
		"srifle_DMR_03_F","arifle_SPAR_03_blk_F","srifle_EBR_F","srifle_DMR_06_camo_F","srifle_DMR_01_F","arifle_AKM_F",
		"arifle_Katiba_F","arifle_Katiba_C_F","arifle_MX_SW_F","arifle_MXM_F","arifle_MX_F","arifle_MXC_F",
		"arifle_Mk20_GL_F","arifle_TRG21_GL_F"
		]
	};
	
	case "attachments": {
		[
		"muzzle_snds_H_khk_F","muzzle_snds_93mmg","muzzle_snds_338_black","muzzle_snds_acp","muzzle_snds_H_MG","muzzle_snds_B","muzzle_snds_M","muzzle_snds_L","muzzle_snds_h",
		"muzzle_snds_H_MG_blk_F","muzzle_snds_65_TI_blk_F","muzzle_snds_B_khk_F","muzzle_snds_58_blk_F","muzzle_snds_m_khk_F"
		]
	};

	default {[]};
};

_craftableItems;
