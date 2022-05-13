/* 
	File: fn_ncstage.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Stage lighting.
*/
private _unit = _this select 0;

if (isNil "_unit" || isNull _unit || !(_unit getVariable "stage")) exitWith {};


if (ncstagelights) exitWith {
	hint "Stage Lights Are Now Off!";
	deleteVehicle  stagelight;
	uiSleep 1;
	hint "";
	ncstagelights = false;
	uiSleep 0.02;
};
_pos = ligh;


ncstagelights = true;
uiSleep 1;
if (!(_vehicle getVariable "stage")) exitWith {};
if (ncstagelights) then {
"stagelight" remoteExec [FALSE,0];
	stagelight = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	
	this setPos [getPos this select 0, getPos this select 1, 0.40];

	stagelight setLightBrightness 0.05;
	//COLOR #FFFFFF	
	stagelight setLightColor [255,255,255];
	hint "Stage Lights Are Now On!";
	uiSleep 3;
	hint "";	
};
