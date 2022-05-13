class aInteraction_Menu {
	idd = 400300;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscTitleBackground: CL_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.6 - (22 / 250);
		};

		class Title: CL_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = 37401;
			text = "Admin Menu";
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
	};

	class controls {
		class ButtonClose: CL_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonOne: CL_RscButtonMenu {
			idc = 400301;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.07;
			w = 0.24;
			h = 0.038;
		};

		class ButtonTwo: CL_RscButtonMenu {
			idc = 400302;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.12;
			w = 0.24;
			h = 0.038;
		};

		class ButtonThree: CL_RscButtonMenu {
			idc = 400303;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.17;
			w = 0.24;
			h = 0.038;
		};

		class ButtonFour: CL_RscButtonMenu {
			idc = 400304;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.22;
			w = 0.24;
			h = 0.038;
		};

		class ButtonFive: CL_RscButtonMenu {
			idc = 400305;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.27;
			w = 0.24;
			h = 0.038;
		};

		class ButtonSix: CL_RscButtonMenu {
			idc = 400306;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.32;
			w = 0.24;
			h = 0.038;
		};

		class ButtonSeven: CL_RscButtonMenu {
			idc = 400307;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.37;
			w = 0.24;
			h = 0.038;
		};

		class ButtonEight: CL_RscButtonMenu {
			idc = 400308;
			colorBackground[] = {1,0,0,1};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.42;
			w = 0.24;
			h = 0.038;
		};

		class ButtonNine: CL_RscButtonMenu {
			idc = 400309;
			colorBackground[] = {1,0,0,1};
			text = "";
			sizeEx = 0.025;
			x = 0.35 + 0.03;
			y = 0.2 + 0.47;
			w = 0.24;
			h = 0.038;
		};
	};
};