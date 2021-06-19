/// @description uiz_depth_foreground(instanceid)
/// @param instanceid
function uiz_depth_foreground(argument0) {
	with(argument0){

	    if uiz_diddepth=false then{
	        uiz_fix_Depth()
	    }
    
	    //gather variables
	    var l=parent.children;
	    var sz=ds_list_size(l);
    
	    if sz > 1 and listpos != sz-1 then{
	        uiz_depth_set(argument0, -l[| sz-1].depth-1)
	    }

	}
}
