class CL_admin_menu {
	idd = 2900;
	name= "CL_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn CL_fnc_adminMenu;";

	class controlsBackground {
		class MainBackground: CL_RscText {
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.396 * safezoneH;
		};

		class CL_RscTitleBackground: CL_RscText {
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "$STR_Admin_Title";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
		class RscButtonMenu_2400: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2402: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_GetID";
			onButtonClick = "[] call CL_fnc_admingetID;";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2403: CL_RscButtonMenu {
			idc = 2904;
			text = "$STR_Admin_Compensate";
			onButtonClick = "createDialog ""CL_Admin_Compensate"";";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2404: CL_RscButtonMenu {
			idc = 2905;
			text = "$STR_Admin_Spectate";
			onButtonClick = "[] call CL_fnc_adminSpectate;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2405: CL_RscButtonMenu {
			idc = 2906;
			text = "$STR_Admin_Teleport";
			onButtonClick = "[] call CL_fnc_adminTeleport; hint 'Select where you would like to teleport';";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2401: CL_RscButtonMenu {
			idc = 2907;
			text = "$STR_Admin_TpHere";
			onButtonClick = "[] call CL_fnc_adminTpHere;";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2406: CL_RscButtonMenu {
			idc = 2908;
			text = "$STR_AdmCL_god";
			onButtonClick = "[] call CL_fnc_adminGodMode;";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2407: CL_RscButtonMenu {
			idc = 2909;
			text = "$STR_Admin_Freeze";
			onButtonClick = "[] call CL_fnc_adminFreeze;";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2408: CL_RscButtonMenu {
			idc = 2910;
			text = "$STR_AdmCL_markers";
			onButtonClick = "[] spawn CL_fnc_adminMarkers;closeDialog 0;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButtonMenu_2409: CL_RscButtonMenu {
			idc = 2911;
			text = "$STR_Admin_Debug";
			onButtonClick = "[] call CL_fnc_adminDebugCon;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class PlayerList_Admin: CL_RscListBox {
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] spawn CL_fnc_adminQuery";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.275 * safezoneH;
		};

		class PlayerBInfo: CL_RscStructuredText {
			idc = 2903;
			text = "";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
/*
		class SpareButton : CL_RscButtonMenu {
			idc = 2912;
			text = "";
			onButtonClick = "";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.885;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
*/
		class DoomsDay : CL_RscButtonMenu {
			idc = 2913;
			text = "DoomsDay";
			onButtonClick = "[] execVM 'core\admin\fn_doomsDay.sqf'";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.1358;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};	
	};
};
