//////////////////////////////
// Laundry Rack Hinge Part
//////////////////////////////

// === Parameters ===
disk_d      = 49;
disk_h      = 10;
well_d      = 16.5;
well_depth  = 7;
screw_d     = 8.2;

rod_d       = 14;
rod_y_offset  = 9;     // from disk center to rod axis
rod_z_offset  = disk_h/2;     // from disk center to rod axis
rod_total   = 92;    // distance from disk center to far end

$fn = 100; // smoothness

//////////////////////////////
// === Construction ===
//////////////////////////////

module hinge_part() {
    difference() {
        // --- main solid (disk + rod) ---
        union() {
            // Disk
            cylinder(h = disk_h, d = disk_d);

            // Rod: positioned tangent to disk side
            translate([0, rod_y_offset, rod_z_offset])
                rotate([0,90,0])
                    cylinder(h = rod_total - disk_d/2, d = rod_d);
        }

        // Well (counterbore)
        translate([0,0,disk_h - well_depth])
            cylinder(h = well_depth, d = well_d);

        // Screw hole (through)
        cylinder(h = disk_h + 0.1, d = screw_d);
    }
}

//////////////////////////////
// === Render ===
//////////////////////////////
hinge_part();
