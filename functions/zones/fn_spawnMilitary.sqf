params ["_trigger", "_marker"];
diag_log format["[TRA] Activating Military Zone: %1", markerText _marker];

/* Total ai should be distributed equally among max amount of zones active */
private _aiLimit = round(TRA_maxAiActive / TRA_maxZonesActive);
private _garrisonLimit = round(TRA_percentGarrisoned * _aiLimit);
private _vehLimit = round(TRA_percentVehicle * _aiLimit);

/* Remove the ai that will become vehicles or be garrisoning from infantry limit */
_aiLimit = _aiLimit - (_garrisonLimit + _vehLimit);

private _infSquadSize = 5;
private _garSquadSize = 3;
private _captureRadius = TRA_milCaptureRadius;
private _patrollingInf = round(_aiLimit / _infSquadSize);

private _unitObjs = [];
private _unitArr = [];
private _vehArr = [];


// Get units to spawn according to awareness
switch (true) do {
	case (TRA_enemyAwareness <= 30): {
		_unitArr = TRA_sectorDefendersInf get "low";
		_vehArr = TRA_sectorDefendersVeh get "low";
		/* Set with a 150 pop cap in mind, may need changing for different populations. Should equal about 12. */
		_patrollingInf = round(_patrollingInf * 0.40);
	};
	case (TRA_enemyAwareness <= 60): {
		_unitArr = TRA_sectorDefendersInf get "medium";
		_vehArr = TRA_sectorDefendersVeh get "medium";
		/* Set with a 150 pop cap in mind, may need changing for different populations. Should equal about 19. */
		_patrollingInf = round(_patrollingInf * 0.63);
	};
	case (TRA_enemyAwareness <= 100): {
		_unitArr = TRA_sectorDefendersInf get "high";
		_vehArr = TRA_sectorDefendersVeh get "high";
	};
	default {
		_unitArr = TRA_sectorDefendersInf get "low";
		_vehArr = TRA_sectorDefendersVeh get "low";
		/* Set with a 150 pop cap in mind, may need changing for different populations. Should equal about 12. */
		_patrollingInf = round(_patrollingInf * 0.40);
	};
};

diag_log format["[TRA] Infantry Limit: %1", _aiLimit];

// Look into disabling ai features until creation is done, also look into creating vehicles as simple objects
for "_i" from 1 to _patrollingInf do {
	_group = createGroup TRA_enemySide;
	_squadPos = (getMarkerPos _marker) getPos [random _captureRadius / 2, random 360];

	[_unitObjs, _group, _unitArr, _squadPos, _captureRadius] spawn {
		params ["_unitObjs", "_group", "_unitArr", "_squadPos", "_captureRadius"];
		for "_j" from 1 to 5 do {
			_unit = _group createUnit [selectRandom _unitArr, _squadPos, [], 0, "FORM"];
			_unit enableSimulationGlobal false;
			_unit allowDamage false;
			_unit hideObjectGlobal true;
			_unit disableAI"ALL";
			_unit setBehaviour"CARELESS";
			_unit setSpeaker"NoVoice";
			_unit disableConversation true;
			_unit enableMimics false;
			_unit enableStamina false;
			_unitObjs pushback (_unit);
			sleep (((abs(50 - diag_fps) / (50 - 20))^2) * 2);
		};
		[_group, _squadPos, _captureRadius / 2] call lambs_wp_fnc_taskPatrol;
	};
};

for "_i" from 1 to round(_garrisonLimit / _garSquadSize) do {
	_group = createGroup TRA_enemySide;
	_squadPos = (getMarkerPos _marker) getPos [random _captureRadius / 2, random 360];

	[_unitObjs, _group, _unitArr, _squadPos, _captureRadius] spawn {
		params ["_unitObjs", "_group", "_unitArr", "_squadPos", "_captureRadius"];
		for "_j" from 1 to 3 do {
			_unit = _group createUnit [selectRandom _unitArr, _squadPos, [], 0, "FORM"];
			_unit enableSimulationGlobal false;
			_unit allowDamage false;
			_unit hideObjectGlobal true;
			_unit disableAI"ALL";
			_unit setBehaviour"CARELESS";
			_unit setSpeaker"NoVoice";
			_unit disableConversation true;
			_unit enableMimics false;
			_unit enableStamina false;
			_unitObjs pushback (_unit);
			sleep (((abs(50 - diag_fps) / (50 - 20))^2) * 2);
		};
		[_group, _squadPos, _captureRadius / 2] call lambs_wp_fnc_taskGarrison;
	};
};

for "_i" from 1 to _vehLimit do {
	_spawnPos = (getMarkerPos _marker) getPos [random _captureRadius, random 360];
	_spawnPos = _spawnPos findEmptyPosition [10, 100];
	[_spawnPos, _vehArr, _unitObjs, _captureRadius] spawn {
		params ["_spawnPos", "_vehArr", "_unitObjs", "_captureRadius"];
		_veh = ([_spawnPos, random 360, selectRandom _vehArr, TRA_enemySide, false] call BIS_fnc_spawnVehicle);
		_vehObj = _veh select 0;
		_vehObj enableSimulationGlobal false;
		_vehObj allowDamage false;
		_vehObj hideObjectGlobal true;
		_vehObj disableAI"ALL";
		_vehObj setBehaviour"CARELESS";
		_vehObj setSpeaker"NoVoice";
		_vehObj disableConversation true;
		_vehObj enableMimics false;
		_vehObj enableStamina false;
		_unitObjs append (crew (_veh select 0));
		_unitObjs pushback (_veh select 0);

		[_veh select 0, _spawnPos, _captureRadius] call lambs_wp_fnc_taskPatrol;
	};
	sleep (((abs(50 - diag_fps) / (50 - 20))^2) * 2);
};

_trigger setVariable [format["%1%2", _marker, "_units"], _unitObjs];
_trigger setVariable [format["%1%2", _marker, "_active"], true];

/* Activate the Ai skills/simulation etc */
[_unitObjs] call TRA_fnc_activateAi;

TRA_activeAi = TRA_activeAi + count(_unitObjs);

TRA_zonesActive = TRA_zonesActive + 1;