class Socket_Reciever {
	tag = "SOCK";
	class SQL_Socket {
		file = "core\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class requestReceived {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
	};
};

class CL_Client_Core {
	tag = "CL";

	class Master_Directory {
		file = "core";
		class initCiv {};
		class initCop {};
		class initMedic {};
		class setupActions {};
		class setupEVH {};
		class survival {};
		class welcomeNotification {};
	};

	class GUI {
		file = "gui\scripts";
		class initTenCodes {};
		class showNotification {};
	};

	class Market {
		file = "core\market";
		class openMarketView {};
		class refreshMarketView {};
		class marketShortView {};
		class marketBuy {};
		class marketSell {};
		class marketGetBuyPrice {};
		class marketGetSellPrice {};
		class marketConfiguration {};
		class marketReset {};
		class marketChange {};
		class marketGetRow {};
		class marketGetPriceRow {};
		class marketSetPriceRow {};
	};

	class vAH {
		file = "core\vAH";
		class vAH_load {};
		class vAH_buy {};
		class vAH_reciever {};
		class vAH_loadInventory {};
		class vAH_sell {};
		class vAH_checkItem {};
		class vAH_takeBack {};
		class vAH_select {};
	};
/*
	class Map {
		file = "core\map";
		class initMap {postInit = 1;};
		class setupInfoStand {};
	};

	class AutoSave {
		file = "core\autosave\scripts";
		class autoSaveInv {};
	};
*/
	class Actions {
		file = "core\actions";
		class arrestAction {};
		class captureCartel {};
		class captureCartelUpdate {};
		class buyLicense {};
		class captureHideout {};
		class catchFish {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gather {};
		class getDPMission {};
		class gutAnimal {};
		class healHospital {};
		class impoundAction {};
		class mine {};
		class packupSpikes {};
		class pickupItem {};
		class pickupMoney {};
		class postBail {};
		class processAction {};
		class pulloutAction {};
		class pushVehicle {};
		class putInCar {};
		class removeContainer {};
		class repairTruck {};
		class restrainAction {};
		class robAction {};
		class searchAction {};
		class searchVehAction {};
		class seizePlayerAction {};
		class serviceChopper {};
		class stopEscorting {};
		class storeVehicle {};
		class surrender {};
		class ticketAction {};
		class unrestrain {};
		class robShops {};
		class robCasino {};
		class robWepDepo {};
		class crushAction {};
		class newsBroadcast {};
		class copRestrainAction {};
	};
/*
	class Nightclub {
		file = "core\nightclub";
		class nclights {};
		class ncLightsOn {};
		class ncmusic {};
		class ncstage {};
		class ncsmoke {};
		class ncflash {};
		class ncFlashOn {};
	};
*/
	class Casino {
		file = "core\casino";
		class playSlotMachine {};
		class slotMachineRandomizer {};
		class slotMachineRewards {};
	};

	class Admin {
		file = "core\admin";
		class adminCompensate {};
		class adminDebugCon {};
		class adminFreeze {};
		class admingetID {};
		class adminGodMode {};
		class adminid {};
		class admininfo {};
//		class adminInteractionMenu {};
		class adminMarkers {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDestroy {};
		class adminDeleteVehicle {};
		class adminHeal {};
		class adminRepair {};
	};

	class scripts {
		file = "core\scripts";
		class prisonFood {};
		class earPlugs {};
		class relinquishLicense{};
		class getFaction {};
		class takeOrgans {};
		class hasOrgan {};
		class triggerBroadcast {};
		class takeFlesh {};
		class hasFlesh {};
		class goodBye {};
		class pumpOil {};
		class seatBelt {};
		class skyDive {};
		class addLicenses {};
		class zoneTrigger {};
	};

	class EMP {
		file = "core\scripts\emp";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
		class prisonEMP {};
		class prisonWarn {};
	};

	class Civilian {
		file = "core\civilian";
		class civLoadout {};
		class civMarkers {};
		class demoChargeTimer {};
		class freezePlayer {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class removeLicenses {};
		class robPerson {};
		class robReceive {};
		class tazed {};
		class handleDowned {};
		class metalDetector {};
	};

	class Config {
		file = "core\config";
		class houseConfig {};
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
	};

	class Cop {
		file = "core\cop";
		class bountyReceive {};
		class containerInvSearch {};
		class copInteractionMenu {};
		class copLights {};
		class copLoadout {};
		class copMarkers {};
		class copSearch {};
		class copSiren {};
		class copSiren2 {};
		class doorAnimate {};
		class fedCamDisplay {};
		class licenseCheck {};
		class licensesRead {};
		class questionDealer {};
		class radar {};
		class repairDoor {};
		class restrain {};
		class searchClient {};
		class seizeClient {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class wantedGrab {};
		class revokeLicense {};
		class undercover {};
		class randomNameGenerator {};
		class copLicenseMenu {};
		class copRestrain {};
		class copUnrestrain {};
		class copGiveLicenses {};
		class copGiveLicenseMenu {};
		class copLicenseCheck {};
		class copLicensesRead {};
		class copRemoveLicenses {};
		class copRemoveLicenseMenu {};
		class copDoors {};
		class copUniformUpdate {};
	};

	class CopPlaceables {
		file = "core\cop\placeables";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemove {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
	};

