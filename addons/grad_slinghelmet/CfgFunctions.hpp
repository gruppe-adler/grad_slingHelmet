class CfgFunctions
{
	class GRAD_slingHelmet
	{
		tag = "GRAD_slingHelmet";
		class commands
		{
			file = "\grad_slinghelmet\functions\commands";
			class addHelmetToWhitelist {};
			class addSlungHelmet {};
			class canSlingHelmet {};
			class getSlungHelmet {};
			class removeSlungHelmet {};
		}
		class misc
		{
			file = "\grad_slinghelmet\functions\misc";
			class actionSling {};
			class actionUnSling {};
			class EHGetIn {};
			class EHGetOut {};
			class EHHandleDisconnect {};
			class EHKilled {};
			class weaponHolder {};
			class whitelist {};
		};
	};
};
