$fn = 64;

//3point5_jack();
//micro_usb();
//translate([0, 3, 0])
//micro_usb_holders();

module 3point5_jack() {
    translate([20, -7, 0])
    rotate([90, 0, 55])
    cylinder(6, 3, 3);
}

module micro_usb() {
    translate([100, 112, 0])
    rotate(90)
    linear_extrude(6)
    square([11, 8]);
}

module micro_usb_holder() {
    linear_extrude(6)
    union() {
        translate([-1, -4.5, 0])
        square([2, 1]);
        translate([-0.5, -6, 0])
        square([1, 1.5]);
    }
}

module micro_usb_holders() {
    micro_usb_holder();
    rotate(180)
    micro_usb_holder();
}