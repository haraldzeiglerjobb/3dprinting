scale([1,3])linear_extrude(100, twist=45, convexity = 10, $fn=30,slices = 100) difference() {
       scale([.5, 2]) circle(r=20);
    translate([10,0])square([20,80],center=true);
}

translate([70,0,0])scale([1,3])linear_extrude(100, twist=45, convexity = 10, $fn=30,slices = 100) translate([10,10,0])difference() {
       scale([.5, 2]) circle(r=20);
    translate([10,0])square([20,80],center=true);
}

translate([140,0,0])scale([1,3])linear_extrude(100, twist=45, convexity = 10, $fn=30,slices = 100) translate([20,20,0])difference() {
       scale([.5, 2]) circle(r=20);
    translate([10,0])square([20,80],center=true);
}
//translate([60,0,0])rotate_extrude(angle = 30, convexity = 1, $fn=100) scale([3,0.5])translate([20,0,0]) circle(r=20);

//rotate([0,0,0]) translate([50,-60,0]) scale([.5,2])cylinder(h=150, d1=40, d2=20);