class CL_My_Gang_Diag {
	idd = 2620;
	name= "CL_my_gang_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";

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
			idc = 2629;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class GangMemberList: CL_RscListBox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			x = 0.11;
			y = 0.26;
			w = 0.350;
			h = 0.370;
		};

		class CloseLoadMenu: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call CL_fnc_p_updateMenu";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangLeave: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_gangLeave";
			x = 0.47;
			y = 0.26;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangLock: CL_RscButtonMenu {
			idc = 2622;
			text = "$STR_Gang_UpgradeSlots";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn CL_fnc_gangUpgrade";
			x = 0.47;
			y = 0.31;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangKick: CL_RscButtonMenu {
			idc = 2624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_gangKick";
			x = 0.47;
			y = 0.36;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangLeader: CL_RscButtonMenu {
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn CL_fnc_gangNewLeader";
			x = 0.47;
			y = 0.41;
			w = (9 / 40);
			h = (1 / 25);
		};

		class InviteMember: GangLeader {
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn CL_fnc_gangInvitePlayer";
			y = .51;
		};

		class DisbandGang: InviteMember	{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn CL_fnc_gangDisband";
			y = .46;
		};

		class ColorList: CL_RscCombo {
			idc = 2632;
			x = 0.47;
			y = 0.56;
			w = (9 / 40);
			h = 0.03;
		};

		class GangBank: Title {
			idc = 601;
			style = 1;
			text = "";
		};
	};
};

class CL_Create_Gang_Diag {
	idd = 2520;
	name= "CL_my_gang_menu_create";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'CL_Settings' >> 'gang_price'))] call CL_fnc_numberText]};";

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};

	class controls {
		class InfoMsg: CL_RscStructuredText {
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5;
			h = .11;
		};

		class Title: CL_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call CL_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangCreateField: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_createGang";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CreateGangText: CL_RscEdit {
			idc = 2522;
			text = "$STR_Gang_YGN";
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};