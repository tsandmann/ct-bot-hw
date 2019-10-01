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
r = 1.6;


module prism2(b, d, h, ht, sc) {
    linear_extrude(height = ht, scale  = sc)
    polygon(points = [[0, 0], [b, -h / 2], [b, h / 2]]);
}

module prong(radius, depth, width) {
    difference() {
        prism2(radius, radius, width, 1, 1);
//      rotate([0, 0, -20]) {
        prism2(radius - depth, radius - depth, width, 1, 1);
    }
}


module base() {
    difference() {
        // Sockel Batteriefach
        translate([-20, -33 / 2, 2.5]) cube([77.7, 21 + 2 * 6, 6], center = false);
        // Vertiefung
        translate([-20, -21 / 2, 2.5 + 4]) cube([77.7, 21, 2], center = false);
        
        // Schraubloecher Linensensoren
        translate([5, 12, 0]) cylinder(r = 2.48, h = 6, center = false);
        translate([5, -12, 0]) cylinder(r = 2.48, h = 6, center = false);
        // Kabelschlitz Linensensoren
        translate([16, -33 / 2, -2.50]) cube([6, 29, 20], center = false);
        
        // Schraubloecher Stuetzrad
        translate([54, -13.5 / 2, 2.5]) cylinder(r = 3.46 / 2, h = 5 - 2.5, center = false);
        translate([54, 13.5 / 2, 2.5]) cylinder(r = 3.46 / 2, h = 5 - 2.5, center = false);
    }

     // Begrenzung Aussparung Stuetzrad
    translate([48 - 8, -10, 0]) cube([8, 20, 2.5], center = false);
    difference() {
        linear_extrude(2.5) {
            difference() {
                circle(60);
                
                // Transportfach
                translate([-40, 0, 0]) square([40, 50], center = true);

                // Radschlitze
                translate([-25, 45, 0]) square([50, 7]);
                translate([-25, -52, 0]) square([50, 7]);
                
                // Schraubloecher Motorhalterungen
                translate([-14.5, 34.5, 0]) circle(r);
                translate([14.5, 34.5, 0]) circle(r);
                translate([-14.5, -34.5, 0]) circle(r);
                translate([14.5, -34.5, 0]) circle(r);

                // Kantensensor
                translate([-38.42, 36.42, 0]) square(8, center = true);
                translate([-38.42, -36.42, 0]) square(8, center = true);
                
                // Liniensensoren
                translate([-7 - 8, -8, 0]) square([8, 16]);
                // Kabelschlitz Liniensensoren
                translate([19, 0, 0]) square([6, 25], center = true);
                // Schraubloecher Linensensoren
                translate([5, 12, 0]) circle(r = 2.48);
                translate([5, -12, 0]) circle(r = 2.48);
                
                // Maussensor
                //translate([2, -8, 0]) square([32, 16]);
                //translate([8, -18.9, 0]) square([18, 33.9]);
                //translate([32, -21.4, 0]) square([14.84, 21.4 + 18.67]);
                
                // weitere Bohrungen
                //translate([-48.48, 28.72, 0]) circle(r);
                //translate([-48.48, -28.72, 0]) circle(r);
                //translate([0, 56, 0]) circle(r);
                //translate([0, -56, 0]) circle(r);
                
                // Schraubloecher Stuetzrad
                translate([54, -13.5 / 2, 0]) circle(3.46 / 2);
                translate([54, 13.5 / 2, 0]) circle(3.46 / 2);
                
                // Schraubloecher Stuetzen
                translate([-29.55, 32, 0]) circle(r);
                translate([-29.55, -32, 0]) circle(r);
                translate([38, -38, 0]) circle(r);
            }
        }
        // Aussparung Stuetzrad
        translate([54, 0, 0]) cylinder(r = 10, h = 1);
    }
}

module top() {
    linear_extrude(2.5) {
        difference() {
            circle(60);
            // Front Klappe
            translate([-40, 0, 0]) square(50, center = true);
            // Servo
            translate([5, 0, 0]) square([22, 12.5], center = true);
            translate([-9, 0, 0]) circle(r);
            translate([19, 0, 0]) circle(r);
            // Kabel Schlitze
            translate([-35, -45, 0]) square([5, 12], center = true);
            translate([-35, 45, 0]) square([5, 12], center = true);
            translate([55, 0, 0]) square([10, 5], center = true);
            // LCD Bohrungen
            translate([27.5, 46.6, 0]) circle(r);
            translate([27.5, -46.6, 0]) circle(r);
            translate([-27.5, 46.6, 0]) circle(r);
            translate([-27.5, -46.6, 0]) circle(r);
            // Bohrungen
            translate([-48.48, 28.72, 0]) circle(r);
            translate([-48.48, -28.72, 0]) circle(r);
            translate([0, 56, 0]) circle(r);
            translate([0, -56, 0]) circle(r);
            //translate([54, 0, 0]) circle(r);
            translate([-29.55, 32, 0]) circle(r);
            translate([-29.55, -32, 0]) circle(r);
            translate([38, -38, 0]) circle(r);
        }
    }
}

module pole() {
    difference() {
        cube([8, 8, 60], center = true);
        translate([0, 0, -30]) cylinder(r = 2.48, h = 6);
        translate([0, 0, 24]) cylinder(r = 2.48,h = 6);
        translate([0, 4, -20]) rotate([90, 0, 0]) cylinder(r = 2.48, h = 6);
//      translate([-5, 0, 23.5]) rotate([0, 90, 0]) cylinder(r = 2, h = 10);
//      translate([-5, 0, -13.5]) rotate([0, 90, 0]) cylinder(r = 2, h = 10);
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
    difference() {
        union() {
            cylinder(r1 = 25, r2 = 23, h = 2.5);
            translate([0, 0, 2.5]) cylinder(r1 = 23, r2 = 25, h = 2.5);
            translate([0, 0, 5]) cylinder(r = 5, h = 5);
//            for(i = [0 : 30]) {
//                rotate([0, 0, i * 360 / 30]) {
//                    translate([0, 23, 5.25]) cube([2.5, 4, 0.5], center = true);
////                    translate([0, 21, 5.25]) prism(2.5, 4, 0.5);
//                }
//            }
        }
        for(i = [0 : 6]) {
            rotate([0, 0, i * 360 / 6]) {
                translate([0, 15, 0]) cylinder(d = 12, h = 5);
            }
        }
        cylinder(r = 1.5, h = 10);
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
            translate([-14.5, 2, 0]) rotate([90, 0, 0]) cylinder(r = 2.48, h = 7);
            translate([14.5, 2, 0]) rotate([90, 0, 0]) cylinder(r = 2.48, h = 7);
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
    color("green") translate([0, 0, 62]) top();
    color("silver") translate([-29.55, 32, 32]) pole();
    color("silver") translate([-29.55, -32, 32]) pole();
    color("silver") translate([38, -38, 32]) pole();
    color("white") translate([0, 51, 19]) rotate([90, 0, 0]) wheel();
    color("white") translate([0, -51, 19]) rotate([-90, 0, 0]) wheel();
    color("black") translate([0, 48.5, 19]) rotate([90, 0, 0]) pneu();
    color("black") translate([0, -48.5, 19]) rotate([-90, 0, 0]) pneu();
    color("silver") translate([0, 41, 19]) rotate([-90, 0, 180]) motormount();
    color("silver") translate([0, -41, 19]) rotate([-90, 0, 0]) motormount();
    color("white") translate([54, 0, 0]) rotate([180, 0, 0]) support(); 
}

//ctbot();

base();
//motormount();
//pole();
//wheel();
//enc(25, 80, 6);
