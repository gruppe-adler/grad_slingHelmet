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

params ["_unit"];

//unit has to have headgear
if (headgear _unit isEqualTo '') exitWith {false;};

//unit must not have a slung helmet already
if !([_unit] call GRAD_slingHelmet_fnc_getSlungHelmet isEqualTo '') exitWith {false;};

//check if all helmets are allowed via CBA setting
if !(missionNamespace getVariable ["GRAD_slingHelmet_allowAll", false]) exitWith {true;};

//check ii uni's helmet is allowed by mod creator
if !(isNull (configFile >> "CfgWeapons" >> (headgear _unit) >> "grad_slingHelmet_allow")) exitWith {true;};

//check wether unit's helemt is in list of allowed helmets
if !((headgear _unit) in ([] call GRAD_slingHelmet_fnc_whitelist)) exitWith {false;};

true;
