#define true 1
#define false 0
class Housing {
/*
	price - Cost of the building
	numberCrates - Allowed number of crates
	restrictedPos[] - Same as the old fn_getBuildingPositions. A list of restricted building positions (i.e, to stop spawning outside, or by windows etc)
		default: {}
	canGarage - True if the building can be used as a garage (need to buy ontop)
		default: false
	garageSpawnPos[] - worldToModel position to spawn vehicles, leave {} if canGarage is false.
		default: {}
	garageSpawnDir - Offset to garage direction to spawn at (+-90 etc). It will be used in the manner: getDir _garage + spawnDir
		default: 0
	garageBlacklists[] - List of blacklisted houses for buying garages
		default: {}
*/
	class CL {
		class Land_i_House_Big_02_V1_F {
			price = 105000;
			numberCrates = 3;
			restrictedPos[] = {0,1,2,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,3.5};
		};

		class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
		class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

		class Land_i_House_Big_01_V1_F {
			price = 155000;
			numberCrates = 4;
			restrictedPos[] = {2,3};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0,-2,3.8};
		};

		class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
		class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};

		class Land_i_House_Small_01_V1_F {
			price = 80000;
			numberCrates = 2;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-1.5,0,2};
		};

		class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
		class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

		class Land_i_House_Small_02_V1_F {
			price = 50000;
			numberCrates = 2;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,2.4};
		};

		class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
		class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};

		class Land_i_House_Small_03_V1_F {
			price = 105000;
			numberCrates = 3;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-3.3,1,2.5};
		};

		class Land_i_House_Small_03_V3_F : Land_i_House_Small_03_V1_F{};

		class Land_i_Stone_HouseSmall_V1_F {
			price = 30000;
			numberCrates = 1;
			restrictedPos[] = {0,1,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0.90,2.3,4};
		};
		class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F{};
		class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F{};
	};
};
