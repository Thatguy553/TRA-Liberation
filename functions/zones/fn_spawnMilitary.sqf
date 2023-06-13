/* ----------------------------------------------------------------------------
Function: TRA_fnc_spawnMilitary

Description:
    Function takes in the trigger for the zone to be activated as well as the marker for said zone.
	The function does some calculations based on the Zone Configs for ai to determine how many ai
	to spawn, and determine how many ai should be doing certain things (garrison, patrol, etc).

	After spawning the units, it adds the zone to TRA_zonesActive and adds the number of units to TRA_activeAi

Parameters:
    _trigger - Trigger Object
	_marker - marker name

Returns:
    Nothing

Examples:
    (begin example)
	[_trigger, "zone_marker"] call TRA_fnc_spawnMilitary;
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */
params ["_trigger", "_marker"];
diag_log format["[TRA] Activating Military Zone: %1", markerText _marker];
private _active = _trigger getVariable ['%1%2', false];
if (_active) exitWith {
	diag_log format["[TRA] Zone %1 already active", markerText _marker];
};

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

private _markerPos = getMarkerPos _marker;

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

_unitObjs pushBack ([_markerPos, _aiLimit, TRA_milCaptureRadius] call TRA_fnc_spawnPatrol);

_unitObjs pushBack ([_markerPos, _garrisonLimit, TRA_milCaptureRadius] call TRA_fnc_spawnGarrison);

_unitObjs pushBack ([_markerPos, _vehLimit, TRA_milCaptureRadius] call TRA_fnc_spawnVehicle);

_trigger setVariable [format["%1%2", _marker, "_units"], _unitObjs];
_trigger setVariable [format["%1%2", _marker, "_active"], true];

TRA_activeAi = TRA_activeAi + count(_unitObjs);

TRA_zonesActive pushback _marker;

