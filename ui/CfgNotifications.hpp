class CfgNotifications
{
	class Default
	{
		title = "";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1};	// Icon and text color
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {};		// Required difficulty settings. All listed difficulties has to be enabled
	};

	class BuildSuccess
	{
		title = "Build Success!";
		iconPicture = "a3\3den\data\displays\display3dentutorial\picturecompleted_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {0,1,0,1};	// Icon and text color
	};
	
	class BuildFailed
	{
		title = "Build Failed!";
		iconPicture = "a3\3den\data\attributes\taskstates\failed_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1,0,0,1};	// Icon and text color
	};
	
	class BuildCanceled
	{
		title = "Build Canceled!";
		iconPicture = "a3\3den\data\attributes\taskstates\failed_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1,0,0,1};	// Icon and text color
	};

	class HaloJumping
	{
		title = "Halo Jumping!";
		iconPicture = "a3\air_f_beta\parachute_01\data\ui\map_parachute_01_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {0,1,0,1};	// Icon and text color
	}

	class HaloCooldown
	{
		title = "Halo Jump Cooldown!";
		iconPicture = "a3\ui_f\data\igui\rsctitles\mpprogress\timer_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1,0,0,1};	// Icon and text color
	}
};