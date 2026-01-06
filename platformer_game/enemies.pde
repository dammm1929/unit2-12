class FGoomba extends FGameObject {

  int dir = L; // direction starts facing left
  int speed = 50;
  int frame = 0;
  FBox enemybox;
  
  FGoomba(float x, float y) {
    super(40,35); // enemy's actual hitbox
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    setGrabbable(false);
    //setNoStroke();
    enemybox = new FBox(50, 50);
    enemybox.setSensor(true);
    world.add(enemybox);
  }
  
  void act() {
    collide();
    move();
    enemysprite();
  }
  
  void enemysprite() {
    enemybox.setPosition(getX(), getY()-31);
    enemybox.setVelocity(this.getVelocityX(), this.getVelocityY());
    enemybox.setFillColor(#05FF2C);
    enemybox.setStroke(255);
    animate();
  }
  
  void animate() {
    if (frame >= crabwalk.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (dir == R) enemybox.attachImage(crabwalk[frame]);
      if (dir == L) enemybox.attachImage(reverseImage(crabwalk[frame]));
      frame++;
    }
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
