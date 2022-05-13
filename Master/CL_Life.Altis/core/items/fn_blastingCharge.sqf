#include "..\..\script_macros.hpp"
/*
	File: fn_blastingCharge.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
params [
	["_vault",objNull,[objNull]]
];

if (isNull _vault) exitWith {}; //Bad object
//if (fed_robbed) exitWith {hint "The Federal Reserve can only be robbed once per restart.";};
if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly";};
if (_vault getVariable ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced";};
if (_vault getVariable ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen";};
if (west countSide playableUnits < (CL_Settings(getNumber,"minimum_cops"))) exitWith {hint format [localize "STR_Civ_NotEnoughCops",(CL_Settings(getNumber,"minimum_cops"))];};
if ((nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) getVariable ["locked",true]) exitWith {hint localize "STR_ISTR_Blast_Exploit";};
if (!([false,"blastingcharge",1] call CL_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable ["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["CL_fnc_broadcast",west];
hint localize "STR_ISTR_Blast_KeepOff";
//fed_robbed = true;
//publicVariable "fed_robbed";

[] remoteExec ["CL_fnc_demoChargeTimer",[west,player]];
[] remoteExec ["TON_fnc_handleBlastingCharge",2];
