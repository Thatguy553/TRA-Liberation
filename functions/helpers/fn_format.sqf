params["_string", "_size"];

if (typeName _string isNotEqualTo "STRING") then {
	_string = str _string;
};

private _strLen = count(_string);
private _newStr = "";

TRA_trim = {
	params["_string", "_size"];
	private _str = [_string, 0, _size] call CBA_fnc_substr;
	_str
};

TRA_extend = {
	params["_string", "_size"];
	private _str = _string;

	private _charToAdd = _size - count(_string);
	for "_i" from 1 to _charToAdd do {
		_str = " " + _str;
	};
	_str
};

if (_strLen > _size) exitWith {
    _newStr = [_string, _size] call TRA_trim;
    _newStr
};
if (_strLen < _size) exitWith {
    _newStr = [_string, _size] call TRA_extend;
    _newStr
};
if (_strLen == _size) exitWith {
    _string
};

_newStr