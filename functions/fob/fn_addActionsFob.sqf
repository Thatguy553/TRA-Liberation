params["_fobObject"];

_fobObject addAction [
	"Heal",
	{
		params ["_target", "_caller"];
		[_caller] call TRA_fnc_heal;
	}
];
_fobObject addAction [
	"Deploy FOB",
	{
		params["_target", "_caller"];
		[_caller, _target] call TRA_fnc_buildFob;
	}
];
_fobObject addAction [
	"Open Build Menu",
	{
		params["_target", "_caller"];
		[_caller] call TRA_fnc_buildMenu;
	}
];
_fobObject addAction [
	"Halo Jump",
	{
		params ["_target", "_caller"];
		[_caller] call TRA_fnc_haloMenu;
	}
];
_fobObject addAction[
	"Redeploy",
	{
		params ["_target", "_caller"];
		[_caller] call TRA_fnc_redeployMenu;
	}
];