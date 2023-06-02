/*
	Takes the trigger and marker for the zone to be deactivated.

	While loop checks if the time since deactivation started (_timerStart) exceeds the max inactive time allowed (TRA_zoneInactiveTime),
	breaks loop when time is exceeded or zone is reactivated. Does a check after loop is broken to see if zone is reactivated, 
	if not then all infantry, vehicles, and structures created during zone activation are deleted.

*/

params ["_trigger", "_marker"];
private ["_timerStart", "_deactivate"];
diag_log format["[TRA] Deactivating Zone: %1", markerText _marker];
_timerStart = diag_tickTime;

while {!(triggerActivated _trigger)} do {
	if ((diag_tickTime - _timerStart) >= TRA_zoneInactiveTime) exitWith {};
	diag_log format["[TRA] Time Since Deactivation: %1", (diag_tickTime - _timerStart)];
	sleep 5;
};

if (triggerActivated _trigger) exitWith {
	diag_log "[TRA] Deactivation Aborted";
	false
};

/* Zone certainly no longer active, set to false and delete all units */
_trigger setVariable [format["%1%2", _marker, "_active"], false];

_zoneUnits = _trigger getVariable format["%1%2", _marker, "_units"];
_zoneUnitsCount = count(_zoneUnits);
{
	// Current result is saved in variable _x
	if (_x isKindOf "man") then {
		deleteVehicle _x;	
	} else {
		{
			// Current result is saved in variable _x
			unassignVehicle _x;
			deleteVehicle _x;
		} forEach crew _x;
		deleteVehicle _x;
	};
} forEach (_zoneUnits);
TRA_activeAi = TRA_activeAi - _zoneUnitsCount;
TRA_zonesActive = TRA_zonesActive - 1;
diag_log format["[TRA] Zone Deactivated: %1", markerText _marker];
true