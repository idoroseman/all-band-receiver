w=1.5;

// cavity
cx = 30;
cy = 18;
cz = 73;

module body(h){
    difference(){
        translate([2,0,0]) minkowski(){
            translate([1,1,1]) union(){
                cube([cx-2*w, cy-2+2*w, h]);
                for (i=[0,cx-2*w])
                    translate([i, (cy-2+2*w)/2, 0]) cylinder(h=h, d=cy-2+2*w);
            }
            sphere(d=2);
        }
    // cavity
    translate([w, w, w]) cube([cx, cy, h]);

    // top
    translate([-cy, 0, h]) cube([cx+2*cy+2*w, cy+2*w, 5]);
    }        
}

module batt_9v(){
    cube([26.5, 17.5, 46]);

}

// main
difference(){
    body(h=cz+w);
    
    // volume knob
    translate([w+6, w+6, 0]) cylinder(h=w+1, d=7+1); 

    // phones jack
    translate([w+6+16.75, w+10, 0]) cylinder(h=w+1, d=5+2); 
 
    
    // cover inserts
    for (i=[-2*w, cx+2*w+2*w])
        translate([i, (cy+2*w)/2, cz-10]) cylinder(d=5, h=20);
    
    // text
    // translate([10, 0.5, cz-21]) rotate([90, -90, 0]) linear_extrude(1) text("4X6UB", size=5);
    translate([cx-7, 0.5, 5.5]) rotate([90, -90, 0]) linear_extrude(1) text("All Band", size=5);
    translate([cx-1, 0.5, 5]) rotate([90, -90, 0]) linear_extrude(1) text("Receiver", size=5);
    
}

// cover
translate([0, cy+2*w+5, 0]) difference() {
    body(10);

    // cover screws
    for (i=[-2*w, cx+2*w+2*w]){
        translate([i, (cy+2*w)/2, 0]) cylinder(d=3+1, h=20);
        translate([i, (cy+2*w)/2, 0]) cylinder(d=6+1, h=5);
    }
}

