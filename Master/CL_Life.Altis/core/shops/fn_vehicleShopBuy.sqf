#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/

params [["_mode",true,[true]]];

if ((lbCurSel 2302) isEqualTo -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};

private "_buyMultiplier";
private "_rentMultiplier";

switch (playerSide) do {
	case civilian: {
		_buyMultiplier = CL_Settings(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
		_rentMultiplier = CL_Settings(getNumber,"vehicle_rental_multiplier_CIVILIAN");
	};
	case west: {
		_buyMultiplier = CL_Settings(getNumber,"vehicle_purchase_multiplier_COP");
		_rentMultiplier = CL_Settings(getNumber,"vehicle_rental_multiplier_COP");
	};
	case independent: {
		_buyMultiplier = CL_Settings(getNumber,"vehicle_purchase_multiplier_MEDIC");
		_rentMultiplier = CL_Settings(getNumber,"vehicle_rental_multiplier_MEDIC");
	};
	case east: {
		_buyMultiplier = CL_Settings(getNumber,"vehicle_purchase_multiplier_OPFOR");
		_rentMultiplier = CL_Settings(getNumber,"vehicle_rental_multiplier_OPFOR");
	};
};

private _className = lbData[2302,(lbCurSel 2302)];
private _initalPrice = M_CONFIG(getNumber,"CLCfgVehicles",_className,"price");
private "_purchasePrice";

if (_mode) then {
	_purchasePrice = round(_initalPrice * _buyMultiplier);
} else {
	_purchasePrice = round(_initalPrice * _rentMultiplier);
};

private _conditions = M_CONFIG(getText,"CLCfgVehicles",_className,"conditions");

if !([_conditions] call CL_fnc_levelCheck) exitWith {hint localize "STR_Shop_Veh_NoLicense";};

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (CL_cmoola < _purchasePrice) exitWith {hint format [localize "STR_Shop_Veh_NotEnough",[_purchasePrice - CL_cmoola] call CL_fnc_numberText];closeDialog 0;};

private _spawnPoints = CL_veh_shop select 1;
private _spawnPoint = "";

if ((CL_veh_shop select 0) == "ems_air") then {
	if (nearestObjects[(getMarkerPos _spawnPoints),["Air"],35] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if (_spawnPoints isEqualType []) then {
		//Find an available spawn point.
		{
			if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};
			true
		} count _spawnPoints;
	} else {
		if (nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
	};
};


if (_spawnPoint isEqualTo "") exitWith {hint localize "STR_Shop_Veh_Block"; closeDialog 0;};
CL_cmoola = CL_cmoola - _purchasePrice;
[0] call SOCK_fnc_updatePartial;
hint format [localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call CL_fnc_numberText];

//Spawn the vehicle and prep it.

private "_vehicle";

if ((CL_veh_shop select 0) == "ems_air") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	uiSleep 0.6;
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle setPos (getMarkerPos _spawnPoint);
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
};

_vehicle lock 2;

private _colorIndex = lbValue[2304,(lbCurSel 2304)];

[_vehicle,_colorIndex] call CL_fnc_colorVehicle;
[_vehicle] call CL_fnc_clearVehicleAmmo;
[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];

_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//Side Specific actions.
switch (playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn CL_fnc_vehicleAnimate;
	};
	case civilian: {
		if ((CL_veh_shop select 2) isEqualTo "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn CL_fnc_vehicleAnimate;
		};
	};
	case independent: {
		[_vehicle,"med_offroad",true] spawn CL_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

CL_vehicles pushBack _vehicle;

//Always handle key management by the server
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

if (_mode) then {
	if !(_className in CL_Settings(getArray,"vehicleShop_rentalOnly")) then {
		if (CL_HC_isActive) then {
			[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["HC_fnc_vehicleCreate",HC_CL];
		} else {
			[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
		};
	};
};

[format [localize "STR_DL_AL_boughtVehicle",profileName,(getPlayerUID player),_className,[_purchasePrice] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText],"VehicleLog"] remoteExecCall ["A3Log",2];
[format [localize "STR_DL_AL_boughtVehicle",profileName,(getPlayerUID player),_className,[_purchasePrice] call CL_fnc_numberText,[CL_cmoola] call CL_fnc_numberText,[CL_bmoola] call CL_fnc_numberText],"MoneyLog"] remoteExecCall ["A3Log",2];

["VehiclePurchased"] spawn mav_ttm_fnc_addExp;

[0] call SOCK_fnc_updatePartial;
[1] call SOCK_fnc_updatePartial;

closeDialog 0; //Exit the menu.
true;
