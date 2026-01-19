void game() {
  background(background);
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  rectMode(CENTER);
  for (int i = 0; i < posX.size(); i++) {
    fill(#4C6741);
    stroke(#4C6741);
    square(posX.get(i), posY.get(i), gridsize);
  }
  
  world.step();
  world.draw();
  popMatrix();

  player.movement();
  player.collision();
  
  if (bomb != null) bomb.explode();
  
  
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}
