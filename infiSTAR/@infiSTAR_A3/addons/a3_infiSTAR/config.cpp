/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2017. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
*/
class CfgPatches
{
	class a3_infiSTAR
	{
		requiredVersion = 0.4919;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		author[]= {"Chris(tian) 'infiSTAR' Lorenzen"};
		website[]= {"https://infiSTAR.de"};
		contact[]= {"admin@infiSTAR.de","infiSTAR23@gmail.com"};
		version = 'v258';
		licensed = "hudson.alistair@gmail.com";
	};
};
class CfgFunctions
{
	class a3_infiSTAR
	{
		class main
		{
			file = "a3_infiSTAR";
			class postInit { postInit = 1; };
		};
	};
};