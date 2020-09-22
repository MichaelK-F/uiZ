/// @description uiz_framesetfixvertical(anchor,bool children?)
/// @param anchor
/// @param bool children?
function uiz_framesetfixvertical(argument0) {
	/*
	A more advanced function which requires more knowledge of the interal workings of uiz framesetstructures.
	Takes an anchor and "fixes" its division values.
	The right function needs to be used with the right type of anchor, else errors might occur.
	A more global and easier function would be: uiz_fixframesetpos() which can also be handled by uiz_fixgeneralpos(). 
	*/
	with(argument0) {
	    uiz_fix_Base_Pos();
	    uiz_fix_Base_Alpha();
	    uiz_fix_Base_Margins();
	    uiz_frameset_fixThickness();
	}



	var g = argument0;

	var updateIsz = false;
	if g.lastFixSize != g.width or forceFixSize then{
	    updateIsz = true;
	    forceFixSize = false;
	}

	if updateIsz then{
	    g.starsr = 0
	    var toleft = g.iwidth - g.marginl - g.marginr;
	    for (var i = 0; i < g.divisions; i++) {
    
	        if g.isize[i] < 0 then {
	            g.isize[i] = 0
	        }
    
	        switch (g.isizetype[i]) {
	            case xtra:
	                g.starsr += g.isize[i]
	                break;
	            case px:
	                g.isz[i] = round(g.isize[i] + g.margincellw * 2)
	                toleft -= g.isz[i]
	                break;
	            case dp:
	                g.isz[i] = round(g.isize[i] * uiz_dp + g.margincellw * 2)
	                toleft -= g.isz[i]
	                break;
	            case fc:
	            case fcx:
	                g.isz[i] = round(g.isize[i] * (g.iwidth - g.marginr - g.marginl) + g.margincellw * 2)
	                toleft -= g.isz[i]
	                break;
	            case fcy:
	                g.isz[i] = round(g.isize[i] * (g.iheight - g.margint - g.marginb) + g.margincellw * 2)
	                toleft -= g.isz[i]
	                break;
	        }
	        if g.hasBar[i] then{
	            toleft -= g.thickness;
	        }
	    }

	    g.toleft = toleft;

	    if g.starsr > 0 then {
	        if toleft > 0 then {
	            var startSize = (toleft / g.starsr);
	            uiz_frameset_getLeftOverXtraPixels(g);
            
	            for (var i = 0; i < g.divisions; ++i) {
	                if g.isizetype[i] = xtra then {
	                    g.isz[i] = round(startSize * g.isize[i]) + g.absorbPixelDiff[i];
	                    //sdbm("setting gisz",i,string_format(startSize * g.isize[i],4,16),g.absorbPixelDiff[i],g.isz[i])
	                }
	            }
	        } else {
	            for (var i = 0; i < g.divisions; i++) {
	                if g.isizetype[i] = xtra then {
	                    g.isz[i] = 0;
	                }
	            }
	        }
	    }
    
	    if toleft < 0 then {
	        var factor = (g.iwidth - g.marginl - g.marginr) / (g.iwidth - g.marginl - g.marginr - toleft)
	        for (var i = 0; i < g.divisions; i++) {
	            g.isz[i] *= factor
	        }
	    }
	}
	//really set the objects sizes
	at = g.marginl
	for (var i = 0; i < g.divisions; i++) {
	    g.doxt[i] = 0
	    g.frameat[i].x = at + g.margincellw
	    at += g.isz[i];
	    if g.hasBar[i] then{ at += g.thickness;}
	    //set the final framesizes
	    g.frameat[i].width = g.isz[i] - g.margincellw * 2
	    g.frameat[i].height = g.iheight;
    

	    if g.frameat[i].object_index = obj_uiZ_framerowanchor then {
	        g.doxt[i] = 1
	    }
	    if g.frameat[i].object_index = obj_uiZ_framecolanchor then {
	        g.doxt[i] = 2
	    }
	}

	//sdbm("fix divisions");
	for (var i = 0; i < g.divisions; i++) {
	    if global.isfixinggrandchildren = false then {
	        uiz_fixgeneralpos(g.frameat[i]);
	        //sdbm("       i:",i," isz:",g.isz[i]," isize:",g.isize[i]," absorb:",g.absorbPixelDiff[i]," width:",g.frameat[i].width," rx:",g.frameat[i].rx," rlx:",g.frameat[i].rlx)
	        uiz_fixChildren(g.frameat[i], true);
	    }
	    switch (g.doxt[i]) {
	        case 1:
	            uiz_framesetfixhorizontal(g.frameat[i])
	            break;
	        case 2:
	            uiz_framesetfixvertical(g.frameat[i])
	            break;
	    }
	}

	g.lastFixSize = g.width;



}
