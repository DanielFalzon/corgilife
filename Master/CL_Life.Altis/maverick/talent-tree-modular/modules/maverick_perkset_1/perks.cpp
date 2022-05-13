// -- Faster gathering
class perk_gathering_1 {
	displayName = "Gathering Speed";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to gather materials more efficiently<br/><br/><t color='#10FF45'>+1 faster gathering</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherIncrease_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gathering_2 {
	displayName = "Gathering Speed 2";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_gathering_1";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Learn to gather materials more efficiently<br/><br/><t color='#10FF45'>+2 faster gathering</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherIncrease_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gathering_3 {
	displayName = "Gathering Speed 3";
	requiredPerkPoints = 2;
	requiredLevel = 3;
	requiredPerk = "perk_gathering_2";
	subtitle = "Level 3 Required, 2 Perk Points";
	description = "Learn to gather materials more efficiently<br/><br/><t color='#10FF45'>+3 faster gathering</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherIncrease_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Faster lockpicking
class perk_locksmith_1 {
	displayName = "Locksmith";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>2x faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_2 {
	displayName = "Locksmith 2";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_locksmith_1";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>3x faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_3 {
	displayName = "Locksmith 3";
	requiredPerkPoints = 3;
	requiredLevel = 3;
	requiredPerk = "perk_locksmith_2";
	subtitle = "Level 3 Required, 3 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>4x faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Lockpick Success Ratio
class perk_locksmithMastery_1 {
	displayName = "Locksmith Mastery";
	requiredPerkPoints = 4;
	requiredLevel = 4;
	requiredPerk = "perk_locksmith_3";
	subtitle = "Level 4 Required, 4 Perk Points";
	description = "Learn to pick locks more efficiently and increase success chance on vehicles<br/><br/><t color='#10FF45'>+10% Higher success chance</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmithMastery_2 {
	displayName = "Locksmith Mastery 2";
	requiredPerkPoints = 4;
	requiredLevel = 5;
	requiredPerk = "perk_locksmithMastery_1";
	subtitle = "Level 5 Required, 4 Perk Points";
	description = "Learn to pick locks more efficiently and increase success chance on vehicles<br/><br/><t color='#10FF45'>+25% Higher success chance</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Faster mining
class perk_mining_1 {
	displayName = "Mining Speed";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to mine materials more efficiently<br/><br/><t color='#10FF45'>+1 faster mining</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_mineIncrease_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_mining_2 {
	displayName = "Mining Speed 2";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_mining_1";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Learn to mine materials more efficiently<br/><br/><t color='#10FF45'>+2 faster mining</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_mineIncrease_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_mining_3 {
	displayName = "Mining Speed 3";
	requiredPerkPoints = 3;
	requiredLevel = 3;
	requiredPerk = "perk_mining_2";
	subtitle = "Level 3 Required, 3 Perk Points";
	description = "Learn to mine materials more efficiently<br/><br/><t color='#10FF45'>+3 faster mining</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_mineIncrease_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Paycheck
class perk_paycheck_1 {
	displayName = "Paycheck";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+25% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_2 {
	displayName = "Paycheck 2";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_paycheck_1";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+50% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_3 {
	displayName = "Paycheck 3";
	requiredPerkPoints = 3;
	requiredLevel = 3;
	requiredPerk = "perk_paycheck_2";
	subtitle = "Level 3 Required, 3 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+75% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_4 {
	displayName = "Paycheck 4";
	requiredPerkPoints = 4;
	requiredLevel = 4;
	requiredPerk = "perk_paycheck_3";
	subtitle = "Level 4 Required, 4 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+100% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_4.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Faster processing
class perk_processing_1 {
	displayName = "Processing Speed";
	requiredPerkPoints = 2;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "Level 1 Required, 2 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>2x faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_2 {
	displayName = "Processing Speed 2";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_processing_1";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>3x faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_3 {
	displayName = "Processing Speed 3";
	requiredPerkPoints = 2;
	requiredLevel = 3;
	requiredPerk = "perk_processing_2";
	subtitle = "Level 3 Required, 2 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>4x faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Weapon related perks
class perk_gunsspecialist_lessRecoil_1 {
	displayName = "Recoil Compensation";
	requiredPerkPoints = 3;
	requiredLevel = 3;
	requiredPerk = "";
	subtitle = "Level 3 Required, 3 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-5% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_2 {
	displayName = "Recoil Compensation 2";
	requiredPerkPoints = 3;
	requiredLevel = 4;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "Level 4 Required, 3 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-10% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_3 {
	displayName = "Recoil Compensation 3";
	requiredPerkPoints = 3;
	requiredLevel = 5;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "Level 5 Required, 3 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-15% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_4 {
	displayName = "Recoil Compensation 4";
	requiredPerkPoints = 3;
	requiredLevel = 6;
	requiredPerk = "perk_gunsspecialist_lessRecoil_3";
	subtitle = "Level 6 Required, 3 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-20% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_4.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_5 {
	displayName = "Recoil Compensation 5";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_gunsspecialist_lessRecoil_4";
	subtitle = "Level 7 Required, 3 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-25% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_5.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};