// params["_player", "_fob"];
params["_player"];
private _fob = "";

private _choices = [
	"Light Vehicles",
	"Heavy Vehicles",
	"Aircraft"
] apply {
	[
		[_x],
		[],
		[],
		[],
		_x,
		_x
	]
};

[
	[
		_choices,
		4, // Selects the quadbike by default
		false // Multi select disabled
	],
	"What Type Of Vehicle",
	[{
		params["_player", "_fob"];

		private _success = false;

		try {
			if (_confirmed) exitWith {
				switch (_index) do {
					case 0: {
						_success = [_player, _fob] call TRA_menuLightVeh;
						systemChat (str _success);
						_success
					};
					case 1: {
						_success = [_player, _fob] call TRA_menuHeavyVeh;
						systemChat (str _success);
						_success
					};
					case 2: {
						_success = [_player, _fob] call TRA_menuAircraft;
						systemChat (str _success);
						_success
					};
					default {
						diag_log "[TRA] Build Menu: something went wrong with _index";
						false
					};
				};
			};
		} catch {
			throw _exception;
		};

		systemChat (str _success);
	},
	[_player, _fob]
	],
	"SELECT", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;	


TRA_menuLightVeh = {
	params["_player", "_fob"];
	private _lightVeh = TRA_playerVehicles get "veh_light";

	private _vehicles = _lightVeh apply {
		[
			[getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName")],
			[format[" %1 | %2 | %3", [(_x select 1) select 0, 6] call TRA_fnc_format, [(_x select 1) select 1, 6] call TRA_fnc_format, [(_x select 1) select 2, 6] call TRA_fnc_format]],
			[getText(configFile >> "CfgVehicles" >> (_x select 0) >> "picture")],
			[],
			getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName"),
			str _x,
			getNumber(configFile >> "CfgVehicles" >> (_x select 0) >> "scope")
		]
	};

	_vehicles = [[["Vehicle:"],[" Supply |  Ammo  |  Fuel  "],[],[],"Header","2"]] + _vehicles;
	[
		[
			_vehicles,
			4, // Selects the quadbike by default
			false // Multi select disabled
		],
		"Vehicle selection",
		[{
			params["_player", "_fob"];
			private _parsedData = parseSimpleArray _data;
			private _success = [_player, _parsedData select 0, _parsedData select 1, _fob] spawn TRA_fnc_build;
			_success
		},
		[_player, _fob]
		],
		"BUILD", // reverts to default
		""  // reverts to default, disable cancel option
	] call CAU_UserInputMenus_fnc_listbox;	
};

TRA_menuHeavyVeh = {
	params["_player"];
	private _lightVeh = TRA_playerVehicles get "veh_heavy";

	private _vehicles = _lightVeh apply {
		[
			[getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName")],
			[format[" %1 | %2 | %3", [(_x select 1) select 0, 6] call TRA_fnc_format, [(_x select 1) select 1, 6] call TRA_fnc_format, [(_x select 1) select 2, 6] call TRA_fnc_format]],
			[getText(configFile >> "CfgVehicles" >> (_x select 0) >> "picture")],
			[],
			getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName"),
			str _x,
			getNumber(configFile >> "CfgVehicles" >> (_x select 0) >> "scope")
		]
	};

	_vehicles = [[["Vehicle:"],["Supply  | Ammo    | Fuel   "],[],[],"Header","2"]] + _vehicles;
	[
		[
			_vehicles,
			4, // Selects the quadbike by default
			false // Multi select disabled
		],
		"Vehicle selection",
		[{
			params["_player"];
			private _parsedData = parseSimpleArray _data;
			private _success = [_player, _parsedData select 0, _parsedData select 1, false] spawn TRA_fnc_build;
			_success
		},
		[_player]
		],
		"BUILD", // reverts to default
		""  // reverts to default, disable cancel option
	] call CAU_UserInputMenus_fnc_listbox;	
};

TRA_menuAircraft = {
	params["_player"];
	private _lightVeh = TRA_playerVehicles get "veh_aircraft";

	private _vehicles = _lightVeh apply {
		[
			[getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName")],
			[format[" %1 | %2 | %3", [(_x select 1) select 0, 6] call TRA_fnc_format, [(_x select 1) select 1, 6] call TRA_fnc_format, [(_x select 1) select 2, 6] call TRA_fnc_format]],
			[getText(configFile >> "CfgVehicles" >> (_x select 0) >> "picture")],
			[],
			getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName"),
			str _x,
			getNumber(configFile >> "CfgVehicles" >> (_x select 0) >> "scope")
		]
	};

	_vehicles = [[["Vehicle:"],["Supply  | Ammo    | Fuel   "],[],[],"Header","2"]] + _vehicles;
	[
		[
			_vehicles,
			4, // Selects the quadbike by default
			false // Multi select disabled
		],
		"Vehicle selection",
		[{
			params["_player"];
			private _parsedData = parseSimpleArray _data;
			private _success = [_player, _parsedData select 0, _parsedData select 1, false] spawn TRA_fnc_build;
			_success
		},
		[_player]
		],
		"BUILD", // reverts to default
		""  // reverts to default, disable cancel option
	] call CAU_UserInputMenus_fnc_listbox;	
};