class DefaultEventhandlers;
class CfgPatches
{
	class CL_Server
	{
		units[]=
		{
			"C_man_1"
		};
		weapons[]={};
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_Soft_F",
			"A3_Soft_F_Offroad_01",
			"A3_Characters_F"
		};
		fileName="CL_Server.pbo";
		author="Dark";
	};
};
class CfgFunctions
{
	class MySQL_Database
	{
		tag="DB";
		class MySQL
		{
			file="\CL_Server\Functions\MySQL";
			class numberSafe
			{
			};
			class mresArray
			{
			};
			class queryRequest
			{
			};
			class asyncCall
			{
			};
			class insertRequest
			{
			};
			class updateRequest
			{
			};
			class mresToArray
			{
			};
			class insertVehicle
			{
			};
			class bool
			{
			};
			class mresString
			{
			};
			class updatePartial
			{
			};
		};
	};
	class CL_System
	{
		tag="CL";
		class Wanted_Sys
		{
			file="\CL_Server\Functions\WantedSystem";
			class wantedFetch
			{
			};
			class wantedPerson
			{
			};
			class wantedBounty
			{
			};
			class wantedRemove
			{
			};
			class wantedAdd
			{
			};
			class wantedCrimes
			{
			};
			class wantedProfUpdate
			{
			};
		};
		class Jail_Sys
		{
			file="\CL_Server\Functions\Jail";
			class jailSys
			{
			};
		};
		class Client_Code
		{
			file="\CL_Server\Functions\Client";
		};
	};
	class TON_System
	{
		tag="TON";
		class Systems
		{
			file="\CL_Server\Functions\Systems";
			class cleanup
			{
			};
			class getID
			{
			};
			class vehicleCreate
			{
			};
			class spawnVehicle
			{
			};
			class getVehicles
			{
			};
			class vehicleStore
			{
			};
			class vehicleDelete
			{
			};
			class vehicleCrush
			{
			};
			class spikeStrip
			{
			};
			class logIt
			{
			};
			class federalUpdate
			{
			};
			class chopShopSell
			{
			};
			class chopShopClaim
			{
			};
			class clientDisconnect
			{
			};
			class cleanupRequest
			{
			};
			class setObjVar
			{
			};
			class keyManagement
			{
			};
			class vehicleUpdate
			{
			};
			class recupkeyforHC
			{
			};
			class handleBlastingCharge
			{
			};
		};
		class vAH
		{
			file="\CL_Server\Functions\vAH";
			class vAH_init
			{
			};
			class vAH_update
			{
			};
		};
		class Housing
		{
			file="\CL_Server\Functions\Housing";
			class addHouse
			{
			};
			class addContainer
			{
			};
			class fetchPlayerHouses
			{
			};
			class initHouses
			{
			};
			class sellHouse
			{
			};
			class sellHouseContainer
			{
			};
			class updateHouseContainers
			{
			};
			class updateHouseTrunk
			{
			};
			class houseCleanup
			{
			};
			class deleteDBContainer
			{
			};
			class houseGarage
			{
			};
		};
		class Gangs
		{
			file="\CL_Server\Functions\Gangs";
			class insertGang
			{
			};
			class capZones
			{
			};
			class queryPlayerGang
			{
			};
			class removeGang
			{
			};
			class updateGang
			{
			};
		};
		class Airdrop
		{
			file="\CL_Server\Functions\Airdrop";
			class generateAirdrop
			{
			};
		};
		class Actions
		{
			file="\CL_Server\Functions\Actions";
			class pickupAction
			{
			};
		};
	};
};
class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F: Civilian
	{
		class EventHandlers;
	};
	class C_man_1: Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init="(_this select 0) execVM ""\CL_Server\fix_headgear.sqf""";
		};
	};
};
