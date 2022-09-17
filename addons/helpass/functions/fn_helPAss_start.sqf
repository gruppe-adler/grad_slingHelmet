#include "../script_component.hpp"

params [
    ["_modID", "", [""]],
    ["_startIndex", 0, [0]],
    ["_resultsMap", createHashMap, [createHashMap]]
];

private _display = (findDisplay 46) createDisplay "grad_slingHelmet_helPAss_display_main";

private _helmets = ([] call grad_slingHelmet_fnc_helPAss_headgearByMod) getOrDefault [_modID, []];

_display setVariable ["grad_slingHelmet_helPAss_modID", _modID];
_display setVariable ["grad_slingHelmet_helPAss_allHelmets", _helmets];
_display setVariable ["grad_slingHelmet_helPAss_resultsMap", _resultsMap];

private _listBox = _display displayCtrl IDC_LIST;
lbClear _listBox;
{
    private _helmetDisplayName = [(configFile >> "CfgWeapons" >> _x), "displayName", ""] call BIS_fnc_returnConfigEntry;
    private _helmetPicture = [(configFile >> "CfgWeapons" >> _x), "picture", ""] call BIS_fnc_returnConfigEntry;

    _listBox lbAdd _helmetDisplayName;
    _listBox lbSetPicture [_forEachIndex, _helmetPicture];

    if (_resultsMap get _x) then {
        _listBox lbSetColor [_forEachIndex, [0,1,0,1]];
    } else {
        _listBox lbSetColor [_forEachIndex, [1,0,0,1]];
    }
} forEach _helmets;

_listBox ctrlAddEventHandler ["LBSelChanged", {
    params ["_ctrl", "_index"];

    private _display = ctrlParent _ctrl;

    private _curIndex = _display getVariable ["grad_slingHelmet_helPAss_index", -1];
    if (_index isEqualTo _curIndex) exitWith {};

    [_display, _index] call grad_slingHelmet_fnc_helPAss_setIndex;
}];

