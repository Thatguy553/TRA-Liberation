params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

private _display = createDialog["RedeployGui", true];

private _loadoutDropDown = 2100;
private _baseListBox = 1500;
private _deployButton = 1600;

{
	// Current result is saved in variable _x
	_fobName = markerText format["%1_marker", _x select 0];
	_fobSpawnPosition = _x select 1;
	
	_row = lbAdd [_baseListBox, _fobName];
	lbSetData [_baseListBox, _row, str _forEachIndex];
} forEach (TRA_playerFobs get "fobs");