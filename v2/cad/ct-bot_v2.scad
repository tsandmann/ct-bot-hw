/**
 * c't-Bot mechanical parts
 * 
 * Created by Peter Recktenwald, CC BY-SA 4.0
 * https://github.com/robotfreak/ct-bot/tree/master/CAD
 *
 * Updated for ct-Bot v2 by Timo Sandmann, CC BY-SA 4.0
 * https://github.com/tsandmann/ct-bot-hw/tree/master/v2/cad
 *
 */


$fn = 100;
m3_hole_rad = 1.6;
m2_hole_rad = 1.2;
m3_insert_nut_rad = 3.8 / 2;
m2_insert_nut_rad = 2.8 / 2;

pole_height = 70;


module prism2(b, d, h, ht, sc) {
    linear_extrude(height = ht, scale = sc) polygon(points = [[0, 0], [b, -h / 2], [b, h / 2]]);
}

module prong(radius, depth, width) {
    difference() {
        prism2(radius, radius, width, 1, 1);
        prism2(radius - depth, radius - depth, width, 1, 1);
    }
}

module bms_holder() {
    difference() {
        cube([8, 10.5, 8 + 12], center = false);

        translate([4, 6.5, 14]) cylinder(r = m3_insert_nut_rad, h = 7);
        translate([-1, -1, 15]) cube([10, 3.5, 6], center = false);

        translate([9, 10.5, 0]) rotate([180, 90, 0]) {
            linear_extrude(height = 10) polygon(points = [ [-10, 0], [0, 0], [0, 9]]);
        }
    }
}

module bms_holder_v2() {
    difference() {
        translate([-0.4, 4.5, 10]) {
            cube([6.4, 1, 7], center = false);
            translate([0, -6, 5])
            cube([6.4, 6, 2], center = false);
            translate([0, 1, 0])
            cube([6.4, 3, 7], center = false);

        }

        translate([2.8, 1.3, 14.5]) cylinder(d = 3.2, h = 3);
    }
    translate([-0.4, 5.5 + 3, 10]) rotate([0, 90, 0]) {
        linear_extrude(height = 6.4) polygon(points = [ [-7, 0], [0, 0], [0, 3]]);
    }
}

module battery_case() {
    difference() {
        // Batteriefach
        translate([-20, -36 / 2, 2.5]) cube([77, 36, 32 + 26.5], center = false);

        // Aussparungen
        translate([-20 + 1.5, -36 / 2 + 1.5, 2.5 + 24]) cube([77 - 3, 33, 40], center = false);
        translate([-20 - 3 + 77, -36 / 2 + 8 / 2, 2.5 + 24]) cube([4, 28, 10], center = false);

        translate([-20 - 3 + 77 - 4 - 0, -36 / 2 + 8 / 2, 2.5 + 5]) cube([8, 28, 20], center = false);
        translate([-20 - 3 + 77 - 4 - 0, -36 / 2 + 8 / 2 + 10, 2.5 + 5]) cube([8, 28, 10], center = false);
        
        translate([-20 - 3 + 77 - 4 - 0, 36 / 2, 7.5]) rotate([0, 0, 90]) {
            linear_extrude(height = 6) polygon(points = [ [-32, 0], [0, 0], [0, 8]]);
        }
        
        // Aussparungen Motoren
        translate([-13 / 2, 36 / 2 - 10, 2.5 + 10.5]) cube([13, 10, 15], center = false);
        translate([-13 / 2, -36 / 2, 2.5 + 10.5]) cube([13, 10, 15], center = false);
        // Kabelschaechte Motoren
        translate([-13 / 2 + 8, 36 / 2 - 10, 2.5 + 20]) cube([13, 4.5, 6], center = false);
        translate([-13 / 2 + 8, -36 / 2 + 5.5, 2.5 + 20]) cube([13, 4.5, 6], center = false);
        
        // Schraubloecher Liniensensoren
        translate([5, 12, 0]) cylinder(r = 3.5, h = 30, center = false);
        translate([5, -12, 0]) cylinder(r = 3.5, h = 30, center = false);
    }
    translate([-20 - 3 + 77 - 4, 5.5 + 12.5, 17.5]) rotate([-90, 0, 180]) {
        linear_extrude(height = 4) polygon(points = [ [-7, 0], [0, 0], [0, 4]]);
    }
}

