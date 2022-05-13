/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Packs up a deployed spike strip.
*/
private _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if (isNil "_spikes") exitWith {};

if ([true,"spikeStrip",1] call CL_fnc_handleInv) then {
	titleText[localize "STR_NOTF_SpikeStrip","PLAIN"];
	player removeAction CL_action_spikeStripPickup;
	CL_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
};