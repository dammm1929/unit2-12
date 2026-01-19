boolean upkey, leftkey, rightkey, downkey, spell;
boolean upkeyalt;
boolean faceright = true;
boolean faceleft = false;
boolean dash = false;

void keyPressed() {
  if (keyCode == UP || key == 'w' || key == 'W') upkey = true;
  if (keyCode == ' ') upkeyalt = true;
  if (keyCode == LEFT || key == 'a' || key == 'A') {
    leftkey = true;
    faceleft = true;
    faceright = false;
  }
  if (keyCode == RIGHT || key == 'd' || key == 'D') {
    rightkey = true;
    faceright = true;
    faceleft = false;
  }
  if (keyCode == DOWN || key == 's' || key == 'S') {
    downkey = true;
  }
  if (key == 'e' || key == 'E') spell = true;
  if (keyCode == SHIFT) dash = true; 
  
  //if (keyCode == RIGHT) imgright = true;
}

void keyReleased() {
  if (keyCode == UP || key == 'w' || key == 'W') upkey = false;
  if (keyCode == ' ') upkeyalt = false;
  if (keyCode == LEFT || key == 'a' || key == 'A') leftkey = false;
  if (keyCode == RIGHT || key == 'd' || key == 'D') rightkey = false;
  if (keyCode == DOWN || key == 's' || key == 'S') downkey = false;
  if (key == 'e' || key == 'E') spell = false; 
  if (keyCode == SHIFT) dash = false;
}
