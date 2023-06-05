class RedeployGui
{
	idd = 5534;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Damien.B, v1.063, #Vahuje)
		////////////////////////////////////////////////////////

		class redepBack: IGUIBack
		{
			idc = 2200;
			x = 0.42125 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.532 * safezoneH;
		};
		class redepLoadout: RscCombo
		{
			idc = 2100;
			text = "Loadout1"; //--- ToDo: Localize;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Choose your spawning loadout here!"; //--- ToDo: Localize;

			onLBSelChanged = "uiNamespace setVariable['comboLoadoutIndex', _this select 1];";
		};
		class redepBases: RscListbox
		{
			idc = 1500;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.308 * safezoneH;

			onLBSelChanged = "uiNamespace setVariable['listBoxBaseIndex', _this select 1];";
		};
		class redepButton: RscButton
		{
			idc = 1600;
			text = "DEPLOY"; //--- ToDo: Localize;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.056 * safezoneH;

			onButtonClick = "closeDialog 1; [player] call TRA_fnc_redeploy;";
		};
		class redepTitle: RscText
		{
			idc = 1000;
			text = "REDEPLOY"; //--- ToDo: Localize;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Select where you want to redeploy!"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	}

}
