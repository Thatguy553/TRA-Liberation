params["_player"];
private _lastHaloTime = _player getVariable ['TRA_lastHalo', diag_tickTime - 500];
private _timeSinceLastHalo = diag_tickTime - _lastHaloTime;
if (_timeSinceLastHalo <= TRA_haloJumpCooldown) exitWith {
	["HaloCooldown", [format["Halo jumping is on cooldown... please wait %1 more minutes!", round((TRA_haloJumpCooldown - _timeSinceLastHalo) / 60)]]] call BIS_fnc_showNotification;
};

/* Open Display */
private _display = createDialog ["HaloJumpGui", false];
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
uiNamespace setVariable["TRA_haloVehicle", objNull];

_ctrlMap ctrlAddEventHandler['MouseButtonClick', {
	params[ "_map", "_button", "_mouseX", "_mouseY" ];
	private _worldCoords = _map ctrlMapScreenToWorld [_mouseX, _mouseY];
	private _worldX = _worldCoords select 0;
	private _worldY = _worldCoords select 1;

	private _display = uiNamespace getVariable ["HALO_display", objNull];
	private _vehicleCheckBox = cbChecked (_display displayCtrl 2801);
	private _curVeh = uiNamespace getVariable["TRA_haloVehicle", objNull];
	systemChat (str _curVeh);
	if (_vehicleCheckBox && isNull _curVeh) then {
		[player] call TRA_selectHaloVeh;
	};
	
	"halo_marker" setMarkerPosLocal _worldCoords;
	uiNamespace setVariable["TRA_haloCoords", [_worldX, _worldY, TRA_haloJumpHeight]];
}];

TRA_selectHaloVeh = {
	params["_player"];
	private _lightVeh = _player nearEntities [["Car", "Motorcycle", "Tank"], 100];
	systemChat format["Vehicle Array: %1", str _lightVeh];

	private _vehicles = _lightVeh apply {
		[
			[getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName")],
			[],
			[getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture")],
			[],
			getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
			typeOf _x,
			getNumber(configFile >> "CfgVehicles" >> typeOf _x >> "scope")
		]
	};
	[
		[
			_vehicles,
			0,
			false // Multi select disabled
		],
		"Vehicle selection",
		[{
			params["_lightVeh"];
			if (_data isNotEqualTo "") then {
				systemChat (str _data);
				uiNamespace setVariable["TRA_haloVehicle", _lightVeh select _index];
			};
		},
		[_lightVeh]
		],
		"SELECT", // reverts to default
		""  // reverts to default, disable cancel option
	] call CAU_UserInputMenus_fnc_listbox;	
};