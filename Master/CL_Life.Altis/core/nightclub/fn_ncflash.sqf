/* 
	File: fn_ncflash.sqf
	Author: Rewrote by Ciaran to work properly.
	Date: Unknown
	Desc: main file for the strobe..
*/

_trueorfalse = nc_light getVariable ["ncstrobe",false];

if (_trueorfalse) then {
	hint "Turning off strobe. This may take a second.";
	nc_light setVariable ["ncstrobe",false,true];
} else {
	nc_light setVariable ["ncstrobe",true,true];
	[nc_light,perrys_stage] remoteExec ["CL_fnc_ncFlashOn",0];
};