module base() {
    difference() {
        battery_case();

        // Schraubloecher Liniensensoren
        translate([5, 12, 0]) cylinder(r = m3_hole_rad, h = 2.5, center = false);
        translate([5, -12, 0]) cylinder(r = m3_hole_rad, h = 2.5, center = false);

        // Kabelschlitz Linensensoren
        translate([13, -39 / 2, -2.50]) cube([8, 32, 5 + 22 + 4], center = false);

        // Schraubloecher Stuetzrad
        translate([53, -13.5 / 2, 2.5]) cylinder(r = m2_hole_rad, h = 10);
        translate([53, 13.5 / 2, 2.5]) cylinder(r = m2_hole_rad, h = 10);
        
        // Schraubloch BMS-Halter
        translate([46.5 + 7.5, 36 / 2 + 0.5, 2.5 + 52.5 + 3]) rotate([90, 0, 0]) linear_extrude(2.5) circle(m2_hole_rad);
    }

    // Motorhalterungen
    translate([0, 34.5 - 15 / 2, 2.5 + 10.5]) rotate([270, 0, 0]) motormount_v2();
    translate([0, -34.5 + 15 / 2, 2.5 + 10.5]) rotate([270, 0, 180]) motormount_v2();
        

    // Begrenzung Aussparung Stuetzrad
    translate([46 - 8, -10, 0]) cube([8, 20, 2.5], center = false);
    
    difference() {
        linear_extrude(2.5) {
            difference() {
                circle(60);
                
                // Transportfach
                translate([-40, 0, 0]) square([40, 50], center = true);
                // Aussparung Transportfachsensor
                translate([-21.5, -25, 0]) square([3, 3], center = true);

                // Radschlitze
                translate([-25, 44, 0]) square([50, 8]);
                translate([-25, -52, 0]) square([50, 8]);

                // Kantensensoren
                translate([-38.42, 36.42, 0]) square(8, center = true);
                translate([-38.42, -36.42, 0]) square(8, center = true);
                
                // Liniensensoren
                translate([-7 - 8, -8, 0]) square([8, 16]);
                // Kabelschlitz Liniensensoren
                translate([17, 0, 0]) square([8, 25], center = true);
                // Gewindeeinsaetze Liniensensoren
                translate([5, 12, 0]) circle(r = m3_hole_rad);
                translate([5, -12, 0]) circle(r = m3_hole_rad);
                
                // Schraubloecher Stuetzrad
                translate([53, -13.5 / 2, 0]) circle(m2_hole_rad);
                translate([53, 13.5 / 2, 0]) circle(m2_hole_rad);
                
                // Schraubloecher Stuetzen
                translate([-29.55, 32, 0]) circle(m3_hole_rad);
                translate([-29.55, -32, 0]) circle(m3_hole_rad);
                translate([38, -38, 0]) circle(m3_hole_rad);
            }
        }
        // Aussparung Stuetzrad
        translate([53, 0, 0]) cylinder(r = 10, h = 1);
        
        // Schraubloecher Stuetzrad
        translate([53, -13.5 / 2, 0]) cylinder(r = m2_hole_rad, h = 4);
        translate([53, 13.5 / 2, 0]) cylinder(r = m2_hole_rad, h = 4);
   
        // Schraubloecher Motorhalterungen
        translate([0, 34.5 - 15 / 2, 2.5 + 10.5]) rotate([270, 0, 0]) {
            translate([-9, 14, 7.5]) rotate([90, 0, 0]) cylinder(r = m2_hole_rad, h = 4);
            translate([9, 14, 7.5]) rotate([90, 0, 0]) cylinder(r = m2_hole_rad, h = 4);
        }
        translate([0, -34.5 + 15 / 2, 2.5 + 10.5]) rotate([270, 0, 180]) {
            translate([-9, 14, 7.5]) rotate([90, 0, 0]) cylinder(r = m2_hole_rad, h = 4);
            translate([9, 14, 7.5]) rotate([90, 0, 0]) cylinder(r = m2_hole_rad, h = 4);
        }
    }
    
    // Halterungen BMS
    translate([-19.6, 36 / 2 - 1.5 - 8.5, 2.5 + 25]) rotate([-90, 0, 0]) bms_holder_v2();
    translate([45, 36 / 2 - 1.5 - 8.5, 2.5 + 25]) rotate([-90, 0, 0]) bms_holder_v2();
    //translate([46.5, 36 / 2 - 1.5 - 8.5, 2.5 + 52.5]) rotate([-90, -90, 0]) bms_holder_v2();
    
