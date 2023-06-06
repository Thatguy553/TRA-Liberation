/*


// Different Types of zones:
military_
factory_
capture_
bigtown_
tower_

*/

// Variable Initialization
TRA_Markers = allMapMarkers;

/* Whitelist to give Curator and Administration Permissions */
TRA_whitelist = ["76561198201550691"];

/* Military Configs */
TRA_milActivationRadius = 1000;
TRA_milCaptureRadius = 175;

/* Factory Configs */
TRA_facActivationRadius = 500;
TRA_facCaptureRadius = 175;

/* Village Configs (capture_)*/
TRA_villActivationRadius = 350;
TRA_villCaptureRadius = 175;

/* Bigtown Configs */
TRA_townActivationRadius = 1000;
TRA_villCaptureRadius = 200;

/* Tower Configs */
TRA_towerActivationRadius = 350;
TRA_towerCaptureRadius = 175;
TRA_towerRange = 2000;

/* Side Configs */
TRA_playerSide = west;
TRA_enemySide = east;
TRA_resistanceSide = independent;
TRA_civSide = civilian;

TRA_playerSidePreset = 0;
TRA_hostileSidePreset = 0;
TRA_resistanceSidePreset = 0;
TRA_civilianSidePreset = 0;

/* Zone Configs */
TRA_maxZonesActive = 5;
TRA_maxAiActive = 150;
TRA_maxReinforceAmnt = 30;
TRA_zoneInactiveTime = 20;
TRA_zonesActive = 0;
TRA_activeAi = 0;
TRA_capturedZones = [];
TRA_enemyAwareness = 0;
TRA_percentGarrisoned = 0.30;
TRA_percentVehicle = 0.08;

/* Preset Variables (Dont Touch) */
TRA_sectorDefendersInf = createHashMap;
TRA_sectorDefendersVeh = createHashMap;
TRA_playerStructures = createHashMap;
TRA_playerVehicles = createHashMap;

/* Garrison Structure/Position hashmap */
TRA_garrisonStructures = createHashMap;

/* Player FOB's hashmap
	Doing 'fob_num_name' so that I can basically substring the 'num' out.
	Getting the num out is how ill later determine what the fob name is when loading the map.
	num = TRA_playerFobNames index.

	Will need to make exceptions for the operation base

	example:
	TRA_playerFobs set [
		"fobs",
		[
			["fob_num_name", fob_object],
			["fob_num_name", fob_object]
		]
	]

	TRA_playerFobs set [
		"fob_num_name",
		[
			["obj_class", [_positionInformation]]
		]
	];

	TRA_playerResourcesset [
		"fob_num_name",
		[
			[supply, ammo, fuel]
		]
	]
*/
TRA_playerFobs = createHashMap;
TRA_playerResources = createHashMap;
TRA_playerFobPrefix = "FOB";
TRA_playerFobNames = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-ray", "Yankee", "Zulu"];

/* Halo Jump Height (meters)*/
TRA_haloJumpHeight = 1000;
TRA_haloJumpCooldown = 300;
TRA_vehicleParaOpenHeight = 500;

/* Build Menu Object Init Code */
TRA_buildObjectInits = createHashMap;



/* Temporary Code Placement */
private _fobs = TRA_playerFobs getOrDefault ["fobs", []];
[operation_base] call TRA_fnc_addActionsFob;
_fobs pushBack ["operation_base", operation_base];
TRA_playerFobs set [
	"fobs",
	_fobs
];