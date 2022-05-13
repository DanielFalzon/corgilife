class nanoEMPConsole {
	idd = 3494;
	name= "nanoEMPConsole";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn CL_fnc_openEmpMenu;";

	class controlsBackground {
		class CL_RscTitleBackground:CL_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:CL_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};

	class controls {
		class Title : CL_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "nanoEMP Operator Console";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class PlayerList_Admin : CL_RscListBox
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			//onLBSelChanged = "hint format [""%1"",_this select 1];";

			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};

		class PlayerBInfo : CL_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : CL_RscButtonMenu {
			idc = -1;
			text = "Shut Down";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Refresh : CL_RscButtonMenu {
			idc = -1;
			text = "Scan";
			onButtonClick = "[] spawn CL_fnc_scanVehicles;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		/*class WarnEMP : CL_RscButtonMenu {
			idc = 2030;
			text = "Warnen";
			onButtonClick = "";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};*/

		class ExecEMP : CL_RscButtonMenu {
			idc = 2070;
			text = "Deactivate";
			onButtonClick = "[] spawn CL_fnc_empVehicle;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class WarnEMP : CL_RscButtonMenu {
			idc = 2060;
			text = "Warn";
			onButtonClick = "[] spawn CL_fnc_warnVehicle;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};