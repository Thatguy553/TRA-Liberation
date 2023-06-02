class TRA {
	class functions {
		file = "functions";

		class initZones {};
	};
	
	class functions_zones {
		file = "functions\zones";

		class spawnMilitary {};
		class spawnFactory  {};
		class spawnBigtown  {};
		class spawnTower    {};
		class spawnVillage  {};

		class activateAi	{};
	};

	class functions_manage_zones {
		file = "functions\manage_zones";

		class deactivateZone {};
	};

	class functions_build {
		file = "functions\build";

		class build			{};
		class buildFob		{};
		class buildMenu		{};
	};

	class functions_helpers {
		file = "functions\helpers";

		class format		{};
		class resourceCheck {};
	};
};

