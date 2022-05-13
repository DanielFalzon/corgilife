/*
	File: fn_setupInfoStand.sqf
*/

params [
  ["_object", objNull, [objNull]],
  ["_title", "Info Stand", [""]],
  ["_subtitle", "", [""]]
];

if (isNull _object) exitWith {};
/*
//--- Name tag
_object setVariable ["nameTag_icon", "NPC"];
_object setVariable ["nameTag_title", _title];
if (_subtitle != "") then {
  _object setVariable ["nameTag_subtitle", _subtitle];
};
*/
//--- Texture
_object setObjectTexture [0, "textures\screen.jpg"];
