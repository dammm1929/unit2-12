class FGoomba extends FGameObject {

  int dir = L; // direction starts facing left
  int speed = 50;
  int frame = 0;
  FBox enemybox;
  
  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    enemybox = new FBox(imgw, imgh);
    enemybox.setSensor(true);
    world.add(enemybox);
  }
  
  void act() {
    collide();
    move();
    enemysprite();
  }
  
  void animate() {
    if (frame >= crabwalk.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (dir == R) attachImage(crabwalk[frame]);
      if (dir == L) attachImage(reverseImage(crabwalk[frame]));
      frame++;
    }
  }
  
  void enemysprite() {
    enemybox.setPosition(getX(), getY()-5);
    enemybox.setVelocity(this.getVelocityX(), this.getVelocityY());
    enemybox.setFillColor(#0FF23A);
    animate();
  }
  
  void collide() {
    if (istouching("bouncewall") || istouching("breakable")) {
      dir *= -1;
      setPosition(getX() + dir, getY());
    }
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*dir, vy);
  }
}
