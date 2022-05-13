#define true 1
#define false 0

class AutoSave_Settings
{
	autoSaveInterval = 15; // Automatic saving interval in minutes default [15]
	lockManualSync = true; // Locks manual sync [true]
	lockSyncTime = 5; // Time in minutes [1] for locking manual sync after automatic saving; ONLY ACTIVE IF lockManualSync is set to true!
	chatInfo = true; // Turn to false if you don´t like to see a saving message, [true] to got a message in system chat
	advancedChatInfo = false; // Turn to false if you don´t like to see extra informations, eg. Manual Saving is now blocked for 1 Minute; ONLY ACTIVE IF chatInfo is set to true!
	waitForManSave = true; // [True] for waiting until manual saves has been completed; (recommended, saves server traffic)
};
