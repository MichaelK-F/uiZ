var menu = uiz_spawnMouseMenu(obj_windows31controller.menulist_main,false,-1,uiz_acceldecel,uiz_acceldecel,uiz_acceldecel,1);
uiz_win31_template_mousemenu(menu);
menu.enabledlist=obj_windows31controller.menulist_main_enabled;
ds_list_add(obj_windows31controller.WindowMouseMenuList,menu)
ds_list_add(obj_windows31controller.WindowMouseMenuWindowList,argument0)
uiz_mousemenu_setListenerScript(menu,argument0,uiz_win31_window_handleMouseMenu)
uiz_fixgeneralpos(menu)
