/*
 * Author: DerZade
 * Triggered by GetOutMan-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: position <STRING>
 * 2: vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_slingHelmet_fnc_EHGetOut;
 *
 * Public: No
 */
params ["_unit","","_veh"];

if (isNil "_unit" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _wh = [_unit] call GRAD_slingHelmet_fnc_weaponHolder;

// attach and unhide the weaponholder (slung helmet)
[_wh, [_unit,[-0.41,0.3,0],"pelvis", true]] remoteExec ["attachTo", 0];
[_wh, [[1,-0.8,0],[0,0,1]]] remoteExec ["setVectorDirAndUp", 0];
[_wh, false] remoteExec ["hideObjectGlobal", 0];
