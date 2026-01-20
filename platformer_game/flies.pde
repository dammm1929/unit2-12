class Ffly extends FGameObject {
  int dir = L; // direction starts facing left
  int speed = 3;
  int frame = 0;
  float flyturnaroundcount = random(400,600);
  
  final int idle = 1;
  final int aggro = -1;
  int state = idle;
  
  FBox enemybox;
  FCircle radar;
  FCircle radar2;
  
  Ffly (float x, float y) {
    super(40,35); // enemy's actual hitbox
    setPosition(x, y);
    setNoStroke();
    setName("fly");
    setRotatable(false);
    setGrabbable(false);
    setStatic(true);
    enemybox = new FBox(50, 50);
    radar = new FCircle(600);
    radar.setSensor(true);
    radar2 = new FCircle(1200);
    radar2.setSensor(true);
    enemybox.setSensor(true);
    world.add(enemybox);
    world.add(radar);
    world.add(radar2);
  }
  
  float flysinY = 0;
  void act() {
    detection();
    move();
    enemysprite();
    collision();
    if (state == idle) {
      waiting();
    }
    if (state == aggro) {
      attacking();
    }
  }
  
  void detection() {
    radar.setPosition(getX(), getY());
    radar.setVelocity(this.getVelocityX(), this.getVelocityY());
    radar.setNoFill();
    radar.setNoStroke();
    
    radar2.setVelocity(this.getVelocityX(), this.getVelocityY());
    radar2.setNoFill();
    radar2.setNoStroke();
    
    if (player.isTouchingBody(radar)) {
      state = aggro;
    }
  }
  
  void waiting() { // caused by state being idle
    setStatic(true);
    radar2.setPosition(-100,-100);
    setPosition(this.getX(), this.getY()+sin(flysinY)*2); // fly bobbing up and down
    flysinY += 0.06;
    flyturnaroundcount -= 1; // fly turning around randomly
    if (flyturnaroundcount <= 0) {
      flyturnaroundcount = random(400,600);
      dir *= -1;
    }
  }
  
  void attacking() { // caused by state being aggro
    radar2.setPosition(getX(), getY());
    if (player.isTouchingBody(radar2) == false) {
      state = idle;
    }
    
    //moving 
    setStatic(false);
    setVelocity((player.getX() - this.getX())/2, (player.getY() - this.getY())/2);
    if (player.getX() < this.getX()) {
      dir = R;
    }
    else if (player.getX() > this.getY()) {
      dir = L;
    }
    
    //if (dist(player.getX(), player.getY(), this.getX(), this.getY()) < 100) {
    //  speed += 1;
    //}

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
  
  void collision() {
    
    if (this.istouching("bomb")) {
      world.remove(this);
      enemies.remove(this);
      // UNFINISHED!!!! COLLISION WITH BOMB TO DESPAWN

    }
    
  }
  
}
