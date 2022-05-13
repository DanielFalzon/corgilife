/*--------------------------------------------------------------------------
	Author:		Maverick Applications
	Website:	https://maverick-applications.com

	You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

//Customize your settings, to fit your server setup!
class Maverick_SpeedCameras {

	//Define the possible locations for your speed cameras.
	//position -> Get the position via: diag_log(getPosATL player) -> replace the [] with {}
	//direction -> Get the position via: diag_log((getDir player) - 90)
	//speedlimit -> Choose any value you like. In a zone where people should drive 50, make set it to 55 or 60, to catch those speeders!
	SpeedCameras[] = {
	//{{<position>}, <direction>, <speedlimit>},
		{{3605.94,13087.6,0}, 283.865, 40}, //Kavalla Martketplace [Altis]
		{{3403.625,12613.456,0}, 146.733, 60}, //Kavalla Beach [Altis]
		{{3427.11,12676.5,0.136895}, -41.9086, 60}, //Kavalla Beach [Altis]
		{{3777.49,13420.8,0}, 146.733, 60}, //Outside kavalla near the construction site [Altis]
		{{3813.16,13485.9,0.00132275}, -21.2063, 60}, //Outside kavalla near the construction site [Altis]
		{{6379.185,15180.673,0}, 146.733, 120},  //Outside Oil Processor
		{{6491.73,15267.7,0.00140381}, -20.9271, 120},  //Outside Oil Processor
		{{7920.468,16016.155,0}, 221.246, 120},  //Before Death Bend
		{{8029.69,15970.6,0.00141907}, 38.6536, 120},  //Before Death Bend
		{{9164.53,15799.2,0.00141144}, 164.04, 120},  //Inside Agios
		{{9306.63,15871.9,0.00145721}, -13.2256, 120},  //Inside Agios
		{{12248.694,15848.57,0}, 182.738, 120},  //Outside Gange Hideout 1
		{{12425.2,15883.5,0.00144958}, 1.19088, 120},  //Outside Gange Hideout 1
		{{14076.66,16453.445,0}, 146.733, 120}, //Airport Road
		{{14123.21,16519.133,0}, 326.733, 120}, //Airport Road
		{{16448.322,15863.825,0}, 226.192, 120}, //Anthrakia Bridge
		{{16564.012,15788.637,0}, 44.0359, 120} //Anthrakia Bridge
	};
	
	//Define the radius in meter in front of the speed camera where it should be active. 25 Works well with default arma roads.
	Radius = 25;
	
	SideWhitelist[] = {
		//Side name to lower case!
		"west", 	  //Prevent Police officers from triggering the speed camera
		"guer" //Prevent medics from triggering the speed camera
	};
	
	//Shall the user get its driver licenses revoked?
	RemoveLicenses[] = {
		//{ <License name to display in the hint 'msgRemoveLicense'>, <license_variable_name>, <how fast over the limit does he need to drive to get the license removed e.g 10>}
		//{ "driver license" , "license_civ_driver", 25 }     //Remove the driver license if he was diriving faster than allowed by at least 1km/h 
	};

	//Shall the player be added to the wanted list with a speeding entry?
	AddPlayerToWanted      = 1;   				   // 0 = No | 1 = yes
	WantedCase			   = "4"; 				   //The number/numbers+charaters that describe the crime you want the player to be added for
	WantedFunction		   = "CL_fnc_wantedAdd"; //Adjust if you use any other wanted add function name
	
	//Let the player pay a fine from his bank account
	SpeedingFee            = 500;			 // 0 = No fine payed | Any value over $0 will be then subtracted from the bank account
	EnableFactor           = 0;			 	 // 0 = No | 1 = yes -> SpeedingFee * Amount of speed the player was going to fast = $500 * 24kmh = $12000
	BankVariable		   = "CL_bmoola"; //Adjust your bank account variable
	
	class localization {
	
		//Define the messages, which will be shown to the player, when he was driving too fast
		msgSpeedCamera		   = "Speedcamera";
		msgInfo                = "You were driving %1 km/h too fast!";
		msgRemoveLicense 	   = "Your %1 has been revoked!";
		msgWantedAdd  		   = "A wanted record has been created!";
		msgSpeedingFee         = "You have been fined $%1 for speeding!";
	};
};