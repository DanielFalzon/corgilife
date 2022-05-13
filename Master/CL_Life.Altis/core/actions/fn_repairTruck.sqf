#include "..\..\script_macros.hpp"
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private _veh = cursorObject;

CL_interrupted = false;
if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
	if (!(_veh getVariable ["nano_empd", false])) then {
		if (CL_inv_toolkit > 0) then {
			CL_action_inUse = true;
			private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
			private _upp = format[localize "STR_NOTF_Repairing",_displayName];

			//Setup our progress bar.
			disableSerialization;
			"progressBar" cutRsc ["CL_progress","PLAIN"];
			private _ui = uiNamespace getVariable "CL_progress";
			private _progress = _ui displayCtrl 38201;
			private _pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
			_progress progressSetPosition 0.01;
			private _cP = 0.01;

			for "_i" from 0 to 1 step 0 do {
				if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["CL_fnc_animSync",RCLIENT];
					player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				};

				uiSleep 0.27;
				_cP = _cP + 0.01;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
				if (_cP >= 1) exitWith {};
				if (!alive player) exitWith {};
				if !(isNull objectParent player) exitWith {};
				if (CL_istazed) exitWith {}; //Tazed
				if (CL_isknocked) exitWith {}; //Knocked
				if (CL_interrupted) exitWith {};
				if (CL_isdowned) exitWith {}; //Rubbered
			};

			CL_action_inUse = false;
			"progressBar" cutText ["","PLAIN"];
			player playActionNow "stop";

			if (!alive player || CL_istazed || CL_isknocked || CL_isdowned) exitWith {CL_action_inUse = false;};
			if (player getVariable ["restrained",false]) exitWith {CL_action_inUse = false;};
			if (CL_interrupted) exitWith {CL_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; CL_action_inUse = false;};
			if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

			private _sideRepairArray = CL_Settings(getArray,"vehicle_infiniteRepair");

			//Check if playerSide has infinite repair enabled
			if (playerSide isEqualTo civilian && (_sideRepairArray select 0) isEqualTo 0) then {
				[false,"toolkit",1] call CL_fnc_handleInv;
			};
			if (playerSide isEqualTo west && (_sideRepairArray select 1) isEqualTo 0) then {
				[false,"toolkit",1] call CL_fnc_handleInv;
			};
			if (playerSide isEqualTo independent && (_sideRepairArray select 2) isEqualTo 0) then {
				[false,"toolkit",1] call CL_fnc_handleInv;
			};
			if (playerSide isEqualTo east && (_sideRepairArray select 3) isEqualTo 0) then {
				[false,"toolkit",1] call CL_fnc_handleInv;
			};
			["VehicleRepaired"] spawn mav_ttm_fnc_addExp;
			_veh setDamage 0;
			titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		};
	} else {
		titleText["You can't find anything wrong with your vehicle. It's as if all the electronics aren't working.","PLAIN"];
	};
};
