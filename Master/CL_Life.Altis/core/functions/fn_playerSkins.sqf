#include "..\..\script_macros.hpp"
/*
	File: fn_playerSkins.sqf
	Author: Daniel Stuart
	Description:
	Sets skins for players by their side and uniform.
*/
private "_skinName";

switch(playerSide) do {
	case civilian: {
		if (CL_Settings(getNumber,"civ_skins") isEqualTo 1) then {
			if (uniform player isEqualTo "U_C_Poloshirt_blue") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_1.jpg"];
			};
			if (uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_2.jpg"];
			};
			if (uniform player isEqualTo "U_C_Poloshirt_stripped") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_3.jpg"];
			};
			if (uniform player isEqualTo "U_C_Poloshirt_tricolour") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_4.jpg"];
			};
			if (uniform player isEqualTo "U_C_Poloshirt_salmon") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_5.jpg"];
			};
			if (uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_6.jpg"];
			};
			if (uniform player isEqualTo "U_C_Commoner1_1") then {
				player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Civ\civilian_uniform_7.jpg"];
			};
		};
	};

	case west: {
		// Cadet
		if (uniform player isEqualTo "U_Rangemaster") then {
			_skinName = "textures\Uniforms\Police\cop_uniform.jpg";
			if (CL_Settings(getNumber,"cop_extendedSkins") isEqualTo 1) then {
				if(FETCH_CONST(CL_coplevel) >= 1) then {
					_skinName = ["textures\Uniforms\Police\cop_uniform_",(FETCH_CONST(CL_coplevel)),".jpg"] joinString "";
				};
			};
			player setObjectTextureGlobal [0, _skinName];
		};

		// Swat
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
			player setObjectTextureGlobal [0, "textures\Uniforms\Police\Uniform_Swat.paa"];
		};

		// PTU
		if (uniform player isEqualTo "U_B_CombatUniform_mcam_worn") then {
			player setObjectTextureGlobal [0, "textures\Uniforms\Police\Uniform_PTU.paa"];
		};

		if (backpack player isEqualTo "B_Carryall_cbr") then {
			unitBackpack player setObjectTextureGlobal [0, ""];
		};
	};

	case independent: {
		// Medic
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
			player setObjectTextureGlobal [0, "\CL\textures\Uniforms\Medic\Uniform_Medic.paa"];
		};

		if (!(backpack player isEqualTo "")) then {
			unitBackpack player setObjectTextureGlobal [0, ""];
		};
	};
};