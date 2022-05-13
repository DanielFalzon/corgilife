#include "..\..\script_macros.hpp"
/*
	Author: hallyg
	Edited: Dark
	Description: EMP Grenade
*/
_AOE = _this select 0;
_lightsList = CL_Settings(getArray,"emp_light_list");
_Lights =  nearestObjects [_AOE,_lightsList,50];
_DamageOFF = 0.95;
_DamageON = 0.00;
_Vehicles = nearestObjects [(getpos _AOE),["Car"],50];
_CountLights = count _Lights;
_Lights select 0;
uiSleep (floor(random 3) +2);

for "_i" from 0 to _CountLights do {
	if (getDammage (_Lights select _i) < 0.90) then {
		(_Lights select _i) setDamage _DamageOFF;
		uiSleep 0.1;
		(_Lights select _i) setDamage _DamageON;
		uiSleep 0.1;
		(_Lights select _i) setDamage _DamageOFF;
		uiSleep 0.1;
	 };
};

{
	if (isEngineOn _x) then {_x setHit ["motor", 1]}
} forEach _Vehicles;
