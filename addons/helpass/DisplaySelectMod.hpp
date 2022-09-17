#define DIALOG_W (50 * GRID_W)

#define DIALOG_H ((5 + SPACING * 2.5) * GRID_H)

#define DIALOG_X CENTER_X(DIALOG_W)
#define DIALOG_Y CENTER_Y(DIALOG_H)
#define DIALOG_TITLE "Gruppe Adler SlingHelmet Helmet Picking Assistant"

class grad_slingHelmet_helPAss_display_selectMod
{
	idd = -1;
	movingEnable = 1;

	class ControlsBackground
	{
		class dialog_background: ctrlStaticBackground
		{
			x = QUOTE(DIALOG_X);
			y = QUOTE(DIALOG_Y);
			w = QUOTE(DIALOG_W);
			h = QUOTE(DIALOG_H + DIALOG_FOOTER_H);
		};
		class dialog_title: ctrlStaticTitle
		{
			x = QUOTE(DIALOG_X);
			y = QUOTE(DIALOG_Y - DIALOG_TITLE_H);
			w = QUOTE(DIALOG_W);
			h = QUOTE(DIALOG_TITLE_H);
			text = DIALOG_TITLE;
		};
		class dialog_footer: ctrlStaticFooter
		{
			x = QUOTE(DIALOG_X);
			y = QUOTE(DIALOG_Y + DIALOG_H);
			w = QUOTE(DIALOG_W);
			h = QUOTE(DIALOG_FOOTER_H);
		};
		class dialog_btnOk: ctrlButtonOK
		{
			x = QUOTE(DIALOG_X + DIALOG_W - 29 * GRID_W);
			y = QUOTE(DIALOG_Y + DIALOG_H + DIALOG_BUTTON_SPACING * GRID_H);
			w = QUOTE(14 * GRID_W);
			h = QUOTE(DIALOG_FOOTER_H - DIALOG_BUTTON_SPACING * 2 * GRID_H);
		};
		class dialog_btnCancel: ctrlButtonCancel
		{
			x = QUOTE(DIALOG_X + DIALOG_W - 14.5 * GRID_W);
			y = QUOTE(DIALOG_Y + DIALOG_H + DIALOG_BUTTON_SPACING * GRID_H);
			w = QUOTE(14 * GRID_W);
			h = QUOTE(DIALOG_FOOTER_H - DIALOG_BUTTON_SPACING * 2 * GRID_H);
		};
	};
	class Controls
	{
		class content: ctrlControlsGroupNoScrollbars
		{
			idc = IDC_DIALOG_CONTENT;
			x = QUOTE(DIALOG_X);
			y = QUOTE(DIALOG_Y);
			w = QUOTE(DIALOG_W);
			h = QUOTE(DIALOG_H);
			class Controls
			{
				class text: ctrlStatic
				{
					idc = -1;
					x = SPACING * GRID_W;
					y = SPACING * GRID_H;
					w = DIALOG_W - SPACING * 2 * GRID_W;
					h = 2.5 * GRID_H;
					text = "Select a mod or DLC. We'll show you headgear from only that mod / DLC";
					style = 2;
				};
				class combo: ctrlCombo
				{
					idc = IDC_MOD_COMBO;
					x = SPACING * GRID_W;
					y = SPACING * 1.5 * GRID_H + 2.5 * GRID_H;
					w = DIALOG_W - SPACING * 2 * GRID_W;
					h = 2.5 * GRID_H;
				};
			};
		};
	};
};
