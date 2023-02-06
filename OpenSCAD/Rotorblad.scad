/*linear_extrude(20,center=false,twist=45, slices=100,scale=0.3, $fn=5) 
translate([0,0,0]) 
square([5,20]);
*/

k=5;

    for(i = [0:4]) {
        translate([0,0,k*i]) rotate([0,0,i*15]) cube([10,2,k]);
    }
