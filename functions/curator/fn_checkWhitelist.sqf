/* ----------------------------------------------------------------------------
Function: TRA_fnc_checkWhitelist

Description:
    Function checks if player steamID is contained within the TRA_whitelist array.

Parameters:
    _player - The player/unit object.

Returns:
    Boolean

Examples:
    (begin example)
	[player] call TRA_fnc_checkWhitelist;
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */
params["_player"];

if ((getPlayerUID _player) in TRA_whitelist) exitWith {
	true
};
false