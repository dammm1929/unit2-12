class enemy extends gameobject {
  PVector dir;
  int cooldown;
  boolean startshooting;
  
  enemy() {
    super(random(width), random(height), 1, 1);
    if (round(random(1)) == 0) loc.x = -100; // decides the enemy's spawn location
    else loc.x = 1100;
    dir = new PVector(0.1,0);
    cooldown = 0;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(#A7A7A7); // his gun
    rotate(atan2(player1.loc.y-loc.y,player1.loc.x-loc.x));
    strokeWeight(3);
    noFill();
    rect(-7,-7,100,15);
    popMatrix();
    
    pushMatrix();
    translate(loc.x, loc.y);
    if (loc.x > 900) {
      startshooting = false;
      loc.x -= 2;
    } else startshooting = true;
    if (loc.x < 100) {
      startshooting = false;
      loc.x += 2;
    } else startshooting = true;
    stroke(#FA5B5B);
    strokeWeight(3);
    fill(0);
    ellipse(0,20, 130,60); // wings kind of
    line(-25,10, -58,7);
    line(-15,12, -55,35);
    line(0,20, 0,50);
    line(15,12, 55,35);
    line(25,10, 58,7);
    ellipse(0,0, 80,55); // head
    strokeWeight(5);
    line(-5,-10, -26,-15);
    line(5,-10, 26,-15);
    ellipse(-15,-8, 7,5);
    ellipse(15,-8, 7,5);
    ellipse(-15,-8, 7,5);
    ellipse(0,10, 35,15);
    noStroke();
    rect(-20,10, 40,10); // invisible square because i dont like arcs
    stroke(#FA5B5B);
    strokeWeight(3);
    rect(-20,-30, 40, -10);
    rect(-5,-40, 10,-40);
    popMatrix();
  }

  void act() {
    cooldown -= 1;
    if (cooldown <= 0 && startshooting == true) {
      objects.add(new bullet(loc.x,loc.y));
      cooldown = 60;
    }
    
    
  }
}
