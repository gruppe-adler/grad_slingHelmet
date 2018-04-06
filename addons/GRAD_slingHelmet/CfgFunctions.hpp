class CfgFunctions
{
	class GRAD_slingHelmet
	{
		tag = "GRAD_slingHelmet";
		class commands
		{
			file = "\GRAD_slingHelmet\functions\commands";
			class addHelmetToWhitelist {};
			class addSlungHelmet {};
			class canSlingHelmet {};
			class getSlungHelmet {};
			class removeSlungHelmet {};
		}
		class misc
		{
			file = "\GRAD_slingHelmet\functions\misc";
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