	class Crafting {
		file = "core\crafting";
		class craftingConfig {};
		class craftingList {};
		class craftingMenu {};
		class craftItem {};
		class getCraftable {};
	};

	class Dialog_Controls {
		file = "dialog\function";
		class bankDeposit {};
		class bankTransfer {};
		class bankWithdraw {};
		class displayHandler {};
		class gangDeposit {};
		class gangWithdraw {};
		class garageLBChange {};
		class impoundMenu {};
		class progressBar {};
		class safeFix {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class sellGarage {};
		class setMapPosition {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class unimpound {};
		class vehicleGarage {};
		class wireTransfer {};
	};

	class Functions	{
		file = "core\functions";
		class accType {};
		class AAN {};
		class actionKeyHandler {};
		class animSync {};
		class calWeightDiff {};
		class captureAlert {};
		class clearVehicleAmmo {};
		class dropItems {};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class isDamaged {};
		class getDamage {};
		class giveDiff {};
		class handleDamage {};
		class handleInv {};
		class handleItem {};
		class hideObj {};
		class hudSetup {};
		class hudUpdate {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isnumeric {};
		class isUIDActive {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class nearATM {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class onTakeItem {};
		class playerCount {};
		class playerSkins {};
		class playerTags {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class receiveMoney {};
		class revealObjects {};
		class safeZones {};
		class saveGear {};
		class searchPosEmpty {};
		class simDisable {};
		class stripDownPlayer {};
		class teleport {};
		class whereAmI {};
		class carAlarmSound {};
		class seizeObjects {};
		class vdmed {};
		class jihad {};
		class welcome {};
		class postNewsBroadcast {};
		class setDamage {};
		class markers {};
		class airDrop {};
		class randomRound {};
		class speaking {};
	};

	class Gangs	{
		file = "core\gangs";
		class createGang {};
		class gangCreated {};
		class gangDisband {};
		class gangDisbanded {};
		class gangInvite {};
		class gangInvitePlayer {};
		class gangKick {};
		class gangLeave {};
		class gangMenu {};
		class gangNewLeader {};
		class gangUpgrade {};
		class initGang {};
	};

	class Housing {
		file = "core\housing";
		class buyHouse {};
		class containerMenu {};
		class copBreakDoor {};
		class copHouseOwner {};
		class garageRefund {};
		class getBuildingPositions {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class placeContainer {};
		class PlayerInBuilding {};
		class sellHouse {};
		class sellHouseGarage {};
		class raidHouse {};
		class buyHouseGarage{};
	};

	class Items	{
		file = "core\items";
		class blastingCharge {};
		class boltcutter {};
		class defuseKit {};
		class empGrenade {};
		class flashbang {};
		class jerrycanRefuel {};
		class jerryRefuel {};
		class lockpick {};
		class spikeStrip {};
		class skeletonKey {};
		class GPSTracker {};
		class cocaine {};
		class heroine {};
		class rum {};
		class moonshine {};
		class weed {};
		class placestorage {};
		class storageBox {};
		class speedBomb {};
	};

	class Medical_System {
		file = "core\medical";
		class bloodbag {};
		class bloodbagself {};
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
		class newLifeRule {};
		class deadBloodEffect {};
		class medicUniformUpdate {};
	};

	class Network {
		file = "core\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class say3D {};
		class setFuel {};
		class soundDevice {};
	};

	class TreasureHunting {
		file ="core\jobs\Treasure";
		class Appraise {};
		class SearchWreck {};
		class TreasureHunt {};
		class TreasureHuntInit {};
	};

	class Player_Menu {
		file = "core\pmenu";
		class cellphone {};
		class giveItem {};
		class giveMoney {};
		class keyDrop {};
		class keyGive {};
		class keyMenu {};
		class p_openMenu {};
		class p_updateMenu {};
		class pardon {};
		class removeItem {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class settingsMenu {};
		class upcomingFeature {};
		class updateViewDistance {};
		class usefullinks {};
		class useItem {};
		class wantedAddP {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
		class openMainMenu {};
	};

	class Shops	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class chopShopClaim {};
		class clothingFilter {};
		class clothingMenu {};
		class fuelLBchange {};
		class fuelStatOpen {};
		class levelCheck {};
		class vehicleShop3DPreview {};
		class vehicleShopBuy {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class vehicleShopLBChange {};
		class vehicleShopMenu {};
		class virt_buy {};
		class virt_menu {};
		class virt_sell {};
		class virt_update {};
		class weaponShopAccs {};
		class weaponShopBuySell {};
		class weaponShopFilter {};
		class weaponShopMags {};
		class weaponShopMenu {};
		class weaponShopSelection {};
	};

	class Vehicle {
		file = "core\vehicle";
		class addVehicle2Chain {};
		class colorVehicle {};
		class deviceMine {};
		class FuelRefuelcar {};
		class fuelStore {};
		class fuelSupply {};
		class lockVehicle {};
		class openInventory {};
		class vehiclecolor3DRefresh {};
		class vehicleOwners {};
		class vehicleWeight {};
		class vehInventory {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vInteractionMenu {};
	};
	
	class CivTieing {
		file = "core\civilian\CivTieing";
		class gagAction {};					
		class gagged {};
		class removeGagAction {};
		class tieing {};
		class tieingAction {};
		class tieingActionb {};
		class tieingb {};
		class untie {};
		class untieb {};
	};
};
