/* 
	File: fn_ncFlashOn.sqf
	Author: Wilco, Ciaran (Fixing it)
	Date: Unknown
	Desc: starts the strobing.
*/
private _vehicle = _this select 0;
private _pos = _this select 1;
if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "ncstrobe")) exitWith {};

//waitUntil {player distance _pos < 500; uiSleep 10;};

uiSleep 0.5;
_flash = "#lightpoint" createVehicleLocal (getPos _pos);
_flash setLightAttenuation [0.181, 0, 1000, 130];
_flash setLightIntensity 10;
_flash setLightFlareSize 0.38;
_flash setLightFlareMaxDistance 150;
_flash setLightUseFlare true;
_flash setLightDayLight true;
_flash setLightAmbient [0.1,0.1,1];
_flash lightAttachObject [perrys_stage,[0,0,2.5]];

uiSleep 0.5;
_flashR = "#lightpoint" createVehicleLocal (getPos _pos);
_flashR setLightAttenuation [0.181, 0, 1000, 130];
_flashR setLightIntensity 10;
_flashR setLightFlareSize 0.38;
_flashR setLightFlareMaxDistance 150;
_flashR setLightUseFlare true;
_flashR setLightDayLight true;
_flashR setLightAmbient [0.1,0.1,1];
_flashR lightAttachObject [perrys_stage,[-3,0,2.5]];

uiSleep 0.5;
_flashL = "#lightpoint" createVehicleLocal (getPos _pos);
_flashL setLightAttenuation [0.181, 0, 1000, 130];
_flashL setLightIntensity 10;
_flashL setLightFlareSize 0.38;
_flashL setLightFlareMaxDistance 150;
_flashL setLightUseFlare true;
_flashL setLightDayLight true;
_flashL setLightAmbient [0.1,0.1,1];
_flashL lightAttachObject [perrys_stage,[3,0,2.5]];
_flashL setLightFlareSize 5;

while {true} do {
	if (!(_vehicle getVariable "ncstrobe")) exitWith {};
	uiSleep 0.09;
	_flash setLightBrightness 2;
	_flash setLightColor[255,255,255];
	_flashR setLightBrightness 2;
	_flashR setLightColor[255,255,255];
	_flashL setLightBrightness 2;
	_flashL setLightColor[255,255,255];

	uiSleep 0.1;
	_flash setLightBrightness 0;
	_flashR setLightBrightness 0;
	_flashL setLightBrightness 0;
};
deleteVehicle _flash;
deleteVehicle _flashR;
deleteVehicle _flashL;