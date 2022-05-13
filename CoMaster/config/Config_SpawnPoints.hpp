class CfgSpawnPoints {
/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call CL_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*/
	class Civilian {
		class Kavala {
			displayName = "Kavala";
			spawnMarker = "civ_spawn_1";
			icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
			conditions = "!license_civ_reb && !license_civ_corp";
		};

		class Athira {
			displayName = "Athira";
			spawnMarker = "civ_spawn_3";
			icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
			conditions = "!license_civ_reb && !license_civ_corp";
		};

		class Pyrgos {
			displayName = "Pyrgos";
			spawnMarker = "civ_spawn_2";
			icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
			conditions = "!license_civ_reb && !license_civ_corp";
		};

		class Sofia {
			displayName = "Sofia";
			spawnMarker = "civ_spawn_4";
			icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
			conditions = "!license_civ_reb && !license_civ_corp";
		};

		class rebelN {
			displayName = "Northern Rebel Base";
			spawnMarker = "reb_spawn_2";
			icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
			conditions = "license_civ_reb && !license_civ_corp";
		};

		class rebelS {
			displayName = "Southern Rebel Base";
			spawnMarker = "reb_spawn_1";
			icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
			conditions = "license_civ_reb && !license_civ_corp";
		};

		class Corp_HQ {
			displayName = "Corp HQ";
			spawnMarker = "corp_spawn_1";
			icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
			conditions = "!license_civ_reb && license_civ_corp";
		};

		class CorpO {
			displayName = "Corp Outpost";
			spawnMarker = "corp_spawn_2";
			icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
			conditions = "!license_civ_reb && license_civ_corp";
		};
	};

	class Cop {
		class Kavala {
			displayName = "Kavala HQ";
			spawnMarker = "cop_spawn_1";
			icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
			conditions = "";
		};

		class Athira {
			displayName = "Athira HQ";
			spawnMarker = "cop_spawn_3";
			icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
			conditions = "";
		};

		class Pyrgos {
			displayName = "Pyrgos HQ";
			spawnMarker = "cop_spawn_2";
			icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
			conditions = "";
		};

		class Air {
			displayName = "Air HQ";
			spawnMarker = "cop_spawn_4";
			icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
			conditions = "license_cop_cAirA";
		};

		class HW {
			displayName = "HW Patrol";
			spawnMarker = "cop_spawn_5";
			icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
			conditions = "license_cop_cPTU";
		};

		class Academy {
			displayName = "Academy";
			spawnMarker = "cop_spawn_6";
			icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
			conditions = "";
		};
	};

	class Medic {
		class Kavala {
			displayName = "Kavala Hospital";
			spawnMarker = "medic_spawn_1";
			icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
			conditions = "";
		};

		class Athira {
			displayName = "Athira Hospital";
			spawnMarker = "medic_spawn_2";
			icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
			conditions = "";
		};

		class Pyrgos {
			displayName = "Pyrgos Hospital";
			spawnMarker = "medic_spawn_3";
			icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
			conditions = "";
		};
	};
};