    // Halterungen Motorctl-PCB
    translate([-14, 36 / 2 - 1.5 - 8.5 - 16, 2.5 + 25 + 2]) rotate([-90, 0, 180]) bms_holder_v2();
    translate([45 + 5.6 - 1, 36 / 2 - 1.5 - 8.5 - 16, 2.5 + 25 + 2]) rotate([-90, 0, 180]) bms_holder_v2();
}


module stand() {
    difference() {
        linear_extrude(12) {
            difference() {
                circle(60);
                
                // Transportfach
                translate([-40, 0, 0]) square([40, 50], center = true);

                // Radschlitze
                translate([-25, 44, 0]) square([50, 8]);
                translate([-25, -52, 0]) square([50, 8]);
                
                // Liniensensoren
                translate([-7 - 8, -8, 0]) square([8, 16]);
            }
        }
        
        translate([-48, 0, 6]) cube([30, 120, 20], center = true);
        translate([48, 0, 6]) cube([30, 120, 20], center = true);
        translate([0, 0, 9]) cube([80, 80, 6], center = true);
    }
}

module mainboard() {
    linear_extrude(1.5) {
        difference() {
            circle(60);
            // Front Klappe
            // translate([-40, 0, 0]) square(50, center = true);

            // Servo
            translate([5, 0, 0]) square([22, 12.5], center = true);
            translate([-9, 0, 0]) circle(m3_hole_rad);
            translate([19, 0, 0]) circle(m3_hole_rad);

            // Kabel Schlitze
            translate([-35, -45, 0]) square([5, 12], center = true);
            translate([-35, 45, 0]) square([5, 12], center = true);
            translate([55, 0, 0]) square([10, 5], center = true);

            // LCD Bohrungen
            translate([27.5, 46.6, 0]) circle(m3_hole_rad);
            translate([27.5, -46.6, 0]) circle(m3_hole_rad);
            translate([-27.5, 46.6, 0]) circle(m3_hole_rad);
            translate([-27.5, -46.6, 0]) circle(m3_hole_rad);

            // Bohrungen
            // translate([-48.48, 28.72, 0]) circle(m3_hole_rad);
            // translate([-48.48, -28.72, 0]) circle(m3_hole_rad);
            // translate([0, 56, 0]) circle(m3_hole_rad);
            // translate([0, -56, 0]) circle(m3_hole_rad);
            // translate([54, 0, 0]) circle(m3_hole_rad);
            translate([-29.55, 32, 0]) circle(m3_hole_rad);
            translate([-29.55, -32, 0]) circle(m3_hole_rad);
            translate([38, -38, 0]) circle(m3_hole_rad);
        }
    }
}

module bms_345() {
    difference() {
        cube([71, 38, 1.5]);
        
        // schraubloecher
        translate([71 - 3.2, 38 - 3.2, -0.5]) cylinder(r = m3_hole_rad, h = 3);
        translate([3.2, 38 - 3.2, -0.5]) cylinder(r = m3_hole_rad, h = 3);
        translate([71 - 3.2, 3.2, -0.5]) cylinder(r = m3_hole_rad, h = 3);
        translate([3.2, 3.2, -0.5]) cylinder(r = m3_hole_rad, h = 3);        
    }
}

module pole_base(height) {
      difference() {
        cube([8, 8, height], center = false);
        translate([4, 4, height - 7]) cylinder(r = m3_insert_nut_rad, h = 7);
        translate([4, 4, 0]) cylinder(r = m3_insert_nut_rad, h = 7);
    }  
}

module vl53l0x_holder() {
    difference() {
        cube([8, 17.8, 12.7 - 3.7], center = false);
        translate([0, 2.54, 12.7 - 3.7 - 2.54]) 
            rotate([0, 90, 0]) linear_extrude(10) circle(m2_insert_nut_rad);
        translate([0, 17.8 - 2.54, 12.7 - 3.7 - 2.54]) 
            rotate([0, 90, 0]) linear_extrude(10) circle(m2_insert_nut_rad);
    }
}

