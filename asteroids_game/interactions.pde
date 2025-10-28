void keyPressed() {
  if (key == 'w' || keyCode == UP || key == 'W') upkey = true;
  if (key == 'a' || keyCode == LEFT || key == 'A') leftkey = true;
  if (key == 's' || keyCode == DOWN || key == 'S') downkey = true;
  if (key == 'd' || keyCode == RIGHT || key == 'D') rightkey = true;
  if (key == ' ') spacekey = true;
  if (keyCode == SHIFT) {
    shiftkey = true;
    showshadow = true;
  }
}


void keyReleased() {
  if (key == 'w' || keyCode == UP || key == 'W') upkey = false;
  if (key == 'a' || keyCode == LEFT || key == 'A') leftkey = false;
  if (key == 's' || keyCode == DOWN || key == 'S') downkey = false;
  if (key == 'd' || keyCode == RIGHT || key == 'D') rightkey = false;
  if (key == ' ') spacekey = false;
  if (keyCode == SHIFT) shiftkey = false;
}
