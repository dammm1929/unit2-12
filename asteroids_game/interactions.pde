void keyPressed() {
  if (key == 'w' || keyCode == UP) upkey = true;
  if (key == 'a' || keyCode == LEFT) leftkey = true;
  if (key == 's' || keyCode == DOWN) downkey = true;
  if (key == 'd' || keyCode == RIGHT) rightkey = true;
}


void keyReleased() {
  if (key == 'w' || keyCode == UP) upkey = false;
  if (key == 'a' || keyCode == LEFT) leftkey = false;
  if (key == 's' || keyCode == DOWN) downkey = false;
  if (key == 'd' || keyCode == RIGHT) rightkey = false;
  
}
