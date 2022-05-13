#include "..\..\script_macros.hpp"
/*
	File: fn_fedCamDisplay.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
private _laptop = _this select 0;
private _mode = _this select 3;

if (!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if (isNil "CL_fed_scam") then {
	CL_fed_scam = "camera" camCreate [0,0,0];
	CL_fed_scam camSetFov 0.5;
	CL_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	CL_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		CL_fed_scam camSetPos [16029.1,16938.9,3.08817];
		CL_fed_scam camSetTarget [16034.9,16930.6,0.00146008];
		CL_fed_scam camCommit 0;
	};

	case "vault": {
		CL_fed_scam camSetPos [16031.1,16936.6,10.287];
		CL_fed_scam camSetTarget [16017.1,16957.3,0.597221];
		CL_fed_scam camCommit 0;
	};

	case "front": {
		CL_fed_scam camSetPos [16084.3,16997.8,23.6492] ;
		CL_fed_scam camSetTarget [16037.8,16966.7,0.00145817];
		CL_fed_scam camCommit 0;
	};

	case "back": {
		CL_fed_scam camSetPos [16002,16904.9,5.71753];
		CL_fed_scam camSetTarget [15998.7,16939.7,0.00146866];
		CL_fed_scam camCommit 0;
	};

	case "off" :{
		CL_fed_scam cameraEffect ["terminate", "back"];
		camDestroy CL_fed_scam;
		_laptop setObjectTexture [0,""];
		CL_fed_scam = nil;
	};
};