_display displayAddEventHandler ["Unload", {
    params ["_display"];

    private _modID = _display getVariable ["grad_slingHelmet_helPAss_modID", ""];
    private _allHelmets = _display getVariable ["grad_slingHelmet_helPAss_allHelmets", []];
    private _resultsMap = _display getVariable ["grad_slingHelmet_helPAss_resultsMap", createHashMap];

    // switch back to player
    ["grad_slingHelmet_helPAss_updateCam", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    deleteVehicle (_display getVariable "grad_slingHelmet_helPAss_target");
    (_display getVariable "grad_slingHelmet_helPAss_camera") cameraEffect ["Terminate", "back"];

    if (count _allHelmets > count _resultsMap) exitWith {

        [_modId, _resultsMap] spawn { // arma crashes w/o spawn
            private _display = [
                "Looks like you missed some helmets. Do you want to go back and keep selecting or do you want to exit?",
                "You're not done!",
                "Back",
                ["Exit", { (ctrlParent (_this # 0)) setVariable ["grad_slingHelmet_helPAss_exit", true]}],
                "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa",
                findDisplay 46
            ] call BIS_fnc_3DENShowMessage;

            _display setVariable ["grad_slingHelmet_helPAss_params", _this];

            _display displayAddEventHandler ["Unload", {
                params ["_display"];
                (_display getVariable "grad_slingHelmet_helPAss_params") params ["_modID", "_resultsMap"];

                if (_display getVariable ["grad_slingHelmet_helPAss_exit", false]) exitWith {
                    [_modID, _resultsMap] spawn grad_slingHelmet_fnc_helPAss_showResult; // arma crashes w/o spawn
                };

                [_modID, -1, _resultsMap] spawn grad_slingHelmet_fnc_helPAss_start; // arma crashes w/o spawn
            }];
        };
    };

    [_modID, _resultsMap] spawn grad_slingHelmet_fnc_helPAss_showResult;
}];

if (_startIndex isEqualTo -1) then {
    // find first headgear which wasn't neither accepted nor rejected
    _startIndex = _helmets findIf { !(_x in _resultsMap) };
};

[_display, _startIndex] call grad_slingHelmet_fnc_helPAss_setIndex;

// ---------------------------------------------------------------------------------------------------------------------------------------------------------

private _target = createagent ["Logic", (getPos player), [], 0, "none"];
private _camera = "camera" camCreate (eyePos player);

_camera cameraEffect ["internal", "back"];
cameraEffectEnableHUD false;
showCinemaBorder false;

_display setVariable ["grad_slingHelmet_helPAss_camera", _camera];
_display setVariable ["grad_slingHelmet_helPAss_target", _target];

if (isNil "grad_slingHelmet_helPAss_campos") then {
    grad_slingHelmet_helPAss_campos = [5,0,0,[0,0,0.85]];
};

[
    "grad_slingHelmet_helPAss_updateCam",
    "onEachFrame",
    {
        params ["_display", "_camera", "_target", "_center"];

        grad_slingHelmet_helPAss_campos params ["_dis", "_dirH", "_dirV", "_targetPos"];

        [_target, [_dirH + 180, -_dirV, 0]] call bis_fnc_setobjectrotation;
        _target attachto [_center, _targetPos, ""];

        _camera attachto [_target,[0, -_dis, 0],""];
        _camera setdir 0;
    },
    [_display, _camera, _target, player]
] call BIS_fnc_addStackedEventHandler;

(_display displayCtrl IDC_MOUSE_HANLDER) ctrlAddEventHandler ["MouseZChanged", {
    params ["_ctrl"];
    
    private _disMax = 7;
    private _dis = grad_slingHelmet_helPAss_campos select 0;
    _dis = _dis - ((_this select 1) / 10);
    _dis = _dis max (_disMax * 0.05) min _disMax;
    grad_slingHelmet_helPAss_campos set [0, _dis];
}];

(_display displayCtrl IDC_MOUSE_HANLDER) ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl","_btn"];
    private _btns = _ctrl getVariable ["grad_slingHelmet_helPAss_mouseButtons", [false, false]];
    _btns set [_btn, true];
    _ctrl setVariable ["grad_slingHelmet_helPAss_mouseButtons", _btns]
}];

(_display displayCtrl IDC_MOUSE_HANLDER) ctrlAddEventHandler ["MouseButtonUp", {
    params ["_ctrl","_btn"];
    private _btns = _ctrl getVariable ["grad_slingHelmet_helPAss_mouseButtons", [false, false]];
    _btns set [_btn, false];
    _ctrl setVariable ["grad_slingHelmet_helPAss_mouseButtons", _btns]
}];

(_display displayCtrl IDC_MOUSE_HANLDER) ctrlAddEventHandler ["MouseMoving", {
    params ["_ctrl","_xPos","_yPos"];

    private _btns = _ctrl getVariable ["grad_slingHelmet_helPAss_mouseButtons", [false, false]];
    private _oldPos = _ctrl getVariable ["grad_slingHelmet_helPAss_mousePos", getMousePosition];

    private _offsetX = (_oldPos # 0) - _xPos;
    private _offsetY = (_oldPos # 1) - _yPos;

    _ctrl setVariable ["grad_slingHelmet_helPAss_mousePos", [_xPos, _yPos]];
    grad_slingHelmet_helPAss_campos  params ["", "_dirH", "_dirV", "_targetPos"];

    if (_btns # 0) then {
		boundingboxreal player params ["_minBox", "_maxBox"];
		private _centerSizeBottom = _minBox select 2;
		private _centerSizeUp = _maxBox select 2;
		private _centerSize = sqrt ([_minBox select 0, _minBox select 1] distance2D [_maxBox select 0, _maxBox select 1]);
		
		private _z = _targetPos select 2;
		_targetPos = _targetPos getPos [_offsetX * _centerSize, _dirH - 90];
		_z = (_z - (_offsetY) * _centerSize) max _centerSizeBottom min _centerSizeUp;
		_targetPos = [0,0,0] getPos [([0,0,0] distance2D _targetPos) min _centerSize, [0,0,0] getDir _targetPos];
		_targetPos set [2, _z max ((_minBox select 2) + 0.2)];	

		grad_slingHelmet_helPAss_campos set [3, _targetPos];
    };

    if (_btns # 1) then {
        private _dX = _offsetX * 0.75;
		private _dY = _offsetY * 0.75;
		private _z = _targetPos select 2;

        _targetPos = [0,0,0] getPos [[0,0,0] distance2D _targetPos, ([0,0,0] getDir _targetPos) - _dX * 180];
        _targetPos set [2, _z];
		
        grad_slingHelmet_helPAss_campos set [1, (_dirH - _dX * 180) % 360];
		grad_slingHelmet_helPAss_campos set [2, (_dirV - _dY * 100) max -89 min 89];
		grad_slingHelmet_helPAss_campos set [3, _targetPos];
    };

}];
