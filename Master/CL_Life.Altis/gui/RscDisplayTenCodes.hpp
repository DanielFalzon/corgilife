class RscDisplayTenCodes
{
	idd = -1;
	duration = 10;
	fadein = 1;
	fadeout = 1;

	class controls
	{
		class Tencodes
		{
			idc = -1;
			type = CT_STRUCTURED_TEXT;
			style = ST_MULTI;

			x = 0;
			y = 0;
			w = 15 * GUI_GRID_W;
			h = 21.5 * GUI_GRID_H;

			//filename = "Dialogs\Html\tenCodes.html";
			lineSpacing = 0.2;
			text = "";
			size = 0.028;
			sizeEx = 0.028;

			font = "EtelkaMonospacePro";

			colorBackground[] = {0.2,0.2,0.2,0.5};
			colorBold[] = {1, 0, 0, 1};
			colorLink[] = {0, 0, 1, 1};
			colorLinkActive[] = {1, 0, 0, 1};
			colorPicture[] = {1, 1, 1, 1};
			colorPictureBorder[] = {1, 0, 0, 1};
			colorPictureLink[] = {0, 0, 1, 1};
			colorPictureSelected[] = {0, 1, 0, 1};
			colorText[] = {0, 0, 0, 1};

			onLoad = "_this call CL_fnc_initTenCodes";
		};
	};
};