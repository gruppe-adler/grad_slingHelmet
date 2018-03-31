/*
 * Author: DerZade
 * Returns wether a unit can sling it's helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Sling <BOOL>
 *
 * Example:
 * [player] call GRAD_slingHelmet_fnc_canSlingHelmet;
 *
 * Public: No
 */

#include "..\..\allowedHeadgear.hpp"

params ["_unit"];

//unit has to have headgear
if (headgear _unit isEqualTo '') exitWith {false;};

//unit must not have a slung helmet already
if !([_unit] call GRAD_slingHelmet_fnc_getSlungHelmet isEqualTo '') exitWith {false;};

//check wether unit's helemt is in list of allowed helmets
if !((headgear _unit) in _allowedHeadgear) exitWith {false;};

true;
