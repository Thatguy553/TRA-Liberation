params ["_object"];

private _objClass = typeOf _object;

private _objFunc = TRA_buildObjectInits get _objClass;

[_object] call _objFunc;