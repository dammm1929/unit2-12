class FPlayer extends FGameObject {
  int frame;
  int fastframe;
  FBox playerbox;
  FGameObject feet;
  FGameObject rightside;
  FGameObject leftside;
  FPlayer() {
    super(20,40);
    frame = 0;
    setPosition(respawnx, respawny); // 980, 1100 default
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
    feet = new FGameObject(13,5);
    feet.setSensor(true);
    rightside = new FGameObject(10,35);
    rightside.setSensor(true);
    leftside = new FGameObject(10,35);
    leftside.setSensor(true);
    world.add(playerbox);
    world.add(feet);
    world.add(rightside);
    world.add(leftside);
  }
  
  void playersprite() {
    playerbox.setPosition(getX(), getY()-7);
    playerbox.setVelocity(this.getVelocityX(), this.getVelocityY());
    playerbox.setFillColor(#03FF98);
    if (action != dashimg) {
      animate();
    }
    if (action == dashimg) {
      fastanimate();
    }
  }
  
  void animate() {
    if (frame >= action.length && action != jump) frame = 0; // for most actions, reset frame to 0
    if (frame >= action.length && action == jump) frame = 3; // for jump, hold last frame
    if (frameCount % 4 == 0) {
      if (faceright) playerbox.attachImage(action[frame]);
      if (faceleft) playerbox.attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  
  void fastanimate() {
    if (fastframe >= action.length) fastframe = 0;
    if (frameCount % 2 == 0) { // faster because dash needs to be fast
      if (faceright) playerbox.attachImage(action[fastframe]);
      if (faceleft) playerbox.attachImage(reverseImage(action[fastframe]));
      fastframe++;
    }
    if (dashcooldown <= 0) fastframe = 0;
  }
  
  void feet() {
    feet.setPosition(getX(), getY()+30);
    feet.setVelocity(this.getVelocityX(), this.getVelocityY());
    feet.setNoFill();
    feet.setNoStroke();
    feet.setStrokeWeight(5);
  }
  
  void sides() {
    rightside.setPosition(getX()+10, getY());
    rightside.setVelocity(this.getVelocityX(), this.getVelocityY());
    rightside.setNoFill();
    rightside.setNoStroke();
    rightside.setStrokeWeight(2);

    leftside.setPosition(getX()-10, getY());
    leftside.setVelocity(this.getVelocityX(), this.getVelocityY());
    leftside.setNoFill();
    leftside.setNoStroke();
    leftside.setStrokeWeight(2);
  }
  
  void movement() {
    playersprite();
    feet();
    sides();
    if (leftkey == false && rightkey == false) vx = 0;
    //if (leftkey && nomovetimer == 8 && rightkey == false) vx = -300; // moving left
    //if (rightkey && nomovetimer == 8 && leftkey == false) vx = 300; // moving right
    
    if (rightside.istouching("regwall") == false && rightside.istouching("bouncewall") == false && rightside.istouching("breakable") == false) {
      if (rightkey && nomovetimer == 8 && leftkey == false) vx = 300; // moving right
    }
    else if (rightside.istouching("regwall") || rightside.istouching("bouncewall") || rightside.istouching("breakable")) {
      if (rightkey) vx = 0;
    }
    
    if (leftside.istouching("regwall") == false && leftside.istouching("bouncewall") == false && leftside.istouching("breakable") == false) {
      if (leftkey && nomovetimer == 8 && rightkey == false) vx = -300; // moving left
    }
    else if (leftside.istouching("regwall") || leftside.istouching("bouncewall") || leftside.istouching("breakable")) {
      if (leftkey) vx = 0;
    }

    vy = player.getVelocityY();
    
    // jumping
    
    //if (upkey && contacts.size() > 0 || upkeyalt && contacts.size() > 0) { // if touching anything
    if (upkey && feet.istouching("regwall") || upkey && feet.istouching("bouncewall") || upkey && feet.istouching("breakable")) { // make sure its the ground
      vy = -500;
    }
    else if (upkeyalt && feet.istouching("regwall") || upkeyalt && feet.istouching("bouncewall") || upkeyalt && feet.istouching("breakable")) { // make sure its the ground
      vy = -500;
    }
    //}
    
    player.setVelocity(vx, vy);
    
    if (feet.istouching("regwall") || feet.istouching("bouncewall") || feet.istouching("breakable")) {
      dashcharged = true;
    }
    
    
    // player animations
    
    if (dashing == false && rightkey == false && leftkey == false && shootcooldown <= 15) {
      //idlegif.show();
      if (feet.istouching("regwall") || feet.istouching("bouncewall") || feet.istouching("breakable")) {
        action = idle;
      }
    }
    if (dashing == false && rightkey == true && shootcooldown <= 15 || dashing == false && leftkey == true && shootcooldown <= 15) {
      //walkgif.show();
      if (feet.istouching("regwall") || feet.istouching("bouncewall") || feet.istouching("breakable")) {
        action = walk;
      }
    }
    if (feet.istouching("regwall") == false && feet.istouching("bouncewall") == false && feet.istouching("breakable") == false) {
      if (dashing == false && shootcooldown <= 15) {
      //jumpgif.show();
        action = jump;
      }
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
        if (bombright) {
          player.setVelocity(-20,-10);
        }
        else if (bombleft) {
          player.setVelocity(20,-10); // air stall after shooting and momentum
        }
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
        
      }
      if (dashcooldown <= 18) {
        nomovetimer = 8;
        dashing = false;
      }
    }
    
  } // end of movement function
  
  
  boolean checkpoint1;
  boolean checkpoint2;
  boolean checkpoint3;
  void collision() {
    if (istouching("spike")) {
      setPosition(respawnx,respawny);
    }
    
    if (istouching("goomba")) {
      setPosition(respawnx,respawny);
    }
    
    if (istouching("fly")) {
      setPosition(respawnx,respawny);
    }
    
    if (istouching("npc")) {
      dialogue = true;
    }
    
    if (istouching("respawn1")) { // 72, 47
      checkpoint1 = true;
      checkpoint2 = false;
      checkpoint3 = false;
    }
    if (istouching("respawn2")) { // 56, 34
      checkpoint1 = false;
      checkpoint2 = true;
      checkpoint3 = false;
    }
    if (istouching("respawn3")) { // 54, 15
      checkpoint1 = false;
      checkpoint2 = false;
      checkpoint3 = true;
    }
    
    if (checkpoint1 == true) {
      respawnx = 3600;
      respawny = 2350;
    }
    if (checkpoint2 == true) {
      respawnx = 2800;
      respawny = 1700;
    }
    if (checkpoint3 == true) {
      respawnx = 2700;
      respawny = 750;
    }
    if (checkpoint1 == false && checkpoint2 == false && checkpoint3 == false) {
      respawnx = 980;
      respawny = 1500;
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
