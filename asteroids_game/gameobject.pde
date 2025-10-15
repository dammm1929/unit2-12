class gameobject {
  PVector loc;
  PVector vel;
  int lives;
  // multi constructors. the one that is called is the one that runs
  gameobject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 3;
  }
  
  gameobject(PVector l, PVector v) { // unless specified, objects have 1 life
    loc = l;
    vel = v;
    lives = 1;
  }
  
  gameobject(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
  }
  
  void act() {
    
  }
  
  void show() {
    
  }
  
  
}
