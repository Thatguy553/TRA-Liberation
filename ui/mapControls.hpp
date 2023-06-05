#include "\a3\ui_f\hpp\defineCommonGrids.inc"
class HaloJumpGui
{
	idd = 5533;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Damien.B, v1.063, #Dibele)
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
			align = "CENTER";
			style = 0x02;
			valign = "top";
			tooltip = "Click anywhere on the map to Halo Jump!"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
		};
		class buttonHalo: RscButton
		{
			idc = 1600;
			onButtonClick = "closeDialog 1;[player, uiNamespace getVariable ['TRA_haloCoords', [0,0,0]]] spawn TRA_fnc_haloJump;";

			text = "HALO"; //--- ToDo: Localize;
			x = 0.296562 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.150937 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class buttonCancelHalo: RscButton
		{
			idc = 1601;

			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.565625 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.056 * safezoneH;
      
			onButtonClick = "closeDialog 2;";
		};
		class bringSquadChkBox: RscCheckbox
		{
			idc = 2800;
			x = 0.467187 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;

			onCheckedChanged = "uiNamespace setVariable['TRA_haloSquadBool', _this select 1];"
		};
		class chkBoxOneText: RscText
		{
			idc = 1001;
			text = "Bring Squad With"; //--- ToDo: Localize;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Check this box to bring your squad within 10m of you in the halo"; //--- ToDo: Localize;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class bringVehicleChkBox: RscCheckbox
		{
			idc = 2801;
			x = 0.467187 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
			
			onCheckedChanged = "uiNamespace setVariable['TRA_haloVehicleBool', _this select 1];"
		};
		class chkBoxTwoText: RscText
		{
			idc = 1001;
			text = "Bring Vehicle With"; //--- ToDo: Localize;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.780 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Check this box to bring the vehicle you are in with you in the halo"; //--- ToDo: Localize;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	}
}

/* #Dibele
$[
	1.063,
	["HaloJumpGui",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"mapGuiBack",[1,"",["0.2375 * safezoneW + safezoneX","0.15 * safezoneH + safezoneY","0.525 * safezoneW","0.7 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2200;"]],
	[1800,"mapFrame",[1,"",["0.276875 * safezoneW + safezoneX","0.234 * safezoneH + safezoneY","0.44625 * safezoneW","0.476 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1800;"]],
	[1000,"haloJumpTitle",[1,"HALO JUMP",["0.42125 * safezoneW + safezoneX","0.164 * safezoneH + safezoneY","0.1575 * safezoneW","0.07 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Click anywhere on the map to Halo Jump!","-1"],["idc = 1000;"]],
	[1600,"buttonHalo",[1,"HALO",["0.296562 * safezoneW + safezoneX","0.752 * safezoneH + safezoneY","0.150937 * safezoneW","0.056 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1600;","onButtonClick = |closeDialog 1;[player, uiNamespace getVariable [^TRA_haloCoords^, [0,0,0]]] spawn TRA_fnc_haloJump;|;"]],
	[1601,"buttonCancelHalo",[1,"CANCEL",["0.565625 * safezoneW + safezoneX","0.752 * safezoneH + safezoneY","0.137812 * safezoneW","0.056 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1601;"]],
	[2800,"bringSquadChkBox",[1,"",["0.467187 * safezoneW + safezoneX","0.738 * safezoneH + safezoneY","0.013125 * safezoneW","0.028 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"chkBoxOneText",[1,"Bring Squad With",["0.480312 * safezoneW + safezoneX","0.738 * safezoneH + safezoneY","0.065625 * safezoneW","0.028 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check this box to bring your squad within 10m of you in the halo","0.7"],[]],
	[2801,"bringVehicleChkBox",[1,"",["0.467187 * safezoneW + safezoneX","0.78 * safezoneH + safezoneY","0.013125 * safezoneW","0.028 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"bringVehicleChkBox",[1,"Bring Vehicle With",["0.480312 * safezoneW + safezoneX","0.78 * safezoneH + safezoneY","0.065625 * safezoneW","0.028 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Check this box to bring the vehicle you are in to the halo.","0.7"],[]]
]
*/

