class HaloJumpGui
{
	idd = 5533;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Damien.B, v1.063, #Reweja)
		////////////////////////////////////////////////////////

		class mapGuiBack: IGUIBack
		{
			idc = 2200;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class mapFrame: RscFrame
		{
			idc = 1800;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.476 * safezoneH;
		};
		class haloJumpTitle: RscText
		{
			idc = 1000;
			text = "HALO JUMP"; //--- ToDo: Localize;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.07 * safezoneH;
			tooltip = "Click anywhere on the map to Halo Jump!"; //--- ToDo: Localize;
		};
		class buttonHalo: RscButton
		{
			idc = 1600;
			text = "HALO"; //--- ToDo: Localize;
			x = 0.296562 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.150937 * safezoneW;
			h = 0.056 * safezoneH;


			colorBackground[] = {0,0,0,0.7};
			onButtonClick= "closeDialog 1;[player, uiNamespace getVariable ['TRA_haloCoords', [0,0,0]]] spawn TRA_fnc_haloJump;";
		};
		class buttonCancelHalo: RscButton
		{
			idc = 1601;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.565624 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.056 * safezoneH;

			colorBackground[] = {0,0,0,0.7};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	}
}

/* #Xawuzi
$[
	1.063,
	["HaloJumpGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"mapGuiBack",[1,"",["0.2375 * safezoneW + safezoneX","0.15 * safezoneH + safezoneY","0.525 * safezoneW","0.7 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"mapFrame",[1,"",["0.276875 * safezoneW + safezoneX","0.234 * safezoneH + safezoneY","0.44625 * safezoneW","0.476 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"haloJumpTitle",[1,"HALO JUMP",["0.42125 * safezoneW + safezoneX","0.164 * safezoneH + safezoneY","0.1575 * safezoneW","0.07 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Click anywhere on the map to Halo Jump!","-1"],[]],
	[1600,"buttonHalo",[1,"HALO",["0.296562 * safezoneW + safezoneX","0.752 * safezoneH + safezoneY","0.150937 * safezoneW","0.056 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"buttonCancelHalo",[1,"CANCEL",["0.565624 * safezoneW + safezoneX","0.752 * safezoneH + safezoneY","0.137812 * safezoneW","0.056 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
