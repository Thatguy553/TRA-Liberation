params["_player", "_position"];
private _jumpDelay = 3; // Seconds

["HaloJumping", [format["Halo Jumping! Please wait %1 seconds...", _jumpDelay]]] call BIS_fnc_showNotification;
sleep _jumpDelay;
playSound ['FlyBy', false, 0];
_player setVariable ['TRA_lastHalo', diag_tickTime];
[_player] call bocr_main_fnc_actionOnChest;
_player addBackpack "B_Parachute";

_player setPosATL _position;