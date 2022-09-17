#define PICTURE_SIZE 15
#define TEXT_HEIGHT 5
#define BTN_SIZE 5
#define LIST_WIDTH 40
#define LIST_HEIGHT 30

class grad_slingHelmet_helPAss_display_main
{
	idd = -1;
	movingEnable = 1;

	class ControlsBackground
	{
		class progess: RscProgress
		{
			x = safezoneX;
			y = safezoneY + safezoneH - 0.4 * GRID_H;
			w = safezoneW - LIST_WIDTH * GRID_W;
			idc = IDC_PROGRESS;
			h = 0.4 * GRID_H;
		};
		class helmetPicture: ctrlStaticPicture
		{
			x = safezoneX + SPACING * GRID_W;
			y = safezoneY + safezoneH - (PICTURE_SIZE + SPACING) * GRID_H;
			w = PICTURE_SIZE * GRID_W;
			h = PICTURE_SIZE * GRID_H;
			idc = IDC_HELMET_PICTURE;
		};
		class helmetSate: ctrlStaticPicture
		{
			x = (safezoneX + SPACING * GRID_W) + PICTURE_SIZE * (2/3) * GRID_W;
			y = (safezoneY + safezoneH - (PICTURE_SIZE + SPACING) * GRID_H) + PICTURE_SIZE * (2/3) * GRID_H;
			w = PICTURE_SIZE / 3 * GRID_W;
			h = PICTURE_SIZE / 3 * GRID_H;
			idc = IDC_HELMET_STATE;
		};
		class helmetName: ctrlStatic
		{
			x = safezoneX + (SPACING * 2 + PICTURE_SIZE) * GRID_W;
			y = safezoneY + safezoneH - (SPACING + (PICTURE_SIZE + TEXT_HEIGHT) / 2) * GRID_H;
			w = safezoneW - (SPACING * 3 + PICTURE_SIZE + LIST_WIDTH) * GRID_W;
			h = TEXT_HEIGHT * GRID_H;
			idc = IDC_HELMET_NAME;
			shadow = 0;
			sizeEx = 3.5 * GRID_H;
		};
		class progressText: helmetName
		{
			style = 1;
			idc = IDC_PROGRESS_TEXT;
			y = safezoneY + safezoneH - (TEXT_HEIGHT + SPACING) * GRID_H;
		};
		class mouseHandler: ctrlStructuredText
		{
			text = "";
			x = "safeZoneXAbs";
			y = "safeZoneY";
			w = "safeZoneWAbs";
			h = "safeZoneH";
			colorBackground[] = {1,1,1,0};
			style = 16;
			idc = IDC_MOUSE_HANLDER;
		};
	};
	class Controls
	{
		class accept: ctrlButton
		{
			onButtonClick="params ['_ctrl']; [ctrlParent _ctrl, true] call grad_slingHelmet_fnc_helPAss_choose;";
			text = "ACCEPT";
			x = safezoneX + safezoneW / 2 + SPACING * GRID_W;
			y = safezoneY + SPACING * GRID_H;
			w = BTN_SIZE * 3 * GRID_W;
			h = BTN_SIZE * GRID_H;
			colorFocused[] = {0, 1, 0, 1};
			colorBackgroundActive[] = {0, 1, 0, 1};
		};
		class reject: accept
		{
			onButtonClick="params ['_ctrl']; [ctrlParent _ctrl, false] call grad_slingHelmet_fnc_helPAss_choose;";
			text = "REJECT";
			x = safezoneX + safezoneW / 2 - (SPACING + 3 * BTN_SIZE) * GRID_W;
			colorFocused[] = {1, 0, 0, 1};
			colorBackgroundActive[] = {1, 0, 0, 1};
		};
		class list: ctrlListBox
		{
			x = safezoneX + safezoneW - LIST_WIDTH * GRID_W;
			y = safezoneY + safezoneH - LIST_HEIGHT * GRID_H;
			w = LIST_WIDTH * GRID_W;	
			h = LIST_HEIGHT * GRID_H;
			idc = IDC_LIST;
		};
	};
};
