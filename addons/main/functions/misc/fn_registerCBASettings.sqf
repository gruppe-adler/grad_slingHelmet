/*
 * Author: DerZade
 * Registers all CBA settings. Called postInit
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call GRAD_slingHelmet_fnc_registerCBASettings;
 *
 * Public: No
 */

#define MODDISPLAYNAME "GRAD slingHelmet"


[
  "GRAD_slingHelmet_allowAll",
  "CHECKBOX",
  ["Allow any headgear", "Allow any headgear to be slung."],
  MODDISPLAYNAME,
  false,
  true
] call CBA_Settings_fnc_init;

[
  "GRAD_slingHelmet_additionalList",
  "EDITBOX",
  ["Additional whitelist", "Custom additional whitelist of headgear (for SP or Server only)"],
  MODDISPLAYNAME,
  "",
  true,
  {
    if !(isServer) exitWith {};
    (call compile format ["[%1]", _this]) call GRAD_slingHelmet_fnc_addHelmetToWhitelist;
  }
] call CBA_Settings_fnc_init;

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extradata"];
    private _helmetClass = _extradata getOrDefault ["grad_slingHelmet", ""];
    if (_helmetClass != "") then {
        [_unit, _helmetClass] call GRAD_slingHelmet_fnc_addSlungHelmet;
    } else {
        [_unit] call GRAD_slingHelmet_fnc_removeSlungHelmet;
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "_loadout", "_extradata"];
    private _helmetClass = [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet;
    if (_helmetClass != "") then {
        _extradata set ["grad_slingHelmet", _helmetClass];
    };
}] call CBA_fnc_addEventHandler;
