void player1() {
  player = new FBox(20,40); 
  player.setPosition(250,500); // 250,500
  player.setFillColor(#1F3DCB);
  player.setStrokeWeight(3);
  player.setStroke(0);
  player.setRestitution(0);
  player.setDensity(1);
  player.setGrabbable(false);
  player.setRotatable(false);
  world.add(player);
  
  
  
  
  
}

//void playerbottom() {
//  playerbottom = new FBox(18,1);
//  playerbottom.setPosition(player.getX()+1, player.getY()+41);
//  playerbottom.setNoFill();
//  playerbottom.setNoStroke();
//  playerbottom.setRestitution(0);
//  playerbottom.setDensity(1);
//  playerbottom.setGrabbable(false);
//  playerbottom.setRotatable(false);
//  world.add(playerbottom);
//}
