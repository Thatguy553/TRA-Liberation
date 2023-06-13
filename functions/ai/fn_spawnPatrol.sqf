// Look into instead of position, get the trigger and see if the radius + center position can be gotten from that instead
params ["_position", "_spawnNum", "_radius"];

private _unitArr = [];
private _squadSize = 5;

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

private _squadsCount = round(_spawnNum / _squadSize);
private _squadsSpawned = 0;
private _units = [];
private _spawnPositions = [];

for "_i" from 1 to _squadsCount do {
	_pos = _position getPos [random _radius, random 360];
	_emptyPos = _pos findEmptyPosition [10, 10];
	if (_emptyPos isEqualTo []) then {
		_i = _i - 1;
		continue;
	};
	_spawnPositions append [_emptyPos];
};

// if (_squadsSpawned >= _squadsCount) exitWith {break};

{	
	private _size = _squadSize;
	private _position = _x;
	private _group = createGroup [TRA_enemySide, true];
	for "_i" from 1 to _size do {
		if (count(_units) >= _spawnNum) then {
			break;
		};
		private _position = _position;
		private _unitType = (selectRandom _unitArr);
		private _unit = (_group createUnit [_unitType, _position, [], 0, "CAN_COLLIDE"]);

		_units pushBack _unit;

		sleep 0.05;
	};
	[_group, _position, _radius] call lambs_wp_fnc_taskPatrol;
	sleep 0.1;
} forEach _spawnPositions;

_units