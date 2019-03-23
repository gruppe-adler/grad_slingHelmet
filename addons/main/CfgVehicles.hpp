class CfgVehicles
{
	class ReammoBox;
	class GRAD_slingHelmet_WeaponHolder: ReammoBox
	{
		scope = 1;
		author = "DerZade [A]";
		_generalMacro = "GRAD_slingHelmet_WeaponHolder";
		scopeCurator = 0;
		model = "x\grad_slinghelmet\addons\main\model.p3d";
		accuracy = 0.2;
		mapSize = 1.39;
		class TransportMagazines {};
		forceSupply = 0;
		memoryPointSupply = "";
		supplyRadius = 0;
		showWeaponCargo = 1;
		transportMaxMagazines = "1e+009";
		transportMaxWeapons = "1e+009";
		displayName = "GRAD Sling Helmet WH";
		destrType = "DestructNo";
		transportMaxBackpacks = 0;
		isGround = 0;
		icon = "iconObject_1x1";
	};

     class Man;
     class CAManBase: Man
     {
          class ACE_SelfActions
          {
               class ACE_Equipment {
                    #include "ACE_SelfActions.hpp"
               };
          };
     };
};
