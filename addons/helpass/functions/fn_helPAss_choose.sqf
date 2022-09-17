#include "../script_component.hpp"

params ["_display", "_choice"];

private _allHelmets = _display getVariable ["grad_slingHelmet_helPAss_allHelmets", []];
private _resultsMap = _display getVariable ["grad_slingHelmet_helPAss_resultsMap", createHashMap];
private _currentIndex = _display getVariable ["grad_slingHelmet_helPAss_index", 0];
private _currentHelmet = _allHelmets select _currentIndex;

_resultsMap set [_currentHelmet, _choice];

private _color = [
	[1, 0, 0, 1],
	[0, 1, 0, 1]
] select _choice;

(_display displayCtrl IDC_LIST) lbSetColor [_currentIndex, _color];

[_display] call grad_slingHelmet_fnc_helPAss_next;