function uiz_textarea_selectionToLeftCursor() {
	selection1Line=selectionMinLine;
	selection1X=selectionMinX;
	selection1Char=selectionMinChar;

	selection2Line=-1;
	selection2X=-1;
	selection2Char=-1

	hasSelection=false;
	isTyping=true;

	uiz_textarea_resetSelection_selectionOnly();//remove selection
	uiz_textarea_registerTypeCursor();



}