module pole_left(height) {
    difference() {
        pole_base(height);
        translate([4, 7, 10]) rotate([90, 0, 0]) cylinder(r = m3_insert_nut_rad, h = 7);
    }
    translate([-8, -17.8 + 8 + 3, 42]) vl53l0x_holder();
    translate([0, 0, 42]) rotate([180, 180, 0]) {
        linear_extrude(height = 9)
        polygon(points = [ [-8, 0], [0, 0], [0, 17.8 - 3 - 8]]);
    }
    translate([0, 8, 42 + 9]) rotate([0, 180, 0]) {
        linear_extrude(height = 9)
        polygon(points = [ [-8, 0], [0, 0], [0, 3]]);
    }
}

module pole_right(height) {
    difference() {
        pole_base(height);
        translate([4, 8, 10]) rotate([90, 0, 0]) cylinder(r = m3_insert_nut_rad, h = 7);
    }
    translate([-8, -3, 42]) vl53l0x_holder();
    translate([0, 0, 42]) rotate([180, 180, 0]) {
        linear_extrude(height = 9)
        polygon(points = [ [-8, 0], [0, 0], [0, 3]]);
    }
    translate([0, 8, 42 + 9]) rotate([0, 180, 0]) {
        linear_extrude(height = 9)
        polygon(points = [ [-8, 0], [0, 0], [0, 17.8 - 3 - 8]]);
    }
}

module enc(radius, marks, depth) {
    difference() {
        union() {
            difference() {
                cylinder(r = radius, h = 0.6);
                for(i = [0 : marks]) {
                    rotate([0, 0, i * 360 / marks]) {
                        //translate([0, radius - depth, 0]) cube([PI * radius / marks, depth, 2]);
                        prong(radius, depth, PI * radius / marks);
                    }
                }
            }
            translate([0, 0, 0.3]) cylinder(r = radius - depth / 2, h = 0.3);
        }
        cylinder(r = 6, h = 2);
    }
}

module wheel() {
    rotate([180, 0, 0]) translate([0, 0, -4])
    difference() {
        union() {
            cylinder(r1 = 25, r2 = 23, h = 2.0);
            translate([0, 0, 2.0]) cylinder(r1 = 23, r2 = 25, h = 2.0);
            //translate([0, 0, 5]) cylinder(r = 5, h = 5);
//            for(i = [0 : 30]) {
//                rotate([0, 0, i * 360 / 30]) {
//                    translate([0, 23, 5.25]) cube([2.5, 4, 0.5], center = true);
////                    translate([0, 21, 5.25]) prism(2.5, 4, 0.5);
//                }
//            }
        }
        for(i = [0 : 8]) {
            rotate([0, 0, i * 360 / 8]) {
                translate([0, 17, 0]) cylinder(d = 10, h = 5);
            }
        }
        cylinder(r = 1.6, h = 5);
        //translate([0, 0, 3]) cylinder(r = 9, h = 2);

        // Schraubloecher
        union() {
            translate([6.35, 0, 0]) cylinder(r = 1.55, h = 5);
            translate([6.35, 0, 0]) cylinder(r1 = 2.8, r2 = 1.55, h = 1.8);
        }
        union() {
            translate([-6.35, 0, 0]) cylinder(r = 1.55, h = 5);
            translate([-6.35, 0, 0]) cylinder(r1 = 2.8, r2 = 1.55, h = 1.8);
        }
        union() {
            translate([0, 6.35, 0]) cylinder(r = 1.55, h = 5);
            translate([0, 6.35, 0]) cylinder(r1 = 2.8, r2 = 1.55, h = 1.8);
        }
        union() {
            translate([0, -6.35, 0]) cylinder(r = 1.55, h = 5);
            translate([0, -6.35, 0]) cylinder(r1 = 2.8, r2 = 1.55, h = 1.8);
        }
        //translate([1.5, 0, 5 + 1.96]) rotate([0, 90, 0]) cylinder(r = 1.96, h = 3.5);
    }
}

module motormount() {
    difference() {
        cube([36, 28, 2], center = true);
        translate([0, 0, -1]) cylinder(d = 12, h = 2);
        for(i = [0 : 3]) {
            rotate([0, 0, i * 360 / 3]) {
                translate([0, -8.5, -1]) cylinder(d = 2.1, h = 2);
            }
        }
    }
    translate([0, 15, 6.5]) {
        difference() {
            union() {
                cube([36, 2, 15], center = true);
                translate([14, -3, 0]) cube([8, 8, 15], center = true);
                translate([-14, -3, 0]) cube([8, 8, 15], center = true);
            }
            translate([-14.5, 2, 0]) rotate([90, 0, 0]) cylinder(r = m3_insert_nut_rad, h = 7);
            translate([14.5, 2, 0]) rotate([90, 0, 0]) cylinder(r = m3_insert_nut_rad, h = 7);
        }
    }
}

