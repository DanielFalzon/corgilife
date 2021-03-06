/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance CL_Settings_viewDistanceFoot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance CL_Settings_viewDistanceCar};
	case ((vehicle player) isKindOf "Ship"): {setViewDistance CL_Settings_viewDistanceCar};
	case ((vehicle player) isKindOf "Air"): {setViewDistance CL_Settings_viewDistanceAir};
};
