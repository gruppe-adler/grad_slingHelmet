/*
 * Author: DerZade
 * Adds a slung helmet to given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Helmet Class <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "H_HelmetB_desert"] call GRAD_slingHelmet_fnc_addSlungHelmet;
 *
 * Public: No
 */

params ["_unit", "_helmetClass"];

// remove old helmet if unit has already a slung helmet
if !(([_unit] call GRAD_slingHelmet_fnc_getSlungHelmet) isEqualTo "") then {
    [_unit] call GRAD_slingHelmet_fnc_removeSlungHelmet;
};

// create weaponholder
private _weaponHolder = createVehicle ["GRAD_slingHelmet_WeaponHolder", getPos _unit, [], 0, "CAN_COLLIDE"];
_weaponHolder addItemCargoGlobal [_helmetClass, 1];

// add EHs to unit
private _getInID = _unit addEventHandler ["GetInMan",GRAD_slingHelmet_fnc_EHGetIn];
private _getOutID = _unit addEventHandler ["GetOutMan",GRAD_slingHelmet_fnc_EHGetOut];
private _killedID = _unit addEventHandler ["Killed",GRAD_slingHelmet_fnc_EHKilled];

_unit setVariable ["GRAD_slingHelmet_variable",[_helmetClass, _weaponHolder, [_getInID,_getOutID,_killedID]], true];

// add HandleDisconnect-EH on server if not done yet
if !(missionNamespace getVariable ["GRAD_slingHelmet_HDCEHadded",false]) then {
    ["HandleDisconnect", GRAD_slingHelmet_fnc_EHHandleDisconnect] remoteExec ["addMissionEventHandler", 2];
    GRAD_slingHelmet_HDCEHadded = true;
    publicVariable "GRAD_slingHelmet_HDCEHadded";
};

// execute vehicle shit
if !(vehicle _unit isEqualTo _unit) then {
    [_unit, "", vehicle _unit] call GRAD_slingHelmet_fnc_EHGetIn;
} else {
    [_unit, "", objNull] call GRAD_slingHelmet_fnc_EHGetOut;
};
