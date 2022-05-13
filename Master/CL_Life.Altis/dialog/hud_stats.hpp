#define INFINITE 1e+1000
#define IDC_CL_BAR_FOOD 2200
#define IDC_CL_BAR_FOOD_RING 3200
#define IDC_CL_BAR_WATER 2201
#define IDC_CL_BAR_WATER_RING 3201
#define IDC_CL_BAR_HEALTH 2202
#define IDC_CL_BAR_HEALTH_RING 3202
//#define IDC_CL_BAR_POOP 4202
#define IDC_CL_BAR_Speaker 3007
#define IDC_CL_BAR_SeatBelt 4203


class playerHUD {
idd = -1;
duration = INFINITE;
movingEnable = 0;
fadein = 0;
fadeout = 0;
name = "playerHUD";
onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
objects[] = {};
controls[] = {
	CL_BAR_FOOD_RING,
	CL_BAR_WATER_RING,
	CL_BAR_HEALTH_RING,
	CL_BAR_Speaker,
	CL_BAR_SeatBelt
};
	class CL_BAR_SeatBelt: CL_RscPicture
	{
		idc = IDC_CL_BAR_SeatBelt;
		text = "";
		x = 0.952292 * safezoneW + safezoneX;
		y = 0.574333 * safezoneH + safezoneY;
		w = 0.0331042 * safezoneW;
		h = 0.0589743 * safezoneH;
	};
	class CL_BAR_Speaker: CL_RscPicture
	{
		idc = IDC_CL_BAR_Speaker;
		text = "";
		x = 0.952292 * safezoneW + safezoneX;
		y = 0.640333 * safezoneH + safezoneY;
		w = 0.0331042 * safezoneW;
		h = 0.0589743 * safezoneH;
	};
	class CL_BAR_HEALTH_RING: CL_RscPicture
	{
		idc = IDC_CL_BAR_HEALTH_RING;
		text = "";
		x = 0.952292 * safezoneW + safezoneX;
		y = 0.706333 * safezoneH + safezoneY;
		w = 0.0331042 * safezoneW;
		h = 0.0589743 * safezoneH;
	};
	class CL_BAR_FOOD_RING: CL_RscPicture
	{
		idc = IDC_CL_BAR_FOOD_RING;
		text = "";
		x = 0.952292 * safezoneW + safezoneX;
		y = 0.772333 * safezoneH + safezoneY;
		w = 0.0331042 * safezoneW;
		h = 0.0589743 * safezoneH;
	};
	class CL_BAR_WATER_RING: CL_RscPicture
	{
		idc = IDC_CL_BAR_WATER_RING;
		text = "";
		x = 0.952292 * safezoneW + safezoneX;
		y = 0.838333 * safezoneH + safezoneY;
		w = 0.0331042 * safezoneW;
		h = 0.0589743 * safezoneH;
	};
};