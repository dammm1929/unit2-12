int layertimer = 0;

void game() {
  //layertimer += 1;
  //if (layertimer == 2) {
  //  fill(0, 30);
  //  rect(0,0,width,height);
  //  layertimer = 0;
  //}

  
  background(0);
  
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
  rect(70,900, 200, 50);
  fill(#77E372);
  rect(70,900, fuelbarx, 50);
}
