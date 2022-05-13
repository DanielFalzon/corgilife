///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Life
///////////////////////////////////////////////////////////////////////////
class RscText : CL_RscText
{
	
};
class RscStructuredText : CL_RscStructuredText
{
	
};
class RscPicture : CL_RscPicture
{
	
};
class RscEdit : CL_RscEdit
{
	
};
class RscCombo : CL_RscCombo
{
	
};
class RscListBox : CL_RscListBox
{
	
};
class RscButton : CL_RscButton
{
	
};
class RscShortcutButton : CL_RscShortcutButton
{
	
};
class RscShortcutButtonMain : CL_RscShortcutButtonMain
{
	
};
class RscFrame : CL_RscFrame
{
	
};
class RscSlider : CL_RscSlider
{
	
};
class IGUIBack : CL_RscText
{
	colorBackground[] = {0, 0, 0, 0.7};
};
class RscCheckBox : CL_RscCheckBox
{
	
};

class RscButtonMenu : CL_RscButtonMenu
{
	
};
class RscButtonMenuOK : CL_RscButtonMenu
{
	idc = 1;
	shortcuts[] = 
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	default = 1;
	text = "OK";
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
};
class RscButtonMenuCancel : CL_RscButtonMenu
{
	idc = 2;
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Close";
};
class RscControlsGroup : CL_RscControlsGroup
{
	
};
