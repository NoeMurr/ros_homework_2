module sedia() {
    cube([0.05,0.05,0.45]);
    translate([0.40,0,0]) cube([0.05,0.05,0.45]);
    translate([0.40,0.40,0]) cube([0.05,0.05,0.80]);
    translate([0,0.40,0]) cube([0.05,0.05,0.80]);
    
    translate([0,0,0.40]) cube([0.45,0.45,0.05]);
    
    translate([0,0.40,0.50]) cube([0.45,0.05,0.30]);
}

sedia();