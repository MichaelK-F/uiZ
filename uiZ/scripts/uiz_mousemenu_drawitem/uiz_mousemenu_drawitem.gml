/// @description uiz_mousemenu_drawitem(i,h,ucolor)
/// @param i
/// @param h
/// @param ucolor
///INTERNAL UIZ SCRIPT, DO NOT USE
function uiz_mousemenu_drawitem(argument0, argument1, argument2) {
	var i = argument0;
	var h = argument1;
	var ucolor = argument2;
	txt=string(uselist[| i])
	th=string_height(string_hash_to_newline(txt))
	//sdbm("your text is: ",txt,ucolor,textcolor)
	if ds_exists(enabledlist,ds_type_list) and ds_list_size(enabledlist)>i and enabledlist[| i]=false then{
	uiz_back_at_item(rx+ubkmar*itemhasdoublemargins,h,rlx-ubkmar*itemhasdoublemargins,th+h,3)
	draw_set_color(textcolordisabled)
	}else{
	uiz_back_at_item(rx+ubkmar*itemhasdoublemargins,h,rlx-ubkmar*itemhasdoublemargins,th+h,ucolor)
	draw_set_color(textcolor)
	}
	draw_set_alpha(1);
	//sdbm(rx+ubkmar+textmargin,h+th/2,uiz_getText_contained(txt,width-ubkmar*2-textmargin),draw_get_color())
	draw_text(rx+ubkmar+textmargin,h+th/2,string_hash_to_newline(uiz_getTextLines_contained(txt,width-ubkmar*2-textmargin,th)))

	return th;



}
