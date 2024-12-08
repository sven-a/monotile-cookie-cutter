r = [1,0];
u = [cos(60),sin(60)];
d = [cos(60),-sin(60)];
scale = 20;
rim = 4;
rim_height = 3;
wall = 0.6;
height = 15;

points = [
    [0,0],
    1/2 * r,
    u,
    2*u + 1/2*d,
    r + u,
    u + 3/2*r,
    2*r,
    3*r - 1/2*u,
    2*r + d,
    r + d,
    r + 1/2 * d,
    d,
    -1/2 * u
 ];
 
 module cookie_cutter() {
    linear_extrude(rim_height) {
        difference() {
            offset(r = rim) {
                scale(scale) translate(-r) polygon(points);
            }
            scale(scale) translate(-r) polygon(points);
        }
    }
    
    
    linear_extrude(height) {
        difference() {
            offset(delta = wall) {
                scale(scale) translate(-r) polygon(points);
            }
            scale(scale) translate(-r) polygon(points);
        }
    }
 }
 
 cookie_cutter();