/*
 * Author: Arend, DerZade
 * Swaps the slung helmet and the headgear item currently being worn.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call GRAD_slingHelmet_fnc_actionSwap;
 *
 * Public: No
 */

params ["_unit"];

private _helmetClass = headgear _unit;
removeHeadgear _unit;

[_unit] call GRAD_slingHelmet_fnc_actionUnsling;

// Restore the headgear as slung helmet
[_unit, _helmetClass] call GRAD_slingHelmet_fnc_addSlungHelmet;
