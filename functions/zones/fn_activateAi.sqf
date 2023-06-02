params ["_units"];

{
	// Current result is saved in variable _x
	_x enableSimulationGlobal true;
	_x allowDamage true;
	_x hideObjectGlobal false;
	_x enableAI "all";
	_x setBehaviour "SAFE";
	_x enableMimics true;
	_x enableStamina true;
} forEach _units;