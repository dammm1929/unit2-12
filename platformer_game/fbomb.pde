int shootcooldown = 0;
boolean canshoot = false;
class FBomb extends FBox {
  
  int timer;
  float bombx = player.getX();
  float bombvx = 50;

  FBomb() {
    super(gridsize, gridsize); // FBomb is built like a box
    timer = 60;
    this.setFillColor(#939393);
    this.setStroke(0);
    this.setStrokeWeight(3);
    this.setFriction(0);
    this.setRotatable(false);
    if (faceright == true) {
      this.setPosition(bombx+gridsize/2+10, player.getY()-6);
      this.setVelocity(800,0);
    }
    if (faceleft == true) {
      this.setPosition(bombx-gridsize/2-10, player.getY()-6);
      this.setVelocity(-800,0);
    }

    
    world.add(this);
  }

  
   
  void act() {

  }
  
}
