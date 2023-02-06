thickx = 20;
thicky =20;
thickz=3;

function f(x)= x^2;
function g(x,y) = 5+1.2*((x/10)^2 +(y/10)^2);

//cube(f(1));
//coordxy(0,10,00,100);
coordxyz(-100,100,-100,100,0,100);

//graph2d(0,1,10,2);
//module graph2d(x0,xStep,n,dim) {
//module graph3d(x0,xn,nx,y0,yn,ny,dim) {
//graph3d(-100,100,4,-100,100,4,8);
graph3d(-100,100,8,-100,100,8,10);

module coordxyz(xmin,xmax,ymin,ymax,zmin,zmax) {
    //translate([xmin,0,0])
    cube([xmax-xmin,thicky,thickz],center=true);//x-axis
    //translate([0,ymin,0])
    cube([thickx,ymax-ymin,thickz],center=true);//x-axis
    translate([-thickx/2,-thicky/2,zmin])cube([thickx,thicky,zmax-zmin]);//x-axis
}

module coordxy(xmin,xmax,ymin,ymax) {
    translate([xmin,0,0])cube([xmax-xmin,thickx,thickz]);//x-axis
    translate([0,ymin,0])cube([thickx,ymax-ymin,thickz]);//x-axis
}

module voxel(dim) {
    //cylinder(h=dim,r=dim,$fn=3);
    sphere(dim,center=true);
}

module graph2d(x0,xStep,n,dim) {
    for (i=[0:n-1]) {
        x_old=x0+i*xStep;
        x_new=x_old+xStep;
        hull() {
            translate([x_old,f(x_old),0]) voxel(dim);
            translate([x_new,f(x_new),0]) voxel(dim);
        }
    }
}

module graph3d(x0,xn,nx,y0,yn,ny,dim) {
    
    xStep=(xn-x0)/(nx);
    yStep=(yn-y0)/(ny);
    
    for (i=[0:nx]) {
        x_old=x0+i*xStep;
        x_new=x0+(i+1)*xStep;

        for(j=[0:ny-1]) {
            y_old=y0+j*yStep;
            y_new=y0+(j+1)*yStep;
                
            hull() {
                translate([x_old,y_old,g(x_old,y_old)]) voxel(dim);
                translate([x_old,y_new,g(x_old,y_new)]) voxel(dim);
            }
        }
    }
    for (i=[0:nx-1]) {
        x_old=x0+i*xStep;
        x_new=x0+(i+1)*xStep;

        for(j=[0:ny]) {
            y_old=y0+j*yStep;
            y_new=y0+(j+1)*yStep;
                
            hull() {
                translate([x_old,y_old,g(x_old,y_old)]) voxel(dim);
                translate([x_new,y_old,g(x_new,y_old)]) voxel(dim);
            }
       }
    }
}