params [
	["_modId", "", [""]],
    ["_resultsMap", createHashMap, [createHashMap]],
	["_addComments", true, [true]]
];

private _allHelmets = ([] call grad_slingHelmet_fnc_helPAss_headgearByMod) getOrDefault [_modId, []];
private _partial = count _allHelmets > count _resultsMap;

(modParams [_modID, ["name"]]) params [["_modDisplayName", _modID]];

private _helmetStrs = [];

{
	if (!_y) then {continue};

	private _displayName = [(configFile >> "CfgWeapons" >> _x), "displayName", ""] call BIS_fnc_returnConfigEntry;

	private _str = if (!_addComments || _displayName isEqualTo "") then {
		format ['"%1",', _x]
	} else {
		// yes this looks weird af but I seem to have encountered
		// a bug in SQF. Apperently using two slases within a
		// string using single quotes is buggy... :|
		format ['"%1", %2%2 %3', _x, "/", _displayName] 
	};

	_helmetStrs pushBackUnique _str;
} forEach _resultsMap;

private _str = _helmetStrs  joinString endl;

if (_modDisplayName isEqualTo "") then {
	_modDisplayName = "Arma 3 Vanilla";
};

format ["// %1%2%3%4", _modDisplayName, if(_partial) then {" (partially)"} else {""}, endl, _str]