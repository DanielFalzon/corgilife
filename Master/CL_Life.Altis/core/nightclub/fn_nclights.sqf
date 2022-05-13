/* 
	File: fn_nclights.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Enables/Disables the nightclub lights, then sends it to all clients.
*/
private _obj = nc_light;
if (_this select 3 == "MM") then {
	_obj = nearestObject [position player, "Land_i_Shed_Ind_F"];
};
private _trueorfalse = nc_light getVariable ["nclights",false];

if (_trueorfalse) then {
	_obj setVariable ["nclights",false,true];
	hint "Turning off lights. This may take a second.";
} else {
	_obj setVariable ["nclights",true,true];
	[_obj,0.22] remoteExecCall ["CL_fnc_ncLightsOn",0];
};
