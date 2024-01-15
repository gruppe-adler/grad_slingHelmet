#include "script_component.hpp"

class CfgPatches
{
    class grad_slingHelmet_main
    {
        units[] = {"grad_slingHelmet_WeaponHolder"};
        weapons[] = {};
        requiredVersion = 2.01;
        requiredAddons[] = {"A3_Weapons_F","ace_common","ace_main","cba_settings","cba_common"};
        author = "DerZade";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers {
    class grad_slingHelmet_main {
        init = "[] call GRAD_slingHelmet_fnc_registerCBASettings";
    };
};