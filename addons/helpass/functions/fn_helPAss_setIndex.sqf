#include "../script_component.hpp"

params ["_display", "_index"];

private _allHelmets = _display getVariable ["grad_slingHelmet_helPAss_allHelmets", []];
private _resultsMap = _display getVariable ["grad_slingHelmet_helPAss_resultsMap", createHashMap];

// bounds check
if (_index < 0) then { _index = 0; };
if (_index >= count _allHelmets) then { _index = count _allHelmets - 1; };

private _helmet = _allHelmets # _index;
private _helmetDisplayName = [(configFile >> "CfgWeapons" >> _helmet), "displayName", ""] call BIS_fnc_returnConfigEntry;
private _helmetPicture = [(configFile >> "CfgWeapons" >> _helmet), "picture", ""] call BIS_fnc_returnConfigEntry;

_display setVariable ["grad_slingHelmet_helPAss_index", _index];
(_display displayCtrl IDC_LIST) lbSetCurSel _index;

(_display displayCtrl IDC_HELMET_NAME) ctrlSetText format ["%1 (%2)", _helmetDisplayName, _helmet];
(_display displayCtrl IDC_HELMET_PICTURE) ctrlSetText _helmetPicture;
if (_helmet in _resultsMap) then {
	private _texture = if (_resultsMap get _helmet) then {"\a3\3den\Data\Controls\CtrlMenu\pictureCheckboxEnabled_ca.paa"} else {"\a3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa"};
	private _color = if (_resultsMap get _helmet) then {[0, 1, 0, 1]} else {[1, 0, 0, 1]};
	(_display displayCtrl IDC_HELMET_STATE) ctrlSetText _texture;
	(_display displayCtrl IDC_HELMET_STATE) ctrlSetTextColor _color;
} else {
	(_display displayCtrl IDC_HELMET_STATE) ctrlSetText "#(argb,8,8,3)color(0,1,0,0)";
};

private _done = count _resultsMap;
(_display displayCtrl IDC_PROGRESS) progressSetPosition (_done / (count _allHelmets));
(_display displayCtrl IDC_PROGRESS_TEXT) ctrlSetText format ["%1 / %2", _done, count _allHelmets];

player addHeadgear _helmet;
[player, _helmet] call GRAD_slingHelmet_fnc_addSlungHelmet;
