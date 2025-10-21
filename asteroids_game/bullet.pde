class bullet extends gameobject {
  int timer;
  
  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(20);
    timer = 150;
    d = 7;
  }
  
  void show() {
   fill(255);
   stroke(255);
   circle(loc.x, loc.y, d);
  }
  
  void act() {
    loc.add(vel); 
    timer -= 1;
    if (timer == 0) lives = 0;
    
    if (loc.x > width) loc.x = 0;
    if (loc.x < 0) loc.x = width;
    if (loc.y > height) loc.y = 0;
    if (loc.y < 0) loc.y = height;
  }
}
