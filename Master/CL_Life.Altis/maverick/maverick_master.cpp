#include "gui\includes.cpp"
#include "tuning\config.cpp"
#include "introcam\config.cpp"
#include "indicators\config.cpp"
#include "Shipwrecks\config.cpp"
#include "ServerRestartEvent\config.cpp"
#include "plane_taxis\config.cpp"
#include "talent-tree-modular\config.cpp"
#include "weaponshops\config.cpp"
#include "taxis\config.cpp"
#include "speedcameras\config.cpp"

class CfgMusic {
	tracks[]={};
	class cam_intro
	{
		name = "";
		sound[] = {"maverick\introcam\intro.ogg", db+0, 1.0};
	};
};
