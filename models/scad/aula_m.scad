module tavolo_1(){
    union(){
        // pianale 140x80x3
        translate([0,0,69]) cube([140, 80, 3]);
        
        // gamba 1
        translate([11,11,0])
            rotate(a=90, v=[0,0,1]) 
                cylinder($fn=3, r=7, h=69);
        // gamba 2
        translate([129,11,0])
            rotate(a=90, v=[0,0,1]) 
                cylinder($fn=3, r=7, h=69);
        
        // gamba 3
        translate([11,69,0])
            rotate(a=-90, v=[0,0,1]) 
                cylinder($fn=3, r=7, h=69);
        // gamba 4
        translate([129,69,0])
            rotate(a=-90, v=[0,0,1]) 
                cylinder($fn=3, r=7, h=69);
    }
}

module tavolo_2(){
    
    module gamba_tavolo_2(){
        rotate(a=90, v=[0,0,1])
            union(){
                translate([1,0,0]) cube([78,8,3]);
                translate([35, 0, 0]) cube([8,8,74]);
            }
    }
    
    union(){
        // pianale 120x80x3
        translate([0,0,74]) cube([120, 80, 3]);
        
        // gamba 1
        translate([8,0,0]) gamba_tavolo_2();
        
        // gamba 2
        translate([120,0,0]) gamba_tavolo_2();
    
    }
}

module audio(){
    union(){
        translate([0,0,7]) cube([53,43,85]);
        
        translate([3.5,3.5,3.5]) sphere(r=3.5, $fn=50);
        translate([49.5,3.5,3.5]) sphere(r=3.5, $fn=50);
        translate([3.5,39.5,3.5]) sphere(r=3.5, $fn=50);
        translate([49.5,39.5,3.5]) sphere(r=3.5, $fn=50);
    }
}

module armadio(){
    module maniglia(){
        difference(){
            cube([2,5,10]);
            translate([0,2,2]) cube([3,3,6]);
        }
    }
    union(){
        cube([95,46,84]);
        translate([42,-5,68]) maniglia();
        translate([53,-5,68]) maniglia();
    }
}

module lucidi() {
    union(){
        translate([0,0,50]) cube([45,40,3]);
        cube([2,2,77]);
        translate([43,0,0]) cube([2,2,77]);
        translate([0,38,0]) cube([2,2,77]);
        translate([43,38,0]) cube([2,2,77]);
        translate([0,0,75]) cube([2,40,2]);
        translate([43,0,75]) cube([2,40,2]);
    }
}


module pareti() {
    
    module parete_sud(){
        // todo aggiungi termoconvettori
        module colonna(){
            union(){
                cube([63, 28,290]);
                cube([38, 28+27,290]);
            }
        }
        
        module termoconvettore(){
            module gamba() {
                hull(){
                    cube([10,5,10]);
                    translate([4,16,0]) cylinder(r=4,h=1);
                    translate([6,16,0]) cylinder(r=4,h=1);
                    translate([4,16,9]) cylinder(r=4,h=1);
                    translate([6,16,9]) cylinder(r=4,h=1);
                }
            }
            
            module corpo(){
                hull() {
                    cube([120, 10, 45]);
                    translate([5, 17, 0]) cylinder(r=5, h=1);
                    translate([5, 17, 44]) cylinder(r=5, h=1);
                    translate([115, 17, 44]) cylinder(r=5, h=1);
                    translate([115, 17, 0]) cylinder(r=5, h=1);
                }
            }
    
            translate([0,0, 10]) corpo();
            gamba();
            translate([110,0,0]) gamba();
        }
        
        translate([28,0,0])
            difference(){
                cube([20,290,290]);
                translate([0,10,97]) cube([20,120,190]);
                translate([0,155,97]) cube([20,120,190]);
            }
        
        translate([0,290,0]) colonna();
        
        translate([0,290+28+27,0])    
        difference(){
            cube([20,520,290]);
            translate([0,65,97]) cube([20,140,140]);
            translate([0,270,97]) cube([20,140,140]);
        }
        
        translate([20, 290+28+25+86+120,0]) 
            rotate(a=-90, v=[0,0,1])
                termoconvettore();
        
        translate([20, 290+28+25+86+240+93,0]) 
            rotate(a=-90, v=[0,0,1])
                termoconvettore();
    }


    module parete_ovest() {
        
        module angolo() {
            cube([52,8.5,53]);
        }
        
        difference(){
            cube([883,20,290]);
            translate([883-180-15,0,0]) cube([180,13,210]);
        }
        
        translate([20,-8.5,0]) 
            angolo();
        
    }

    module parete_nord() {
        
        union() {
            translate([110,216,0]) cube([20,670,290]);
            difference(){
                cube([20,216+20,290]);
                translate([0,18,0]) cube([20,180,210]);
            }
            translate([20,216,0]) cube([90,20,290]);
        }
        
    }

    module parete_est(){
        cube([244+486+35,20,290]);
    }
    
    translate([0,290+28+27+520,0]) parete_ovest();
    parete_sud();
    translate([486+244+43,0,0]) parete_nord();
    translate([28,-20,0]) parete_est();
}

module tavoli() {
    module fila() {
        translate([20,345,0]) tavolo_1();
        translate([20+140,345,0]) tavolo_1();
    }
    
    module fila_2() {
        translate([740,345,0]) tavolo_1();
        translate([740-140,345,0]) tavolo_1();
        translate([740-140*2,345,0]) tavolo_1();
    }
    
    fila();
    translate([20,160,0]) fila();
    translate([20,160*2,0]) fila();
    
    fila_2();
    translate([0,160,0]) fila_2();
    translate([0,160*2,0]) fila_2();
}

pareti();
tavoli();

translate([350,50,0]) tavolo_2();
translate([880,240,0]) rotate([0,0,90], [0,0,1]) audio();
