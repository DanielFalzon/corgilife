/*
	File: fn_setupEVH.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master eventhandler file
*/
player addEventHandler ["Killed", {_this call CL_fnc_onPlayerKilled}];
player addEventHandler ["handleDamage", {_this call CL_fnc_handleDamage}];
player addEventHandler ["Respawn", {_this call CL_fnc_onPlayerRespawn}];
player addEventHandler ["Take", {_this call CL_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler ["Fired", {_this call CL_fnc_onFired}];
if (playerSide isEqualTo civilian) then {player addEventHandler ["Fired",{_this call CL_fnc_safeZones}];};
player addEventHandler ["InventoryClosed", {_this call CL_fnc_inventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call CL_fnc_inventoryOpened}];
player addEventHandler ["HandleRating", {0}];
"CL_capture_list" addPublicVariableEventHandler { if (CL_capture_zone > 0) then { [] call CL_fnc_captureCartelUpdate; }; };
