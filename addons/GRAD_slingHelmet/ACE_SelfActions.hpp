class GRAD_slingHelmet_sling
{
     displayName = $STR_grad_slingHelmet_sling;
     condition = "!(missionNamespace getVariable ['zade_boc_disabled',false]) && !(backpack _player isEqualTo '') && ([_player] call zade_boc_fnc_chestpack isEqualTo '')";
     exceptions[] = {"isNotInside"};
     statement = "[_player] call GRAD_slingHelmet_fnc_actionSling";
     showDisabled = 0;
     priority = 2.5;
     icon = "";
};
class GRAD_slingHelmet_unsling : GRAD_slingHelmet_sling
{
     displayName = $STR_grad_slingHelmet_unsling;
     condition = "(headgear _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')";
     statement = "[_player] call GRAD_slingHelmet_fnc_actionUnsling";
};
