class CL_main_menu {
	idd = 2002;
	name= "CL_main_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground {
		class Phoneframe: CL_RscPicture
		{
			idc = 1205;
			text = "icons\phone\phone.paa";
			x = 0.357136 * safezoneW + safezoneX;
			y = 0.225067 * safezoneH + safezoneY;
			w = 0.280802 * safezoneW;
			h = 0.527872 * safezoneH;
		};
	};

	class controls {
		class exitPhone: CL_RscButtonInvisible
		{
			idc = -1;
			x = 0.487214 * safezoneW + safezoneX;
			y = 0.69276 * safezoneH + safezoneY;
			w = 0.0232935 * safezoneW;
			h = 0.0469559 * safezoneH;
			onButtonClick = "closeDialog 0;";
			tooltip = "Turn Off"; //--- ToDo: Localize;
		};
		class PicturePlayerMenu: CL_RscPicture
		{
			idc = 1206;
			text = "icons\phone\playerMenu.paa";
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.302048 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonPlayerMenu: CL_RscButtonInvisible
		{
			idc = 2411;
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.302048 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] call CL_fnc_p_openMenu";
			tooltip = "Inventory Menu"; //--- ToDo: Localize;
		};
		class PictureKeys: CL_RscPicture
		{
			idc = 1207;
			text = "icons\phone\key.paa";
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.302048 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonKeys: CL_RscButtonInvisible
		{
			idc = 2013;
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.302048 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "createDialog ""CL_key_management"";";
			tooltip = "Key Menu"; //--- ToDo: Localize;
		};
		class PicturesMessages: CL_RscPicture
		{
			idc = 1208;
			text = "icons\phone\chat.paa";
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.302048 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonMessages: CL_RscButtonInvisible
		{
			idc = 2014;
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.302048 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "createDialog ""CL_cell_phone"";";
			tooltip = "Messages"; //--- ToDo: Localize;
		};
		class PictureMarket: CL_RscPicture
		{
			idc = 1209;
			text = "icons\phone\cart.paa";
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonMarket: CL_RscButtonInvisible
		{
			idc = 2407;
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] spawn CL_fnc_openMarketView;";
			tooltip = "Market Menu"; //--- ToDo: Localize;
		};
		class PictureSkillsMenu: CL_RscPicture
		{
			idc = 1210;
			text = "icons\phone\briefcase.paa";
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonSkillsMenu: CL_RscButtonInvisible
		{
			idc = 2026;
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
			tooltip = "Skills Menu"; //--- ToDo: Localize;
		};
		class PictureGang: CL_RscPicture
		{
			idc = 1211;
			text = "icons\phone\gang.paa";
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonMyGang: CL_RscButtonInvisible
		{
			idc = 2011;
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "if (isNil ""CL_action_gangInUse"") then {if (isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""CL_Create_Gang_Diag"";} else {[] spawn CL_fnc_gangMenu;};};";
			tooltip = "Gang Menu"; //--- ToDo: Localize;
		};
		class PictureWantedList: CL_RscPicture
		{
			idc = 1212;
			text = "icons\phone\wanted.paa";
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonWantedList: CL_RscButtonInvisible
		{
			idc = 2012;
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.390027 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] call CL_fnc_wantedMenu";
			tooltip = "Wanted List"; //--- ToDo: Localize;
		};
		class PictureSyncData: CL_RscPicture
		{
			idc = -1;
			text = "icons\phone\memorycard.paa";
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonSyncData: CL_RscButtonInvisible
		{
			idc = -1;
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			tooltip = "Synchronize Data"; //--- ToDo: Localize;
		};
		class PictureSettings: CL_RscPicture
		{
			idc = 1214;
			text = "icons\phone\settings.paa";
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonSettings: CL_RscButtonInvisible
		{
			idc = -1;
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] call CL_fnc_settingsMenu;";
			tooltip = "Settings Menu"; //--- ToDo: Localize;
		};
		class PicturePlaceablesMenu: CL_RscPicture
		{
			idc = 1215;
			text = "icons\phone\cone.paa";
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonPlaceablesMenu: CL_RscButtonInvisible
		{
			idc = 20003;
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] spawn CL_fnc_placeablesMenu;";
			tooltip = "Placeables Menu"; //--- ToDo: Localize;
		};
		class PictureAirdrop: CL_RscPicture
		{
			idc = 1216;
			text = "icons\phone\caution.paa";
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonAirdrop: CL_RscButtonInvisible
		{
			idc = 1030;
			x = 0.529558 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] spawn CL_fnc_airDrop;";
			tooltip = "Call Airdrop"; //--- ToDo: Localize;
		};
		class PictureInfoMenu: CL_RscPicture
		{
			idc = 1217;
			text = "icons\phone\info.paa";
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonInfoMenu: CL_RscButtonInvisible
		{
			idc = 20004;
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.478005 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "[] call CL_fnc_usefullinks;";
			tooltip = "Information Menu"; //--- ToDo: Localize;
		};
		class PictureAdminMenu: CL_RscPicture
		{
			idc = 1218;
			text = "icons\phone\security.paa";
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonAdminMenu: CL_RscButtonInvisible
		{
			idc = 2021;
			x = 0.485221 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""CL_admin_menu"";";
			tooltip = "Admin Menu"; //--- ToDo: Localize;
		};
		class PictureTaxi: CL_RscPicture
		{
			idc = 1219;
			text = "icons\phone\taxi.paa";
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
		};
		class ButtonTaxi: CL_RscButtonInvisible
		{
			idc = 20005;
			x = 0.440884 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.0295581 * safezoneW;
			h = 0.0549866 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""RscDisplayTaxiMenu"";";
			tooltip = "Call Taxi"; //--- ToDo: Localize;
		};
	};
};