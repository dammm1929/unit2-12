class mover {
  
  //instance variables
  PVector loca;
  PVector velo;
  float d;
  float r, g, b;
  boolean alive;
  
//constructors (new constructors must have different parameters to be called)
  mover() {
   d = 100;
   loca = new PVector (random(d/2,width-d/2), random(d/2,height-d/2)); // x and y
   velo = new PVector (1,0); // speed
   velo.rotate(radians(random(0,360))); // changed from adding random x and y to always adding 3 at random angle
   velo.setMag(3); // speed that overrides previous speed
   r = random(0,255);
   g = random(0,255);
   b = random(0,255);
   alive = true;
  }
  
  mover(float x, float y) {
    d = 100;
    loca = new PVector (x, y);
    if (x > width-d/2) loca.x = width-d/2;
    if (x < d/2) loca.x = d/2;
    if (y > height-d/2) loca.y = height-d/2;
    if (y < d/2) loca.y = d/2;
    velo = new PVector (1,0);
    velo.rotate(radians(random(0,360))); 
    velo.setMag(3); 
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    alive = true;
  }
  
  //hehaviour functions
  void act() {
    move();
    bounceoffedge();
    checkfordeath();
  }
  void checkfordeath() {
    if (dist(loca.x, loca.y, mouseX, mouseY) < d/2 && mousePressed) {
      alive = false;
    }
  }
  void move() {
    loca.add(velo);
  }
  void bounceoffedge() {
    if (loca.x < 0 + d/2 || loca.x > width - d/2) velo.x *= -1;
    if (loca.y < 0 + d/2 || loca.y > height - d/2) velo.y *= -1;
  }
  // show
  void showbody() {
    noStroke();
    fill(r,g,b,150);
    circle(loca.x, loca.y, d);
  }
  void showconnections() {
    int i = 0;
    while (i < movers.size()) {
      mover other = movers.get(i); // another temproary mover for cleanliness
      float dist = dist(loca.x, loca.y, other.loca.x, other.loca.y);
      if (dist <= 200) {
        float a = map(dist, 0, 200, 255, 0); // maps distance of 0 to 200, as line opacity 255 to 0
        stroke(r, g, b, a);
        strokeWeight(2);
        line(loca.x, loca.y, other.loca.x, other.loca.y);
      }
      i++;
    }
  }
}
