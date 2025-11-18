import fisica.*;

// bouncy sumo game

//assets

boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, rightkey, downkey;
boolean leftinbounds, rightinbounds;
boolean leftpoint, rightpoint;
PImage sicksunglasses;
PImage stache;

FCircle leftPlayer, rightPlayer;
FCircle arena;

//fisica
FWorld world;

void setup() {
  //make window
  size(1000, 1000);
  sicksunglasses = loadImage("sunglasses_funny.png");
  stache = loadImage("realmustache.png");

  // make the world
  Fisica.init(this);
  world = new FWorld();

  //player2();
  arena = new FCircle(700);
  arena.setPosition(width/2, height/2);
  arena.setFillColor(#CECECE);
  arena.setStrokeWeight(5);
  arena.setStroke(0);
  arena.setSensor(true);
  arena.setGrabbable(false);
  world.add(arena);
  player1();
  player2();
}

//===========================================================================================
int celebratetimer = 120;
void draw() {
  background(#C4834D);
  if (leftpoint == true) { // if left wins
    background(#23C0E5);
    celebratetimer -= 1;
    leftPlayer.setVelocity(0,0);
  }
  
  if (rightpoint == true) { // if right wins
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
  
  sumo1();
  sumo2();
}

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
  rect(-60,10,120,20,10); // clothes
  rect(-10,11,20,50,10);
  triangle(0,-50, -15,-70, 15,-70); // hair
  ellipse(0,-70, 30,9);
  ellipse(0,-50, 60,15);
  rotate(radians(6));
  image(stache, -50,-30,100,70);
  popMatrix();
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
  //float leftx = leftPlayer.getX();
  //float lefty = leftPlayer.getY();
  if (leftinbounds == true && celebratetimer == 120) {
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
}

void rightmovement() {

  if (rightinbounds == true && celebratetimer == 120) {
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
}
