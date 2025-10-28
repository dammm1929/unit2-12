

void gameover() {
  background(0);
  textSize(90);
  fill(255);
  text("your lost", 400,600);
  buttons[4].show();
  if (buttons[4].clicked) {
    mode = 3;
  }
}
