module hollow_cylinder(dInner, dOuter, height1 = 20, height2=10, fnOuter, fnInner) {
    //Please provide the 
    //inner diameter and the 
    //outer diameter
    //as input parameters for this function

    difference() {
        cylinder(h=height1, d=dOuter, $fn=fnOuter);
        translate([0,0,height2]) cylinder(h=height1, d=dInner, $fn=fnInner);
        //translate([0,0,height1-3]) rotate([0,90,30]) cylinder(h = 50, d = 3, center=true);
        translate([0,0,height1-3]) rotate([90,0,30]) cylinder(h = 50, d = 3, center=true);
    }
}

module triang_prism1(dInner = 3.3, height = 10, angle = 30) {
    
    //rotations = [[0,ry,0*rz],[0,ry,1*rz],[0,ry,2*rz]];
    rotations = [[0,0,0],[0,45,angle],[0,45,-angle],[0,90,angle],[0,90,-angle]];

    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    
    height_ = height;
    height_0 = height/2;
    for(i = [0:4]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
    translate([0,0,-dOuter/4])cube([dOuter,dOuter,dOuter/2],center=true);
}
module triang_prism2(dInner = 3.3, height = 10, angle = 30) {
    
    //rotations = [[0,ry,0*rz],[0,ry,1*rz],[0,ry,2*rz]];
    rotations = [[0,0,0],[0,45,angle],[0,45,-angle],[0,135,angle],[0,135,-angle],[0,90,angle],[0,90,-angle],[0,180,0]];

    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    
    height_ = height;
    height_0 = height/2;
    for(i = [0:7]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
    //translate([0,0,-dOuter/4])cube([dOuter,dOuter,dOuter/2],center=true);
}
//triang_prism1(dInner  =3.2, height = 10, angle = 30);
triang_prism2(dInner  =3.2, height = 10, angle = 30);
    
    
module straightangles(dInner=3.3, height=10) {
    ry=asin(sqrt(2/3));
    rz = 120;
    
    rotations = [[0,ry,0*rz],[0,ry,1*rz],[0,ry,2*rz]];
    rotations1 = [[0,0,0],[90,0,0],[0,90,0]];

    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    
    height_ = height;
    height_0 = height/2;
    for(i = [0:2]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
    translate([0,0,-dOuter/6x])cube([dOuter,dOuter,dOuter/2],center=true);
}
module tetrahedron(dInner=3.3, height=20) {
    ry = asin(1/sqrt(3));
    rz = 120;
    rotations1 = [[0,90,30],[0,90,-30],[0,asin(2/3),0]];
    rotations = [[0,ry,0],[0,ry,rz],[0,ry,2*rz]];
    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    height_ = height;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    translate([0,0,-1])cube([dOuter,dOuter,dOuter/4],center=true);
    for(i = [0:2]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}

module dodecahedron(dInner=3.3, height = 20) {
    ry = acos(1/(2*cos(18)));
    rz = 120;
    rotations1 = [[0,90,54],[0,90,-54],[0,-asin(1/2*cos(18)),0]];
    rotations = [[0,ry,0],[0,ry,rz],[0,ry,2*rz]];
    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    height_ = height;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    translate([0,0,-1])cube([dOuter,dOuter,dOuter/4],center=true);
    for(i = [0:2]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}

module octahedron(dInner=3.3, height=20) {
    
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
    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    height_ = height;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    translate([0,0,-1])cube([dOuter,dOuter,dOuter/4],center=true);
    for(i = [0:3]) {

        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}

module icosahedron(dInner=3.3, height=20) {
    /*
    Arrange five vertices aroudn the 360 circle. Then, rotate them up a little bit. 
    OR the other way around. 
    The angle to rotate up is ry
    */
    
    ry = asin(1/(2*cos(54)));
    rz = 72;
    rotations = [[0,ry,0],[0,ry,1*rz],[0,ry,2*rz],[0,ry,3*rz],[0,ry,4*rz]];
    //rotations = [[0,90,30],[0,90,-30],[0,30,0]];
    //dInner = 3.4;
    dOuter = dInner+2;
    fnInner = 32;
    fnOuter = 8;
    height_ = height;
    height_0 = height/2;
    //sphere(d = dOuter,center=true, $fn=fnInner);//
    translate([0,0,-1])cube([dOuter,dOuter,dOuter/4],center=true);
    for(i = [0:4]) {
        rotate(rotations[i]) hollow_cylinder(dInner = dInner, dOuter = dOuter, height1 = height_, height2 = height_0, fnInner = fnInner, fnOuter = fnOuter);
    }
}
//cube([42,10,1]);
/*translate([0,0,0]) hollow_cylinder(dInner = 3.2, dOuter = 6, height1 = 6, height2 = 0,fnInner = 32, fnOuter = 8);
translate([5.5,0,0]) hollow_cylinder(dInner = 3.25, dOuter = 6, height1 = 6, height2 = 0,fnInner = 32, fnOuter = 8);
translate([11,0,0]) hollow_cylinder(dInner = 3.3, dOuter = 6, height1 = 6, height2 = 0,fnInner = 32, fnOuter = 8);
translate([16.5,0,0]) hollow_cylinder(dInner = 3.35, dOuter = 6, height1 = 6, height2 = 0,fnInner = 32, fnOuter = 8);
*/
//translate([-10,-20,0]) 
/*translate([-10,0,0]) 
tetrahedron(dInner  =5.2, height = 12);
translate([-10,20,0]) 
octahedron(dInner  =5.3);
translate([10,-10,0]) 
dodecahedron(dInner  =5.3);
translate([10,10,0]) 
icosahedron(dInner  =5.3);
/**/
//hollow_cylinder(dInner = 6, dOuter = 8, height = height_, fnInner = 32, fnOuter = 8);

//rotate([0,-36,0]) dodecahedron();
//tetrahedron();
//rotate([60,60,60]) tetrahedron();
//rotate([60,60,60]) rotate([60,60,60]) tetrahedron();
//rotate([60,60,60]) rotate([60,60,60]) rotate([60,60,60]) tetrahedron();