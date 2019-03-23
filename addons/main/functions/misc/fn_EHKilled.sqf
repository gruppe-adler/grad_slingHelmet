/*
 * Author: DerZade
 * Triggerd by Killed-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_slingHelmet_fnc_EHKilled;
 *
 * Public: No
 */
params ["_unit"];
private _helmet = [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet;

//spawns new weaponholder with helmet on players body
private _holder = createVehicle ["WeaponHolderSimulated", (getPos _unit), [], 0, "CAN_COLLIDE"];
_holder addItemCargoGlobal [_helmet, 1];

//remove the helmet from the dead unit
[_unit] call GRAD_slingHelmet_fnc_removeSlungHelmet;
