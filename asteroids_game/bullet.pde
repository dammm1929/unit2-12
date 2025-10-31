class bullet extends gameobject {
  int timer;
  
  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(20);
    timer = 150;
    d = 7;
  }
  
  //bullet(float x, float y) { // enemy bullets
  //  super(enemy.loc.copy(), enemy.dir.copy());
  //  vel.setMag(10);
  //  vel.add(player1.vel);
  //  timer = 60;
  //  d = 10;
    
  //}
  
  void show() {
   fill(255);
   stroke(255);
   strokeWeight(3);
   circle(loc.x, loc.y, d);
  }
  
  void act() {
    loc.add(vel); 
    timer -= 1;
    if (timer == 0) lives = 0;
  }
}
