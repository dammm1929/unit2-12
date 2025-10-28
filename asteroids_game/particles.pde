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
  shiparticles() {
    super(player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y, 5);
    if(int(random(3)) == 0) f = #FF0808;
    else if(int(random(2)) == 0) f = #FFBE08;
    else f = #FAEE00;
    
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
    super(player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y, 60);
  }
  
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    rotate(radians(90));
    fill(0, map(t, 0,60, 0,150));
    stroke(255, map(t, 0,60, 0,150));
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
