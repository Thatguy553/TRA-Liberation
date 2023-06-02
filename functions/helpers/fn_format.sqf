/* ----------------------------------------------------------------------------
Function: TRA_fnc_format

Description:
    Function will take in a string, and the size to format that string to.

Parameters:
    _string - String to Modify.
	_size - Integer to determine what size to make _string. (can be bigger or smaller than _string, cannot be less than 0)

Returns:
    Modified String,

Examples:
    (begin example)
    _str = ["I want this string to be 35 long"] call TRA_fnc_format;
	// _str = "I want this string to be 35 long   "

	_str = ["I want this string to be 5 long"] call TRA_fnc_format;
	// _str = "I wan"
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */

params["_string", "_size"];

if (typeName _string isNotEqualTo "STRING") then {
	_string = str _string;
};

private _strLen = count(_string);
private _newStr = "";

TRA_trim = {
	params["_string", "_size"];
	private _str = [_string, 0, _size - 1] call CBA_fnc_substr;
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