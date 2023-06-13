// Look into instead of position, get the trigger and see if the radius + center position can be gotten from that instead
params ["_position", "_spawnNum", "_radius"];

private _unitArr = [];
private _squadSize = 3;

// Get units to spawn according to awareness
switch (true) do {
	case (TRA_enemyAwareness <= 30): {
		_unitArr = TRA_sectorDefendersInf get "low";
	};
	case (TRA_enemyAwareness <= 60): {
		_unitArr = TRA_sectorDefendersInf get "medium";
	};
	case (TRA_enemyAwareness <= 100): {
		_unitArr = TRA_sectorDefendersInf get "high";
	};
	default {
		_unitArr = TRA_sectorDefendersInf get "low";
	};
};

// Get Buildings within the provided capture radius of the zone, dont run the script if there is none.
private _uncleanedBuildings = (nearestObjects [(_position), ["house", "building"], _radius]);
if ( count(_uncleanedBuildings) <= 0 ) exitWith {
	diag_log "[TRA] Could not find any buildings in the provided zone.";
};
private _buildings = [];

// Filter out buildings that dont have internal positions for infantry.
{
	private _buildingPositions = _x buildingPos -1;
	if (count(_buildingPositions) > 0) then {
		_buildings pushBack [_x, _buildingPositions];
	};	
} forEach _uncleanedBuildings;
if ( count(_buildings) <= 0 ) exitWith {
	diag_log "[TRA] Could not find any buildings for garrison in the provided zone.";
};

// Shuffle the order of the buildings so garrisoned squads arent in just one area of a zone
_buildings call BIS_fnc_arrayShuffle;

private _squadCount = round(_spawnNum / _squadSize);
private _squadsSpawned = 0;
private _units = [];
{
	if (_squadsSpawned >= _squadCount) exitWith {break};
	private _positions = _x select 1;

	private _group = createGroup [TRA_enemySide, true];
	for "_i" from 1 to count(_positions) do {
		if (_i >= _squadSize + 1) exitWith {break};
		private _position = selectRandom _positions;
		private _unitType = (selectRandom _unitArr);
		private _unit = (_group createUnit [_unitType, _position, [], 0, "CAN_COLLIDE"]);

		_unit disableAI "PATH";
		_unit setUnitPos "UP";
		_units pushBack _unit;

		sleep 0.05;
	};


	sleep 0.1;
	
} forEach _buildings;

_units