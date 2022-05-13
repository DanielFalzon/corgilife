/*
	File: player_inv.hpp
*/
#include "player_sys.sqf"

class playerSettings {
	idd = playersys_DIALOG;
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText
		{
			idc = -1;
			x = 0.303077 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.393846 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class MainBackground: CL_RscText
		{
			idc = -1;
			x = 0.303077 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.393846 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: CL_RscTitle
		{
			idc = -1;
			text = "Player Menu"; //--- ToDo: Localize;
			x = 0.303077 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.315077 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class moneyStatusInfo: CL_RscStructuredText
		{
			idc = 2015;
			x = 0.314334 * safezoneW + safezoneX;
			y = 0.401003 * safezoneH + safezoneY;
			w = 0.118154 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class PlayersName: Title
		{
			idc = carry_weight;
			style = 1;
			x = 0.303077 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.393846 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};

	class controls {
		class itemHeader: CL_RscText
		{
			idc = -1;
			text = "Current Items"; //--- ToDo: Localize;
			x = 0.547262 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113231 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class licenseHeader: CL_RscText
		{
			idc = -1;
			text = "Licenses"; //--- ToDo: Localize;
			x = 0.411385 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113231 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class moneySHeader: CL_RscText
		{
			idc = -1;
			text = "Money Stats"; //--- ToDo: Localize;
			x = 0.312923 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0862524 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class itemList: CL_RscListBox
		{
			idc = 2005;
			x = 0.549231 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108308 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class moneyEdit: CL_RscEdit
		{
			idc = 2018;
			text = "1"; //--- ToDo: Localize;
			x = 0.317846 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0708924 * safezoneW;
			h = 0.0165 * safezoneH;
		};
		class NearPlayers: CL_RscCombo
		{
			idc = 2022;
			x = 0.317846 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0708924 * safezoneW;
			h = 0.0165 * safezoneH;
		};
		class moneyDrop: CL_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] call CL_fnc_giveMoney";
			text = "Give"; //--- ToDo: Localize;
			x = 0.317846 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0512 * safezoneW;
			h = 0.0198 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class itemEdit: CL_RscEdit
		{
			idc = 2010;

			text = "1"; //--- ToDo: Localize;
			x = 0.549231 * safezoneW + safezoneX;
			y = 0.5715 * safezoneH + safezoneY;
			w = 0.108308 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class iNearPlayers: CL_RscCombo
		{
			idc = 2023;

			x = 0.549231 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108308 * safezoneW;
			h = 0.0165 * safezoneH;
		};
		class DropButton: CL_RscButtonMenu
		{
			idc = 2002;
			onButtonClick = "[] call CL_fnc_giveItem;";

			text = "Give"; //--- ToDo: Localize;
			x = 0.623077 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0541539 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class UseButton: CL_RscButtonMenu
		{
			onButtonClick = "[] call CL_fnc_useItem;";

			idc = 1015;
			text = "Use"; //--- ToDo: Localize;
			x = 0.564 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0541539 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class RemoveButton: CL_RscButtonMenu
		{
			onButtonClick = "[] call CL_fnc_removeItem;";

			idc = 1016;
			text = "Remove"; //--- ToDo: Localize;
			x = 0.504923 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0516923 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class ButtonClose: CL_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.303077 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0615385 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			tooltip = "Close the Player Menu"; //--- ToDo: Localize;
		};

		class FrameBorder1: CL_RscText
		{
			idc = -1;

			x = 0.303077 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.393846 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
/*
		class InfoButton: CL_RscButtonMenu
		{
			action = "<a href='ts3server://ts.CorgiLife.co.uk?port=9987'>";

			idc = 1020;
			text = "Teamspeak Server"; //--- ToDo: Localize;
			x = 0.381404 * safezoneW + safezoneX;
			y = 0.665005 * safezoneH + safezoneY;
			w = 0.0886125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class InfoButtonWebsite: CL_RscButtonMenu
		{
			onButtonClick = "<a href='https://www.CorgiLife.co.uk/'>";

			idc = 1021;
			text = "Our Website"; //--- ToDo: Localize;
			x = 0.463905 * safezoneW + safezoneX;
			y = 0.665005 * safezoneH + safezoneY;
			w = 0.0886125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
*/
		class Licenses_Menu: CL_RscControlsGroup
		{
			idc = -1;
			x = 0.413329 * safezoneW + safezoneX;
			y = 0.39963 * safezoneH + safezoneY;
			w = 0.110277 * safezoneW;
			h = 0.209 * safezoneH;

			class Controls {
				class CL_Licenses: CL_RscStructuredText {
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27;
					h = 0.65;
				};
			};
		};
	};
};
