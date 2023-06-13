/* ----------------------------------------------------------------------------
Function: TRA_fnc_initZones

Description:
    Function initiate's all zones on the map according to the following markers.
	Initation includes sorting through all markers on the map, then creating triggers
	for each of these map markers based on zone configs.

	_village == "n_art"
	_bigtown == "n_service"
	_tower == "loc_Transmitter"
	_factory == "loc_Fuelstation"
	_military == "o_support"

Parameters:
    None

Returns:
    Nothing

Examples:
    (begin example)
	[] call TRA_fnc_initZones;
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */
// if (!isServer) exitWith {};
diag_log format["[TRA] Initiating %1 zones!", count(TRA_Markers)];
private ["_military", "_factory", "_bigtown", "_tower", "_village"];

_military = [];
_factory =  [];
_bigtown =  [];
_tower =    [];
_village =  [];

{
	if ((getMarkerType _x) isEqualTo "o_support" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_military pushBack _x;
		continue
	};

	if ((getMarkerType _x) isEqualTo "loc_Fuelstation" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_factory pushBack _x;
		continue
	};

	if ((getMarkerType _x) isEqualTo "n_service" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_bigtown pushBack _x;
		continue
	};

	if ((getMarkerType _x) isEqualTo "loc_Transmitter" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_tower pushBack _x;
		continue
	};

	if ((getMarkerType _x) isEqualTo "n_art" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_village pushBack _x;
		continue
	};
} forEach TRA_Markers;

{
	// Create trigger
	// _marker = createMarker [format["%1_ellipse", _x], getMarkerPos _x, 1];
	// _marker setMarkerSize [TRA_milCaptureRadius, TRA_milCaptureRadius];
	// _marker setMarkerType "ELLIPSE";
	// _marker setMarkerColor "ColorWEST";
	// _marker setMarkerText "test";
	_trigger = createTrigger["EmptyDetector", getMarkerPos _x, true];
	_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trigger setTriggerArea [TRA_milActivationRadius, TRA_milActivationRadius, 0, true];
	// Set Trigger Statements
	_trigger setTriggerStatements
	[
		format["this && (count(TRA_zonesActive) < TRA_maxZonesActive) && (TRA_activeAi < TRA_maxAiActive)", _x, '_active'],
		format["[thisTrigger, %1] spawn TRA_fnc_spawnMilitary;", str _x],
		format["[thisTrigger, %1] spawn TRA_fnc_deactivateZone;", str _x]
	];
} forEach _military;
