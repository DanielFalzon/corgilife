class CarShops {
	/*
	*    ARRAY FORMAT:
	*        0: STRING (Classname)
	*        1: STRING (Condition)
	*    FORMAT:
	*        STRING (Conditions) - Must return boolean :
	*            String can contain any amount of conditions, aslong as the entire
	*            string returns a boolean. This allows you to check any levels, licenses etc,
	*            in any combination. For example:
	*                "call CL_coplevel && license_civ_someLicense"
	*            This will also let you call any other function.
	*
	*   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
	*   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
	*   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
	*   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
	*/
	class civ_car {
		side = "civ";
		conditions = "license_civ_driver";
		vehicles[] = {
			{ "B_Quadbike_01_F", "" },
			{ "C_Hatchback_01_F", "" },
			{ "C_Offroad_01_F", "" },
			{ "C_Offroad_02_unarmed_F", "" },
			{ "C_SUV_01_F", "" },
			{ "C_Hatchback_01_sport_F", "" },	
			{ "C_Van_01_transport_F", "" }
		};
	};

	class civ_truck {
		side = "civ";
		conditions = "license_civ_trucking";
		vehicles[] = {
			{ "C_Van_01_box_F", "" },
			{ "C_Truck_02_transport_F", "" },
			{ "C_Truck_02_covered_F", "" },			
			{ "O_Truck_03_transport_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "B_Truck_01_transport_F", "" },
			{ "O_Truck_03_device_F", "" }
		};
	};

	class civ_air {
		side = "civ";
		conditions = "license_civ_pilot";
		vehicles[] = {
			{ "B_Heli_Light_01_F", "" },
			{ "O_Heli_Light_02_unarmed_F", "" },
			{ "C_Plane_Civil_01_F", "" },
			{ "C_Plane_Civil_01_racing_F", "" }
		};
	};

	class civ_ship {
		side = "civ";
		conditions = "license_civ_boat";
		vehicles[] = {
			{ "C_Scooter_Transport_01_F", "" },
			{ "C_Rubberboat", "" },
			{ "C_Boat_Transport_02_F", "" },
			{ "C_Boat_Civil_01_F", "" },
			{ "B_SDV_01_F", "" }
		};
	};

	class kart_shop {
		side = "civ";
		conditions = "license_civ_driver";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", "" },
			{ "C_Kart_01_Fuel_F", "" },
			{ "C_Kart_01_Red_F", "" },
			{ "C_Kart_01_Vrana_F", "" }
		};
	};

	class reb_car {
		side = "civ";
		conditions = "license_civ_reb";
		vehicles[] = {
			{ "O_MRAP_02_F", "" },
			{ "O_LSV_02_unarmed_F", "" },
			{ "I_Truck_02_transport_F", "" },
			{ "I_Truck_02_covered_F", "" },			
			{ "O_Truck_03_transport_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "B_Truck_01_box_F", "" }
		};
	};

	class reb_air {
		side = "civ";
		conditions = "license_civ_reb";
		vehicles[] = {
			{ "B_Heli_Light_01_F", "" },
			{ "O_Heli_Light_02_unarmed_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
			{ "O_Heli_Transport_04_covered_F", "" },
			{ "O_Heli_Transport_04_F", "" },
			{ "O_T_VTOL_02_vehicle_hex_F", "" },
			{ "O_T_VTOL_02_infantry_F", "" }
		};
	};

	class corp_car {
		side = "civ";
		conditions = "license_civ_corp";
		vehicles[] = {
			{ "B_Quadbike_01_F", "" },
			{ "C_Offroad_01_F", "" },
			{ "B_T_LSV_01_unarmed_F", "" },
			{ "I_MRAP_03_F", "" },
			{ "C_Truck_02_transport_F", "" },
			{ "C_Truck_02_covered_F", "" },			
			{ "O_Truck_03_transport_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "B_Truck_01_transport_F", "" },
			{ "B_Truck_01_covered_F", "" },
			{ "B_Truck_01_box_F", "" }
		};
	};

	class corp_air {
		side = "civ";
		conditions = "license_civ_corp";
		vehicles[] = {
			{ "B_Heli_Light_01_F", "" },
			{ "O_Heli_Light_02_unarmed_F", "" },
			{ "B_Heli_Transport_01_F", "" },
			{ "B_Heli_Transport_03_unarmed_F", "" },
			{ "I_Heli_Transport_02_F", "" },
			{ "B_T_VTOL_01_vehicle_F", "" },
			{ "B_T_VTOL_01_infantry_F", "" }
		};
	};

	class ems_car {
		side = "med";
		conditions = "call CL_mediclevel >= 1";
		vehicles[] = {			
			{ "C_Hatchback_01_F", "call CL_mediclevel >= 1" },
			{ "C_Offroad_01_F", "call CL_mediclevel >= 1" },
			{ "C_SUV_01_F", "call CL_mediclevel >= 2" },
			{ "C_Van_01_box_F", "call CL_mediclevel >= 2" },
			{ "C_Van_02_medevac_F", "call CL_mediclevel >= 2" },
			{ "C_Hatchback_01_sport_F", "call CL_mediclevel >= 3" },
			{ "C_Offroad_02_unarmed_F", "call CL_mediclevel >= 3" }
		};
	};

	class ems_air {
		side = "med";
		conditions = "call CL_mediclevel >= 1";
		vehicles[] = {
			{ "B_Heli_Light_01_F", "license_med_mAir" },
			{ "O_Heli_Light_02_unarmed_F", "license_med_mAir" },
			{ "O_Heli_Transport_04_medevac_black_F", "license_med_mAir" }
		};
	};

	class cop_car {
		side = "cop";
		conditions = "call CL_coplevel >= 1";
		vehicles[] = {
			{ "C_Hatchback_01_F", "call CL_coplevel >= 1"},
			{ "C_Offroad_01_F", "call CL_coplevel >= 2" },
			{ "C_SUV_01_F", "call CL_coplevel >= 3" },
			{ "C_Hatchback_01_sport_F", "call CL_coplevel >= 5" },
			{ "B_MRAP_01_F", "license_cop_cSWAT || call CL_coplevel >= 7" },
			{ "I_MRAP_03_F", "license_cop_cSWAT" },
			{ "B_T_LSV_01_unarmed_F", "license_cop_cSWAT" }
		};
	};

	class cop_truck {
		side = "cop";
		conditions = "call CL_coplevel >= 1";
		vehicles[] = {
			{ "O_Truck_03_covered_F", "license_cop_cUC" }
		};
	};

	class cop_air {
		side = "cop";
		conditions = "call CL_coplevel >= 1";
		vehicles[] = {
			{ "B_Heli_Light_01_F", "license_cop_cAirA" },
			{ "O_Heli_Light_02_unarmed_F", "license_cop_cAirB" },
			{ "I_Heli_light_03_unarmed_F", "license_cop_cAirB" },
			{ "B_Heli_Transport_01_F", "license_cop_cAirC" },
			{ "B_CTRG_Heli_Transport_01_tropic_F", "license_cop_cAirC" },
			{ "B_Heli_Transport_03_unarmed_F", "license_cop_cAirC" }
		};
	};

	class cop_ship {
		side = "cop";
		conditions = "call CL_coplevel >= 1";
		vehicles[] = {
			{ "C_Boat_Civil_01_police_F", "license_cop_cBoat" },
			{ "B_Boat_Transport_01_F", "license_cop_cCG" },
			{ "I_C_Boat_Transport_02_F", "license_cop_cCG" },
			{ "B_SDV_01_F", "license_cop_cSWAT" }
		};
	};
};

class CLCfgVehicles {
	/*
	*    Vehicle Configs (Contains textures and other stuff)
	*
	*    "price" is the price before any multipliers set in Master_Config are applied.
	*
	*    Default Multiplier Values & Calculations:
	*       Civilian [Purchase, Sell]: [1.0, 0.5]
	*       Cop [Purchase, Sell]: [0.5, 0.5]
	*       Medic [Purchase, Sell]: [0.75, 0.5]
	*       ChopShop: Payout = price * 0.25
	*       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
	*       Cop Impound: Payout = price * 0.1
	*       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
	*           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
	*
	*       1: STRING (Condition)
	*    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
	*    Texture(s)path follows this format:
	*    INDEX 0: Texture Layer 0
	*    INDEX 1: Texture Layer 1
	*    INDEX 2: Texture Layer 2
	*    etc etc etc
	*
	*/

	class Default {
		vItemSpace = -1;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class O_Truck_03_medical_F {
		vItemSpace = 0;
		conditions = "";
		price = -1;
	};

	class B_Truck_01_medical_F {
		vItemSpace = 0;
		conditions = "";
		price = -1;
	};

	class C_Scooter_Transport_01_F {
		vItemSpace = 60;
		conditions = "";
		price = 1500;
		textures[] = {
			{ "Black", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"
			}, "" },
			{ "Blue", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"
			}, "" },
			{ "Grey", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"
			}, "" },
			{ "Green", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"
			}, "" },
			{ "Red", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
			}, "" },
			{ "White", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
			}, "" },
			{ "Yellow", "civ", {
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa",
				"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"
			}, "" }
		};
	};

	class C_Rubberboat {
		vItemSpace = 175;
		conditions = "";
		price = 2500;
		textures[] = {};
	};

	class B_Heli_Transport_01_F {
		vItemSpace = 100;
		conditions = "";
		price = 200000;
		textures[] = {
			{ "Police", "Cop", {
				"textures\UH80\Police\Police_UH80_1.paa",
				"textures\UH80\Police\Police_UH80_2.paa"
			}, "" },
			{ "Default", "civ", {
				"\a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext01_co.paa",
				"\a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext02_co.paa"
			}, "" },
			{ "Default", "corp", {
				"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_BLUFOR_CO.paa",
				"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_BLUFOR_CO.paa"
			}, "" },
			{ "Default", "reb", {
				"\a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext01_co.paa",
				"\a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext02_co.paa"
			}, "" }
		};
	};

	class B_MRAP_01_hmg_F : Default {
		vItemSpace = 110;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class O_Boat_Armed_01_hmg_F {
		vItemSpace = 275;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class B_G_Boat_Transport_01_F {
		vItemSpace = 145;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class B_Boat_Transport_01_F {
		vItemSpace = 145;
		conditions = "";
		price = 2000;
		textures[] = {};
	};

	class I_C_Boat_Transport_02_F {
		vItemSpace = 170;
		conditions = "";
		price = 2300;
		textures[] = {};
	};

	class O_Truck_03_transport_F {
		vItemSpace = 300;
		conditions = "";
		price = 200000;
		textures[] = {
			{ "HEX", "civ", {
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"
			}, "" },
			{ "HEX Green", "civ", {
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"
			}, "" }
		};
	};

	class O_Truck_03_device_F {
		vItemSpace = 575;
		conditions = "";
		price = 400000;
		textures[] = {
			{ "HEX", "civ", {
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"
			}, "" },
			{ "HEX Green", "civ", {
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"
			}, "" }
		};
	};
	//--- Fed vault;
	class Land_CargoBox_V1_F : Default {
		vItemSpace = 5000;
		conditions = "";
		price = -1;
	};
	//--- Convoy Vault;
	class O_T_Truck_03_ammo_ghex_F {
		vItemSpace = 5000;
		conditions = "";
		price = -1;
	};

	class Box_IND_Grenades_F : Default {
		vItemSpace = 700;
		conditions = "";
		price = -1;
	};

	class B_supplyCrate_F {
		vItemSpace = 1500;
		conditions = "";
		price = -1;
	};

	class O_T_LSV_02_armed_F {
		vItemSpace = 70;
		conditions = "";
		price = 20000;
		textures[] = {};
	};

	class I_G_Van_01_transport_F {
		vItemSpace = 200;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class B_SDV_01_F {
		vItemSpace = 50;
		conditions = "";
		price = 8000;
		textures[] = {};
	};

	class C_Boat_Transport_02_F	 {
		vItemSpace = 300;
		conditions = "";
		price = 350;
		textures[] = {};
	};

	class C_Boat_Civil_01_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000;
		textures[] = {};
	};

	class C_Boat_Civil_01_police_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000;
		textures[] = {};
	};

	class C_Boat_Civil_01_rescue_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000;
		textures[] = {};
	};

	class B_Truck_01_box_F {
		vItemSpace = 1000;
		conditions = "";
		price = 700000;
		textures[] = {};
	};

	class B_Truck_01_transport_F {
		vItemSpace = 400;
		conditions = "";
		price = 350000;
		textures[] = {};
	};

	class O_MRAP_02_F {
		vItemSpace = 100;
		conditions = "";
		price = 300000;
		textures[] = {};
	};

	class I_MRAP_03_F {
		vItemSpace = 100;
		conditions = "";
		price = 300000;
		textures[] = {
			{ "SWAT Strider", "cop", {
				"#(argb,8,8,3)color(0.05,0.05,0.05,1)"
			}, "" }
		};
	};

	class B_T_LSV_01_armed_F {
		vItemSpace = 100;
		conditions = "";
		price = 99000;
		textures[] = {};
	};

	class B_T_LSV_01_unarmed_F {
		vItemSpace = 70;
		conditions = "";
		price = 100000;
		textures[] = {
			{ "Tactical", "cop", {
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"
			}, "" }
		};
	};

	class B_G_Offroad_01_F {
		vItemSpace = 120;
		conditions = "";
		price = 3000;
		textures[] = {};
	};

	class C_Offroad_01_F {
		vItemSpace = 120;
		conditions = "";
		price = 30000;
		textures[] = {
			{ "Red", "civ", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
			}, "" },
			{ "Yellow", "civ", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
			}, "" },
			{ "White", "civ", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
			}, "" },
			{ "Blue", "civ", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
			}, "" },
			{ "Dark Red", "civ", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
			}, "" },
			{ "Blue / White", "civ", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
			}, "" },
			{ "Police Offroad", "cop", {
				"textures\OffRoad\Police\Offroad_Police.paa"
			}, "" },
			{ "Red", "cop", {
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
				"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
			}, "license_cop_cUC" },
			{ "Offroad", "med", {
				"textures\OffRoad\Medic\Offroad_Medic.paa"
			}, "" }
		};
	};

	class C_Offroad_02_unarmed_F {
		vItemSpace = 100;
		conditions = "";
		price = 35000;
		textures[] = {
			{ "Black", "civ", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"
			}, "" },
			{ "Black", "cop", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"
			}, "" },
			{ "Blue", "civ", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"
			}, "" },
			{ "Blue", "cop", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"
			}, "" },
			{ "Green", "civ", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"
			}, "" },
			{ "Green", "cop", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"
			}, "" },
			{ "Orange", "civ", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"
			}, "" },
			{ "Red", "civ", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"
			}, "" },
			{ "White", "civ", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"
			}, "" },
			{ "Jeep", "med", {
				"textures\Jeep\Medic\medic_jeep.paa"
			}, "" }
		};
	};

	class C_Kart_01_Blu_F {
		vItemSpace = 0;
		conditions = "";
		price = 2500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class B_Quadbike_01_F {
		vItemSpace = 25;
		conditions = "";
		price = 5000;
		textures[] = {
			{ "Brown", "cop", {
				"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
			}, "" },
			{ "Digi Desert", "reb", {
				"\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
			}, "" },
			{ "Black", "civ", {
				"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
			}, "" },
			{ "Blue", "civ", {
				"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
			}, "" },
			{ "Red", "civ", {
				"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
			}, "" },
			{ "White", "civ", {
				"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
			}, "" },
			{ "Digi Green", "corp", {
				"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
			}, "" },
			{ "Hunter Camo", "civ", {
				"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
			}, "" },
			{ "Rebel Camo", "reb", {
				"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
			}, "" }
		};
	};

	class I_Truck_02_medical_F {
		vItemSpace = 475;
		conditions = "";
		price = 2500;
		textures[] = {};
	};

	class O_LSV_02_unarmed_arid_f {
		vItemSpace = 70;
		conditions = "";
		price = 3000;
		textures[] = {};
	};

	class B_T_LSV_01_unarmed_olive_F {
		vItemSpace = 70;
		conditions = "";
		price = 90000;
		textures[] = {};
	};

	class I_Truck_02_covered_F {
		vItemSpace = 500;
		conditions = "";
		price = 400000;
		textures[] = {
			{ "Orange", "civ", {
				"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
			}, "" },
			{ "Undercover Orange", "cop", {
				"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
			}, "license_cop_cUC" }
		};
	};

	class I_Truck_02_transport_F {
		vItemSpace = 375;
		conditions = "";
		price = 300000;
	};

	class O_Truck_03_covered_F {
		vItemSpace = 350;
		conditions = "";
		price = 250000;
		textures[] = {
			{ "HEX", "civ", {
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cover_CO.paa"
			}, "" },
			{ "HEX Green", "civ", {
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cover_ghex_CO.paa"
			}, "" },
			{ "HEX", "cop", {
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa",
				"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cover_CO.paa"
			}, "" },
			{ "HEX Green", "cop", {
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa",
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cover_ghex_CO.paa"
			}, "" }
		};
	};

	class C_Hatchback_01_F {
		vItemSpace = 50;
		conditions = "";
		price = 15000;
		textures[] = {
			{ "Beige", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
			}, "" },
			{ "Green", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
			}, "" },
			{ "Blue", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
			}, "" },
			{ "Dark Blue", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
			}, "" },
			{ "Yellow", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
			}, "" },
			{ "White", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
			}, "" },
			{ "Grey", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
			}, "" },
			{ "Black", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
			}, "" },
			{ "Police Hatchback", "cop", {
				"textures\Hatchback_Sport\Police\Hatchback_Sport_Police.paa"
			}, "" },
			{ "Hatchback", "med", {
				"textures\Hatchback\Medic\Hatchback_Medic.paa"
			}, "" }
		};
	};

	class C_SUV_01_F {
		vItemSpace = 80;
		conditions = "";
		price = 40000;
		textures[] = {
			{ "Dark Red", "civ", {
				"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
			}, "" },		
			{ "Silver", "civ", {
				"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
			}, "" },
			{ "Orange", "civ", {
				"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
			}, "" },
			{ "Police SUV", "cop", {
				"textures\SUV\Police\SUV_Police.paa"
			}, "" },
			{ "SUV", "med", {
				"textures\SUV\Medic\SUV_Medic.paa"
			}, "" }
		};
	};

	class C_Hatchback_01_sport_F {
		vItemSpace = 50;
		conditions = "";
		price = 80000;
		textures[] = {
			{ "Beige", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
			}, "" },
			{ "Green", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
			}, "" },
			{ "Blue", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
			}, "" },
			{ "Dark Blue", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
			}, "" },
			{ "Yellow", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
			}, "" },
			{ "White", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
			}, "" },
			{ "Grey", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
			}, "" },
			{ "Black", "civ", {
				"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
			}, "" },
			{ "Police Hatchback", "cop", {
				"textures\Hatchback_Sport\Police\Hatchback_Sport_Police.paa"
			}, "" },
			{ "Hatchback", "med", {
				"textures\Hatchback\Medic\Hatchback_Medic.paa"
			}, "" }
		};
	};	

	class C_Van_01_transport_F {
		vItemSpace = 175;
		conditions = "";
		price = 60000;
		textures[] = {
			{ "White", "civ", {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
			}, "" },
			{ "Red", "civ", {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
			}, "" }
		};
	};

	class C_Van_01_box_F {
		vItemSpace = 200;
		conditions = "";
		price = 80000;
		textures[] = {
			{ "White", "civ", {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
			}, "" },
			{ "Red", "civ", {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
			}, "" },
			{ "Box Truck", "med", {
				"textures\Box_Truck\Medic\Box_Medic_01.paa",
				"textures\Box_Truck\Medic\Box_Medic_02.paa"
			}, "" },
		};
	};

	class B_MRAP_01_F {
		vItemSpace = 100;
		conditions = "";
		price = 250000;
		textures[] = {
			{ "Police", "cop", {
				"#(argb,8,8,3)color(0.05,0.05,0.05,1)"
			}, "license_cop_cSWAT" }
		};
	};

	class B_Heli_Light_01_F {
		vItemSpace = 15;
		conditions = "";
		price = 100000;
		textures[] = {
			{ "Civ Blue", "civ", {
				"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
			}, "" },
			{ "Civ Red", "civ", {
				"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
			}, "" },
			{ "Blueline", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
			}, "" },
			{ "Elliptical", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
			}, "" },
			{ "Furious", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
			}, "" },
			{ "Jeans Blue", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
			}, "" },
			{ "Speedy Redline", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
			}, "" },
			{ "Sunset", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
			}, "" },
			{ "Vrana", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
			}, "" },
			{ "Waves Blue", "civ", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
			}, "" },
			{ "Rebel Digital", "reb", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
			}, "" },
			{ "Digi Green", "corp", {
				"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
			}, "" },
			{ "EMS", "med", {
				"textures\Hummingbird\Medic\Hummingbird_Medic.paa"
			}, "license_med_mAir" },
			{ "Undercover Hummingbird", "cop", {
				"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
			}, "license_cop_cUC" },
			{ "Police", "cop", {
				"textures\Hummingbird\Police\Hummingbird_Police.paa"
			}, "" },
			{ "Tactical", "cop", {
				"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
			}, "license_cop_cSWAT" }
		};
	};

	class O_Heli_Light_02_unarmed_F {
		vItemSpace = 150;
		conditions = "";
		price = 250000;
		textures[] = {
			{ "Black Custom", "civ", {
				"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"
			}, "" },
			{ "White / Blue", "civ", {
				"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
			}, "" },
			{ "White / Blue", "civ", {
				"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
			}, "" },
			{ "Digi Green", "corp", {
				"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
			}, "" },
			{ "Desert Digi", "reb", {
				"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
			}, "" },
			{ "Tactical", "cop", {
				"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
			}, "license_cop_cSWAT" },
			{ "EMS", "med", {
				"textures\Orca\Medic\Orca_Medic.paa"
			}, "license_med_mAir" }
		};
	};

	class C_Plane_Civil_01_F {
		vItemSpace = 100;
		conditions = "";
		price = 300000;
		textures[] = {};
	};

	class C_Plane_Civil_01_racing_F {
		vItemSpace = 50;
		conditions = "";
		price = 300000;
		textures[] = {};
	};

	class I_Heli_Transport_02_F {
		vItemSpace = 200;
		conditions = "";
		price = 110000;
		textures[] = {};
	};

	class O_Heli_Transport_04_medevac_black_F {
		vItemSpace = 400;
		conditions = "";
		price = 150000;
		textures[] = {};
	};

	class O_Heli_Transport_04_bench_F {
		vItemSpace = 20;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class O_Heli_Transport_04_medevac_F {
		vItemSpace = 0;
		conditions = "";
		price = -1;
		textures[] = {};
	};

	class I_Heli_light_03_unarmed_F {
		vItemSpace = 100;
		conditions = "";
		price = 300000;
		textures[] = {
			{ "Default", "reb", {
				"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa"
			}, "" },
			{ "Police", "cop", {
				"textures\Hellcat\Police\Hellcat_Police.paa"
			}, "" }
		};
	};

	class B_CTRG_Heli_Transport_01_tropic_F {
		vItemSpace = 70;
		conditions = "";
		price = 140000;
		textures[] = {};
	};

	class O_Heli_Transport_04_covered_F {
		vItemSpace = 200;
		conditions = "";
		price = 600000;
		textures[] = {};
	};

	class O_T_VTOL_02_vehicle_hex_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000000;
		textures[] = {};
	};
	
	class O_T_VTOL_02_infantry_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000000;
		textures[] = {};
	};

	class O_Heli_Transport_04_F {
		vItemSpace = 100;
		conditions = "";
		price = 500000;
		textures[] = {
			{ "Default", "reb", {
				"\A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa",
				"\A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"
			}, "" }
		};
	};

	class B_Heli_Transport_03_unarmed_F {
		vItemSpace = 1000;
		conditions = "";
		price = 750000;
		textures[] = {
		{ "Default", "civ", {
				"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
				"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
			}, "license_civ_corp" }
		};
	};

	class B_T_VTOL_01_vehicle_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000000;
		textures[] = {};
	};
	
	class B_T_VTOL_01_infantry_F {
		vItemSpace = 200;
		conditions = "";
		price = 3000000;
		textures[] = {};
	};

	class C_Van_02_medevac_F { //--- LOW DLC Ambulance;
		vItemSpace = 120;
		conditions = "";
		price = 2000;
		textures[] = {};
	};

	class O_G_Offroad_01_armed_F { //--- 911;
		vItemSpace = 50;
		conditions = "";
		price = 50000;
		textures[] = {};
	};

	class C_Truck_02_transport_F { //--- Zamak;
		vItemSpace = 240;
		conditions = "";
		price = 120000;
		textures[] = {};
	};
	
	class C_Truck_02_covered_F { //--- Zamak Coverd;
		vItemSpace = 270;
		conditions = "";
		price = 150000;
		textures[] = {};
	};
	
	class B_Truck_01_covered_F { //--- Hemtt Transport;
		vItemSpace = 70;
		conditions = "";
		price = 190000;
		textures[] = {};
	};

	class O_T_MRAP_02_ghex_F { //--- Ifrit;
		vItemSpace = 70;
		conditions = "";
		price = 300000;
		textures[] = {};
	};	
	
	class O_LSV_02_unarmed_F { //--- Qilin;
		vItemSpace = 70;
		conditions = "";
		price = 100000;
		textures[] = {};
	};		
};
