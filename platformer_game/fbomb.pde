int shootcooldown = 0;
boolean canshoot = false;
class FBomb extends FBox {
  
  int bombdespawntimer;
  int terraindespawntimer;
  float bombx = player.getX();
  float bombvx = 50;

  FBomb() {
    super(gridsize, gridsize); // FBomb is built like a box
    bombdespawntimer = 7;
    terraindespawntimer = 120;
    this.setFillColor(#F5BA19);
    this.setStroke(0);
    this.setStrokeWeight(3);
    this.setFriction(0);
    this.setRotatable(false);
    this.setSensor(true);
    if (faceright == true) this.setPosition(bombx+gridsize/2+10, player.getY()-5);
    if (faceleft == true) this.setPosition(bombx-gridsize/2-10, player.getY()-5);
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
    if (faceright == true) bx = 800;
    if (faceleft == true) bx = -800; 
    bomb.setVelocity(bx,by);
    for (int i = 0; i < breakables.size(); i++) {
      FBox b = breakables.get(i);
      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 90) {
        b.setStatic(false); // setting the blocks to not static
        bombdespawntimer --;
        if (bombdespawntimer <= 0) {
          world.remove(this);
          bomb = null;
        }
        
        // BREAKABLE BLOCK DESPAWNING DOESNT WORK YET
        println(terraindespawntimer);
        if (terraindespawntimer <= 0) {
          world.remove(b); 
        }
        
      }
    }
    for (int i = 0; i < regulars.size(); i++) {
      FBox p = regulars.get(i);
      if (dist(this.getX(), this.getY(), p.getX(), p.getY()) < 60) {
        world.remove(this);
        bomb = null;
      }
    }
  }
}
