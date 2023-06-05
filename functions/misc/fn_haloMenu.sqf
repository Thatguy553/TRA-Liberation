params["_player"];
private _lastHaloTime = _player getVariable ['TRA_lastHalo', diag_tickTime - 500];
private _timeSinceLastHalo = diag_tickTime - _lastHaloTime;
if (_timeSinceLastHalo <= TRA_haloJumpCooldown) exitWith {
	["HaloCooldown", [format["Halo jumping is on cooldown... please wait %1 more seconds!", TRA_haloJumpCooldown - _timeSinceLastHalo]]] call BIS_fnc_showNotification;
};

/* Open Display */
private _display = createDialog ["HaloJumpGui", true];
uiNamespace setVariable ["HALO_display", _display];

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
uiNamespace setVariable["TRA_haloCoords", [0, 0, 0]];
createMarkerLocal ["halo_marker", position player];
"halo_marker" setMarkerTypeLocal "Select";
"halo_marker" setMarkerColorLocal "ColorGreen";

_ctrlMap ctrlAddEventHandler['MouseButtonClick', {
	params[ "_map", "_button", "_mouseX", "_mouseY" ];
	private _worldCoords = _map ctrlMapScreenToWorld [_mouseX, _mouseY];
	private _worldX = _worldCoords select 0;
	private _worldY = _worldCoords select 1;

	private _display = uiNamespace getVariable ["HALO_display", objNull];

	/* Controls for the Infantry and Vehicle bring with checkboxes */
	private _infantryCheckBox = cbChecked (_display displayCtrl 2800);
	private _vehicleCheckBox = cbChecked (_display displayCtrl 2801);

	systemChat (str _infantryCheckBox);
	systemChat (str _vehicleCheckBox);

	"halo_marker" setMarkerPosLocal _worldCoords;
	uiNamespace setVariable["TRA_haloCoords", [_worldX, _worldY, TRA_haloJumpHeight]];
}];