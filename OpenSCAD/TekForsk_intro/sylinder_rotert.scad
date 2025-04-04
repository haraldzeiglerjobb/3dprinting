module hollow_cylinder(dInner, dOuter, height, fnOuter, fnInner) {
    //Please provide the 
    //inner diameter and the 
    //outer diameter
    //as input parameters for this function

    difference() {
        cylinder(h=height, d=dOuter, $fn=fnOuter);
        cylinder(h=height, d=dInner, $fn=fnInner);
    }
}
rotations = [[0,0,0],[90,0,0],[0,90,0]];

height_ = 20;

for(i = [0:2]) {

    rotate(rotations[i]) hollow_cylinder(dInner = 6, dOuter = 8, height = height_, fnInner = 32, fnOuter = 8);
}

//hollow_cylinder(dInner = 6, dOuter = 8, height = height_, fnInner = 32, fnOuter = 8);
