/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/
private ["_dest","_poses","_inArr","_marker","_markerText","_mygroup1","_mygroup2","_mygroup3","_failSafeTimer","_containerdummy","_container","_para","_smoke","_flare","_light","_var","_pos_container","_box","_bmb","_message","_message5","_message4","_message3","_message2","_message1","_messageD","_message5D","_message1D","_message10D","_messageE"];

//_posPlayer = [_this,0,[],[[]]] call BIS_fnc_param;

params [
	["_unit",objNull,[objNull]]
];

if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};
if (isNull _unit) exitWith {};

//_posPlayer = position _unit;
//_dest = _posPlayer;
//_msg = format["Air-drop called in by %1 at %2", name _unit, _posPlayer];
//"debug_console" callExtension (_msg + "~0001");

airdrop_goingon = true;

uiSleep 1;

// AIRDROP STARTEN
_message = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>A helicopter is going to drop a Supplycrate in 10 minutes! The drop-location will be transmitted soon!";
[1,format["%1",_message]] remoteExec ["CL_fnc_broadcast",0];

_poses = count airdrop_positions;
_inArr = floor(random _poses);
_dest = airdrop_positions select _inArr;

_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [250,250];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "Airdrop LZ";
"Airdropmarkertext" setMarkerType "mil_end";

"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

uiSleep 300;

"Airdropmarker" setMarkerAlpha 1;
"Airdropmarkertext" setMarkerAlpha 1;

_message5 = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>5 minutes until the helicopter will drop the supplies! Check your map for the drop-location!";
[1,format["%1",_message5]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 60;

_message4 = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>4 minutes until the helicopter will drop the supplies! Check your map for the drop-location!";
[1,format["%1",_message4]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 60;

_message3 = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>3 minutes until the helicopter will drop the supplies! Check your map for the drop-location!";
[1,format["%1",_message3]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 60;

_message2 = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>2 minutes until the helicopter will drop the supplies! Check your map for the drop-location!";
[1,format["%1",_message2]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 60;

_message1 = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>1 minute until the helicopter will drop the supplies! Stand back, it's going to explode upon touching the ground!";
[1,format["%1",_message1]] remoteExec ["CL_fnc_broadcast",0];

heli1 = CreateVehicle [airdrop_helicopter_main, [7950, 9667, 0], [], 0, "FLY"];
heli2 = CreateVehicle [airdrop_helicopter_scnd, [7950, 9700, 0], [], 0, "FLY"];
heli3 = CreateVehicle [airdrop_helicopter_scnd, [7950, 9630, 0], [], 0, "FLY"];

heli1 allowDamage false;
heli2 allowDamage false;
heli3 allowDamage false;

_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup2 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup3 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x moveInDriver heli1} forEach units _mygroup1;
{_x moveInDriver heli2} forEach units _mygroup2;
{_x moveInDriver heli3} forEach units _mygroup3;

_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[2380.47,22267.8,0], 0];
_mygroup2 addWaypoint [_dest, 0];
_mygroup2 addWaypoint [[2380.47,22267.8,0], 0];
_mygroup3 addWaypoint [_dest, 0];
_mygroup3 addWaypoint [[2380.47,22267.8,0], 0];

_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];
"airbox_marker" setMarkerColor "ColorBlue";
"airbox_marker" setMarkerText " Airdrop Box";
"airbox_marker" setMarkerType "mil_destroy";

_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_containerdummy attachTo [heli1,[0,0,-3.5]];
_containerdummy setDir 90;

_failSafeTimer = serverTime + 300;
while { _dest distance heli1 > 250 } do {
		"airbox_marker" setMarkerPos getPos heli1; uiSleep 1.0;
		if (_failSafeTimer - serverTime <= 0) exitWith {};
};

_messageD = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>The supplies have been dropped! 20 minutes until self destruction!";
[1,format["%1",_messageD]] remoteExec ["CL_fnc_broadcast",0];

// Drop the container

deleteVehicle _containerdummy;
uiSleep 0.1;
_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
uiSleep 0.1;
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos _container;uiSleep 1;};
detach _container;
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2)+0.5];
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
uiSleep 6;
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deleteVehicle _container;
uiSleep 0.5;
_box = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"];
_box allowDamage false;_box enableRopeAttach false;
_smoke="SmokeShellGreen" createVehicle [getpos _box select 0,getpos _box select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];

"airbox_marker" setMarkerPos getPos _box;

// Fill box

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;

uiSleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_F", 1];};
uiSleep 0.1;
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];};
uiSleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MXC_F", 1];};
uiSleep 0.1;
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 10];};
uiSleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_Katiba_F", 1];};
uiSleep 0.1;
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_green", 10];};
uiSleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_Pistol_heavy_01_F", 1];};
uiSleep 0.1;
if (_var==1) then {_box addMagazineCargoGlobal ["11Rnd_45ACP_Mag", 10];};
uiSleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addItemCargoGlobal ["optic_Hamr", 1];};
uiSleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addItemCargoGlobal ["optic_Aco", 1];};
uiSleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addItemCargoGlobal ["optic_Arco", 1];};
uiSleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addItemCargoGlobal ["optic_MRCO", 1];};
uiSleep 0.1;
_var=floor(random 4);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_H", 1];};
uiSleep 0.1;
_var=floor(random 4);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_L", 1];};
uiSleep 0.1;
_var=floor(random 4);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_M", 1];};
uiSleep 0.1;
_var=floor(random 4);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_acp", 1];};
uiSleep 0.1;

// Fill box end

uiSleep 300;

deleteVehicle heli1;
deleteVehicle heli2;
deleteVehicle heli3;

uiSleep 600;

_message5D = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>5 minutes until self destruction";
[1,format["%1",_message5D]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 240;

_message1D = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>1 minute until self destruction";
[1,format["%1",_message1D]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 50;

_message10D = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>10 seconds until self destruction. STAND BACK!";
[1,format["%1",_message10D]] remoteExec ["CL_fnc_broadcast",0];

uiSleep 10;

_messageE = "<t color='#ffffff' size='1.7'>Player</t><t color='#c45454' size='1.7'>Airdrop</t><br/><br/><img shadow='false' size='6'/><br/><br/>The Airdrop has ended!";
[1,format["%1",_messageE]] remoteExec ["CL_fnc_broadcast",0];

deleteVehicle _box;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-21,(getPos _box select 1)+21,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-1,(getPos _box select 1)+56,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+23,(getPos _box select 1)-75,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-50,(getPos _box select 1)+1,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+87,(getPos _box select 1)-22,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+0,(getPos _box select 1)-0,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+20,(getPos _box select 1)-20,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-100,(getPos _box select 1)+56,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-55,(getPos _box select 1)+123,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+577,(getPos _box select 1)-83,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+35,(getPos _box select 1)-99,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+100,(getPos _box select 1)-100,0];
uiSleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-431,(getPos _box select 1)-431,0];

"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

deleteMarker "airbox_marker";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";

airdrop_goingon = false;
