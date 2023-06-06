TRA_buildObjectInits insert [
	[
		"B_Slingload_01_Cargo_F",
		{
			params ["_object"];
			_object addAction [
				"Deploy FOB",
				{
					params["_target", "_caller"];
					[_caller, _target] call TRA_fnc_buildFob;
				}
			];
		}
	]
];