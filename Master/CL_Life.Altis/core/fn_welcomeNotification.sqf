/*
	File: fn_welcomeNotification.sqf
	Author:
	Edited: Dark
	Description:
	Called upon first spawn selection and welcomes our player.
*/
disableUserInput true;
endLoadingScreen;
_fadeIn = [] spawn BIS_fnc_VRFadeIn;
waitUntil {scriptDone _fadeIn};

_introCam = "camera" camCreate (player modelToWorldVisual [-5,0,1250]);
_introCam cameraEffect ["internal","back"];
_introCam camSetFov 2.000;
_introCam camSetTarget vehicle player;
_introCam camSetRelPos [0,-1,1250];
_introCam camCommit 0;
waitUntil {camCommitted _introCam};

_introCam camSetFov 2;
_introCam camSetRelPos [0,-5,1.85];
_introCam camCommit 2;
8 cutFadeOut 3;
waitUntil {camCommitted _introCam};

_introCam camSetFov 1;
_introCam camSetRelPos [0,-1,1.85];
_introCam camCommit 3;
waitUntil {camCommitted _introCam};
_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;

disableUserInput false;
//player allowDamage true;

[] spawn {
	_onScreenTime = 4.1;
	_role1 = "Good day to you!";
	_role1names = ["Welcome to", "CorgiLife.co.uk"];
	_role2 = "Join us on Teamspeak!";
	_role2names = ["ts.CorgiLife.co.uk"];
	_role3 = "We are excited that you are here!";
	_role3names = ["ArmA 3 Life","Server and Community", "CorgiLife.co.uk"];
	_role4 = "Built from the ArmA 3 Life mod";
	_role4names = ["by Dark and Dan"];
	_role5 = "Support us";
	_role5names = ["Please support us by donating on CorgiLife.co.uk"];
	_role6 = "Enjoy your stay!";
	_role6names = ["Have fun and follow the rules<br/>posted on our website<br/>"];
	_role7 = "Special thanks to";
	_role7names = ["All you guys that join us daily!<br/>Thank you!"];

	{
		uiSleep 2;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.40' color='#F09F2E' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.5);
		[
			_finalText,
			[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
			[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
			_onScreenTime,
			0.5
		] spawn BIS_fnc_dynamicText;
		uiSleep (_onScreenTime);
	} forEach [
	//The list below should have exactly the same amount of roles as the list above
		[_role1, _role1names],
		[_role2, _role2names],
		[_role3, _role3names],
		[_role4, _role4names],
		[_role5, _role5names],
		[_role6, _role6names],
		[_role7, _role7names]
	];
};
