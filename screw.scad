$fn = 64;

//screw();
//screw_hold(15);

module screw() {
    //translate([0, 0, 5])
    //rotate([0, 180, 0])
    translate([0, 0, -1])
    rotate([0, 0, 0]) union() {
    screw_head_hole();
    screw_hole(6);
    }
}

module screw_head_hole() {
    cylinder(2, 2, 2);
}

module screw_hole(height) {
    cylinder(height, 1, 1);
}

module screw_hold(height) {
    difference() {
        cylinder(height, 2, 2);
        translate([0, 0, 4])
        cylinder(height, 1, 1);
    }
}