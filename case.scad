include <switch-hole.scad>
include <screw.scad>
include <ports.scad>

kb_width = 115;
kb_length = 152;
gap_between_sw_holes = 5;


union() {
    translate([100, 115.5, 0])
    micro_usb_holders();
}

//rotate(90)
//case_top();
//translate([8, 24, 0])
//screw();

module case_top() {
    difference() {
        base_frame();
        hull() {
            bottom_cut_piece1();
            bottom_cut_piece2();
        }
        union() {
            bottom_cut_piece3();
            bottom_cut_piece4();
            top_cut_piece1();
            top_cut_piece2();
            top_cut_piece3();
        }
        
        // screw holes
        union() {
            translate([12, 22, 0])
            screw();
        }
        
        union() {
            translate([12, 88, 0])
            screw();
        }
        
        union() {
            translate([92, 100, 0])
            screw();
        }
        
        union() {
            translate([70, 12, 0])
            screw();
        }
    }
}


module bottom_cut_piece2() {
    rotate(-35)
    translate([-46.3, -11.5, -1])
    linear_extrude(height = 7)
    square(30);
}

module top_cut_piece1() {
    rotate(21)
    translate([10, -60, -1])
    linear_extrude(height = 7)
    color("red") square([100, 40]);
}

module top_cut_piece2() {
    rotate(-35)
    translate([24, -3, -1])
    linear_extrude(height = 7)
    color("red") square([20, 14]);
}

module top_cut_piece3() {
    //rotate(-35)
    translate([26, -18.7, -1])
    linear_extrude(height = 7)
    color("red") square([20, 14]);
}

module bottom_cut_piece4() {
    rotate(74)
    translate([75, 25, -1])
    linear_extrude(height = 7)
    color("red") square([60, 30]);
}

module bottom_cut_piece3() {
    rotate(-35)
    translate([-25.3, -30.5, -1])
    linear_extrude(height = 7)
    color("red") square([60, 30]);
}

module base_frame() {
    difference() {
        linear_extrude(height = 4)
        switch_frame();
        keys_layout_matrix(5, 7, sw_length + gap_between_sw_holes) switch_hole(-2, 8);
    }
}

module bottom_cut_piece1() {
    translate([-20, 25, -1])
    linear_extrude(height = 7)
    square([17, 108]);
}

module switch_frame() {
    translate([-19, -20, 0])
    square([kb_width, kb_length]);
}

module keys_layout_matrix(rows, columns, distance) {
    for(i = [0: rows - 1]) {
        for(j = [0: columns - 1]) {
            if(i == 1 && j == 0) {
                // draw the single switch hole in the first column
                translate([(distance * i) + 9, distance * j, 0])
                children();
            } else if(i == 0 && j == 0) {
                // draw the main thumb switch hole
                rotate(-35)
                translate([-9, 5, 0])
                children();
            } else if(j != 0 ) { // don't draw the first column
                if(i != 0 || j != 1) { // don't draw the bottom switch hole in the second column
                    if((i != 0 || j != 5) && (i != 0 || j != 6)) { // don't draw the last two switch holes in the bottom
                        if(j == 2 || j == 4) {
                            if(i != 0) {
                                // skip thumb row (first and last)
                                translate([(distance * i) + 2, distance * j, 0])
                                children();
                            } else {
                                // draw thumb row shifted towards the thumb (first and last)
                                if(j == 2) {
                                    translate([(distance * i) + 0, (distance * j) - 10, 0])
                                    children();
                                } else {
                                    translate([(distance * i) + 2, (distance * j) - 10, 0])
                                    children();
                                }
                            }
                        } else if(j == 3) {
                            if(i != 0) {
                                // skip thumb row (middle hole)
                                translate([(distance * i) + 3, distance * j, 0])
                                children();
                            } else {
                                // draw thumb row shifted towards the thumb (middle hole)
                                translate([(distance * i) + 2, (distance * j) - 10, 0])
                                children();
                            }
                        } else if(j == 5) {
                            translate([(distance * i) - 3, distance * j, 0])
                            children();
                        } else if(j == 6) {
                            translate([(distance * i) - 4, distance * j, 0])
                            children();
                        } else {
                            translate([distance * i, distance * j, 0])
                            children();
                        }
                    }
                }
            }
        }
    }
}