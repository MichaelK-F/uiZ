if doscroll then{
    if hasSelection then{
    var sLine = selection2Line;
    }else{
    var sLine = selection1Line;
    }
    var listFrom = uiz_textarea_getListFrom();
    var listTo = uiz_textarea_getListTo(listFrom);
    if sLine<=ceil(listFrom) then{
        sdbm("movecursorview sLine<=ceil(listFrom)")
        listFromPx = sLine*fontHeight;
        uiz_drawscrollbar_setValue(scroll, listFromPx);
        uiz_updater_FixViews_inside();
        uiz_textarea_registerTypeCursor();
        return true;
    }else if sLine>=floor(listTo){
        var curScroll = uiz_drawscrollbar_getValue(scroll);
        listFromPx = (sLine+1)*fontHeight-iheight;
        if listFromPx<0 then{
            listFromPx=0;
        }
        uiz_drawscrollbar_setValue(scroll, listFromPx);
        uiz_updater_FixViews_inside();
        uiz_textarea_registerTypeCursor();
        sdbm("movecursorview sLine>=floor(listTo)",curScroll,uiz_drawscrollbar_getValue(scroll))
        return true;
    }
    
}
return false;
