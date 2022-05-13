#include "..\as_script_macros.hpp"
#include "..\..\..\script_macros.hpp"
/*
    File: fn_autoSaveInv.sqf
    Author: Leon "DerL30N" Beeser"
	Edited: Dark (Translated & Tweaks)
    Description:
    Used for player automatic sync to the server.
*/
if (!isServer) then {

	while {true} do {
	
		if (AS_SETTINGS(getNumber,"lockManualSync") isEqualTo 1) then 
		{
			uiSleep ((AS_SETTINGS(getNumber,"autoSaveInterval") - AS_SETTINGS(getNumber,"lockManualSync")) * 60);
		} else {
			uiSleep ((AS_SETTINGS(getNumber,"autoSaveInterval")) * 60);
		};
		
		if (AS_SETTINGS(getNumber,"waitForManSave") isEqualTo 1) then 
		{
			if (isNil "CL_session_time") then { CL_session_time = false; };
			waitUntil { (!CL_session_time) };
		};
		
		if (alive player) then
		{
			[false] call SOCK_fnc_updateRequest;
		
			if (AS_SETTINGS(getNumber,"chatInfo") isEqualTo 1) then 
			{
				if (AS_SETTINGS(getNumber,"advancedChatInfo") isEqualTo 1) then 
				{
					if (AS_SETTINGS(getNumber,"lockManualSync") isEqualTo 1) then 
					{
						systemChat format["Your data has been synced to the server automatically. Manual sync has been disabled for %1min.", (AS_SETTINGS(getNumber,"lockManualSync"))];
					};
				} else {
					systemChat "Your data has been synced to the server automatically.";
				};
			};

			if (AS_SETTINGS(getNumber,"lockManualSync") isEqualTo 1) then 
			{
				CL_session_time = true;
				uiSleep ((AS_SETTINGS(getNumber,"lockSyncTime")) * 60);
				CL_session_time = false;
			};
		};
	};
};
