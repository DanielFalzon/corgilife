#include "..\..\script_macros.hpp"
/*
	File: fn_copUniformUpdate.sqf
	Author: SilentRifle
	Edited: Dark (To work with 4.xx)
	Description: Can be used to re-texture cops & hide backpacks etc.
*/
if (playerSide isEqualTo west) then {
	switch (call CL_coplevel) do {
		case 1: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_1.jpg"];
			};
		};
		
		case 2: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_2.jpg"];
			};
		};
		
		case 3: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_3.jpg"];
			};
		};
		
		case 4: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_4.jpg"];
			};	
		};
		
		case 5: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_5.jpg"];
			};
		};
		
		case 6: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_6.jpg"];
			};
		};
		
		case 7: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_7.jpg"];
			};
		};
		
		case 8: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform_8.jpg"];
			};
		};
		
		case 9: {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform.jpg"];
			};
		};
		
		default {
			if (uniform player isEqualTo "U_Rangemaster") then {
				player setObjectTextureGlobal [0, "textures\Uniforms\Police\cop_uniform.jpg"];
			};
		};
	};

	if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
		player setObjectTextureGlobal [0, "textures\Uniforms\Police\Uniform_Swat.paa"];
	};

	if (uniform player isEqualTo "U_B_CombatUniform_mcam_worn") then {
		player setObjectTextureGlobal [0, "textures\Uniforms\Police\Uniform_PTU.paa"];
	};

	if (backpack player isEqualTo "B_Carryall_cbr") then {
		unitBackpack player setObjectTextureGlobal [0, ""]
	};
};