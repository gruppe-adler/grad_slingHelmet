
private _getMod = {
    params [["_config", configNull, [configNull]]];

    private _mod = "";
    private _addons = configSourceAddonList _config;
    if (_addons isNotEqualTo []) then {
        private _mods = configSourceModList (configfile >> "CfgPatches" >> _addons select 0);
        if (_mods isNotEqualTo []) then {
            _mod = _mods select 0;
        };
    };

    _mod
};

if (isNil "grad_slingHelmet_helPAss_headgearByMod") then {
    private _headgearByMod = createHashMap;
    {
        private _cfg = _x;
        private _className = configName _cfg;

        (_className call BIS_fnc_itemType) params ["", "_itemType"];
        if (_itemType isNotEqualTo "Headgear") then { continue; };

        private _scope = [_cfg, "scope", 0] call BIS_fnc_returnConfigEntry;
        if (_scope isEqualTo 0) then { continue; };

        private _mod = [_cfg] call _getMod;

        private _helmetList = _headgearByMod getOrDefault [_mod, [], true];
        _helmetList pushBackUnique _className;
    } forEach ("true" configClasses (configFile >> "CfgWeapons"));

    grad_slingHelmet_helPAss_headgearByMod = _headgearByMod;
};


grad_slingHelmet_helPAss_headgearByMod