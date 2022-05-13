class CL_crafting_menu {
	idd = 100200;
	name= "CL_crafting_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {
		class Title: CL_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 100207;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class RecipeList: CL_RscListBox {
			colorBackground[] = {0, 0, 0, .8};
			idc = 100201;
			x = 0.1;
			y = 0.25;
			w = 0.3;
			h = 0.45;
			sizeEx = 0.033;
			onLBSelChanged = "[] call CL_fnc_getCraftable;";
		};

		class ColorList: CL_RscCombo {
			colorBackground[] = {0, 0, 0, 1};
			idc = 100208;
			x = 0.11;
			y = 0.71;
			w = 0.25;
			h = 0.04;
		};

		class IngredientList: CL_RscListBox {
			idc = 100202;
			x = 0.42;
			y = 0.6;
			w = 0.45;
			h = 0.15;
			sizeEx = 0.033;
		};

		class RecipeDescription: CL_RscStructuredText {
			idc = 100209;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.175313 * safezoneW;
			h = 0.165 * safezoneH;
		};

		class CloseButtonKey: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonCraft: CL_RscButtonMenu {
			idc = 100206;
			text = "Craft";
			onButtonClick = "[] call CL_fnc_craftItem;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};