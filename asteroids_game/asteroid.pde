class asteroid extends gameobject {
  
  float rotspeed, angle;
  
  asteroid() {
    super(random(0,width), random(0,height),1,1);
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
    rotspeed = random(-2, 2);
    angle = 0;
  }
  
  asteroid(float x, float y, int l) {
    super(x,y, 1, 1);
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*50;
    rotspeed = random(-2,2);
    angle = 0;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(0);
    stroke(255);
    strokeWeight(3);
    rotate(radians(angle));
    circle(0, 0, d);
    line(0, 0,lives*50/2, 0);
    popMatrix();
    angle += rotspeed;
  }


  void act() {
    loc.add(vel);
    if (loc.x > width+lives*50/2 + 1) loc.x = 0-lives*50/2; // wrap around
    if (loc.x < 0-lives*50/2 - 1) loc.x = width+lives*50/2; 
    if (loc.y > height+lives*50/2 + 1) loc.y = 0-lives*50/2;
    if (loc.y < 0-lives*50/2 - 1) loc.y = height+lives*50/2;
    checkforcollision();
  }
  
  
  void checkforcollision() {
    for (int i = 0; i < objects.size(); i++) {
      gameobject obj = objects.get(i);
      if (obj instanceof bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          objects.add(new asteroid(loc.x, loc.y, lives-1));
          objects.add(new asteroid(loc.x, loc.y, lives-1));
          lives = 0;
          obj.lives = 0;
        }
      }
    }
    
  }
}
