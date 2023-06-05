params["_player", "_position"];

private _jumpDelay = 3; // Seconds
deleteMarkerLocal "halo_marker";
if (_position isEqualTo [0,0,0]) exitWith {
	systemChat "No Jump coords marked...";
};

["HaloJumping", [format["Halo Jumping! Please wait %1 seconds...", _jumpDelay]]] call BIS_fnc_showNotification;
sleep _jumpDelay;

private _squad = uiNamespace getVariable["TRA_haloSquad", false];
private _vehicle = uiNamespace getVariable["TRA_haloVehicle", false];
private _players = [];

// Infantry Check
if (_squad isEqualTo 1) then {
	_players pushBack (_player nearEntities ["Man", 15]);
};

playSound ['FlyBy', false, 0];
// Vehicle Check
if (_vehicle isEqualTo 1) exitWith {
	_veh = vehicle _player;
	_veh setPosATL _position;
	_veh addBackpackCargoGlobal ["B_Parachute", count (crew _veh select {isPlayer _x})];

	_chute = createVehicle ["B_Parachute_02_F", [0, 0, 1000], [], 0, "NONE"];
	_chute allowDamage false;
	_chute enableSimulation false;

	// Make chute wait until certain altitude to deploy (not very smooth, insta stops vehicle mid air)
	[_veh, _chute] spawn {
		params["_veh", "_chute"];
		while {((getPosATL _veh) select 2) >= TRA_vehicleParaOpenHeight} do {
			sleep 1;
		};
		_vehPos = getPosATL _veh;
		_chute setPosATL _vehPos;
		_chute allowDamage true;
		_chute enableSimulation true;
		_veh attachTo [_chute, [0, 0, 1]];
	};

	// Teleport players as well if both options are ticked in the GUI
	if (_squad isEqualTo 1) then {
		{
			// Current result is saved in variable _x
			_space = random 15;
			_x setPosATL [(_position select 0) + _space, (_position select 1) + _space, _position select 2];
			_x setVariable ['TRA_lastHalo', diag_tickTime];
			[_x] call bocr_main_fnc_actionOnChest;
			_x addBackpack "B_Parachute";
		} forEach _players;
	};
};

{
	// Current result is saved in variable _x
	_space = random 15;
	_x setPosATL [(_position select 0) + _space, (_position select 1) + _space, _position select 2];
	_x setVariable ['TRA_lastHalo', diag_tickTime];
	[_x] call bocr_main_fnc_actionOnChest;
	_x addBackpack "B_Parachute";
} forEach _players;

_player setVariable ['TRA_lastHalo', diag_tickTime];
[_player] call bocr_main_fnc_actionOnChest;
_player addBackpack "B_Parachute";

_player setPosATL _position;