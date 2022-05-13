/*
class CL_spawn_selection {
	idd = 38500;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText	{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};

		class Title: CL_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class SpawnPointTitle: Title {
			idc = 38501;
			style = 1;
			text = "";
		};

		class MapView : CL_RscMapControl {
			idc = 38502;
			x = 0.328;
			y = 0.26;
			w = 0.56;
			h = 0.56 - (22 / 250);
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};

	class controls {
		class SpawnPointList: CL_RscListNBox {
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.105;
			y = 0.26;
			w = (8.8 / 40);
			h = (10 / 25);
			onLBSelChanged = "_this call CL_fnc_spawnPointSelected;";
		};

		class spawnButton: CL_RscButtonMenu {
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] call CL_fnc_spawnConfirm";
			x = 0.11;
			y = 0.69;
			w = (8 / 40);
			h = (1 / 25);
		};
	};
};
*/
class CL_spawn_selection {
	idd = 38500;
	movingEnabled = 0;
	enableSimulation = 1;
		class controlsBackground {
			class CL_RscTitleBackground: CL_RscText {
				idc = 1000;
				x = 0.0101577 * safezoneW + safezoneX;
				y = 0.0291999 * safezoneH + safezoneY;
				w = 0.170156 * safezoneW;
				h = 0.9438 * safezoneH;
				colorBackground[] = {0.294,0.286,0.286,0.8};
			};

			class Title: CL_RscText {
				idc = 1001;
				text = "Spawn Selection";
				x = 0.0132501 * safezoneW + safezoneX;
				y = 0.0402 * safezoneH + safezoneY;
				w = 0.164999 * safezoneW;
				h = 0.0242 * safezoneH;
			};

			class MapView: CL_RscMapControl {
				idc = 38502;
				x = 0.183407 * safezoneW + safezoneX;
				y = 0.0292 * safezoneH + safezoneY;
				w = 0.8085 * safezoneW;
				h = 0.9438 * safezoneH;
				maxSatelliteAlpha = 0.75;
				alphaFadeStartScale = 1.15;
				alphaFadeEndScale = 1.29;
			};
		};

		class controls {
			class spawnList: CL_RscListNBox {
				idc = 38510;
				x = 0.0153125 * safezoneW + safezoneX;
				y = 0.071 * safezoneH + safezoneY;
				w = 0.159844 * safezoneW;
				h = 0.847 * safezoneH;
				text = "";
				sizeEx = 0.041;
				coloumns[] = {0,0,0.9};
				drawSideArrows = 1;
				idcLeft = -1;
				idcRight = -1;
				rowHeight = 0.050;
				onLBSelChanged = "_this call CL_fnc_spawnPointSelected;";
			};

			class spawnButton: CL_RscButtonMenu {
				idc = -1;
				text = "Spawn";
				x = 0.0153125 * safezoneW + safezoneX;
				y = 0.9246 * safezoneH + safezoneY;
				w = 0.159844 * safezoneW;
				h = 0.033 * safezoneH;
				style = "0x02";
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
				colorBackgroundDisabled[] = {0.95,0.95,0.95,0};
				offsetX = 0.003;
				offsetY = 0.003;
				offsetPressedX = 0.002;
				offsetPressedY = 0.002;
				colorShadow[] = {0,0,0,1};
				colorBorder[] = {0,0,0,0};
				borderSize = 0.008;
				onButtonClick = "[] call CL_fnc_spawnConfirm";
		};
	};
};