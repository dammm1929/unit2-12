class Ffly extends FGameObject {
  int dir = L; // direction starts facing left
  int speed = 50;
  int frame = 0;
  float flyturnaroundcount = random(400,600);
  
  final int idle = 1;
  final int aggro = -1;
  int state = idle;
  
  FBox enemybox;
  FCircle radar;
  
  Ffly (float x, float y) {
    super(40,35); // enemy's actual hitbox
    setPosition(x, y);
    setName("fly");
    setRotatable(false);
    setGrabbable(false);
    setStatic(true);
    enemybox = new FBox(50, 50);
    radar = new FCircle(600);
    radar.setSensor(true);
    enemybox.setSensor(true);
    world.add(enemybox);
    world.add(radar);
  }
  
  float flysinY = 0;
  
  void act() {
    detection();
    move();
    enemysprite();
    if (state == idle) {
      waiting();
    }
    if (state == aggro) {
      attacking();
    }
  }
  
  void waiting() {
    setPosition(this.getX(), this.getY()+sin(flysinY)*2); // fly bobbing up and down
    flysinY += 0.06;
    flyturnaroundcount -= 1; // fly turning around randomly
    if (flyturnaroundcount <= 0) {
      flyturnaroundcount = random(400,600);
      dir *= -1;
    }
  }
  
  void detection() {
    radar.setPosition(getX(), getY());
    radar.setVelocity(this.getVelocityX(), this.getVelocityY());
    radar.setNoFill();
    radar.setStroke(#FF5A5A);
  }
  
  void attacking() {
    
  }
  
  void enemysprite() {
    enemybox.setPosition(getX(), getY()+10);
    enemybox.setVelocity(this.getVelocityX(), this.getVelocityY());
    enemybox.setFillColor(#05FF2C);
    enemybox.setStroke(255);
    animate();
  }
  
  void animate() {
    if (frame >= batfly.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (dir == R) enemybox.attachImage(batfly[frame]);
      if (dir == L) enemybox.attachImage(reverseImage(batfly[frame]));
      frame++;
    }
  }
  

  void move() {
    float vx = getVelocityX();
    setVelocity(vx, 0);
  }
  
}
