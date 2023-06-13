private _littleBird = TRA_playerStartBase get "littlebird";
private _boat = TRA_playerStartBase get "boat";
private _blackhawk = TRA_playerStartBase get "blackhawk";
private _mobile_respawn = TRA_playerStartBase get "mobile_respawn";
private _fixedwing = TRA_playerStartBase get "fixedwing";
private _fob_container = TRA_playerStartBase get "fob_container";

TRA_spawnVehicles = {
	params ["_padName", "_vehClass"];
	private _index = 0;
	while {!isNil format["%1_%2", _padName, _index]} do {
		_pad = missionNamespace getVariable [format["%1_%2", _padName, _index], objNull];
		_padPos = getPosASL _pad;
		_padVector = vectorDir _pad;

		_veh = createVehicle [_vehClass, [0,0,1000], [], 0, "NONE"];
		_veh enableSimulation false;

		_veh setVectorDir _padVector;
		_veh setPosASL [_padPos select 0, _padPos select 1, (_padPos select 2) + 3];
		_veh enableSimulation true;

		[_veh] call TRA_fnc_objectInit;
		_index = _index + 1;
	};
};

["littlebird", _littleBird] spawn TRA_spawnVehicles;
["boat", _boat] spawn TRA_spawnVehicles;
["blackhawk", _blackhawk] spawn TRA_spawnVehicles;
["mobile_respawn", _mobile_respawn] spawn TRA_spawnVehicles;
["fixedwing", _fixedwing] spawn TRA_spawnVehicles;
["fob_container", _fob_container] spawn TRA_spawnVehicles;
