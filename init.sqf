// Init Configs
[] call compileFinal preprocessFileLineNumbers "tra_liberation_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\init_presets.sqf";
[] call compileFinal preprocessFileLineNumbers "tra_objectInits.sqf";

// Init Zones
[] call TRA_fnc_initZones;
// Init Carrier
[] call TRA_fnc_loadCarrier;



