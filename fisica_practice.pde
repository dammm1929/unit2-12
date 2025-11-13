import fisica.*;

color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color black = color(0,0,0);

int gravity = 1;
int spawn = 1;

int cloud1x = 0;
int cloud2x = 0;

//assets
PImage face;

FPoly topPlatform; 
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  size(800, 600);
  
  //load resources
  face = loadImage("funnyshockface.png");
  face.resize(48,48);

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, 60);
  topPlatform.vertex(340, 240);
  topPlatform.vertex(340, 340);
  topPlatform.vertex(-100, 160);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(690, 530);
  bottomPlatform.vertex(380, 530);
  bottomPlatform.vertex(320, 400);
  bottomPlatform.vertex(350, 560);
  bottomPlatform.vertex(720, 560);
  bottomPlatform.vertex(750, 400);
  



  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(#AFAFAF);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  //println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  if (gravity == 1) world.setGravity(0, 900);
  if (gravity == -1) world.setGravity(0,0);
  
  if (frameCount % 50 == 0 && spawn > 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    shockface();
  }
  
  if (frameCount % 250 == 0 && spawn >= 0) {
    bomb();
  }
  
  // byttons
  tact(50,450);
  stroke(0);
  rect(50,450, 100,50);
  fill(0);
  textSize(30);
  text("gravity", 58,480);
  
  tact(200,450);
  rect(200,450, 100,50);
  textSize(30);
  fill(0);
  text("spawn", 208, 480);
  
  if (spawn > 0) {
    fill(#4BE85E);
    stroke(#4BE85E);
    strokeWeight(4);
    line(215,525, 235,540);
    line(235,540, 270,515);
  }
  
  if (gravity > 0) {
    fill(#4BE85E);
    stroke(#4BE85E);
    strokeWeight(4);
    line(75,525,90,540);
    line(90,540, 130,515);
  }
  
  
  cloud(cloud1x, 100);
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  
  cloud(cloud2x, 500);
  cloud1x += 3;
  cloud2x += 2;
  if (cloud1x >= width+80) cloud1x = -80;
  if (cloud2x >= width+80) cloud2x = -80;
}


//===========================================================================================

void makeCircle() { // red circle
  FCircle circle = new FCircle(50);
  circle.setPosition(random(100,width-100), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() { // yellow blob
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100,width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() { // green box
  FBox box = new FBox(50, 50);
  box.setPosition(random(100,width-100), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1.5);
  world.add(box);
}

//===========================================================================================

void shockface() { // shock face
  FCircle bird = new FCircle(48);
  bird.setPosition(random(100,width-100), -5);

  //set visuals
  bird.attachImage(face);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}

void bomb() {
  FCircle bomb = new FCircle(40);
  bomb.setPosition(550,-5);
  bomb.setStroke(0);
  bomb.setFillColor(black);
  bomb.setDensity(0.2);
  bomb.setRestitution(100);
  world.add(bomb);
}

void cloud(float x, float y) {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(255);
  ellipse(0,0,50,30);
  ellipse(30,10,50,30);
  ellipse(-15,15,40,20);
  ellipse(-30,-5,50,20);
  ellipse(-50,10,60,30);
  popMatrix();
}

void mousePressed() {
  if (mouseX > 50 && mouseX < 150 && mouseY > 450 && mouseY < 500) {
    gravity *= -1;
  }

  if (mouseX > 200 && mouseX < 300 && mouseY > 450 && mouseY < 500) {
    spawn *= -1;
  }
}

void tact(float x, float y) {
  if (mouseX > x && mouseX < x + 100 && mouseY > y && mouseY < y + 50) {
    fill(#C4C2C2);
  } else {
    fill(#E5E5E5);
  }
}
