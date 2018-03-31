/*
 * Author: DerZade
 * Returns the slung helmet's weaponholder
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Weaponholder <OBJECT>
 *
 * Example:
 * [player] call GRAD_slingHelmet_fnc_weaponHolder;
 *
 * Public: No
 */
params ["_unit"];

private _var = _unit getVariable ["GRAD_slingHelmet_variable",nil];

//return ""
if (isNil "_var") exitWith {""};

//return weaponholder
(_var select 1)
