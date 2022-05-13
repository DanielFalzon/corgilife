class mav_pt_transition
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=1;
	fadein=1;
	duration = 0.3;

	class controlsBackground {};

	class controls
	{
		class blackbackground: CL_RscText
		{
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0,0,2};
		};
	};
};

class mav_pt_transition_long
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=1;
	fadein=0;
	duration = 10;

	class controlsBackground {};

	class controls
	{
		class blackbackground: CL_RscText
		{
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0,0,2};
		};
	};
};