module motormount_v2() {
    translate([0, (15 - 4.5) / 2, 15 / 2 + 1.5]) {
        difference() {
            cube([28, 15 - 4.5, 12], center = true);
            translate([-9, 6.75, -1.5]) rotate([90, 0, 0]) cylinder(r = m2_hole_rad, h = 13);
            translate([9, 6.75, -1.5]) rotate([90, 0, 0]) cylinder(r = m2_hole_rad, h = 13);
        }
    }
}

module support() {
    difference() {
        union() {
            cylinder(r = 5, h = 5);
            translate([0, 0, 5]) sphere(r = 5);
        }
        cylinder(r = 1, h = 5);
    }
}

module pneu() {
    rotate_extrude(convexity = 10, $fn = 100)
    translate([25, 0, 0]) circle(r = 2.5, $fn = 100);

}

module ctbot() {
    color("silver") translate([0, 0, 0]) base();
    color("green") translate([0, 0, pole_height + 2.5]) mainboard();
    color("silver") translate([-29.55 - 4, 32 - 4, 2.5]) pole_right(pole_height);
    color("silver") translate([-29.55 - 4, -32 - 4, 2.5]) pole_left(pole_height);
    color("silver") translate([38 - 4, -38 - 4, 2.5]) pole_base(pole_height);
    color("white") translate([0, 51, 18]) rotate([90, 0, 0]) wheel();
    color("white") translate([0, -51, 18]) rotate([-90, 0, 0]) wheel();
    color("black") translate([0, 48.5, 18]) rotate([90, 0, 0]) pneu();
    color("black") translate([0, -48.5, 18]) rotate([-90, 0, 0]) pneu();
    //color("silver") translate([0, 41, 19]) rotate([-90, 0, 180]) motormount();
    //color("silver") translate([0, -41, 19]) rotate([-90, 0, 0]) motormount();
    //color("white") translate([54, 0, 0]) rotate([180, 0, 0]) support();
    
    translate([53, 0, 0]) rotate([180, 0, 90])  import("ball-caster.stl");
    
    translate([0, 33, 18]) rotate([-90, 0, 0]) import("micro-metal-gearmotor-backshaft_fixed.stl");
    difference() {
        translate([0, 39.5, 18]) rotate([90, 0, -90]) import("micro_metal_gearmotor_bracket_fixed.stl");
        translate([-5, 30, 24.498]) cube([20, 20, 2], center = false);
    }
    translate([0, -33, 18]) rotate([90, 180, 0]) import("micro-metal-gearmotor-backshaft_fixed.stl");
//    difference() {
//        translate([0, -39.5, 18]) rotate([90, 0, 90]) import("micro_metal_gearmotor_bracket_fixed.stl");
//        translate([-10, -45, 24.498]) cube([20, 20, 2], center = false);
//    }

    color("green") translate([-20, 38 / 2 + 4, 23]) rotate([90, 0, 0]) bms_345();
    bms_345_top_clip();
}

module clips() {
    difference() {
        cube([8, 16, 1.5], center = true);
        
        translate([0, 15 / 2 - 3.75, - 1]) linear_extrude(2.5) circle(m3_hole_rad);
        translate([0, - (15 / 2 - 3.75), - 1]) linear_extrude(2.5) circle(m3_hole_rad);
    }
}

module bms_345_top_clip() {
    translate([46.5, 36 / 2 - 1.5 - 8.5, 2.5 + 52.5]) rotate([-90, -90, 0]) {
        difference() {
            bms_holder_v2();
            translate([3, 7.5, 10]) cylinder(r = m2_insert_nut_rad, h = 5, center = false);
            translate([-0.4, 10.5, 9]) cube([6.4, 2, 6], center = false);
        }
    }
}

//ctbot();

base();
//bms_345_top_clip();

//translate([0, 0, -12])
//stand();

//battery_case();

//motormount();
//motormount_v2();
//rotate([90, 0, 0])
//pole_left(pole_height);
//translate([0, 50, 0]) 
//pole_right(pole_height);

//wheel();
//enc(25, 80, 5.8);

//translate([0, 0, 0]) clips();
//translate([20, 0, 0]) clips();
//translate([-20, 0, 0]) clips();
//translate([40, 0, 0]) clips();
