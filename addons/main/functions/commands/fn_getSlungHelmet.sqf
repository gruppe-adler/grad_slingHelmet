/*
 * Author: DerZade
 * Returns the classname of a unit's slung helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Classname <STRING>
 *
 * Example:
 * [player] call GRAD_slingHelmet_fnc_getSlungHelmet;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable ["GRAD_slingHelmet_variable",nil];

// no slung helmet; return ""
if (isNil "_var") exitWith {""};

// return classname
(_var select 0)
