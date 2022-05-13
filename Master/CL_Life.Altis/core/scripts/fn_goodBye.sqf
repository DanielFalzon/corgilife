/*
	File: fn_goodBye.sqf
	Author:
	Edited: Dark
	Description: Exit sync script
*/
[] call SOCK_fnc_updateRequest;

disableSerialization;
disableUserInput true;
player allowDamage false;
showChat false;
hintSilent "";

CL_Settings_tagson = false;
[CL_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;

cutText [ "", "BLACK", 1 ];
uiSleep 1;

_ui = uiNamespace getVariable ["CL_HUD_nameTags",displayNull];

_effectID = 1 + floor random 3;
_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
_video = [ _videoFile ] spawn BIS_fnc_playVideo;
playSound ( "Transition" + str _effectID );
uiSleep 1;
0 = [ format [ "<br/><t color='%4'>%3</t><br/><br/><t size='0.7'>%1 %2.</t>", "We hope to see you again soon", profileName, "SYNCING DATA WITH THE SERVER" ], 0, 0.2, 2, 0.5, 0, 1000 ] spawn BIS_fnc_dynamicText;

if (!CL_is_arrested) then {
	player setPos (getMarkerPos "respawn_civilian");
};

[player] remoteExec ["TON_fnc_cleanupRequest",2];

uiSleep 4;

disableUserInput false;
player allowDamage true;

["GoodBye",true,false] call BIS_fnc_endMission;
