params["_player"];

private _lbIndex = uiNamespace getVariable['listBoxBaseIndex', 0];
private _fobObject = ((TRA_playerFobs get "fobs") select _lbIndex) select 1;
_player setPosATL (getPosATL _fobObject);