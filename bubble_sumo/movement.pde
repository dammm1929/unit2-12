void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  
  if (keyCode == UP) upkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == DOWN) downkey = true;
  
  if (wrestle == true) {
    if (key == 'w' || key == 'W') wrestle1count += 1;
  }
  
  if (wrestle == true) {
    if (keyCode == UP) wrestle2count += 1; 
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  
  if (keyCode == UP) upkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == DOWN) downkey = false;
}

void leftmovement() {
  if (leftinbounds == true && celebratetimer == 120 && wrestle == false) {
    if (wkey) {
      leftPlayer.adjustVelocity(0, -10); 
    }
        
    if (akey) {
      leftPlayer.adjustVelocity(-10, 0); 
    }
        
    if (dkey) {
      leftPlayer.adjustVelocity(10, 0);
    }
        
    if (skey) {
      leftPlayer.adjustVelocity(0, 10);
    }
  }
}

void rightmovement() {
  if (rightinbounds == true && celebratetimer == 120 && wrestle == false) {
    if (upkey) {
      rightPlayer.adjustVelocity(0, -10); 
    }
    
    if (leftkey) {
      rightPlayer.adjustVelocity(-10, 0); 
    }
    
    if (rightkey) {
      rightPlayer.adjustVelocity(10, 0);
    }
    
    if (downkey) {
      rightPlayer.adjustVelocity(0, 10);
    }
  }
}
//float leftX = leftPlayer.getX();
//float leftY = leftPlayer.getY();
//float rightX = rightPlayer.getX();
//float rightY = rightPlayer.getY();
