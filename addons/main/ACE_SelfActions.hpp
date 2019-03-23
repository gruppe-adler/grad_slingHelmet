class GRAD_slingHelmet_sling
{
    displayName = "$STR_grad_slingHelmet_sling";
    condition = "[_player] call GRAD_slingHelmet_fnc_canSlingHelmet";
    exceptions[] = {"isNotInside"};
    statement = "[_player] call GRAD_slingHelmet_fnc_actionSling";
    showDisabled = 0;
    priority = 2.5;
    // icon = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\headgear_ca.paa";
};
class GRAD_slingHelmet_unsling : GRAD_slingHelmet_sling
{
    displayName = "$STR_grad_slingHelmet_unsling";
    condition = "(headgear _player isEqualTo '') && !([_player] call GRAD_slingHelmet_fnc_getSlungHelmet isEqualTo '')";
    statement = "[_player] call GRAD_slingHelmet_fnc_actionUnsling";
};
