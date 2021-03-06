/*
	File: fn_bloodEffect.sqf
	Author: Vladimir Hynek
	Edited By: Ciaran Langton

	Description:
	Blood splash (texture) postprocess.

	Parameter(s):
	_this select 0: Number - Bleeding time in seconds, could be <5;90>

	Returned value:
	None.
*/
CL_oldBleedRemaining = _this select 0;

CL_bloodActionPlaying = true;
[]spawn {
	disableSerialization;

	if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
	if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_blood"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
	private _display = uinamespace getvariable "RscHealthTextures";

	private _texLower = _display displayctrl 1211;
	_texLower ctrlsetfade 1;
	_texLower ctrlcommit 0;
	
	private _texMiddle = _display displayctrl 1212;
	_texMiddle ctrlsetfade 1;	
	_texMiddle ctrlcommit 0;
	
	private _texUpper = _display displayctrl 1213;
	_texUpper ctrlsetfade 1;	
	_texUpper ctrlcommit 0;
	
	private _x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2);
	private _y = (-0.0625 * safezoneH) + safezoneY;
	private _w = 2.125 * safezoneW * 3/4;
	private _h = 1.125 * safezoneH;
	
	_texLower ctrlsetposition [_x, _y, _w, _h];
	_texMiddle ctrlsetposition [_x, _y, _w, _h];
	_texUpper ctrlsetposition [_x, _y, _w, _h];
	
	_texLower ctrlcommit 0;
	_texMiddle ctrlcommit 0;
	_texUpper ctrlcommit 0;
	
	//lower
	if ((CL_oldBleedRemaining > 5) && (CL_oldBleedRemaining < 25)) then {
		_texLower ctrlsetfade 0.2;	 //0 --changed
		_texLower ctrlcommit 0.2;
		waituntil {ctrlcommitted _texLower};
		
		//fade-out
		uiSleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texLower ctrlcommit 0.8;
	};
	
	//lower, 50% middle
	if ((CL_oldBleedRemaining >= 25) && (CL_oldBleedRemaining < 40)) then {
		_texLower ctrlsetfade 0.2;	 //0 --changed
		_texMiddle ctrlsetfade 0.85;  //0 --changed
		
		_texLower ctrlcommit 0.2;
		_texMiddle ctrlcommit 0.2;
		waituntil {ctrlcommitted _texMiddle};
		
		//fade-out
		uiSleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;

		_texMiddle ctrlcommit 0.5;
		uiSleep 0.5;
		_texLower ctrlcommit 0.4;
	};
	
	//lower, middle
	if ((CL_oldBleedRemaining >= 40) && (CL_oldBleedRemaining < 55)) then {
		_texLower ctrlsetfade 0.2;	 //0 --changed
		_texMiddle ctrlsetfade 0.7;  //0 --changed
		
		_texLower ctrlcommit 0.2;
		_texMiddle ctrlcommit 0.2;
		waituntil {ctrlcommitted _texMiddle};
		
		//fade-out
		uiSleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;
		_texUpper ctrlsetfade 1;

		_texMiddle ctrlcommit 0.5;
		uiSleep 0.5;
		_texLower ctrlcommit 0.4;
	};
	
	//lower, middle, 50% upper
	if ((CL_oldBleedRemaining >= 55) && (CL_oldBleedRemaining < 70)) then {
		_texLower ctrlsetfade 0.2;	 //0 --changed
		_texMiddle ctrlsetfade 0.7;  //0 --changed
		_texUpper ctrlsetfade 0.85;  //0.5 --changed
		
		_texLower ctrlcommit 0.2;
		_texMiddle ctrlcommit 0.2;
		_texUpper ctrlcommit 0.2;
		waituntil {ctrlcommitted _texUpper};
		
		//fade-out
		uiSleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;
		_texUpper ctrlsetfade 1;

		_texUpper ctrlcommit 0.75;
		uiSleep 1;
		_texMiddle ctrlcommit 0.5;
		uiSleep 0.5;
		_texLower ctrlcommit 0.4;
	};
	
	//lower, middle, upper
	if (CL_oldBleedRemaining >= 70) then {
		_texLower ctrlsetfade 0.2;	 //0 --changed
		_texMiddle ctrlsetfade 0.7;  //0 --changed
		_texUpper ctrlsetfade 0.7;   //0 --changed
		
		_texLower ctrlcommit 0.2;
		_texMiddle ctrlcommit 0.2;
		_texUpper ctrlcommit 0.2;
		waituntil {ctrlcommitted _texUpper};
		
		//fade-out
		uiSleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;
		_texUpper ctrlsetfade 1;

		_texUpper ctrlcommit 0.75;
		uiSleep 1;
		_texMiddle ctrlcommit 0.5;
		uiSleep 0.5;
		_texLower ctrlcommit 0.4;
	};    
	waitUntil {(ctrlCommitted _texUpper && ctrlCommitted _texMiddle && ctrlCommitted _texLower)}; //Wait for the effects to be done!
	CL_bloodActionPlaying = false;
};