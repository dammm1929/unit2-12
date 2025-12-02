import fisica.*;

// platformer game 
PImage map;
int x = 0;
int y = 0;
color black = #000000;
color white = 255;
int gridsize = 50;
float vx;
int zoom;
ArrayList<FBox> terrain;
int dashcooldown = 30;
boolean dashed = false;
boolean nomove = false;
boolean dashing = false;
int nomovetimer = 10;
boolean dashcharged = true;

FBox player;
FBox playerbottom;
FBomb bomb;
FWorld world;

void setup() {
  size(1250,1000);
  Fisica.init(this);
  world = new FWorld(-100,-300, 10000,10000);
  map = loadImage("map.png");
  terrain = new ArrayList<FBox>();
  world.setGravity(0,900);
  zoom = 5;
  
  //loading the world up
  while (y < map.height) {
    // general stuff that apply to all blocks
    color c = map.get(x,y); // get a pixel's colour and coord
    FBox b = new FBox(gridsize, gridsize); // (50,50)
    b.setPosition(x*gridsize,y*gridsize); // so they're spaced properly
    b.setStatic(true); // dont fall
    b.setStrokeWeight(3);
    
    // individual traits for each block
    if (c == black) {
      b.setFillColor(black);
      b.setName("regwall");
      world.add(b);
    }
    //if (c == #FF7F27) { // orange
    //  b.setFillColor(#989898);
    //  b.setName("breakable");
    //  world.add(b);
    //}
    if (c == #FF0000) { // red
      b.setFillColor(#E5E5E5);
      b.setName("spike");
      world.add(b);
    }
    if (c == #22B14C) { //green
      b.setFillColor(#23AF35);
      b.setName("crawler");
      world.add(b);
    }
    if (c == #00A2E8) { // blue
      b.setFillColor(#00A2E8);
      b.setName("fly");
      world.add(b);
    }
    
    
    
    x += 1;                 // move forward in row
    if (x == map.width) {   // if get to end of row
      x = 0;                // go back to start
      y += 1;               // go down a row
    }
  }
  
  player1();
  //playerbottom();
}
void draw() {
  //bombx += bombvx;
  background(#8BA2BF);  
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();
  updateplayer();
  updateterrain();
  // left and right movement
  if (leftkey == false && rightkey == false) vx = 0;
  if (leftkey && nomovetimer == 10) vx = -300;
  if (rightkey && nomovetimer == 10) vx = 300;
  player.setVelocity(vx,player.getVelocityY());
  // jumping
  ArrayList<FContact> contacts = player.getContacts();
  if (upkey && contacts.size() > 0) player.setVelocity(player.getVelocityX(), -500);
  if (contacts.size() > 0) {
    dashcharged = true;
  }
  
  // spell
  if (spell && canshoot == true) {
    bomb = new FBomb(); 
    canshoot = false;
    shootcooldown = 30;
  }
  
  if (canshoot == false) shootcooldown -= 1;
  if (shootcooldown <= 0) canshoot = true;

  if (dash && dashcooldown >= 30 && dashcharged == true) {
    dashing = true;
    if (faceright) {
      if (nomovetimer <= 10 && nomovetimer >= 0) {
        player.setVelocity(1000,-1);
        vx = 1000;
      }
    }
    
    if (faceleft) {
      if (nomovetimer <= 10 && nomovetimer >= 0) {
        player.setVelocity(-1000,-1); 
        vx = -1000;
      }
    }
    
    dashed = true;
  }
  
  if (dashed == true) {
    dashcooldown -= 1;
    if (dashcooldown == 29) dashcharged = false;
    if (dashcooldown > 20) nomovetimer -= 1;
    if (dashcooldown <= 0) {
      dashed = false;
      dashcooldown = 30;
    }
    if (dashcooldown <= 20) {
      nomovetimer = 10;
      dashing = false;
    }
  }
  
}

void updateplayer() {
  
}

void updateterrain() {
  
}
