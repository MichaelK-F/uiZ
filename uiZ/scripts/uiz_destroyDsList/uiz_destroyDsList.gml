/// @description uiz_destroyDsList(ds_list)
/// @param ds_list
function uiz_destroyDsList(argument0) {
	/*
	First checks whether a ds_list exists, and if it does destroys it.
	Returns nothing.
	*/
	if ds_exists(argument0,ds_type_list) then{ds_list_destroy(argument0)}



}
