/* ----------------------------------------------------------------------------
Function: TRA_fnc_buildFob

Description:
    Function will allow the user to place a new HQ at a location, height, and rotation of their choosing similar to
    TRA_fnc_build.

Controls:
    UpArrow = Raise Height
    DownArrow = Lower Height
    LeftArrow = Rotate Left
    RightArrow = Rotate Right

    SpaceBar = Confirm Build
    RightClick = Cancel Build

    PgUp = Push Farther Away From You
    PdDn = Bring Closer To You

Parameters:
    _player - The unit or object to attach to.
    _container - The object that should "contain" the HQ. (Will be deleted, and if build cancel re added.)

Returns:
    Nothing ATM.

Examples:
    (begin example)
    [player, _containerObject] call TRA_fnc_buildFOB;
    (end)

Author:
    Thatguy553
---------------------------------------------------------------------------- */

params["_player", "_container"];

/* Create Provided Object */
private _building = TRA_playerStructures get "struct_fob";
private _fobObj = createVehicle[_building, [1, 1, 1000], [], 0, "NONE"];

/* Attach object to player */
TRA_fobBuildDist = 20;
_fobObj attachTo[_player, [0, TRA_fobBuildDist, 0]];

/* Make the FOB object a mission variable in order to grab it later. */
TRA_fobObject = _fobObj;

/* Make mission variables to be used later */
TRA_fobHeight = 0;
TRA_fobRotation = 0;
TRA_fobSuccess = false;

/* Create display in order to reserve keys for object manipulation. */
private _id = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call TRA_rotateFOB"];
private _id2 = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call TRA_cancelRotation"];

/* ID needed to escape the FOB orienting */
TRA_fobDisplayID = _id;
TRA_fobCancelDisplayID = _id2;

/* Create Controls GUI for later */
TRA_buildCtrlPic = "res\Controls.paa";
with uiNamespace do {
    TRA_buildControls = findDisplay 46 ctrlCreate ["RscPicture", -1];
    TRA_buildControls ctrlSetPosition [0.1, 0.4, 0.7, 0.5];
    TRA_buildControls ctrlCommit 0;
};

/* Show Controls GUI on screen */
(uiNamespace getVariable "TRA_buildControls") ctrlSetText (TRA_buildCtrlPic);

TRA_rotateFOB = {
    params["_display", "_key", "_shift", "_ctrl", "_alt"];
    if (isNil 'TRA_fobObject') exitWith {
        systemChat "Fob object was not set as a missionNamespace variable";
        false;
    };

    /* Free other keys */
    if !(_key in [203, 205, 200, 208, 57, 201, 209]) exitWith {
        false
    };

    private _rotation = TRA_fobRotation;
	private _height = TRA_fobHeight;
    private _distance = TRA_fobBuildDist;
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
            // Remove Event Handlers
            (findDisplay 46) displayRemoveEventHandler ["KeyDown", _thisEventHandler];
            (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", TRA_fobCancelDisplayID];

            // Detach the fob object from the player
            detach TRA_fobObject;

            // Close the controls popup
            (uiNamespace getVariable "TRA_buildControls") ctrlSetText ("");


            _fobs = TRA_playerFobs get "fobs";
            /* Minus one because of Operations Base */
            _fobNum = count(_fobs) - 1;
            _fobVarName = format["%1_%2_%3", toLower TRA_playerFobPrefix, _fobNum, toLower (TRA_playerFobNames select _fobNum)];
            _fobMarkerName = format["%1_marker", _fobVarName];

            createMarker [_fobMarkerName, position TRA_fobObject, 0];

            _fobMarkerName setMarkerTypeLocal "b_hq";
            _fobMarkerName setMarkerColorLocal "ColorWEST";
            _fobMarkerName setMarkerText format["%1 %2", TRA_playerFobPrefix, (TRA_playerFobNames select _fobNum)];

            TRA_fobObject setVehicleVarName _fobVarName;
            _fobs pushBack [_fobVarName, TRA_fobObject];

            TRA_playerFobs set [
                "fobs",
                _fobs
            ];

            // Add FOB object to zeus and signal success
            [TRA_fobObject] call TRA_fnc_addCurators;

            // Add fob actions to building.
            [TRA_fobObject] call TRA_fnc_addActionsFob;
            TRA_fobSuccess = true;


            ["BuildSuccess", [format["%1 %2 Built!", TRA_playerFobPrefix, (TRA_playerFobNames select _fobNum)]]] remoteExec ["BIS_fnc_showNotification", 0];
        };
    };

    if (_rotate) then {
        TRA_fobObject setDir _rotation;
    };
    if (_elevate) then {
        _player = attachedTo TRA_fobObject;
        TRA_fobObject attachTo [_player, [0, _distance, _height]];
        TRA_fobObject setDir TRA_fobRotation;
    };
    if (_dist) then {
        _player = attachedTo TRA_fobObject;
        TRA_fobObject attachTo [_player, [0, _distance, _height]];
        TRA_fobObject setDir TRA_fobRotation;

    };

    TRA_fobRotation = _rotation;
	TRA_fobHeight = _height;
    TRA_fobBuildDist = _distance;

    true
};

TRA_cancelRotation = {
    params["_display", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isNotEqualTo 1) exitWith {
        false
    };

    (findDisplay 46) displayRemoveEventHandler ["KeyDown", TRA_fobDisplayID];
    (findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _thisEventHandler];
    detach TRA_fobObject;
    deleteVehicle TRA_fobObject;
    (uiNamespace getVariable "TRA_buildControls") ctrlSetText ("");
    TRA_fobSuccess = false;
    ["BuildCanceled", ["Building FOB Canceled"]] call BIS_fnc_showNotification;

    false
};

/* While build KeyDown event handler exists, do: */
// while {(findDisplay 46) getEventHandlerInfo ["KeyDown", TRA_fobDisplayID] select 0} do {
//     sleep 1;
// };

/* Return whether build was a success or failure after KeyDown eh is removed */
// TRA_fobSuccess;