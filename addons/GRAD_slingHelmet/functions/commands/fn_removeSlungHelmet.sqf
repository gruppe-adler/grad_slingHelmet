/*
 * Author: DerZade
 * Removes the slung helmet from given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "H_HelmetB_desert"] call GRAD_slingHelmet_fnc_addSlungHelmet;
 *
 * Public: No
 */

params ["_unit"];

private _class = [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet;
private _weaponHolder = [_unit] call GRAD_slingHelmet_fnc_weaponHolder;

if (_class isEqualTo "") exitWith {};

//delete weaponholder and therefore the attched helmet
deleteVehicle _weaponHolder;

//remove EHs
((_unit getVariable "GRAD_slingHelmet_variable") select 2) params ["_getInID","_getOutID","_killedID"];
_unit removeEventHandler ["GetInMan",_getInID];
_unit removeEventHandler ["GetOutMan",_getOutID];
_unit removeEventHandler ["Killed",_killedID];


//update unit's variable
_unit setVariable ["GRAD_slingHelmet_variable",nil, true];
