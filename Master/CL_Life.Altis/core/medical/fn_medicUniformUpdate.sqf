#include "..\..\script_macros.hpp"
/*
	File: fn_medicUniformUpdate.sqf
	Author: SilentRifle
	Edited: Dark (To work with 4.xx)
	Description: Can be used to re-texture medics & hide backpacks etc.
*/
if (playerSide isEqualTo independent) then {
	if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
		player setObjectTextureGlobal [0, "textures\Uniforms\Medic\Uniform_Medic.paa"];
	};

	if (uniform player isEqualTo "U_Rangemaster") then {
		player setObjectTextureGlobal [0, "textures\Uniforms\AAA\Uniform_AAA.paa"];
	};

	if (!(backpack player isEqualTo "")) then {
		unitBackpack player setObjectTextureGlobal [0, ""];
	};
};
