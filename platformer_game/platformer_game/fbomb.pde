int shootcooldown = 0;
boolean canshoot = false;
boolean bombright, bombleft;

class FBomb extends FGameObject {
  
  int blockDespawnTimer;
  float bombx = player.getX();
  float bombvx = 50;
  FGameObject front;

  FBomb() { 
    super(gridsize, gridsize); // FBomb is built like a box
    blockDespawnTimer = 120;
    this.setFillColor(#F5BA19);
    this.setStroke(0);
    this.setName("bomb");
    this.setStrokeWeight(3);
    this.setFriction(0);
    this.setRotatable(false);
    this.setSensor(true);
    if (faceright == true) {
      bombright = true; 
      bombleft = false;
      this.setPosition(bombx+gridsize/2+10, player.getY()-5);
    }
    if (faceleft == true) {
      bombleft = true;
      bombright = false;
      this.setPosition(bombx-gridsize/2-10, player.getY()-5);
    }
    front = new FGameObject(8,40);
    world.add(front);
    world.add(this);
  }

  void front() {
    front.setVelocity(this.getVelocityX(), this.getVelocityY());
    front.setNoFill();
    //front.setNoStroke();
    front.setNoStroke();
    front.setStrokeWeight(5);
    if (bombright) front.setPosition(getX()+35, getY());
    if (bombleft) front.setPosition(getX()-35, getY());
  }
   
  //void act() {
  //  timer --;
  //  if (timer <= 0) {
  //    explode(); 
  //  }
  //}
  
  void explode() {
    front();
    by = 0;
    if (bombright) bx = 800;
    if (bombleft) bx = -800;
    bomb.setVelocity(bx,by);

    
    // bomb despawning from normal blocks
    if (front.istouching("regwall") || front.istouching("bouncewall")) {
      world.remove(bomb);
      bomb = null;
      world.remove(front);
    }
    
    // bomb despawning from breakable blocks
    for (int i = 0; i < breakables.size(); i++) {
      FBox b = breakables.get(i);
    
      if (front.istouching("breakable")) { // if bomb touches
        b.setStatic(false); // setting the blocks to not static
        world.remove(this);
        world.remove(front);
        bomb = null;
      }
      
      // blocks getting knocked around
      if (bombright && front.istouching("breakable")) {
        b.setVelocity(random(500,700), random(-30,-70)); // knocked to the right
      }
      if (bombleft && front.istouching("breakable")) {
        b.setVelocity(random(-500,-700), random(-30,-70)); // knocked to the left
      }
    }
    
    //bomb despawning frmo enemies
    if (this.istouching("fly") || this.istouching("goomba")) {
      world.remove(bomb);
      world.remove(front);
      bomb = null;
    }
    
    //  // BREAKABLE BLOCK DESPAWNING DOESNT WORK YET
    //blockDespawnTimer --;
    //  //println(blockDespawnTimer);
    //if (blockDespawnTimer == 0) {
    //  world.remove(b);
    //  blockDespawnTimer = 120;
    //}
  }
}
