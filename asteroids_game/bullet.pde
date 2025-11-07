class bullet extends gameobject {
  int timer;
  
  bullet(float x, float y) {
    super(player1.loc.copy(), player1.dir.copy());
    loc.x = x;
    loc.y = y;
    vel.setMag(20);
    timer = 150;
    d = 7;
    loc.add(vel.x*1.5,vel.y*1.5);
  }
  
  bullet(float x, float y, int p) { // enemy bullets
    super(enemy1.loc.copy(), enemy1.dir.copy());
    loc.x = x;
    loc.y = y;
    vel.rotate(atan2(player1.loc.y-loc.y,player1.loc.x-loc.x));
    vel.setMag(10);
    //vel.add(enemy1.vel);
    loc.add(vel.x*9,vel.y*9);
    timer = 150;
    d = 10;
  }
  
  void show() {
   fill(255);
   stroke(255);
   strokeWeight(3);
   if (d == 10) {
     fill(#EA7979);
     stroke(#EA7979);
   }
   if (d == 7) fill(255);
   circle(loc.x, loc.y, d);
  }
  
  void act() {
    loc.add(vel); 
    timer -= 1;
    if (timer == 0) lives = 0;
    
    particle.add(new bullettrail(loc.x, loc.y, vel.x, vel.y));
  }
}
