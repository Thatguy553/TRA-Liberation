class StatisticsGui
{
	idd = 5535;

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Damien.B, v1.063, #Dipoko)
		////////////////////////////////////////////////////////

		class statsBack: IGUIBack
		{
			idc = 2200;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.476 * safezoneH;
		};
		class statsFob: RscText
		{
			idc = 1000;
			text = "Alpha"; //--- ToDo: Localize;
			x = 0.965937 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Statistics for the FOB you are at."; //--- ToDo: Localize;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class supplyImg: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class ammoImg: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class fuelImg: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class supplyNum: RscText
		{
			idc = 1001;
			text = "1000"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current number of supplies at this FOB."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class ammoNum: RscText
		{
			idc = 1002;
			text = "1000"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current number of supplies at this FOB."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class fuelNum: RscText
		{
			idc = 1003;
			text = "1000"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current number of supplies at this FOB."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class RscPicture_1203: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscPicture_1204: RscPicture
		{
			idc = 1204;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscPicture_1205: RscPicture
		{
			idc = 1205;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscPicture_1206: RscPicture
		{
			idc = 1206;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscPicture_1207: RscPicture
		{
			idc = 1207;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class RscPicture_1208: RscPicture
		{
			idc = 1208;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.985625 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class aiStat: RscText
		{
			idc = 1004;
			text = "0/25"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current number of friendly spawned AI."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class heliStat: RscText
		{
			idc = 1005;
			text = "0/5"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current number of friendly built helicopters."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class jetStat: RscText
		{
			idc = 1006;
			text = "0/5"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current number of friendly built Jets."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class aggStat: RscText
		{
			idc = 1007;
			text = "0%"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current Enemy Aggression."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class repStat: RscText
		{
			idc = 1008;
			text = "0%"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current reputation with Civillians."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class intelStat: RscText
		{
			idc = 1009;
			text = "0%"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Current Intel Points."; //--- ToDo: Localize;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
