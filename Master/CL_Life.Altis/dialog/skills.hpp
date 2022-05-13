class CL_skill_menu {
	idd = 100100;
	name = "CL_skill_menu";
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			x = 0.10;
			y = 0.20;
			w = 0.80;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.10;
			y = 0.20 + (11 / 250);
			w = 0.80;
			h = 0.60 - (2 / 250);
		};
	};

	class controls {
		class Title: CL_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Skill System";
			x = 0.10;
			y = 0.20;
			w = 0.60;
			h = (1 / 25);
		};

		class skillTitle: CL_RscTitle {
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Your Skills";
			x = 0.11;
			y = 0.26;
			w = 0.375;
			h = (1 / 25);
		};

		class skillDescTitle: CL_RscTitle {
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Skill Description";
			x = 0.495;
			y = 0.26;
			w = 0.375;
			h = (1 / 25);
		};

		class skillLevelTitle: CL_RscTitle {
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Skill Level";
			sizeEx = 0.04;
			x = 0.495;
			y = 0.63;
			w = 0.375;
			h = 0.04;
		};

		class skillDescriptionBox: CL_RscListBox {
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "";
			style = "0x02 + 0xC0";
			sizeEx = 0.085;
			//onLBSelChanged = "";
			x = 0.495;
			y = 0.31;
			w = 0.375;
			h = 0.31;
		};

		class skillLevelBox: CL_RscListBox {
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "";
			style = "0x02 + 0xC0";
			sizeEx = 0.085;
			x = 0.495;
			y = 0.68;
			w = 0.375;
			h = 0.133;
		};

		//List of skills
		class skillTextBox: CL_RscListBox {
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text="";
			style = 0x02;
			sizeEx = 0.04;
			onLBSelChanged = "";
			x = 0.11;
			y = 0.31;
			w = 0.375;
			h = 0.5;
		};

		class ButtonClose: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.80 + (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
