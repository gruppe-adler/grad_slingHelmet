/*
 * Author: DerZade
 * Triggered by GetInMan-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: position <STRING>
 * 2: vehicle <OBJECT>
 * 3: turret path <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_slingHelmet_fnc_EHGetIn;
 *
 * Public: No
 */
params ["_unit","_position","_veh"];

if (isNil "_unit" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _wh = [_unit] call GRAD_slingHelmet_fnc_weaponHolder;

//detach and hide the weaponholder (slung helmet)
_wh remoteExec ["detach", 0];
_wh remoteExec ["hideObjectGlobal", 0];
[_wh, [-10000,-10000,-100]] remoteExec ["setPos", 0];
