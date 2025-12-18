class FGoomba extends FGameObject {

  int dir = L; // direction starts facing left
  int speed = 50;
  int frame = 0;
  
  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    
  }
  
  void act() {
    animate();
    collide();
    move();
  }
  
  void animate() {
    if (frame >= crabwalk.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (dir == R) attachImage(crabwalk[frame]);
      if (dir == L) attachImage(reverseImage(crabwalk[frame]));
      frame++;
    }
  }
  
  void collide() {
    
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*dir, vy);
  }
}
