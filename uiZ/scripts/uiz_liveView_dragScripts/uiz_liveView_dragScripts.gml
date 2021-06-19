
function uiz_liveView_dragScript_depthSort(){
	var draggingItem = argument1;//the #id of the item being dragged
	var itemDestination = argument2;//the #id of the item being dragged to
	var itemDestinationYPosition = argument3;//if the draggingItem was dragged to the bottom half of the itemDestination (=1) or if the draggingItem was dragged to the top half of the itemDestination (=0), and everthing between those two values.
	if instance_exists(argument0) and draggingItem!=-1 and itemDestination!=-1{//if itemDestination==-1 then the user dragged the item onto nothingness
	    with(argument0){
			//get variables
			var xml = uiz_treelist_getxml(argument0);
			var draggingItemXmlHandle = uiz_treelist_getXmlHandle(argument0, draggingItem);
			var itemDestinationXmlHandle = uiz_treelist_getXmlHandle(argument0, itemDestination);
			var draggingItemInstance = uiz_xml_gettaginfo_at(xml, draggingItemXmlHandle, "instance_id" ,noone);
			var itemDestinationInstance = uiz_xml_gettaginfo_at(xml, itemDestinationXmlHandle, "instance_id" ,noone);
			var draggingItemObjListPos = ds_list_find_index(obj_uiZ_designer.main_area_objectList, draggingItemInstance);
			var itemDestinationObjListPos = ds_list_find_index(obj_uiZ_designer.main_area_objectList, itemDestinationInstance);
	        if itemDestinationYPosition<0.5 then{//if we are hovering over the top of the item
				//move depth
				uiz_depth_moveBehind(draggingItemInstance, itemDestinationInstance);
				
				//move treelist
	            uiz_treelist_moveEntry_recursive(argument0,draggingItem,itemDestination);
	        }else{//if we are hovering over the bottom of the item
	            //var addIndent = 0;
	            //if uiz_treelist_item_get_boxState(argument0,itemDestination)!=uiz_treelist_boxState_noBox then{
	            //    addIndent = 1;//add indent if we are putting this inside another item (instead of under it). We put the item inside when the destination has children.
	            //}
				
				//move depth
				uiz_depth_moveInFront(draggingItemInstance, itemDestinationInstance);
				
				//move treelist
	            uiz_treelist_moveEntry_recursive(argument0,draggingItem,itemDestination+1,uiz_treelist_item_get_indentLevel(argument0,itemDestination)/*+addIndent*/);//add item below the destination, with the same indent as the destination
				
	        }
			
			//move designer objectList
			if (draggingItemObjListPos!=-1 and itemDestinationObjListPos!=-1) then{
				var temp = obj_uiZ_designer.main_area_objectList[|draggingItemObjListPos];
				obj_uiZ_designer.main_area_objectList[|draggingItemObjListPos] = obj_uiZ_designer.main_area_objectList[|itemDestinationObjListPos];
				obj_uiZ_designer.main_area_objectList[|itemDestinationObjListPos] = temp;
			}
			
	        /*
	        for(var i=0;i<ds_list_size(indentEnabledAndBoxList);++i){
	            sdbm(textList[|i],"indent: ",indentEnabledAndBoxList[|i]>>3,id)
	        }
	        */
	    }
	    uiz_selfmarked = false;
	    uiz_updater_FixViews();
	}
}