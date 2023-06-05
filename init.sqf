// Init Configs
[] call compileFinal preprocessFileLineNumbers "tra_liberation_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\init_presets.sqf";

// Init Zones
[] call TRA_fnc_initZones;
// [] call TRA_fnc_addCurators;

// Init addActions 

[TRA_playerFobPrefix] call TRA_fnc_addActions;


