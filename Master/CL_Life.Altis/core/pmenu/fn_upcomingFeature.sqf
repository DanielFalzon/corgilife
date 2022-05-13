disableSerialization;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<br /><br /><t align='center' size='3' shadow='0'>You've clicked on an upcoming feature!</t><br /><br />";
_message = _message + "These features will be implemented soon. Stay tuned!<br /><br />";
//_message = _message + "You can expect a talent/proficiency system, president/governor system, and market system.<br />";
//_message = _message + "Debit cards will make an appearance soon as well. Even a hitman/bounties system!<br /><br />";
_message = _message + "Happy gaming! - Dark";

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
