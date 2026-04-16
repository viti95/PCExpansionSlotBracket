include <BOSL2/std.scad>

$fn=256;

module Plate(support) {
    right(25.5) fwd(0.5) up(0.6) xrot(270) import("bracket.stl", convexity=3);
    if (support) {
        down(9) right(15) cube([96.7267,1,10]);
    }
}

module Std_Retainer_Hole() {
    cylinder(d=3, h=5);
}

module Part_SVideo() {
    cylinder(d=12, h=5);
}

module Part_RCA() {
    cylinder(d=10, h=5);
}

module Part_Jack35() {
    cylinder(d=8, h=5);
}

module Part_VGA() {
    Std_Retainer_Hole();
    right(25) Std_Retainer_Hole();
    right(3.5) xrot(90) fwd(1) round3d(or=1) { 
            prismoid([16,7],[20,7],h=10,anchor=LEFT+FWD); 
        };
}

module Part_DVI() {
    Std_Retainer_Hole();
    right(32) Std_Retainer_Hole();
    right(3) xrot(90) fwd(1) round3d(or=1) { 
            prismoid([26,7],[26,7],h=10,anchor=LEFT+FWD); 
        };
}

module DVI(h, d)     place(h,d) Part_DVI();
module VGA(h, d)     place(h,d) Part_VGA();
module SVideo(h, d)  place(h,d) Part_SVideo();
module RCA(h, d)     place(h,d) Part_RCA();
module Jack35(h, d)  place(h,d) Part_Jack35();

module place(height, distance) {
    right(distance) back(height) children();
}

module bracket(support=true) {
    difference() {
        Plate(support);
        children();
    }
}

bracket() {
    #DVI(10,28);
    #SVideo(10,74);
    #VGA(10,85);
}
