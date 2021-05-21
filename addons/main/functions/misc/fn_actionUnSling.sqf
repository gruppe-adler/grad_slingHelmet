/*
 * Author: DerZade
 * Triggered by the unSling-action. Handles all the stuff.
 * Fails if unit already has headgear, but not enough space
 * in inventory to store that headgear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call GRAD_slingHelmet_fnc_actionUnSling;
 *
 * Public: No
 */

params ["_unit"];

private _slungHelmetClass = [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet;
private _currentHelmetClass = headgear _unit;

//can't unsling a non existent helmet
if (_slungHelmetClass isEqualTo "") exitWith {};

if (_currentHelmetClass isNotEqualTo "") then {
    private _succeeded = [_unit, _currentHelmetClass] call CBA_fnc_addItem;

    if (!_succeeded) exitWith {
        ["Not enough space in inventory to add current headgear."] call BIS_fnc_error;
    };

    private _picture = [(configFile >> "CfgWeapons" >> _currentHelmetClass), "picture", ""] call BIS_fnc_returnConfigEntry;
    [
        localize "str_grad_slingHelmet_moved_to_inventory",
        _picture
    ] call ace_common_fnc_displayTextPicture;

    removeHeadgear _unit;
};

[_unit] call GRAD_slingHelmet_fnc_removeSlungHelmet;
_unit addHeadgear _slungHelmetClass;

