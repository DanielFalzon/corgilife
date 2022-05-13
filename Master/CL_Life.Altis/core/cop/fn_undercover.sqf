/*
	File: fn_undercover.sqf
	Author: Paul "Jerico" Smith
	Developed For: Amarok Gaming (www.AmarokGaming.co.uk)

	Description:
	Make Cop go undercover hiding his identity
*/
if (player getVariable ["Undercover", false]) then {
	// Player is already undercover. Remove Cover
	player setVariable ["Undercover",false,true];
	player setVariable ["realname",profilename,true];

	"progressBar" cutText ["","PLAIN"];
	titleText [ "You are no longer undercover","PLAIN"];
} else {
	// Player is not undercover. Go undercover
	player setVariable ["Undercover",true,true];
	player setVariable ["realname",[] call CL_fnc_RandomNameGenerator,true];

	"progressBar" cutText ["","PLAIN"];
	titleText["You have gone undercover","PLAIN"];
};
