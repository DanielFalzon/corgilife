#include "titles.cpp"

/*
	Author: Maverick Applications
	Airport Plane Taxi Script
*/

class Maverick_PlaneTaxis {
	class Costs {
		pricePerMeter = 0.5; // Given in dollars
		moneyVariable = "CL_bmoola";
	};

	class Messages {
		notEnoughMoney = "You do not have enough money to fly to this airport.";
		noSpaceForPlane = "There is a vehicle blocking the spawn location of your plane.";
	};

	class Vehicle {
		classname = "C_Plane_Civil_01_F";
	};

	class Airports {
		class CL {
			class a0 {
				id = 0;
				displayName = "Airbase";
				exitPosition[] = {{14596.5,16758.7,0.00143814},135};
				entryPosition[] = {{14484.1,16179.4,0.0014534},223};
			};
			class a1 {
				id = 1;
				displayName = "AAC Airfield";
				exitPosition[] = {{11593.8,11967.6,0.00143623},162.876};
				entryPosition[] = {{11356.5,11445.5,0.00142479},34};
			};
			class a2 {
				id = 2;
				displayName = "Krya Nera Airstrip";
				inAir = 1;
				exitPosition[] = {{9162.19,21657.8,0.00143909},148};
				entryPosition[] = {{9198.62,21622.1,0.00144863},148};
			};
/*			class a3 {
				id = 3;
				displayName = "Selakeno Airfield";
				inAir = 1;
				exitPosition[] = {{20783.6,7264.12,0.00138664},139};
				entryPosition[] = {{20810.2,7252.59,0.00139427},48};
			};*/
			class a3 {
				id = 3;
				displayName = "Molos Airfield";
				inAir = 1;
				exitPosition[] = {{26736.3,24607.3,0.00139809},121};
				entryPosition[] = {{26784.9,24629.8,0.00131989},131};
			};
			class a4 {
				id = 4;
				displayName = "Almyra Salt Lake Airstrip";
				exitPosition[] = {{22989.7,18892,0.00142145},144};
				entryPosition[] = {{23083.8,18860,0.00143886},90};
			};
		};
	};
};