#include "script_component.hpp"

class CfgPatches
{
    class grad_slingHelmet_helPAss
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.02;
        requiredAddons[] = {"a3_ui_f","grad_slingHelmet_main"};
        author = "DerZade";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"

class ctrlStaticBackground;
class ctrlStaticTitle;
class ctrlStaticFooter;
class ctrlButtonOK;
class ctrlButtonCancel;
class ctrlButtonClose;
class ctrlCombo;
class ctrlStatic;
class ctrlControlsGroupNoScrollbars;
class RscProgress;
class ctrlStaticPicture;
class ctrlButtonPictureKeepAspect;
class ctrlButton;
class ctrlListBox;
class ctrlEditMulti;
class ctrlStructuredText;
class ctrlCheckbox;

#include "DisplaySelectMod.hpp"
#include "DisplayMain.hpp"
#include "DisplayResult.hpp"