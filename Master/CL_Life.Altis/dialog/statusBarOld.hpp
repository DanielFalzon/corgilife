#define ST_RIGHT 0x01

class osefStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 55554;
			x = safezoneX + safezoneW - 1;
			y = safezoneY + safezoneH - 0.08;
			w = 1;
			h = 0.04;
			shadow = 0; // 2
//			colorBackground[] = { 1, 0.3, 0, 0.0 }; // Uncomment and increase 4th number to have a background
			font = "RobotoCondensedBold";
			size = 0.03;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="right";
				color = "#ffffff"; // #FF8700
			};
		};
	};
};