#include "..\script_macros.hpp"
/*
	File: fn_setupActions.sqf
	Author:

	Description:
	Master addAction file handler for all client-based actions.
*/
CL_actions = [];

switch (playerSide) do {
	case civilian: {
		//Drop fishing net
		CL_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",CL_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && CL_carryWeight < CL_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !CL_net_dropped ']);
		//Rob person
		CL_actions pushBack (player addAction[localize "STR_pAct_RobPerson",CL_fnc_robAction,"",0,false,false,"",'
		!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']);
		//Harvest Organs
		CL_actions pushBack (player addAction["Harvest Organs",CL_fnc_takeOrgans,"",1.5,false,false,"",'
		!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["missingOrgan",false]) && !(player getVariable "hasOrgan") ']);
		//Cannibalism
		CL_actions pushBack (player addAction["Take a bite",CL_fnc_takeFlesh,"",1.5,false,false,"",'
		!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["missingFlesh",false]) && !(player getVariable "hasFlesh") ']);

		//Smoke Trails for Plane
		CL_smokeTrail = false;
		CL_smokes = [];

		CL_actions pushBack (player addAction ["Start Smoke Trail",
			{
				CL_smokeTrail = true;
				{
					private _colour = ["SmokeShellRed", "SmokeShellBlue"] select _forEachIndex;
					for "_i" from 0 to 5 do {
						private _veh = objectParent player;
						private _smoke = _colour createVehicle [random(50),random(50),random(50)];
						_smoke attachTo [_veh, _x];
						CL_smokes pushBack _smoke;
					};
				} forEach [[-5,0.855469,-0.6],[5,0.855469,-0.6]];
			},"",0,false,false,"",'!CL_smokeTrail && {!isNull objectParent player} && {objectParent player isKindOf "Plane"}']);

		CL_actions pushBack (player addAction ["Stop Smoke Trail",
			{
				CL_smokeTrail = false;
				{
					deleteVehicle _x;
				} forEach CL_smokes;
			},"",0,false,false,"",'CL_smokeTrail']);
	};

	case west: {
		//Seize Objects on Ground
		CL_actions pushBack (player addAction["Seize Objects",CL_fnc_seizeObjects,cursorObject,1.5,false,false,"",'((count(nearestObjects [player,["WeaponHolder"],3])>0) || (count(nearestObjects [player,["GroundWeaponHolder"],3])>0) || (count(nearestObjects [player,["WeaponHolderSimulated"],3])>0))']);
	};

	case independent: {
		//Bloodbag Self
		CL_actions pushBack (player addAction["<t color='#FF0000'>Self Bloodbag</t>",CL_fnc_bloodbagself,"",1.5,false,true,"",'player isKindOf "Man" && alive player && (damage player) > 0.05 && (CL_inv_bloodbag > 0)']);
		//Bloodbag Others
		CL_actions pushBack (player addAction["<t color='#FF0000'>Give Bloodbag</t>",CL_fnc_bloodbag,"",1.5,true,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && (damage cursorTarget) > 0.05 && cursorTarget distance player < 3.5 && (CL_inv_bloodbag > 0)']);
	};
};

//SeatBelts
CL_actions pushBack (player addAction["<t color = '#D660D6'>Put on Seatbelt</t>",CL_fnc_seatbelt,"",7,false,false,"",' !CL_seatbelt && vehicle player != player ']);
CL_actions pushBack (player addAction["<t color = '#D660D6'>Remove Seatbelt</t>",CL_fnc_seatbelt,"",7,false,false,"",' CL_seatbelt && vehicle player != player ']);
