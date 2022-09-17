params ["_display"];

private _allHelmets = _display getVariable ["grad_slingHelmet_helPAss_allHelmets", []];
private _resultsMap = _display getVariable ["grad_slingHelmet_helPAss_resultsMap", createHashMap];
private _currentIndex = _display getVariable ["grad_slingHelmet_helPAss_index", 0];

private _nextIndex = _currentIndex + 1;
while {_nextIndex isNotEqualTo _currentIndex} do {
	if (_nextIndex >= count _allHelmets) then {
		_nextIndex = 0;
	};

	if !((_allHelmets # _nextIndex) in _resultsMap) exitWith {};

	_nextIndex = _nextIndex + 1;
};

if (_nextIndex isEqualTo _currentIndex) exitWith {
	_display closeDisplay 1;
};
	
[_display, _nextIndex] call grad_slingHelmet_fnc_helPAss_setIndex;