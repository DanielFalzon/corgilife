#include "..\..\script_macros.hpp"
/*
	File: fn_airDrop.sqf
	Author:
	Edited: Dark (To work with 4.xx)
	Description: Calls in Airdrop
*/
if (!(playerSide isEqualTo civilian)) exitWith {hint "You are not a civilian.";};
if (civilian countSide playableUnits < (CL_Settings(getNumber,"min_civs_airDrop"))) exitWith {hint format [localize "STR_Civ_NotEnoughCivs",(CL_Settings(getNumber,"min_civs_airDrop"))];};

disableSerialization;
_question = [parseText format ["Airdrop info at <t color='#c45454'><a href='https://www.CorgiLife.co.uk/'>Corgi Life</a><br /></t>You have %1 Airdrops Remaining. Are you certain you want to call in an Airdrop?",CL_airDrops], "Air Drop", (localize "STR_Global_Yes"), (localize "STR_Global_No")] call BIS_fnc_guiMessage;
if (CL_airDrops < 1) exitWith {hint "You have 0 Airdrops left. See our website for more details.";};
if ("Airdropmarker" in allmapMarkers) exitWith { hint "Wait for the previous air drop to finish! Greedy bugger!";};
if (_question) then {
    CL_airDrops = CL_airDrops - 1;
	[player] remoteExec ["TON_fnc_generateAirdrop",2];
	[8] call SOCK_fnc_updatePartial;
} else {
	hint "Airdrop Cancelled";
};

uiSleep 2.0;
