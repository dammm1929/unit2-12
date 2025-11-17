import fisica.*;

// bouncy sumo game

//assets

boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, rightkey, downkey;

FCircle leftPlayer, rightPlayer;

//fisica
FWorld world;

void setup() {
  //make window
  size(1000, 1000);

  // make the world
  Fisica.init(this);
  world = new FWorld();

  player1();
  player2();
}

//===========================================================================================

void draw() {
  background(#C4834D);
  leftmovement();
  rightmovement();
  strokeWeight(5);
  fill(#CECECE);
  circle(width/2,height/2,700);
  world.setGravity(0,0);
  world.step();
  world.draw();

}

void player1() {
  leftPlayer = new FCircle(90);
  leftPlayer.setPosition(400,500);
  leftPlayer.setFillColor(#2CB4D8); // red
  leftPlayer.setStrokeWeight(3);
  leftPlayer.setStroke(0);
  leftPlayer.setRestitution(1);
  leftPlayer.setDensity(1);
  leftPlayer.setFriction(1);
  world.add(leftPlayer);
}

void player2() {
  rightPlayer = new FCircle(90);
  rightPlayer.setPosition(600,500);
  rightPlayer.setFillColor(#D82C2F); // blue
  rightPlayer.setStrokeWeight(3);
  rightPlayer.setStroke(0);
  rightPlayer.setRestitution(1);
  rightPlayer.setDensity(1);
  rightPlayer.setFriction(1);
  world.add(rightPlayer);
}
//===========================================================================================

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  
  if (keyCode == UP) upkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == DOWN) downkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  
  if (keyCode == UP) upkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == DOWN) downkey = false;
}

void leftmovement() {
  //float left_vx = leftPlayer.getVelocityX();
  //float left_vy = leftPlayer.getVelocityY();
  
  if (wkey) {
    leftPlayer.adjustVelocity(0, -10); 
  }
  
  if (akey) {
    leftPlayer.adjustVelocity(-10, 0); 
  }
  
  if (dkey) {
    leftPlayer.adjustVelocity(10, 0);
  }
  
  if (skey) {
    leftPlayer.adjustVelocity(0, 10);
  }
}

void rightmovement() {
  //float right_vx = rightPlayer.getVelocityX();
  //float right_vy = rightPlayer.getVelocityY();
  
  if (upkey) {
    rightPlayer.adjustVelocity(0, -10); 
  }
  
  if (leftkey) {
    rightPlayer.adjustVelocity(-10, 0); 
  }
  
  if (rightkey) {
    rightPlayer.adjustVelocity(10, 0);
  }
  
  if (downkey) {
    rightPlayer.adjustVelocity(0, 10);
  }
}

//boolean outside(FBox out) {
//  ArrayList<FContact> contactList = ball.getContacts();
  
//}
