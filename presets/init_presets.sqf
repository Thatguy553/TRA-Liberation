switch (TRA_playerSide) do {
	case 0: {
		[] call compileFinal preprocessFileLineNumbers "presets\playerSide\rhs_usaf.sqf";
	};
	default {
		[] call compileFinal preprocessFileLineNumbers "presets\playerSide\rhs_usaf.sqf";
	};
};

switch (TRA_hostileSidePreset) do {
	case 0: {
		[] call compileFinal preprocessFileLineNumbers "presets\hostileSide\rhs_afrf.sqf";
	};
	default {
		[] call compileFinal preprocessFileLineNumbers "presets\hostileSide\rhs_afrf.sqf";
	};
};