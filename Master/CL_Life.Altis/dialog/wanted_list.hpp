class CL_wanted_menu {
	idd = 2400;
	name= "CL_wanted_menu";
	movingEnable = 0;
	enableSimulation = 1;
	//onLoad = "[] spawn CL_fnc_wantedadd2;";

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
			text = "$STR_Wanted_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class WantedConnection: Title {
			idc = 2404;
			style = 1;
			text = "";
		};

		class WantedList: CL_RscListBox {
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] spawn CL_fnc_wantedGrab";
			x = 0.12;
			y = 0.28;
			w = 0.2;
			h = 0.3;
		};

		class PlayerList: CL_RscListBox {
			idc = 2406;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "";
			x = 0.34;
			y = 0.28;
			w = 0.2;
			h = 0.3;
		};

		class WantedDetails: CL_RscListBox {
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.12;
			y = 0.62;
			w = 0.48;
			h = 0.12;
		};

		class BountyPrice: CL_RscText	{
			idc = 2403;
			text = "";
			x = 0.12;
			y = 0.30;
			w = 0.6;
			h = 0.6;
		};

		class WantedAddL: CL_RscCombo	{
			idc = 2407;
			x = 0.542;
			y = 0.28;
			w = (8 / 52);
			h = 0.03;
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

		class PardonButtonKey: CL_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call CL_fnc_pardon; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonWantedAdd: CL_RscButtonMenu {
			idc = 9800;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Wanted_Add";
			onButtonClick = "[] call CL_fnc_wantedAddP;";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class wantedText: CL_RscText {
			idc = 1000;
			text = "$STR_Wanted_People";
			x = 0.12;
			y = 0.11;
			w = 0.2;
			h = 0.3;
		};

		class citizensText: CL_RscText {
			idc = 1001;
			text = "$STR_Wanted_Citizens";
			x = 0.34;
			y = 0.11;
			w = 0.2;
			h = 0.3;
		};

		class crimesText: CL_RscText {
			idc = 1002;
			text = "$STR_Wanted_Crimes";
			x = 0.542;
			y = 0.245;
			w = (8 / 52);
			h = 0.03;
		};
	};
};