L = 60;
W = 30;
H = 2;
ts = 10;
space=2;
delta = 0.5;

L1 = L-2*space;
W1 = ts+2*space;
H1=H;
t1 = "Kalibrert:";
t2 = "31.01.23";

plate1();
translate([space+delta,space+delta,1]) plate2();
module plate1() {
    difference() {
        cube([L,W,H]);
        translate([space,space,1]) cube([L1,W1,H]);
    }
    translate([space,4*space+ts,0]) linear_extrude(H+2) text(t1,size=ts);
    }

module plate2() {
    cube([L1-2*delta,W1-2*delta,H1]);
    translate([space-delta,space-delta,0]) linear_extrude(H+2) text(t2,size=ts);
}