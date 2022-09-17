#include "../script_component.hpp"

params [
	["_modId", "", [""]],
    ["_resultsMap", createHashMap, [createHashMap]]
];

private _display = (findDisplay 46) createDisplay "grad_slingHelmet_helPAss_display_result";
_display setVariable ["grad_slingHelmet_helPAss_params", [_modID, _resultsMap]];

// inital fill of list
private _str = [_modID, _resultsMap, true] call grad_slingHelmet_fnc_helPAss_calcResult;
copyToClipboard _str;
(_display displayCtrl IDC_RESULT) ctrlSetText _str;

// setup checkbox
(_display displayCtrl IDC_ADD_COMMENTS) cbSetChecked true;
(_display displayCtrl IDC_ADD_COMMENTS) ctrlAddEventHandler ["CheckedChanged", {
	params ["_control", "_checked"];
	private _display = ctrlParent _control;

	(_display getVariable "grad_slingHelmet_helPAss_params") params ["_modID", "_resultsMap"];

	private _str = [_modID, _resultsMap, [false, true] select _checked] call grad_slingHelmet_fnc_helPAss_calcResult;
	copyToClipboard _str;
	(_display displayCtrl IDC_RESULT) ctrlSetText _str;
}];
