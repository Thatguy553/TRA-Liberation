/* ----------------------------------------------------------------------------
Function: TRA_fnc_resourceCheck

Description:
    Function will take in two arrays of ints in the following format, [Supply, Ammo, Fuel].
	It will compare these two arrays and return if array 2 is greater than or equal to array 1.

Parameters:
    _resources - The available resources array [100, 50, 0]
	_cost - The required resources array [200, 10, 50]

Returns:
    Boolean

Examples:
    (begin example)
    _bool = [[100, 10, 20], [50, 20, 10]] call TRA_fnc_resourceCheck;
	// _bool = false

	_bool = [[200, 1000, 300], [100, 50, 70]] call TRA_fnc_resourceCheck;
	// _bool = true
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */

params["_resources", "_cost"];

private _resSupply = _resources select 0;
private _resAmmo   = _resources select 1;
private _resFuel   = _resources select 2;

private _costSupply = _cost select 0;
private _costAmmo   = _cost select 1;
private _costFuel   = _cost select 2;

private _enough = false;
private _supplyEnough = false;
private _ammoEnough = false;
private _fuelEnough = false;

if (_resSupply >= _costSupply) then {
	_supplyEnough = true;
};

if (_resAmmo >= _costAmmo) then {
	_ammoEnough = true;
};

if (_resFuel >= _costFuel) then {
	_fuelEnough = true;
};

if (_supplyEnough && _ammoEnough && _fuelEnough) exitWith {
	true
};
false