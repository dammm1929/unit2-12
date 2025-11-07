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
    
    //if (vel.x > 8 || vel.y > 8 || vel.x < -8 || vel.y < -8) {
    if (vel.x + vel.y >= 9 || vel.x - vel.y <= -9 || vel.x - vel.y >= 9 || vel.x + vel.y <= -9) {
      showshadow = true;
    } else showshadow = false;
    
    if (showshadow == true) {
      particle.add(new shipshadow());
    }
  }
  void drawship() {
    rotate(radians(90));
    fill(0);
    stroke(255,255,255, shipopacity);
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
      if (vel.mag() <= 0.3 && vel.mag() >= -0.3) { // if ship is barely moving
        vel = hitAsteroid.vel.copy();
        print(hitAsteroid.vel, " is asteroid velocity       ");
        print(vel, " is ship velocity");
      }
      hitAsteroid = null;
      
      hit = false;
      enterdashstun = true;
      if (enterhitstun == false) {
        lives -= 1;
        showshield = true;
      }
      if (vel.mag() > 0.3 || vel.mag() < 0.3) { // if ship is moving enough
        vel.x *= -0.5; // standard reverse it's velocity
        vel.y *= -0.5;
      }
    }
    
    if (enterdashstun == true) dashstun += 1;
    if (dashstun == 30) {
      enterdashstun = false;
      dashstun = 0;
    }
    
    if (enterhitstun == true) {
      hitstun += 1; // hitstun starts at 0 and adds to 60
      shipopacity = 100;
    }
    if (hitstun == 60) {
      enterhitstun = false;
      hitstun = 0;
      shipopacity = 255;
    }
    
    if (lives == 0) { // if you die
      mode = 4;
    //  // ----- reset everything -----
    //  lives = 3; 
    //  loc.x = width/2;
    //  loc.y = height/2;
    //  score = 0;
    //  fuel = 50;
    //  dir = new PVector(0.1,0);
    //  vel.setMag(0);
      fuelbarx = map(fuel, 0,50, 0,200);

    }
    if (showshield == true) {
      shieldopa = map(iframes, 0,120, 0,255);
      iframes -= 1;
      if (iframes >= 1) {
        noFill();
        stroke(255, 255, 255, shieldopa);
        strokeWeight(3);
        circle(loc.x, loc.y, 100);
      }
      if (iframes <= 0) {
        showshield = false;
        iframes = 120;
        shieldopa = 255;
      }
    }
    textSize(55);
    fill(255);
    stroke(255, 255, 255, 255);
    strokeWeight(3);
    textAlign(CENTER, CENTER);
    text("lives: ", 105,100);
    text("score: " + score, 125,50);
    textAlign(LEFT, CENTER);
    text("time: " + timesurvived/60, 35,150);
    if (lives >= 1) circle(190,103,20);
    if (lives >= 2) circle(230,103,20);
    if (lives >= 3) circle(270,103,20);
    
    for (int i = 0; i < objects.size(); i++) {
      gameobject obj = objects.get(i);
      if (obj instanceof bullet && showshield == false) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < 20 + obj.d/2) {
          showshield = true;
          lives -= 1;
          obj.lives = 0;
          if (lives == 0) mode = 4;
        }
      }
    }
    
  }
  
  void move() {
    loc.add(vel);
    if (upkey && hitstun == 0) vel.add(dir);
    if (upkey == true && hitstun > 0) vel.mult(0.97);
    if (upkey == false) vel.mult(0.97); // slow it down
    if (upkey == true && shiftkey == false && hitstun == 0) particle.add(new shiparticles(player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y));
    if (upkey == true && fuel == 0 && hitstun == 0) particle.add(new shiparticles(player1.loc.x, player1.loc.y, player1.dir.x, player1.dir.y));
    
    
    if (leftkey && hitstun == 0) dir.rotate(-radians(4));
    if (rightkey && hitstun == 0) dir.rotate(radians(4));

    if (vel.x >= 9 || vel.y >= 9) vel.setMag(9);
    if (vel.x <= -9 || vel.y <= -9) vel.setMag(9);
    
    if (shiftkey && fuel > 0 && downkey == false && dashstun <= 0 && hitstun == 0) {
      vel.set(dir);
      vel.setMag(10);
      fuel -= 1;
      particle.add(new shiptrail());
    }
    
    if (shiftkey && fuel > 0 && downkey == true && dashstun <= 0 && hitstun == 0) {
      vel.set(dir);
      vel.setMag(-5);
      fuel -= 3;
    }
    

  }
  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new bullet(loc.x,loc.y));
      cooldown = 30;
    }
  }
  
  
  
  
}
