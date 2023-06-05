params["_player"];
private _lastHaloTime = _player getVariable ['TRA_lastHalo', diag_tickTime - 500];
private _timeSinceLastHalo = diag_tickTime - _lastHaloTime;
if (_timeSinceLastHalo <= TRA_haloJumpCooldown) exitWith {
	["HaloCooldown", [format["Halo jumping is on cooldown... please wait %1 more seconds!", TRA_haloJumpCooldown - _timeSinceLastHalo]]] call BIS_fnc_showNotification;
};

/* Open Display */
private _display = createDialog ["HaloJumpGui", true];

/* idc codes for each part of display */
private _mapFrame = 1800;
private _btnHalo = 1600;
private _btnCancel = 1601;
private _title = 1000;

/* Main Used Display stored for multiple use later */
private _mainDisplay = (findDisplay 46);

/* Open Map for player */
private _ctrlMap = _display ctrlCreate ["RscMapControl", -1]; 
_ctrlMap ctrlMapSetPosition [0.276875 * safezoneW + safezoneX, 0.234 * safezoneH + safezoneY, 0.44625 * safezoneW, 0.476 * safezoneH]; // effect is immediate 

/* Coords array to pass */
private _defaultCoords = getPosATL _player;
uiNamespace setVariable["TRA_haloCoords", [_defaultCoords select 0, _defaultCoords select 1, TRA_haloJumpHeight]];

_ctrlMap ctrlAddEventHandler['MouseButtonClick', {
	params[ "_map", "_button", "_mouseX", "_mouseY" ];
	private _worldCoords = _map ctrlMapScreenToWorld [_mouseX, _mouseY];
	private _worldX = _worldCoords select 0;
	private _worldY = _worldCoords select 1;

	TRA_haloCoords = [_worldX, _worldY, TRA_haloJumpHeight];
}]