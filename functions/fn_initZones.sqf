/*
fn_initZones.sqf
TRA_fnc_initZones

Should sort through the TRA_Markers array and create triggers for each marker depending on its type.

_village == "n_art"
_bigtown == "n_service"
_tower == "loc_Transmitter"
_factory == "loc_Fuelstation"
_military == "o_support"

*/

private ["_military", "_factory", "_bigtown", "_tower", "_village"];

_military = [];
_factory =  [];
_bigtown =  [];
_tower =    [];
_village =  [];

{
	if ((getMarkerType _x) isEqualTo "o_support" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_military pushBack _x;
	};

	if ((getMarkerType _x) isEqualTo "loc_Fuelstation" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_factory pushBack _x;
	};

	if ((getMarkerType _x) isEqualTo "n_service" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_bigtown pushBack _x;
	};

	if ((getMarkerType _x) isEqualTo "loc_Transmitter" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_tower pushBack _x;
	};

	if ((getMarkerType _x) isEqualTo "n_art" && !((getMarkerType _x) in TRA_capturedZones)) then {
		_village pushBack _x;
	};
} forEach TRA_Markers;

{
	// Create trigger
	_trigger = createTrigger["EmptyDetector", getMarkerPos _x, true];
	_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trigger setTriggerArea [TRA_milActivationRadius / 2, TRA_milActivationRadius / 2, 0, true];
	// Set Trigger Statements
	_trigger setTriggerStatements
	[
		format["this && (thisTrigger getVariable ['%1%2', false] isEqualTo false) && (TRA_zonesActive < TRA_maxZonesActive) && (TRA_activeAi < TRA_maxAiActive)", _x, '_active'],
		format["[thisTrigger, %1] spawn TRA_fnc_spawnMilitary;", str _x],
		format["[thisTrigger, %1] spawn TRA_fnc_deactivateZone;", str _x]
	];
} forEach _military;
