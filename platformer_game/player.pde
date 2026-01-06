class FPlayer extends FGameObject {
 
  int frame;
  FBox playerbox;
  FBox feet;
  FPlayer() {
    super(20,40); // if i extend gameobject, the size proportions of player is off
    frame = 0;
    setPosition(980,900);
    setNoFill();
    setStrokeWeight(3);
    setNoStroke();
    setName("player");
    setRestitution(0);
    setDensity(1);
    setGrabbable(false);
    setRotatable(false);
    playerbox = new FBox(imgw,imgh);
    playerbox.setSensor(true);
    feet = new FBox(13,5);
    feet.setSensor(true);
    world.add(playerbox);
    world.add(feet);
  }
  
  void playersprite() {
    playerbox.setPosition(getX(), getY()-7);
    playerbox.setVelocity(this.getVelocityX(), this.getVelocityY());
    playerbox.setFillColor(#03FF98);
    animate();
  }
  
  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 4 == 0) { // MAKE THIS FASTER WHEN DASHING !!!!
      if (faceright) playerbox.attachImage(action[frame]);
      if (faceleft) playerbox.attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  
  void feet() {
    feet.setPosition(getX(), getY()+30);
    feet.setVelocity(this.getVelocityX(), this.getVelocityY());
    feet.setNoFill();
    feet.setNoStroke();
    feet.setStrokeWeight(5);
  }
  
  void movement() {
    playersprite();
    feet();
    if (leftkey == false && rightkey == false) vx = 0;
    if (leftkey && nomovetimer == 8 && rightkey == false) vx = -300;
    if (rightkey && nomovetimer == 8 && leftkey == false) vx = 300;
    vy = player.getVelocityY();
    
    // jumping
    ArrayList<FContact> contacts = feet.getContacts();
    
    if (upkey && contacts.size() > 0 || upkeyalt && contacts.size() > 0) vy = -500;
    player.setVelocity(vx, vy);
    if (contacts.size() > 0) {
      dashcharged = true;
    }
    
    
    // player animations
    

    if (dashing == false && rightkey == false && leftkey == false && contacts.size() > 0 && shootcooldown <= 15) {
      //idlegif.show();
      action = idle;
    }
    if (dashing == false && rightkey == true && contacts.size() > 0 && shootcooldown <= 15 || dashing == false && leftkey == true && contacts.size() > 0 && shootcooldown <= 15) {
      //walkgif.show();
      action = walk;
    }
    if (contacts.size() <= 0 && dashing == false && shootcooldown <= 15) {
      //jumpgif.show();
      action = jump;
    }
    if (dashing == true && shootcooldown <= 15) {
      //dashgif.show();
      action = dashimg;
    }
    if (shootcooldown < 30 && shootcooldown > 15) {
      //flopgif.show();
      action = flop;
    }
    

    // spell
    if (spell && canshoot == true && dashing == false) {
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
      if (nomovetimer <= 8 && nomovetimer >= 0) {
        
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
      if (dashcooldown > 20) nomovetimer -= 8;
      if (dashcooldown <= 0) {
        dashed = false;
        dashcooldown = 30;
        dashvar = 0;
      }
      if (dashcooldown <= 18) {
        nomovetimer = 8;
        dashing = false;
      }
    }
    
  } // end of movement function
  
  
  
  void collision() {
    if (istouching("spike")) {
      setPosition(900,1000);
    }
    
    if (istouching("goomba")) {
      setPosition(900,1000);
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
