params ["_position", "_num", "_radius"];


private _unitArr = [];

// Get units to spawn according to awareness
switch (true) do {
	case (TRA_enemyAwareness <= 30): {
		_unitArr = TRA_sectorDefendersVeh get "low";
	};
	case (TRA_enemyAwareness <= 60): {
		_unitArr = TRA_sectorDefendersVeh get "medium";
	};
	case (TRA_enemyAwareness <= 100): {
		_unitArr = TRA_sectorDefendersVeh get "high";
	};
	default {
		_unitArr = TRA_sectorDefendersVeh get "low";
	};
};

private _squadsSpawned = 0;
private _units = [];
private _spawnPositions = [];

// Find safe spawn positions around the objective
for "_i" from 1 to _num do {
	_pos = _position getPos [random _radius, random 360];
	_emptyPos = _pos findEmptyPosition [10, 10];
	if (_emptyPos isEqualTo []) then {
		_i = _i - 1;
		continue;
	};
	_spawnPositions append [_emptyPos];
};

// Spawn vehicles on previously found safe locations
{
	if (count(_units) >= _num) then {
		break;
	};
	private _vehType = selectRandom _unitArr;
	private _position = _x;
	private _veh = createVehicle [_vehType, _position, [], 0, "NONE"];
	private _group = createVehicleCrew _veh;
	_units pushBack _veh;
	
	[_group, _position, _radius] call lambs_wp_fnc_taskPatrol;
	sleep 0.1;
} forEach _spawnPositions;

_units