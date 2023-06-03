/* ----------------------------------------------------------------------------
Function: TRA_fnc_addCurator

Description:
    Function adds zeus permissions to the provided player.

Parameters:
    _player - The player/unit object.

Returns:
    Nothing

Examples:
    (begin example)
	[player] call TRA_fnc_addCurator;
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */
params["_player"];
diag_log format["[TRA] Creating %1 curator modules", count(TRA_whitelist)];

[[_player], {
  	params ["_player"];
	_grp = createGroup sideLogic;
	_module = _grp createUnit ["ModuleCurator_F", [1,1,1], [], 0, "NONE"];
	_module addCuratorEditableObjects [allUnits, true];
	_module addCuratorEditableObjects [vehicles, true];
	_module addCuratorAddons activatedAddons;
	_player assignCurator _module;
}] remoteExec ["call", 2];