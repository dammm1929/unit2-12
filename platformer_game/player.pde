class FPlayer extends FBox {
 
  FPlayer() {
    super(20,40);
    setPosition(250,500);
    setFillColor(#1F3DCB);
    setStrokeWeight(3);
    setStroke(0);
    setRestitution(0);
    setDensity(1);
    setGrabbable(false);
    setRotatable(false);
  }
  
  void movement() {
    if (leftkey == false && rightkey == false) vx = 0;
    if (leftkey && nomovetimer == 10) vx = -300;
    if (rightkey && nomovetimer == 10) vx = 300;
    vy = player.getVelocityY();
    // jumping
    ArrayList<FContact> contacts = player.getContacts();
    if (upkey && contacts.size() > 0 || upkeyalt && contacts.size() > 0) vy = -500;
    player.setVelocity(vx, vy);
    if (contacts.size() > 0) {
      dashcharged = true;
    }
    
    // spell
    if (spell && canshoot == true) {
      bomb = new FBomb(); 
      canshoot = false;
      shootcooldown = 30;
    }
    
    if (canshoot == false) {
      shootcooldown -= 1;
      if (shootcooldown < 30 && shootcooldown > 10) {
        player.setVelocity(0,0); // air stall after shooting
      }
    }
  
    if (shootcooldown <= 0) canshoot = true;
  
    if (dash && dashcooldown >= 30 && dashcharged == true) { // if dash
      dashing = true;
      if (nomovetimer <= 10 && nomovetimer >= 0) {
        
        // directions for omni directional dash
        if (rightkey && upkey == false && downkey == false) {
          player.setVelocity(1000,-1);
          vx = 1000;
        }
      
        if (leftkey && upkey == false && downkey == false) {
          player.setVelocity(-1000,-1); 
          vx = -1000;
        }
   
        if (upkey && rightkey == false && leftkey == false) {
          player.setVelocity(0,-700);
        }
        
        if (rightkey && upkey) {
          player.setVelocity(0,-600);
          vx = 600;
        }
        
        if (leftkey && upkey) {
          player.setVelocity(0,-600);
          vx = -600;
        }
        
        if (rightkey && downkey) {
          player.setVelocity(0,400);
          vx = 700;
        }
        
        if (leftkey && downkey) {
          player.setVelocity(0,400);
          vx = -700;
        }
        
        if (downkey && leftkey == false && rightkey == false) {
          player.setVelocity(0,500); 
        }
        
        if (downkey == false && rightkey == false && leftkey == false && upkey == false) {
          if (faceright == true) {
            player.setVelocity(1000,-1);
            vx = 1000;
          }
          if (faceleft == true) {
            player.setVelocity(-1000,-1); 
            vx = -1000;
          }
        }
      }
      dashed = true;
    }
    
    if (dashed == true) {
      dashcooldown -= 1;
      if (dashcooldown == 29) dashcharged = false;
      if (dashcooldown > 20) nomovetimer -= 1;
      if (dashcooldown <= 0) {
        dashed = false;
        dashcooldown = 30;
      }
      if (dashcooldown <= 20) {
        nomovetimer = 10;
        dashing = false;
      }
    }
  }
  
  void collisions() {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains("spike")) {
        setPosition(250,800); 
      }
    }
  }
  
}

//void playerbottom() {
//  playerbottom = new FBox(18,1);
//  playerbottom.setPosition(player.getX()+1, player.getY()+41);
//  playerbottom.setNoFill();
//  playerbottom.setNoStroke();
//  playerbottom.setRestitution(0);
//  playerbottom.setDensity(1);
//  playerbottom.setGrabbable(false);
//  playerbottom.setRotatable(false);
//  world.add(playerbottom);
//}
