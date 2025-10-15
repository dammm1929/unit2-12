

void game() {
  background(0);
  
  for (int i = 0; i < objects.size(); i++) {
    gameobject currentobject = objects.get(i);
    currentobject.act();
    currentobject.show();
    if (currentobject.lives == 0) {
      objects.remove(i);
    }
  }
  

}
