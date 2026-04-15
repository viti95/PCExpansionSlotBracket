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

module SVideo(height, distance) {
    right(distance) back(height) Part_SVideo();
}

module Part_VGA() {
    Std_Retainer_Hole();
    right(25) Std_Retainer_Hole();
    right(3.5) xrot(90) fwd(1) round3d(or=1) { 
            prismoid([16,7],[20,7],h=10,anchor=LEFT+FWD); 
        };
}

module VGA(height, distance) {
    right(distance) back(height) Part_VGA();
}

module Part_DVI() {
    Std_Retainer_Hole();
    right(34) Std_Retainer_Hole();
    right(3.5) xrot(90) fwd(1) round3d(or=1) { 
            prismoid([27,7],[27,7],h=10,anchor=LEFT+FWD); 
        };
}

module DVI(height, distance) {
    right(distance) back(height) Part_DVI();
}

module Part_HDMI() {

}

module HDMI() {

}

difference() {
    Plate(true);
    #DVI(10,26);
    #SVideo(10,72);
    #VGA(10,85);
}
