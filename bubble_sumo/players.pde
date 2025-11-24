void player1() {
  leftPlayer = new FCircle(120);
  leftPlayer.setPosition(400,500);
  leftPlayer.setFillColor(#2CB4D8); // red
  leftPlayer.setStrokeWeight(5);
  leftPlayer.setStroke(0);
  leftPlayer.setRestitution(1);
  leftPlayer.setDensity(1);
  leftPlayer.setFriction(1);
  leftPlayer.setGrabbable(false);
  world.add(leftPlayer);
}

void sumo1() {
  float leftguyX = leftPlayer.getX();
  float leftguyY = leftPlayer.getY();
  pushMatrix();
  translate(leftguyX, leftguyY);
  fill(0);
  stroke(0);
  strokeWeight(5);
  rect(-60,10,120,20,10); // clothes?
  rect(-10,11,20,50,10);
  ellipse(0,-60,40,30); // hair
  ellipse(0,-50, 60,15);
  rotate(radians(-10));
  image(sicksunglasses, -50,-63,100,100);
  popMatrix();
}

void player2() {
  rightPlayer = new FCircle(120);
  rightPlayer.setPosition(600,500);
  rightPlayer.setFillColor(#D82C2F); // blue
  rightPlayer.setStrokeWeight(5);
  rightPlayer.setStroke(0);
  rightPlayer.setRestitution(1);
  rightPlayer.setDensity(1);
  rightPlayer.setFriction(1);
  rightPlayer.setGrabbable(false);
  world.add(rightPlayer);
}

void sumo2() {
  float rightguyX = rightPlayer.getX();
  float rightguyY = rightPlayer.getY();
  pushMatrix();
  translate(rightguyX, rightguyY);
  fill(0);
  stroke(0);
  strokeWeight(5);
  rect(-60,10,120,20,10); // clothes
  rect(-10,11,20,50,10);
  triangle(0,-50, -15,-70, 15,-70); // hair
  strokeWeight(7);
  ellipse(0,-70, 30,9);
  ellipse(0,-50, 60,15);
  rotate(radians(6));
  image(stache, -50,-30,100,70);
  popMatrix();
}

void outline1() {
  float leftguyX = leftPlayer.getX();
  float leftguyY = leftPlayer.getY();
  pushMatrix();
  translate(leftguyX, leftguyY);
  noFill();
  strokeWeight(outlinethickness);
  stroke(255);
  circle(0,0, 120);
  popMatrix(); 
}

void outline2() {
  float rightguyX = rightPlayer.getX();
  float rightguyY = rightPlayer.getY();
  pushMatrix();
  translate(rightguyX, rightguyY);
  noFill();
  strokeWeight(outlinethickness);
  stroke(255);
  circle(0,0, 120);
  popMatrix();
}
