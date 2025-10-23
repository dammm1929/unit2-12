int j = 0;
void game() {
  background(0);
  
  if (j == 600) {
    objects.add(new asteroid(random(0,width),-100)); //spawning new asteroids at top or bottom
    j = 0;
  }
  j++;
  
  for (int i = 0; i < objects.size(); i++) {
    gameobject currentobject = objects.get(i);
    currentobject.act();
    currentobject.show();
    if (currentobject.lives == 0) {
      objects.remove(i);
    }
  }
  
  fuelbarx = map(fuel, 0,50, 0,200);
  noStroke();
  fill(#C1C1C1);
  rectMode(CORNER);
  rect(70,900, 200, 50);
  fill(#77E372);
  rect(70,900, fuelbarx, 50);
  
}
