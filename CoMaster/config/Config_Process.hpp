class ProcessAction {
/*
*   class:
*	   MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*	   MaterialsGive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*	   Text (Progess Bar Text) = Localised String
*	   NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*
*	   MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*	   MaterialsGive[] = {{"diamond_cut",1}};
*	   Text = "STR_Process_Example";
*	   //ScrollText = "Process Example";
*	   NoLicenseCost = 4000;
*	};
*
*/
	class oil {
		MaterialsReq[] = {{"oil_unprocessed",1}};
		MaterialsGive[] = {{"oil_processed",1}};
		Text = "STR_Process_Oil";
		//ScrollText = "Process Oil";
		NoLicenseCost = 100000;
	};

	class sugar {
		MaterialsReq[] = {{"sugar_unprocessed",1}};
		MaterialsGive[] = {{"sugar_processed",1}};
		Text = "STR_Process_Sugar";
		//ScrollText = "Process Sugar Cane";
		NoLicenseCost = 100000;
	};
	
	class gravel {
		MaterialsReq[] = {{"gravel",1}};
		MaterialsGive[] = {{"refined_gravel",1}};
		Text = "STR_Process_Gravel";
		//ScrollText = "Process Gravel";
		NoLicenseCost = 0;
	};

	class aluminium {
		MaterialsReq[] = {{"aluminium_unrefined",1}};
		MaterialsGive[] = {{"aluminium_refined",1}};
		Text = "STR_Refine_Aluminium";
		//ScrollText = "Refine Aluminium";
		NoLicenseCost = 100000;
	};

	class mahogany {
		MaterialsReq[] = {{"mahogany_unprocessed",1}};
		MaterialsGive[] = {{"mahogany_processed",1}};
		Text = "STR_Process_Mahogany";
		//ScrollText = "Process Mahogany";
		NoLicenseCost = 100000;
	};

	class heroin {
		MaterialsReq[] = {{"heroin_unprocessed",1}};
		MaterialsGive[] = {{"heroin_processed",1}};
		Text = "STR_Process_Heroin";
		//ScrollText = "Process Heroin";
		NoLicenseCost = 100000;
	};

	class copper {
		MaterialsReq[] = {{"copper_unrefined",1}};
		MaterialsGive[] = {{"copper_refined",1}};
		Text = "STR_Refine_Copper";
		//ScrollText = "Refine Copper";
		NoLicenseCost = 100000;
	};

	class stone {
		MaterialsReq[] = {{"stone_unrefined",1}};
		MaterialsGive[] = {{"stone_refined",1}};
		Text = "STR_Refine_Stone";
		//ScrollText = "Refine Stone";
		NoLicenseCost = 100000;
	};

	class cocaine {
		MaterialsReq[] = {{"cocaine_unprocessed",1}};
		MaterialsGive[] = {{"cocaine_processed",1}};
		Text = "STR_Process_Cocaine";
		//ScrollText = "Process Cocaine";
		NoLicenseCost = 100000;
	};

	class marijuana {
		MaterialsReq[] = {{"cannabis",1}};
		MaterialsGive[] = {{"marijuana",1}};
		Text = "STR_Process_Marijuana";
		//ScrollText = "Process Marijuana";
		NoLicenseCost = 100000;
	};

	class platinum {
		MaterialsReq[] = {{"platinum_unrefined",1}};
		MaterialsGive[] = {{"platinum_refined",1}};
		Text = "STR_Refine_Platinum";
		//ScrollText = "Refine Platinum";
		NoLicenseCost = 100000;
	};


	class soup {
		MaterialsReq[] = {{"discuss_raw",1},{"arowana_raw",1},{"datnoid_raw",1},{"stingray_raw",1},{"pufferfish_raw",1}};
		MaterialsGive[] = {{"exotic_soup",1}};
		Text = "STR_Cook_Fish";
		//ScrollText = "Cook Fish";
		NoLicenseCost = 100000;
	};

	class turtle_soup {
		MaterialsReq[] = {{"turtle_raw",1}};
		MaterialsGive[] = {{"turtle_soup",1}};
		Text = "STR_Cook_Fish";
		//ScrollText = "Cook Fish";
		NoLicenseCost = 100000;
	};

	class rum {
		MaterialsReq[] = {{"mature_sugar",1},{"empty_cask",1}};
		MaterialsGive[] = {{"rum_cask",1}};
		Text = "STR_Process_MatureSugar";
		//ScrollText = "Process Mature Sugar";
		NoLicenseCost = 100000;
	};

	class kidney_trade {
		MaterialsReq[] = {{"kidney",1}};
		MaterialsGive[] = {{"emerald",1}};
		Text = "STR_Trading_Kidneys";
		//ScrollText = "Trade Kidneys";
		NoLicenseCost = 0;
	};
	
	class methamphetamine {
		MaterialsReq[] = {{"hydrochloricacid",1},{"ephedrine",1},{"sodiumhydroxide",1}};
		MaterialsGive[] = {{"methamphetamine",1}};
		Text = "STR_Process_Meth";
		//ScrollText = "Process Meth";
		NoLicenseCost = 100000;
	};

	class uraniumA {
		MaterialsReq[] = {{"uraniumA",1}};
		MaterialsGive[] = {{"uraniumB",1}};
		Text = "STR_Clean_Uranium";
		//ScrollText = "Clean Uranium";
		NoLicenseCost = 999999;
	};

	class uraniumB {
		MaterialsReq[] = {{"uraniumB",1}};
		MaterialsGive[] = {{"uraniumC",1}};
		Text = "STR_Distil_Uranium";
		//ScrollText = "Distil Uranium";
		NoLicenseCost = 999999;
	};

	class uraniumC {
		MaterialsReq[] = {{"uraniumC",1}};
		MaterialsGive[] = {{"uraniumD",1}};
		Text = "STR_Separate_Uranium";
		//ScrollText = "Separate Uranium";
		NoLicenseCost = 999999;
	};

	class uraniumD {
		MaterialsReq[] = {{"uraniumD",1}};
		MaterialsGive[] = {{"uraniumP",1}};
		Text = "STR_Dry_Uranium";
		//ScrollText = "Dry Uranium";
		NoLicenseCost = 999999;
	};
};
