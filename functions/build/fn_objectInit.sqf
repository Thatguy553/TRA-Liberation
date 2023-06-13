params ["_object"];

private _objClass = typeOf _object;

private _objFunc = TRA_buildObjectInits get _objClass;

if (isNil "_objFunc") exitWith {
	diag_log format["[TRA] %1 Not found in object inits.", _objClass];
};

[_object] call _objFunc;