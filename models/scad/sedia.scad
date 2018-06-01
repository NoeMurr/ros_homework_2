module sedia() {
    cube([5,5,45]);
    translate([40,0,0]) cube([5,5,45]);
    translate([40,40,0]) cube([5,5,80]);
    translate([0,40,0]) cube([5,5,80]);
    
    translate([0,0,40]) cube([45,45,5]);
    
    translate([0,40,50]) cube([45,5,30]);
}

sedia();