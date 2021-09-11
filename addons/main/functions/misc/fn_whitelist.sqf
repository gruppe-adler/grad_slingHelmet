#include "..\..\allowedHeadgear.hpp"
/*
 * Author: DerZade
 * Returns all whitelisted helmets.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Whitelisted Headgear <ARRAY>
 *
 * Example:
 * [] call GRAD_slingHelmet_fnc_whitelist;
 *
 * Public: No
 */

if (isNil "GRAD_slingHelmet_whitelist") then {
    // var has to be initialized
    GRAD_slingHelmet_whitelist = WHITELIST_DEFAULT;
    publicVariable "GRAD_slingHelmet_whitelist";
};

GRAD_slingHelmet_whitelist;
