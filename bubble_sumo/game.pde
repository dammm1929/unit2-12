void game() {
  background(#C4834D);
  rectMode(CORNER);
  textAlign(CORNER);
  if (leftpoint == true) { // if left wins
    if (celebratetimer == 120) {
      score1 += 1;
    }
    background(#23C0E5);
    celebratetimer -= 1;
    leftPlayer.setVelocity(0,0);
  }
  
  if (rightpoint == true) { // if right wins
    if (celebratetimer == 120) {
      score2 += 1;
    }
    background(#D83448);
    celebratetimer -= 1;
    rightPlayer.setVelocity(0,0);
  }
  
  if (celebratetimer <= 0) {
      celebratetimer = 120; // reset everything
      rightpoint = false;
      leftpoint = false;
      background(#C4834D);
      leftPlayer.setPosition(400,500);
      rightPlayer.setPosition(600,500);
      leftPlayer.setVelocity(0,0);
      rightPlayer.setVelocity(0,0);
    }
  
  leftmovement();
  rightmovement();
  world.setGravity(0,0);
  world.step();
  world.draw();
  
  if (leftPlayer.isTouchingBody(arena)) {
    leftinbounds = true;
  } else {
    leftinbounds = false;
    rightpoint = true;
  }

  if (rightPlayer.isTouchingBody(arena)) {
    rightinbounds = true; 
  } else {
    rightinbounds = false;
    leftpoint = true;

  }
  
  if (leftPlayer.isTouchingBody(rightPlayer) && grace == 100) {
    if (int(random(5)) == 0) wrestle = true; // usually at 15
  }
  
  if (wrestle == true) { // wrestle event
    wrestletimer -= 1;
    grace -= 1;
    leftPlayer.setVelocity(0, 0);
    rightPlayer.setVelocity(0, 0);
    if (outlinethicknesstimer % 2 == 0) outlinethickness = 7;
    else if (outlinethicknesstimer % 3 == 0) outlinethickness = 9;
    else outlinethickness = 5;
    
    if (wrestletimer <= 0) {
      wrestle = false;
      wrestletimer = 90;
      println("blue count: " + wrestle1count);
      println("red count: " + wrestle2count);
      PVector pos1 = new PVector(leftPlayer.getX(), leftPlayer.getY());
      PVector pos2 = new PVector(rightPlayer.getX(), rightPlayer.getY());
      PVector dir = PVector.sub(pos2, pos1);
      PVector ref = new PVector(1,0); // 0 degrees / radians
      anglebetween = PVector.angleBetween(ref, dir);
      println("angle between objects: " + degrees(anglebetween) + " degrees");
      if (wrestle1count < wrestle2count) rightPlayer.setVelocity(-dir.x*4, -dir.y*4);
      else if (wrestle1count > wrestle2count) leftPlayer.setVelocity(dir.x*4, dir.y*4);
      else {
        leftPlayer.setVelocity(dir.x, dir.y);
        rightPlayer.setVelocity(-dir.x, -dir.y);
      }
      wrestle1count = 0;
      wrestle2count = 0;
      grace = 100;
    }
  }
  
  if (wrestle == true) {
    outline1();
    outline2();
  }
  
  outlinethicknesstimer += 1;
  sumo1();
  sumo2();
  
  textSize(60);
  text("blue: " + score1, 50,80);
  text("red: " + score2, 800,80);
  
  if (score1 >= 5 && celebratetimer == 120) {
    mode = 3; 
    player1win = true;
  }
  if (score2 >= 5 && celebratetimer == 120) {
    mode = 3;
    player2win = true;
  }
}
