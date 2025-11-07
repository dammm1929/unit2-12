class particles {
  PVector loc, dir;
  float t;
  particles(float lx, float ly, float dx, float dy, float time) {
    loc = new PVector(lx,ly);
    dir = new PVector(dx,dy);
    t = time;
  }
  void show() {
    
  }
}

class shiparticles extends particles {
  color f;
  shiparticles(float lx, float ly, float vx, float vy) {
    super(lx,ly, vx,vy, 5);
    if(int(random(3)) == 0) f = #FF0808;
    else if(int(random(2)) == 0) f = #FFBE08;
    else f = #FAEE00;
    //player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y
  }
  
  void show() {
    noStroke();
    fill(f, map(t, 0,5, 0,255)); // change opacity from 255 to 0 in 5 frames
    pushMatrix();
    translate(loc.x - dir.x*240, loc.y - dir.y*240); // how far back the fire trail is
    translate(0,random(-5,5));
    circle(0,0,10);
    popMatrix();
    t--;
  }
}

class shiptrail extends particles {
  shiptrail() {
    super(player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y, 15);
  }
  
  void show() {
    //fill(#03ECFF, map(t, 0,5, 0,255));
    fill(#03ECFF, map(t, 0,15, 0,255)); // blue
    noStroke();
    pushMatrix();
    translate(loc.x - dir.x*200, loc.y - dir.y*200);
    rotate(dir.heading());
    square(-5,-5,10);
    popMatrix();
    t--;
  }
  
}

class shipshadow extends particles {
  shipshadow() {
    super(player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y, 30);
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    rotate(radians(90));
    fill(0, map(t, 0,30, 0,150));
    stroke(255, map(t, 0,30, 0,150));
    strokeWeight(3);
    triangle(0,-25, 17,15, -17,15);
    circle(0,0,10);
    triangle(9,-7, 30,5, 14,5);
    triangle(-9,-7, -30,5, -14,5);
    strokeWeight(1.5);
    line(26,5, 15,14);
    line(-26,5, -15,14);
    strokeWeight(3);
    line(18,-3, 18,-11);
    line(-18,-3, -18,-11);
    triangle(14,15, 15,22, 5,15);
    triangle(-14,15, -15,22, -5,15);
    popMatrix();
    t--;
  }
}

class dust extends particles {
  float tmax, dist;
  dust(float x, float y, float time, float _dist) {
    super(x, y, random(-1,1), random(-1,1), time);
    dir.rotate(random(radians(360)));
    dist = _dist;
    tmax = time;
  }
  
  void show() {
    noStroke();
    fill(255, map(t, 0,tmax, 0,255));
    pushMatrix();
    translate(loc.x, loc.y);
    circle(0,0,10);
    popMatrix();
    loc.add(dir.x*dist, dir.y*dist);
    t--;
  }
}

class bullettrail extends particles {
  bullettrail(float lx, float ly, float vx, float vy) {
    super(lx, ly, vx, vy, 20);
    loc.sub(dir.x*1.5,dir.y*1.5);
  }
  
  void show() {
    loc.add(dir.x*0.6, dir.y*0.6);
    pushMatrix();
    translate(loc.x, loc.y);
    fill(#B4B4B4, map(t,0,10, 0,255));
    noStroke();
    strokeWeight(2);
    circle(0,0,5);
    popMatrix();
    t--;
  }
}
