///check to disable this event
if kmouseover=0 and mouse_check_button(mb_left) and typing = true then {
    uiz_stringbox_disableSelection(id);
    return true;
}
return false;

