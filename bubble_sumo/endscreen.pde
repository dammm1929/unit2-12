void endscreen() {
  background(#C4834D);
  buttons[1].show();
  if (buttons[1].clicked) {
    mode = 2; 
    player1win = false;
    player2win = false;
    score1 = 0;
    score2 = 0;
  }
  if (player1win == true) {
    textSize(50);
    text("player 1 wins", 400,400); 
  }
  if (player2win == true) {
    textSize(50);
    text("player 2 wins", 400,400); 
  }
}
