#include "script_component.hpp"

class CfgPatches
{
	class grad_slingHelmet_main
	{
		units[] = {"GRAD_slingHelmet_WeaponHolder"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Weapons_F","ace_common","ace_main","cba_settings"};
		author = "DerZade";
		VERSION_CONFIG;
	};
};

#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"
