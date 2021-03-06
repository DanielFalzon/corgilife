class CL_key_management {
	idd = 2700;
	name= "CL_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn CL_fnc_keyMenu;";

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {
		class Title: CL_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Keys_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class KeyChainList: CL_RscListBox {
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			x = 0.12;
			y = 0.26;
			w = 0.56;
			h = 0.370;
		};

		class CloseButtonKey: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class NearPlayers: CL_RscCombo {
			idc = 2702;
			x = 0.26;
			y = 0.645;
			w = 0.275;
			h = 0.03;
		};

		class DropKey: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call CL_fnc_keyDrop";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GiveKey: CL_RscButtonMenu {
			idc = 2703;
			text = "$STR_Keys_GiveKey";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_keyGive";
			x = 0.32;
			y = 0.69;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};