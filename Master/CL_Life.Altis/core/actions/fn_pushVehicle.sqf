/*
	Does it matter? Needs to be replaced.
	Built for Feint's Push functionality
*/
private _target = cursorObject;
private _caller = player;
private _posCaller = getPos _caller;
private _dir = getDir _caller;

if (isNull _target) exitWith {};
if (_caller distance _target > 5) exitWith {};

if (local _target) then {
	[_caller,_target,_posCaller,_dir] spawn CL_fnc_pushFunction;
} else {
	[_caller,_target,_posCaller,_dir] remoteExec ["CL_fnc_pushFunction",_target];
};
