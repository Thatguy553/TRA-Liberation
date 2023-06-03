params["_player", "_jip"];

_player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	if ([_unit] call TRA_fnc_checkWhitelist) then {
		systemChat format["Assigning player %1 curator.", name _unit];
		[_unit] call TRA_fnc_addCurators;
	};
}];