class asteroid extends gameobject {
  
  asteroid() {
    super(random(0,width), random(0,height),1,1);
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
  }
  
  void show() {
    fill(0);
    stroke(255);
    strokeWeight(3);
    circle(loc.x, loc.y, d);
    line(loc.x, loc.y, loc.x + lives*50/2, loc.y);
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
           lives = 0;
           obj.lives = 0;
        }
      }
    }
    
  }
}
