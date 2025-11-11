//////////////////////////////
// Laundry Rack Hinge Half
//////////////////////////////

// === Parameters ===
disk_d       = 49;
disk_h       = 10;
hinge_height = 2*disk_h;     // total height (two halves)
well_d       = 16.5;
well_depth   = 7;
screw_d      = 8.2;

rod_d        = 14;
rod_y_offset = 9;
rod_z_offset = hinge_height/2;  // center of the tall hinge body
rod_total    = 92;
sheath_d     = 19;
sheath_inner_d = 16.4;
sheath_total = rod_total - 18;
sheath_overhang = 8.5;


$fn = 100;

//////////////////////////////
// === Modules ===
//////////////////////////////

module rod() {
    translate([0, rod_y_offset, rod_z_offset])
        rotate([0,90,0])
            union() {
                // Core rod
                cylinder(h = rod_total, d = rod_d);
                // Rod sheath
                difference(){
                    cylinder(h = sheath_total, d = sheath_d);
                    translate([0,0,sheath_total-sheath_overhang])
                        cylinder(h = sheath_overhang, d = sheath_inner_d);
                }
            }
}

module hinge_half() {
    difference() {
        union() {
            cylinder(h = hinge_height, d = disk_d);
            rod();
        }
        // counterbore
        translate([0,0,hinge_height + 0.1 - well_depth])
            cylinder(h = well_depth, d = well_d);
        // screw hole
        cylinder(h = hinge_height + 0.1, d = screw_d);
        // recess for mating half
        cylinder(h = hinge_height/2, d = disk_d);
    }
}

//////////////////////////////
// === Render ===
//////////////////////////////
hinge_half();
