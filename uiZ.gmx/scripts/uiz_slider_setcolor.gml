///uiz_slider_setcolor(instanceid,left[c_green],right[c_red])
gml_pragma("forceinline");

if argument0.coloranimation then{
    with(argument0){
        uiz_updater_step();
        color1from=color1;
        color2from=color2;
        color1to=argument1;
        color2to=argument2;
        animateColors=0;
    }
}else{
    argument0.color1=argument1;
    argument0.color2=argument2;
}
