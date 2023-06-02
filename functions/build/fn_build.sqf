/*
_player should be the player unit building the structure.
_objectType should be the class name of the object to be built.
_fob should be the FOB variable name.
*/
params["_player", "_objectType", "_cost", "_fob"];

/* Check if the needed supplies exists at the current fob */
private _resources = TRA_playerResources getOrDefault [_fob, [1000,1000,1000]];
TRA_objectName = getText (configFile >> "CfgVehicles" >> _objectType >> "displayName");

if !([_resources, _cost] call TRA_fnc_resourceCheck) exitWith {
    ["TaskFailed", ["", format["Not enough resources to build %1!", TRA_objectName]]] call BIS_fnc_showNotification;
    false
};

/* Create Provided Object */
private _object = createVehicle[_objectType, [1, 1, 1000], [], 0, "NONE"];

/* Attach object to player */
private _playerDist = 10;
if (!isNil 'TRA_buildDistance') then {
    if (TRA_buildDistance <= 10 || TRA_buildDistance >= 10) then {
        _playerDist = TRA_buildDistance;
    };
};
_object attachTo[_player, [0, _playerDist, 0]];

/* Make the object a mission variable in order to grab it later. */
TRA_buildObject = _object;

/* Make mission variables to be used later */
TRA_buildHeight = 0;
TRA_buildRotation = 0;
TRA_buildDistance = _playerDist;
TRA_buildSuccess = false;

/* Create display in order to reserve keys for object manipulation. */
private _id = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call TRA_rotateObject"];
private _id2 = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call TRA_cancelRotation"];

/* ID needed to escape the Object orienting */
TRA_buildDisplayID = _id;
TRA_cancelDisplayID = _id2;

/* Create Controls GUI for later */
TRA_buildCtrlPic = "res\Controls.paa";
with uiNamespace do {
    TRA_buildControls = findDisplay 46 ctrlCreate ["RscPicture", -1];
    TRA_buildControls ctrlSetPosition [0.1, 0.4, 0.7, 0.5];
    TRA_buildControls ctrlCommit 0;
};

/* Show Controls GUI on screen */
(uiNamespace getVariable "TRA_buildControls") ctrlSetText (TRA_buildCtrlPic);


TRA_rotateObject = {
    params["_display", "_key", "_shift", "_ctrl", "_alt"];
    if (isNil 'TRA_buildObject') exitWith {
        systemChat "Build object was not set as a missionNamespace variable";
        false;
    };
    
    /* Free other keys */
    if !(_key in [203, 205, 200, 208, 57, 201, 209]) exitWith {
        false
    };

    private _rotation = TRA_buildRotation;
	private _height = TRA_buildHeight;
    private _distance = TRA_buildDistance;
    private _rotate = false;
    private _elevate = false;
    private _dist = false;

	private _rotateIncrement = (parseNumber TRA_buildRotIncrement);
	private _elevateIncrement = (parseNumber TRA_buildElevationIncrement);
    private _distanceIncrement = (parseNumber TRA_buildDistIncrement);

    switch (_key) do {
        case 203: {
            _rotation = _rotation + _rotateIncrement;
            _rotate = true;
        };
        case 205: {
            _rotation = _rotation - _rotateIncrement;
            _rotate = true;
        };
		case 200: {
			_height = _height + _elevateIncrement;
            _elevate = true;
		};
		case 208: {
			_height = _height - _elevateIncrement;
            _elevate = true;
		};
		case 201: {
			_distance = _distance + _distanceIncrement;
            _dist = true;
		};
		case 209: {
			_distance = _distance - _distanceIncrement;
            _dist = true;
		};
        case 57: {
            (findDisplay 46) displayRemoveEventHandler ["KeyDown", _thisEventHandler];
            (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", TRA_cancelDisplayID];
            detach TRA_buildObject;
            (uiNamespace getVariable "TRA_buildControls") ctrlSetText ("");
            TRA_buildSuccess = true;
            ["TaskSucceeded", ["", format["%1 Built!", TRA_objectName]]] call BIS_fnc_showNotification;
        };
    };

    if (_rotate) then {
        TRA_buildObject setDir _rotation;
    };
    if (_elevate) then {
        _player = attachedTo TRA_buildObject;
        TRA_buildObject attachTo [_player, [0, _distance, _height]];
        TRA_buildObject setDir TRA_buildRotation;
    };
    if (_dist) then {
        _player = attachedTo TRA_buildObject;
        TRA_buildObject attachTo [_player, [0, _distance, _height]];
        TRA_buildObject setDir TRA_buildRotation;
        
    };

    TRA_buildRotation = _rotation;
	TRA_buildHeight = _height;
    TRA_buildDistance = _distance;

    true
};

TRA_cancelRotation = {
    params["_display", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isNotEqualTo 1) exitWith {
        false
    };

    detach TRA_buildObject;
    deleteVehicle TRA_buildObject;
    (uiNamespace getVariable "TRA_buildControls") ctrlSetText ("");
    TRA_buildSuccess = false;
    ["TaskFailed", ["", format["%1 build canceled!", TRA_objectName]]] call BIS_fnc_showNotification;

    (findDisplay 46) displayRemoveEventHandler ["KeyDown", TRA_buildDisplayID];
    (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _thisEventHandler];
    false
};

/* While build KeyDown event handler exists, do: */
// while {(findDisplay 46) getEventHandlerInfo ["KeyDown", TRA_buildDisplayID] select 0} do {
//     sleep 1;
// };

/* Return whether build was a success or failure after KeyDown eh is removed */
// TRA_buildSuccess;