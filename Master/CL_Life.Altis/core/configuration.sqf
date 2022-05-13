#include "..\script_macros.hpp"
/*
	File: configuration.sqf
	Author:

	Description:
	Master in Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
CL_query_time = time;
CL_action_delay = time;
CL_trunk_vehicle = objNull;
CL_session_completed = false;
CL_garage_store = false;
CL_session_tries = 0;
CL_net_dropped = false;
CL_siren_active = false;
CL_siren2_active = false;
CL_clothing_filter = 0;
CL_clothing_uniform = -1;
CL_redgull_effect = time;
CL_is_processing = false;
CL_bail_paid = false;
CL_impound_inuse = false;
CL_action_inUse = false;
CL_spikestrip = ObjNull;
CL_knockout = false;
CL_interrupted = false;
CL_respawned = false;
CL_removeWanted = false;
CL_action_gathering = false;
CL_god = false;
CL_frozen = false;
CL_save_gear = [];
CL_container_activeObj = ObjNull;
CL_disable_getIn = false;
CL_disable_getOut = false;
CL_admin_debug = false;
CL_preview_3D_vehicle_cam = objNull;
CL_preview_3D_vehicle_object = objNull;
CL_preview_light = objNull;
CL_pos_exist = false;
CL_pos_attach = [];
CL_civ_position = [];
CL_markers = false;
CL_canpay_bail = true;
CL_storagePlacing = scriptNull;
CL_safezone_shots = 0;
CL_capture_zone = 0;
CL_seatbelt = false;
CL_speaking = false;
CL_request_timer = false;
CL_fadeSound = false;
robShops_Active = false;
robCasino_Active = false;
robWepDepo_Active = false;


//Settings
CL_Settings_enableNewsBroadcast = profileNamespace getVariable ["CL_enableNewsBroadcast",true];
CL_Settings_enableSidechannel = profileNamespace getVariable ["CL_enableSidechannel",true];
CL_Settings_tagson = profileNamespace getVariable ["CL_Settings_tagson",true];
CL_Settings_revealObjects = profileNamespace getVariable ["CL_Settings_revealObjects",true];
CL_Settings_viewDistanceFoot = profileNamespace getVariable ["CL_viewDistanceFoot",1250];
CL_Settings_viewDistanceCar = profileNamespace getVariable ["CL_viewDistanceCar",1250];
CL_Settings_viewDistanceAir = profileNamespace getVariable ["CL_viewDistanceAir",1250];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
CL_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
CL_maxWeight = CL_Settings(getNumber,"total_maxWeight");
CL_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
CL_nlrtimer_stop = false;
CL_nlrtimer_running = false;
CL_net_dropped = false;
CL_use_atm = true;
CL_is_arrested = false;
CL_is_alive = false;
CL_delivery_in_progress = false;
CL_thirst = 100;
CL_hunger = 100;
CL_cmoola = 0;
CL_airDrops = 0;
CL_explorer_wreck = objNull;
CL_wreck_searched = false;
CL_bloodActionPlaying = false;

CL_istazed = false;
CL_isdowned = false;
CL_isknocked = false;
CL_vehicles = [];

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");

	missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
