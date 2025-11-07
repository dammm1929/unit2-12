void gameover() {
  for (int i = 0; i < objects.size(); i++) {
    objects.get(i);
    objects.remove(i);
  }
  background(0);
  textSize(90);
  fill(255);
  text("your lost", 400,300);
  text("you score: " + score, 300,470);
  textSize(60);
  text("time survived: " + timesurvived/60 + " seconds", 350, 850);
  buttons[4].show();
  if (buttons[4].clicked) { // try again button
    mode = 3;
    objects = new ArrayList();
    player1 = new ship();
    objects.add(player1);
    objects.add(new asteroid());
    objects.add(new asteroid());
    objects.add(new asteroid());
    objects.add(new asteroid());
    objects.add(new asteroid());
    objects.add(new asteroid());
    objects.add(new asteroid());
    iframes = 120;
    score = 0;
    fuel = 50;
    showshadow = false;
    showshield = true; 
    timesurvived = 0;
    enemyspawntimer = 500;
  }
}
