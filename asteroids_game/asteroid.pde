class asteroid extends gameobject {
  
  float rotspeed, angle;
  int a;
  float s = 1;
  
  asteroid() { // starting asteroids
    super(random(0,width), random(0,height),1,1);
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
    rotspeed = random(-2, 2);
    angle = 0;
    if(int(random(2)) == 0) a = 2;
    else if(int(random(1)) == 0) a = 1;
    else a = 3;
  }
  
  asteroid(float x, float y, int l) { // split asteroids
    super(x,y, 1, 1);
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*50;
    rotspeed = random(-2,2);
    angle = 0;
    if(int(random(2)) == 0) a = 2;
    else if(int(random(1)) == 0) a = 1;
    else a = 3;
    if (lives == 2) s -= 0.33;
    else s = 0.33;
  }
  
  asteroid(float x, float y) { // new asteroids from sides
    super(x, y, 1,1);
    //s = 1;
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
    rotspeed = random(-2, 2);
    angle = 0;
    if(int(random(2)) == 0) a = 2;
    else if(int(random(1)) == 0) a = 1;
    else a = 3;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(0);
    stroke(255);
    if (lives == 3) strokeWeight(3);
    else if (lives == 2) strokeWeight(5);
    else strokeWeight(9);
    rotate(radians(angle));
    
    //circle(0, 0, d); // d = 150 at default
    if (a == 0) {
      scale(s);
      line(-90,0, -70,-50);
      line(-70,-50, -20,-70);
      line(-20,-70, 30,-65);
      line(30,-65, 60,-75);
      line(60,-75, 80,-10);
      line(80,-10, 65,40);
      line(65,40, 30,60);
      line(30,60, 0,80);
      line(0,80, -70,40);
      line(-70,40, -90,0);
    }
    
    if (a == 1) {
      scale(s);
      line(-80,10, -65,-40);
      line(-65,-40, -65,-70);
      line(-65,-70, -20,-80);
      line(-20,-80, 25,-70);
      line(25,-70, 40,-80);
      line(40,-80, 90,-10);
      line(90,-10, 60,40);
      line(60,40, 65,60);
      line(-20,80, 65,60);
      line(-20,80, -80,10);
    }
    
    if (a == 2) {
      scale(s);
      line(-80,10, -65,-40);
      line(-65,-40, -10,-70);
      line(-10,-70, 40,-80);
      line(80,10, 40,-80);
      line(80,10, 70,40);
      line(70,40, 20,60);
      line(20,60, 10,75);
      line(10,75, -75,50);
      line(-75,50, -80,10);
    }
      
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
      if (obj instanceof bullet) { // collision with bullets
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          objects.add(new asteroid(loc.x, loc.y, lives-1));
          objects.add(new asteroid(loc.x, loc.y, lives-1));
          lives = 0;
          obj.lives = 0;
          score += 1;
        }
      }
      if (obj instanceof ship && showshield == false) { // collision with the ship
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d+6){
          if (showshadow == true) {
            objects.add(new asteroid(loc.x, loc.y, lives-1));
            objects.add(new asteroid(loc.x, loc.y, lives-1));
            lives = 0;
            score += 1;
          }
          hit = true;
          hitAsteroid = obj;
        }
      }
    }
  }
}
