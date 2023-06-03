params["_objects"];

if ((typeName _objects) isNotEqualTo "ARRAY") then {
	_objects = [_objects];
};

{
	// Current result is saved in variable _x
	_x addCuratorEditableObjects
	[
		_objects,
		true
	];
} forEach allCurators;