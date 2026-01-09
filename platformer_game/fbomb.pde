int shootcooldown = 0;
boolean canshoot = false;
boolean bombright, bombleft;
class FBomb extends FBox {
  
  int bombdespawntimer;
  int blockDespawnTimer;
  float bombx = player.getX();
  float bombvx = 50;

  FBomb() { 
    super(gridsize, gridsize); // FBomb is built like a box
    bombdespawntimer = 7;
    blockDespawnTimer = 120;
    this.setFillColor(#F5BA19);
    this.setStroke(0);
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
    world.add(this);
  }

  
   
  //void act() {
  //  timer --;
  //  if (timer <= 0) {
  //    explode(); 
  //  }
  //}
  
  void explode() {
    by = 0;
    if (bombright) bx = 800;
    if (bombleft) bx = -800; 
    bomb.setVelocity(bx,by);
    for (int i = 0; i < breakables.size(); i++) {
      FBox b = breakables.get(i);
      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 90) { // if bomb within range of breakable
        b.setStatic(false); // setting the blocks to not static
        bombdespawntimer --;
        if (bombdespawntimer <= 0) { // remove the bomb
          world.remove(this);
          bomb = null;
        }
        if (bombright) {
          b.setVelocity(random(500,700), random(-30,-70)); // blocks knocked to the right
        }
        if (bombleft) {
          b.setVelocity(random(-500,-700), random(-30,-70)); // blocks knocked to the left
        }
        
        // BREAKABLE BLOCK DESPAWNING DOESNT WORK YET
        blockDespawnTimer --;
        //println(blockDespawnTimer);
        if (blockDespawnTimer == 0) {
          world.remove(b);
          blockDespawnTimer = 120;
        }

      }
    }
    
    for (int i = 0; i < regulars.size(); i++) {
      FBox p = regulars.get(i);
      if (dist(this.getX(), this.getY(), p.getX(), p.getY()) < 60) { // if bomb within range of normals
        world.remove(this);
        bomb = null;
      }
    }
  }
}
