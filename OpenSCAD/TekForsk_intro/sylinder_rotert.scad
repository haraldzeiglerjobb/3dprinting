module hollow_cylinder(dInner, dOuter, height1, height2, fnOuter, fnInner) {
    //Please provide the 
    //inner diameter and the 
    //outer diameter
    //as input parameters for this function

    difference() {
        cylinder(h=height1, d=dOuter, $fn=fnOuter);
        translate([0,0,height2]) cylinder(h=height1, d=dInner, $fn=fnInner);
    }
}

module straightangles() {
    ry=asin(sqrt(2/3));
    rz = 120;
    
    rotations = [[0,ry,0*rz],[0,ry,1*rz],[0,ry,2*rz]];
    rotations1 = [[0,0,0],[90,0,0],[0,90,0]];

    height_ = 20;
    height_0 = 10;
    for(i = [0:2]) {

        rotate(rotations[i]) hollow_cylinder(dInner = 6, dOuter = 8, height1 = height_, height2 = height_0, fnInner = 32, fnOuter = 8);
    }
    cube([8,8,8],center=true);
}
module tetrahedron() {
    ry = asin(1/sqrt(3));
    rz = 120;
    rotations1 = [[0,90,30],[0,90,-30],[0,asin(2/3),0]];
    rotations = [[0,ry,0],[0,ry,rz],[0,ry,2*rz]];
    dInner = 3.4;
    dOuter = 6;
    fnInner = 32;
    fnOuter = 8;
    height_ = 10;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    rotate([0,0,0]) cube(dOuter, center=true);
    for(i = [0:2]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}

module dodecahedron() {
    ry = acos(1/(2*cos(18)));
    rz = 120;
    rotations1 = [[0,90,54],[0,90,-54],[0,-asin(1/2*cos(18)),0]];
    rotations = [[0,ry,0],[0,ry,rz],[0,ry,2*rz]];
    dInner = 3.4;
    dOuter = 6;
    fnInner = 32;
    fnOuter = 8;
    height_ = 10;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    rotate([0,0,0]) cube(dOuter, center=true);
    for(i = [0:2]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}

module octahedron() {
    
    /*
    A way to make the three cylinders is to
    Spread three y-axis rotated cylinders around the z axis (120 deg each)
    The spreading angle is inverse cos or inverse sine of sqrt(2/3)

    It is also possible to use rotations1 list, that is a more intuitive 90 degrees
    separation by utilizing the x,y,z axes.    
    */
    ry = 45;
    rz = 90;
    rotations1 = [[0,90,45],[0,90,-45],[0,135,0],[0,45,0]];
    rotations = [[0,45,0],[0,ry,rz],[0,ry,2*rz],[0,ry,3*rz]];
    dInner = 3.4;
    dOuter = 6;
    fnInner = 32;
    fnOuter = 8;
    height_ = 10;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    rotate([0,0,0]) cube(dOuter, center=true);
    for(i = [0:3]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}

module icosahedron() {
    /*
    Arrange five vertices aroudn the 360 circle. Then, rotate them up a little bit. 
    OR the other way around. 
    The angle to rotate up is ry
    */
    
    ry = asin(1/(2*cos(54)));
    rz = 72;
    rotations = [[0,ry,0],[0,ry,1*rz],[0,ry,2*rz],[0,ry,3*rz],[0,ry,4*rz]];
    //rotations = [[0,90,30],[0,90,-30],[0,30,0]];
    dInner = 3.4;
    dOuter = 6;
    fnInner = 32;
    fnOuter = 8;
    height_ = 10;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    rotate([0,0,0]) cube(dOuter, center=true);
    for(i = [0:4]) {
        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}
straightangles();
//tetrahedron();
//dodecahedron();
//icosahedron();
//octahedron();
//hollow_cylinder(dInner = 6, dOuter = 8, height = height_, fnInner = 32, fnOuter = 8);

//rotate([0,-36,0]) dodecahedron();
//tetrahedron();
//rotate([60,60,60]) tetrahedron();
//rotate([60,60,60]) rotate([60,60,60]) tetrahedron();
//rotate([60,60,60]) rotate([60,60,60]) rotate([60,60,60]) tetrahedron();