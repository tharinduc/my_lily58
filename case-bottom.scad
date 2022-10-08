include <switch-hole.scad>
include <case.scad>

//resize([0,0,1.5])
//bottom_base_out();
bottom_base_with_screw_holders();

module bottom_base_out() {
    keyboard_shape();
    // screw holes
    union() {
        translate([12, 22, 0])
        screw_hold(4);
        translate([12, 22, 0])
        cylinder(4, 1, 1);
    }
    
    union() {
        translate([12, 88, 0])
        screw_hold(4);
        translate([12, 88, 0])
        cylinder(4, 1, 1);
    }
    
    union() {
        translate([92, 100, 0])
        screw_hold(4);
        translate([92, 100, 0])
        cylinder(4, 1, 1);
    }
    
    union() {
        translate([70, 12, 0])
        screw_hold(4);
        translate([70, 12, 0])
        cylinder(4, 1, 1);
    }
}

module bottom_base_with_screw_holders() {
    resize([0,0,1.5])
    keyboard_shape();
    // screw holes
    union() {
        translate([12, 22, 0])
        screw_hold(13.5);
    }
    
    union() {
        translate([12, 88, 0])
        screw_hold(13.5);
    }
    
    union() {
        translate([92, 100, 0])
        screw_hold(13.5);
    }
    
    union() {
        translate([70, 12, 0])
        screw_hold(13.5);
    }
}

module keyboard_shape() {
    union() {
        case_top();
        keys_layout_matrix(5, 7, sw_length + gap_between_sw_holes) switch_hole(0, 4);
    }
}
        