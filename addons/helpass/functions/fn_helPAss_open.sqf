#include "../script_component.hpp"


private _headgearByMod = [] call grad_slingHelmet_fnc_helPAss_headgearByMod;

private _display = (findDisplay 46) createDisplay "grad_slingHelmet_helPAss_display_selectMod";

// fill mods ComboBox
private _modCombo = _display displayCtrl IDC_MOD_COMBO;
{
	private _modID = _x;
    (modParams [_modID, ["name", "logo"]]) params [["_name", "Arma 3 Vanilla"], ["_logo", "#(argb,8,8,3)color(0,1,0,0)"]];

    private _index =_modCombo lbAdd _name;
    _modCombo lbSetPicture [_index, _logo];
	_modCombo lbSetData [_index, _modID];
} forEach (keys _headgearByMod);

lbSort [_modCombo, "ASC"];
_modCombo lbSetCurSel 0;

_display displayAddEventHandler ["Unload", {
    params ["_display", "_exitCode"];

    if (_exitCode isNotEqualTo 1) exitWith {};

	private _combo = _display displayCtrl IDC_MOD_COMBO;
    private _selectedMod = _combo lbData (lbCurSel _combo);

	// spawn, because Arma does not like opening
	// new displays in an display Unload EH
	[_selectedMod] spawn grad_slingHelmet_fnc_helPAss_start;
}];