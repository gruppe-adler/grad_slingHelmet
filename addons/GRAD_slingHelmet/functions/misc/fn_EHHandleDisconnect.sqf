/*
 * Author: DerZade
 * Triggered by HandleDisconnect-Eventhandler on Server.
 * Handles deleting the slung helmet of old units form disconnected players.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call GRAD_slingHelmet_fnc_HandleDisconnect;
 *
 * Public: Yes
 */
params ["_unit"];

if !([_unit] call GRAD_slingHelmet_fnc_getSlungHelmet isEqualTo "") then {
     [[_unit] call GRAD_slingHelmet_fnc_weaponHolder, _unit] spawn {
          params ["_wh","_unit"];
          sleep 1.5;
          if !(alive _unit) then {
               deleteVehicle _wh;
          };
     };
};
