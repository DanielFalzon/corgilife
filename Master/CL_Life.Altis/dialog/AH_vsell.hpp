class AH_vsell 
{
	idd = 15600;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: CL_RscText
		{
			idc = -1;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.528089 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: CL_RscText
		{
			idc = -1;
			text = "FOR SALE"; //--- ToDo: Localize;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: CL_RscListBox
		{
			idc = 15601;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.04;
			onLBSelChanged = "_this spawn CL_fnc_vAH_select";
		};
		class RscButtonMenu_2400: CL_RscButtonMenu
		{
			idc = -1;
			text = "SELL"; //--- ToDo: Localize;
			onButtonClick = "[] spawn CL_fnc_vAH_sell;";
			x = 0.669 * safezoneW + safezoneX; //399 - 604
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: CL_RscButtonMenu
		{
			idc = -1;
			text = "CLOSE"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		/*
		class RscButtonMenu_2402: CL_RscButtonMenu
		{
			idc = -1;
			text = "AMOUNT"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn CL_fnc_vAH_loadInventory;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		*/
		class RscPic_2403: CL_RscPicture
		{
			idc = 15660;
			text = "textures\fattony.jpg";
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.10528089 * safezoneH;
		};
		class RscText_1002: CL_RscText
		{
			idc = -1;
			text = "QUANTITY"; //--- ToDo: Localize;
			x = 0.429 * safezoneW + safezoneX; //334
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit : CL_RscEdit {
			idc = 15602;
			text = "1";
			x = 0.49 * safezoneW + safezoneX; //464
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.022 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1003: CL_RscText
		{
			idc = -1;
			text = "TOTAL PRICE $"; //--- ToDo: Localize;
			x = 0.529 * safezoneW + safezoneX; //334
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.062 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit2 : CL_RscEdit {
			idc = 15603;
			text = "50";
			x = 0.604 * safezoneW + safezoneX; //464
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		
		class RscButtonMenu_2404: CL_RscButtonMenu
		{
			idc = -1;
			text = "TAKE BACK"; //--- ToDo: Localize;
			onButtonClick = "[] spawn CL_fnc_vAH_takeBack;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,0.54,0,1};
		};
	
	};
};