/*
	File: fn_usefullinks.sqf
	Author:

	Description:
	Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
		"",
		0,
		0.2,
		10,
		0,
		0,
		8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\inlogo.paa' /></t><br /><br />";
_message = _message + "*** Welcome to Corgi Life! ***<br /><br />";
_message = _message + " <a href='https://www.CorgiLife.co.uk/' color='#0000FF'>Corgi Life Website<br /><br />";
//_message = _message + " <a href='https://www.infinitenetwork.xyz/topic/54-arma-3-sync/' color='#0000FF'>Corgi Life Mods<br /><br />";
_message = _message + " <a href='https://www.CorgiLife.co.uk/rules/' color='#0000FF'>Corgi Life Rules<br /><br />";
_message = _message + " <a href='https://www.CorgiLife.co.uk/donate/' color='#0000FF'>Corgi Life Donations<br /><br />";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
