class CL_atm_management {
	idd = 2700;
	name= "CL_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class CL_RscTitleBackground: CL_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};

		class MainBackground: CL_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.7 - (22 / 250);
		};
	};

	class controls {
		class CashTitle: CL_RscStructuredText {
			idc = 2701;
			text = "";
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = 0.14;
		};

		class Title: CL_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class WithdrawButton: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_bankWithdraw";
			x = 0.425;
			y = 0.46;
			w = (6 / 40);
			h = (1 / 25);
		};

		class DepositButton: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_bankDeposit";
			x = 0.425;
			y = 0.512;
			w = (6 / 40);
			h = (1 / 25);
		};

		class moneyEdit: CL_RscEdit {
			idc = 2702;
			text = "1";
			sizeEx = 0.030;
			x = 0.4;
			y = 0.41;
			w = 0.2;
			h = 0.03;
		};

		class PlayerList: CL_RscCombo {
			idc = 2703;
			x = 0.4;
			y = 0.58;
			w = 0.2;
			h = 0.03;
		};

		class TransferButton: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_bankTransfer";
			x = 0.425;
			y = 0.63;
			w = (6 / 40);
			h = (1 / 25);
		};

		class GangWithdraw : TransferButton {
			idc = 2705;
			text = "$STR_ATM_WithdrawGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_gangWithdraw";
			x = 0.365;
			y = 0.79;
			w = 0.275;
		};

		class GangDeposit : TransferButton {
			idc = 2706;
			text = "$STR_ATM_DepositGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call CL_fnc_gangDeposit";
			x = 0.365;
			y = 0.732;
			w = 0.275;
		};

		class CloseButtonKey: CL_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};