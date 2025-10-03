class mover {
  
  //instance variables
  float x, y;
  float vx, vy;
  float d;
  float r, g, b;
  
  //constructor
  mover() {
   d = 100;
   x = random(d/2,width-d/2);
   y = random(d/2,height-d/2);
   vx = random(-1,1);
   vy = random(-1,1);
   r = random(0,255);
   g = random(0,255);
   b = random(0,255);
  }
  
  //hehaviour functions
  void act() {
    move();
    bounceoffedge();
  }
  void move() {
    x += vx;
    y += vy;
  }
  void bounceoffedge() {
    if (x < 0 + d/2 || x > width - d/2) vx *= -1;
    if (y < 0 + d/2 || y > height - d/2) vy *= -1;
  }
  // show
  void showbody() {
    noStroke();
    fill(r,g,b,150);
    circle(x, y, d);
  }
  void showconnections() {
    int i = 0;
    while (i < numofmovers) {
      float dist = dist(x, y, movers[i].x, movers[i].y);
      if (dist <= 200) {
        float a = map(dist, 0, 200, 255, 0); // maps distance of 0 to 200, as line opacity 255 to 0
        stroke(r, g, b, a);
        strokeWeight(2);
        line(x, y, movers[i].x, movers[i].y);
      }
      i++;
    }
  }
}
