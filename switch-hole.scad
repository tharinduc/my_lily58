sw_length = 14;

//switch_hole(-2, 8);

/*****
//extrude_height = 8 and tanslate_z = -2 to generate the top frame with key holes
//extrude_height = 4 and tanslate_z = 0 to generate the bottom base
******/
module sq1(tanslate_z, extrude_height) {
    translate([0, 0, tanslate_z])
    linear_extrude(height = extrude_height)
    square(sw_length);
}

module sq2() {
    translate([5.5, -1, -1])
    linear_extrude(height = 3)
    square([3, 2]);
}

module sq3() {
    rotate(90)
    translate([4.5, -1, -1])
    linear_extrude(height = 3)
    square([5, 2]);
}

module sq_ring() {
    sq2();
    translate([0, 14, 0])
    sq2();
    sq3();
    translate([14, 0, 0])
    sq3();
}

module switch_hole(tanslate_z, extrude_height) {
    difference() {
        sq1(tanslate_z, extrude_height);
        //sq_ring();
    }
}