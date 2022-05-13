#include "..\..\script_macros.hpp"
/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/
if (!isNil "CL_action_spikeStripPickup") exitWith {hint localize "STR_ISTR_SpikesDeployment"};	// avoid conflicts with addactions allowing duplication.
private _spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable ["item","spikeDeployed",true];

CL_action_spikeStripDeploy = player addAction [localize "STR_ISTR_Spike_Place",{if (!isNull CL_spikestrip) then {detach CL_spikestrip; CL_spikestrip = objNull;};player removeAction CL_action_spikeStripDeploy; CL_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull CL_spikestrip'];
CL_spikestrip = _spikeStrip;
waitUntil {isNull CL_spikestrip};

if (!isNil "CL_action_spikeStripDeploy") then {player removeAction CL_action_spikeStripDeploy;};
if (isNull _spikeStrip) exitWith {CL_spikestrip = objNull;};

_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;

CL_action_spikeStripPickup = player addAction [localize "STR_ISTR_Spike_Pack",CL_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];

if (CL_HC_isActive) then {
	[_spikeStrip] remoteExec ["HC_fnc_spikeStrip",HC_CL]; //Send it to the HeadlessClient for monitoring.
} else {
	[_spikeStrip] remoteExec ["TON_fnc_spikeStrip",RSERV]; //Send it to the server for monitoring.
};
