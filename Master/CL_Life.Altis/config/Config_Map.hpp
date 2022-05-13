class CfgMap
{
	class TerrainObjects
	{
		class Kavala_Square
		{
			position[] = {3650, 13112, 0};
			radius = 36;
			recursive = 1;
			type[] = {"concrete_smallwall", "t_phoenixc3s_f", "t_oleae1s_f", "treebin_f", "garbagecontainer_closed_f"};
			hide = 1;
			scope = 2;
		};

		class Kavala_Square_RedBurger
		{
			position[] = {3637.2, 13099.4, 2.97199};
			type = "Land_Kiosk_redburger_F";
			hide = 1;
			scope = 2;
		};

		class Kavala_BasketBall_Court
		{
			position[] = {3650.47, 13154.7, 0};
			type = "Land_BC_Court_F";
			hide = 1;
			scope = 2;
		};

		class Kavala_Square_Office
		{
			position[] = {3691.69, 13156.8, 7.94988};
			type = "Land_Offices_01_V1_F";
			lockDoors[] = {6};
			scope = 2;
		};

		class Kavala_Square_TouristHouse
		{
			position[] = {3603.72, 13117.4, 3.11376};
			type = "Land_i_House_Big_02_V1_F";
			hide = 1;
			scope = 2;
		};

		class Kavala_FoodCourt_Walls
		{
			position[] = {3668, 13187, 0};
			radius = 60;
			recursive = 1;
			mapType[] = {"Fence", "Wall"};
			type[] = {"pipewall_concretel", "city_pillar_f"};
			hide = 1;
			scope = 2;
		};

		class Kaval_FoodCourt_Barracks
		{
			position[] = {3654.56, 13196.9, -0.31782};
			type = "Land_i_Barracks_V2_F";
			hide = 1;
			scope = 2;
		};

		class Kavala_PoliceHQ_Trash
		{
			position[] = {3225, 12919, 0};
			radius = 100;
			recursive = 1;
			type[] = {"fishinggear_01_f", "fishinggear_02_f", "crabcages_f"};
			hide = 1;
			scope = 2;
		};

		class Kavala_Square_Replace_Shops01
		{
				position[] = {3651, 13148, 0};
				radius = 85;
				recursive = 1;
				mapType = "House";
				type[] = {"Land_u_Shop_01_V1_F", "Land_d_Shop_01_V1_F"};
				lockDoors[] = {2, 3};
				scope = 1;

				class Replacements
				{
				class Land_i_Shop_01_V1_F
				{
					type = "Land_i_Shop_01_V1_F";
					scope = 1;
				};

				class Land_i_Shop_01_V2_F
				{
					type = "Land_i_Shop_01_V2_F";
					scope = 1;
				};

				class Land_i_Shop_01_V3_F
				{
					type = "Land_i_Shop_01_V3_F";
					scope = 1;
				};
			};
		};

		class Kavala_Square_Replace_Shops02: Kavala_Square_Replace_Shops01
		{
				type = "Land_u_Shop_02_V1_F";
				lockDoors = 1;
				scope = 1;

				class Replacements
				{
				class Land_i_Shop_02_V1_F
				{
					type = "Land_i_Shop_02_V1_F";
					scope = 1;
				};

				class Land_i_Shop_02_V2_F
				{
					type = "Land_i_Shop_02_V2_F";
					scope = 1;
				};

				class Land_i_Shop_02_V3_F
				{
					type = "Land_i_Shop_02_V3_F";
					scope = 1;
				};
			};
		};
	};
};
