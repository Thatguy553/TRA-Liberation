/* both variables should be arrays in the format of [0,0,0] */
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