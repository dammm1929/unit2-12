class bullet extends gameobject {
  int timer;
  
  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 150;
  }
  
  void show() {
   fill(255);
   stroke(255);
   circle(loc.x, loc.y, 5);
  }
  
  void act() {
    loc.add(vel); 
    timer -= 1;
    if (timer == 0) lives = 0;
  }
}
