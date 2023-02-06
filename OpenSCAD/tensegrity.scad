/*
Description

*/
h0=3;//height of cylindrical base
thick = 10;//thickness of central hanger
r0=50;//radius of cylindrical base
hs = 60;//Height of twisted shape
rr0=3;//radius of inner circle in rope fastening rings
rThick = 3;//thickness of rope fastening rings
rr1 = rr0+rThick;//radius og outer circle in rope fastening rings
fn=50;
fnRing = 50;
nRings = 8;



//backBone();
thing();
rotate([0,-180,0]) translate([0,0,-130]) thing();

shapeLower = [[10,10],[-10,10],[-10,0],[10,0]];
shapeLowerLeft = [[0,0],[-30,30],[-40,30],[-10,0]];
shapeMid = [[-30,30],[-30,60],[-40,60],[-40,30]];
shapeUpperLeft = [[-40,50],[10,80],[10,90],[-40,60]];
shapePoints = [[10,0],[10,10],[-10,10],[-20,40],[10,60],[10,70],
                                        [-20,50],
                                [-33,40],
                         [-20,0]];
sL = shapeLower;
sLL=shapeLowerLeft;
sUL=shapeUpperLeft;
sM = shapeMid;

module backBone() {
    
    //polygon(shapePoints);
    minkowski() {
        sphere(r=2,center=true);
        linear_extrude(height = thick-2,center = true, convexity = 10, twist = 0) polygon(sL);    
    }
    minkowski() {
        sphere(r=2,center=true);
        linear_extrude(height = thick-2,center = true, convexity = 10, twist = 0) polygon(sM);    
    }
    minkowski() {
        sphere(r=2,center=true);
        linear_extrude(height = thick-2,center = true, convexity = 10, twist = 0) polygon(sLL);    
    }

    difference() {
        minkowski() {
            sphere(r=2,center=true);
            linear_extrude(height = thick-2,center = true, convexity = 10, twist = 0) polygon(sUL);    
        }
        
        translate([-2,80,-thick]) cube([4,100,2*thick]);
    }   
}

module ring() {
 difference() {
  cylinder(r=rr1,h=rThick,$fn=fnring,center=true);
  cylinder(r=rr1-rThick,h=rThick,$fn=fnRing, center=true);  
 }
}

module thing() {
  
    cylinder(h=h0, r=r0,$fn=fn);
    translate([0,0,h0/2+1]) rotate([90,0,0]) backBone();
    for (i=[0:nRings-1]) rotate([0,0,i*360/nRings]) translate([r0,0,6]) rotate([0,-50,0]) ring();
    
}