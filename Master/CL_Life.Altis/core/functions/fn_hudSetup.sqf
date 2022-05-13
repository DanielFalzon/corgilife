#include "..\..\script_macros.hpp"
/*
    File: fn_hudSetup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Setups the hud for the player?
*/
disableSerialization;

"playerHUD" cutRsc ["playerHUD","PLAIN"];
[] call CL_fnc_hudUpdate;

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        private _dam = damage player;
        waitUntil {!((damage player) isEqualTo _dam)};
        [] call CL_fnc_hudUpdate;
    };
};
