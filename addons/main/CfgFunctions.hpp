class CfgFunctions
{
    class GRAD_slingHelmet
    {
        tag = "GRAD_slingHelmet";
        class commands
        {
            file = "x\grad_slinghelmet\addons\main\functions\commands";
            class addHelmetToWhitelist {};
            class addSlungHelmet {};
            class canSlingHelmet {};
            class getSlungHelmet {};
            class removeSlungHelmet {};
        };
        class misc
        {
            file = "x\grad_slinghelmet\addons\main\functions\misc";
            class actionSling {};
            class actionSwap {};
            class actionUnSling {};
            class EHGetIn {};
            class EHGetOut {};
            class EHHandleDisconnect {};
            class EHKilled {};
            class registerCBASettings {};
            class weaponHolder {};
            class whitelist {};
            class isWhitelisted {};
        };
    };
};
