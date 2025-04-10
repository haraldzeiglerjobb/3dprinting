/*
for (i = [0:10]) {
    translate([0,0,10*i]) linear_extrude(10,twist = 5*exp(-0.1*i)) scale([1,1]) hull() {
        circle(r=3);
        translate([40,0,0]) circle(r=10);
    }
}*/

module shape() {
        difference() {
            hull() {
            scale([2,.2])circle(r = 2);
            translate([40,0,0]) scale([2,.2])circle(r=10);
        }
        translate([-20,-100,0])square([100,100]);
    }

    difference() {
            hull() {
            scale([2,.5])circle(r = 2);
            translate([40,0,0]) scale([2,.5])circle(r=10);
        }
        translate([-20,0,0])square([100,100]);
    }
}

//translate([0,0,10]) shape();

module element(z=10, t = 5) {
    
    linear_extrude(z,twist=t, $fn=30,slices=5) shape();
}

module element2(z = 10) {
    linear_extrude(z) {
            difference() {
                hull() {
                scale([2,.2])circle(r = 2);
                translate([40,0,0]) scale([2,.2])circle(r=10);
            }
            translate([-20,-100,0])square([100,100]);
        }

        difference() {
                hull() {
                scale([2,.5])circle(r = 2);
                translate([40,0,0]) scale([2,.5])circle(r=10);
            }
            translate([-20,0,0])square([100,100]);
        }
    }    
}

/*translate([0,0,z]) rotate([0,0,-r]) element(z=5,t=5);
translate([0,0,5]) rotate([0,0,-5]) element(z=10,t=5);
translate([0,0,15]) rotate([0,0,-10]) element(z=20,t=5);
*/

z=[5,10,15,20];
t=[5,4,3,2];
t_acc = [0,5,9,12];

//echo(t_acc);
z_acc = [0,5,15,30];
for (i = [0:1:3]) {
    translate([0,0,z_acc[i]]) rotate([0,0,-t_acc[i]]) element(z=z[i],t=t[i]);
    //z_acc = z_acc + z[i];
    //t_acc = t_acc+t[i];
}