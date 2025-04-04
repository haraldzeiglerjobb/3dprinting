//Kommentarer med dobbel skråstrek
/*
Eller denne her / * * /som dere kjenner fra Arduino C++
*/

//Innebygde funskjoner er blant annet cylinder() med mange mulige argumenter
/*
cyilnder(h = height, d = diameter)
cylinder(h = height, r = radius)
cylinder(h = height, d1 = diameter_bottom, d2 = diameter_top)
cylinder(h = height, r1 = radius_bottom, r2 = radius_top)

Også: Legg til arguemntet $fn = N for å bruke en mange kant med N sider
Skikkelig kult å velge 3 eller 4 her
*/
//Cylinder with height 20 and diameter 5
cylinder(h = 20, d = 5);

//Kjegle med nedre diameter 10 og øvre diameter 3
//flyttes (translateres) maed kommandoen translate([x, y, z])
translate([20,0,0]) cylinder (h = 20, d1 = 10, d2 = 3);

//kjegle med nedre radius 5 og øvre radius 7, la det være en 8-kant
translate([20,20,0]) cylinder(h = 20, r1 = 5, r2 = 7, $fn=8);

//flyttet [-10,10,0] rotasjon av sylinder 45 grader omkring x-aksen, -40 grader om y-aksen
translate([-10,10,0]) rotate([45,-40,0]) cylinder(h=30,r=4);