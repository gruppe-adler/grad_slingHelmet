#include "script_component.hpp"

class CfgPatches
{
	class grad_slingHelmet_main
	{
		units[] = {"GRAD_slingHelmet_WeaponHolder"};
		weapons[] = {};
		requiredVersion = 2.0;
		requiredAddons[] = {"A3_Weapons_F","ace_common","ace_main","cba_settings"};
		author = "DerZade";
		VERSION_CONFIG;
	};
};

#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"
