/*
 * Author: Arend, DerZade
 * Check wether headgear is whitelisted.
 *
 * Arguments:
 * 0: Headgear class <STRING>
 *
 * Return Value:
 * Is whitelisted? <BOOL>
 *
 * Example:
 * ["UK3CB_ADA_B_H_6b27m_ml_ESS_OLI"] call GRAD_slingHelmet_fnc_isWhitelisted;
 *
 * Public: No
 */

params [["_headgear", "", [""]]];

if (_headgear isEqualTo "") exitWith {false;};

// check if all helmets are allowed via CBA setting
if (missionNamespace getVariable ["GRAD_slingHelmet_allowAll", false]) exitWith {true;};

// check if unit's helmet is allowed by mod creator
if !(isNull (configFile >> "CfgWeapons" >> _headgear >> "grad_slingHelmet_allow")) exitWith {true;};

// check wether unit's helemt is in list of allowed helmets
if (_headgear in ([] call GRAD_slingHelmet_fnc_whitelist)) exitWith {true;};

false;