boolean upkey, leftkey, rightkey, spell;
boolean faceright = true;
boolean faceleft = false;
boolean dash = false;

void keyPressed() {
  if (keyCode == UP || key == 'w' || key == 'W' || key == ' ') upkey = true;
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
    spell = true;
  }
  if (keyCode == SHIFT) dash = true; 
  
}

void keyReleased() {
  if (keyCode == UP || key == 'w' || key == 'W' || key == ' ') upkey = false;
  if (keyCode == LEFT || key == 'a' || key == 'A') leftkey = false;
  if (keyCode == RIGHT || key == 'd' || key == 'D') rightkey = false;
  if (keyCode == DOWN || key == 's' || key == 'S') spell = false;
  if (keyCode == SHIFT) dash = false;
}
