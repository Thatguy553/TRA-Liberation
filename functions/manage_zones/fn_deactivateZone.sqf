/*
	Takes the trigger and marker for the zone to be deactivated.

	While loop checks if the time since deactivation started (_timerStart) exceeds the max inactive time allowed (TRA_zoneInactiveTime),
	breaks loop when time is exceeded or zone is reactivated. Does a check after loop is broken to see if zone is reactivated, 
	if not then all infantry, vehicles, and structures created during zone activation are deleted.

*/
/* ----------------------------------------------------------------------------
Function: TRA_fnc_deactivateZone

Description:
    Function takes in the trigger for the zone to be deactivated as well as the marker for said zone.
	The function will wait TRA_zoneInactiveTime seconds before it begins deactivating. If in this time the zone is reactivated via
	player re-entering the trigger, the Deactivation is aborted. If a player does not re enter the trigger all units spawned for that
	zone will be deleted, removed from the TRA_activeAi count, and removed from TRA_zonesActive.

Parameters:
    _trigger - Trigger Object
	_marker - marker name

Returns:
    Boolean

Examples:
    (begin example)
	[_trigger, "zone_marker"] call TRA_fnc_deactivateZone;
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */


params ["_trigger", "_marker"];
private ["_timerStart", "_deactivate"];
diag_log format["[TRA] Deactivating Zone: %1", markerText _marker];
// timer set to time script was called
_timerStart = diag_tickTime;

// as long as the zone still has no players in it, loop
while {!(triggerActivated _trigger)} do {
	// If the zone still has no players in it after TRA_zoneInactiveTime seconds, break
	if ((diag_tickTime - _timerStart) >= TRA_zoneInactiveTime) exitWith {};
	diag_log format["[TRA] Time Since Deactivation: %1", (diag_tickTime - _timerStart)];
	sleep 5;
};

// check if loop broke because of players entering trigger again, if so dont deactivate zone.
if (triggerActivated _trigger) exitWith {
	diag_log "[TRA] Deactivation Aborted";
	false
};

/* Zone certainly no longer active, set to false and delete all units */
_trigger setVariable [format["%1%2", _marker, "_active"], false];

// Get units stored on trigger for zone
_zoneUnits = _trigger getVariable format["%1%2", _marker, "_units"];
_zoneUnitsCount = count(_zoneUnits);

// Delete all the units found to be stored on zone trigger
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

// Remove the number of deleted ai from total active ai
TRA_activeAi = TRA_activeAi - _zoneUnitsCount;

// Remove this zone from the total zones active (going to rewrite later)
TRA_zonesActive = TRA_zonesActive - [_marker];
diag_log format["[TRA] Zone Deactivated: %1", markerText _marker];
true