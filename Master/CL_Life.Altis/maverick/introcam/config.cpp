/*
	Author: Maverick Applications
	Altis Life Intro Cam
*/

// Map configuration
class Maverick_IntroCam_CL {
	class Info {
		secondsPerCam 	= 40;
		selectRandom 	= 1;
		music			= 1;
		musicVolume		= 0.4;
		musicName		= "cam_intro";
	};
	class Positions {
		data[] = {
			// Start pos, start target pos, end pos, end target pos, focus
			{{3598.4,13214.2,38.8473},{3661.28,13109.3,0.0039854},{3587.01,13067.3,35.3913},{3661.28,13109.3,0.0039854},5}, //Kavala Square
			{{16600.8,12648.8,46.136},{16588.7,12782.1,0},{16722.9,12804.7,39.7488},{16588.7,12782.1,0},5} //Corp HQ			
		};
	};
};
