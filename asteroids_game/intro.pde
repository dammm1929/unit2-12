

void intro() {
  background(0);

  buttons[0].show();
  buttons[1].show();
  buttons[2].show();

  if (pleasedontleave == true && mode == 1) text("click the play button", 390, 900);
  if (buttons[0].clicked) mode = 3; // play
  if (buttons[1].clicked) mode = 2; // settings
  if (buttons[2].clicked) {
    pleasedontleave = true;
  }
  if (buttons[1].clicked) {
    pleasedontleave = false;
  }
  
  textSize(140);
  text("astorids", width/2,200);
}

//void tactile(int x, int y) {
//  if (mouseX > 400 && mouseX < 600 && mouseY > 400 && mouseY < 500) {
//    fill(#C6C6C6);
//  }
//}
