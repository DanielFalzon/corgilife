class CL_cop_placeables {
	idd = 20000;
	name= "CL_cop_placeables";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground {
		class CL_RscTitleBackground : CL_RscText {
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};

		class MainBackground : CL_RscText {
			colorBackground[] = {0.19,0.19,0.19,1};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {
		class Title : CL_RscTitle {
			idc = -1;
			text = "Available placeables"; //--- ToDo: Localize;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};

		class PlaceablesList : CL_RscListBox {
			idc = 20001;
			text = "";
			sizeEx = 0.035;

			x = 0.12; y = 0.26;
			w = 0.56; h = 0.370;
		};

		class CloseButtonKey : CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Remove : CL_RscButtonMenu {
			idc = -1;
			text = "Del Target"; //--- ToDo: Localize;
			onButtonClick = "[] call CL_fnc_placeablesRemove";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class RemoveAll : CL_RscButtonMenu {
			idc = -1;
			text = "Del All"; //--- ToDo: Localize;
			onButtonClick = "[] call CL_fnc_placeablesRemoveAll";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Place : CL_RscButtonMenu {
			idc = -1;
			text = "Place"; //--- ToDo: Localize;
			onButtonClick = "[] spawn CL_fnc_placeablePlace;";
			x = 0.32;
			y = 0.69;
			w = (6.25 / 40);
			h = (1 / 25);
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};
};
