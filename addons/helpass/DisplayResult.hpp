#define DIALOG_W (60 * GRID_W)
#define DIALOG_H (80 * GRID_H)

#define DIALOG_X CENTER_X(DIALOG_W)
#define DIALOG_Y CENTER_Y(DIALOG_H)
#define DIALOG_TITLE "Gruppe Adler SlingHelmet Helmet Picking Assistant"

class grad_slingHelmet_helPAss_display_result
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
		class dialog_btnClose: ctrlButtonClose
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
				class result: ctrlEditMulti
				{
					idc = IDC_RESULT;
					x = SPACING * GRID_W;
					y = SPACING * GRID_H;
					w = DIALOG_W - SPACING * 2 * GRID_W;
					h = DIALOG_H - (SPACING * 3 + 2.2) * GRID_H;
					text = "";
				};
				class addComments: ctrlCheckbox
				{
					idc = IDC_ADD_COMMENTS;
					x = SPACING * GRID_W;
					y = DIALOG_H - (2.2 + SPACING) * GRID_H;
					w = 2.2 * GRID_W;
					h = 2.2 * GRID_H;
					text = "";
				};
				class text: ctrlStatic
				{
					x = (SPACING + 2.5) * GRID_W;
					y = DIALOG_H - (2.2 + SPACING) * GRID_H;
					w = DIALOG_W - (SPACING + 2.5) * GRID_W;
					h = 2.2 * GRID_H;
					text = "Add display names as comments.";
				};
			};
		};
	};
};
