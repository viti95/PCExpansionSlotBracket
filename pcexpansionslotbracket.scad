include <BOSL2/std.scad>

$fn=256;

module Plate() {
    right(25.5) fwd(0.5) up(0.6) xrot(270) import("bracket.stl", convexity=3);
}

module Part_SVideo() {
    cylinder(d=12, h=5);
}

module SVideo(height, distance) {
    right(distance) back(height) Part_SVideo();
}

difference() {
    Plate();
    #SVideo(10,60);
}