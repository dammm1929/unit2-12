class ship extends gameobject { // ship is extending off gameobject
  // instance
  PVector dir;
  int cooldown;
  
  // constructor
  ship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.1,0);
    cooldown = 0;
    
  }
  
  
  // behaviour
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading());
    drawship();
    popMatrix();
  }
  void drawship() {
    rotate(radians(90));
    fill(0);
    stroke(255);
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
  }
  void act() {
    move();
    shoot();

    if (loc.x > width+10) loc.x = 0-9; // wrap around
    if (loc.x < 0-10) loc.x = width+9;
    if (loc.y > height+10) loc.y = 0-9;
    if (loc.y < 0-10) loc.y = height+9;
    
    if (hit == true) {
      hit = false;
      lives -= 1;
      showshield = true;
    }
    
    if (lives == 0) {
      mode = 4;
    }
    
    if (showshield == true) {
      iframes -= 1;
      if (iframes >= 1) {
        circle(loc.x, loc.y, 50);
      }
      if (iframes <= 0) {
        showshield = false;
        iframes = 180;
      }
    }
    textSize(55);
    fill(255);
    text("lives: ", 105,100);
    text("score: " + score, 125,50);
    if (lives >= 1) circle(190,103,20);
    if (lives >= 2) circle(230,103,20);
    if (lives >= 3) circle(270,103,20);
  }
  
  void move() {
    loc.add(vel);
    if (upkey) vel.add(dir);
    if (upkey == false) vel.mult(0.97); // slow it down
    if (upkey == true && shiftkey == false) particle.add(new shiparticles());
    if (upkey == true && fuel == 0) particle.add(new shiparticles());
    
    
    if (leftkey) dir.rotate(-radians(4));
    if (rightkey) dir.rotate(radians(4));

    if (vel.x >= 10) vel.setMag(10);
    if (vel.y >= 10) vel.setMag(10);
    
    if (shiftkey && fuel > 0 && downkey == false) {
      vel.set(dir);
      vel.setMag(10);
      fuel -= 1;
      particle.add(new shiptrail());
    }
    
    if (shiftkey && fuel > 0 && downkey == true) {
      vel.set(dir);
      vel.setMag(-5);
      fuel -= 3;
    }
    
    if (showshadow == true && fuel > 0) {
      showshadow = false;
      particle.add(new shipshadow());
    }

  }
  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new bullet());
      cooldown = 30;
    }
  }
  
  
  
  
}
