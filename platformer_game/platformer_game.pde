import fisica.*;

// platformer game 
PImage map;
int x = 0;
int y = 0;
color black = #000000;
color white = 255;
int gridsize = 50;
float vx, vy;
float bx, by;
int zoom;
ArrayList<FBox> breakables;
ArrayList<FBox> regulars;
int dashcooldown = 30;
boolean dashed = false;
boolean nomove = false;
boolean dashing = false;
int nomovetimer = 10;
boolean dashcharged = true;

FPlayer player;
//FBox player;
//FBox playerbottom;
FBomb bomb;
FWorld world;

void setup() {
  size(1250,1000);
  Fisica.init(this);
  world = new FWorld(-100,-300, 10000,10000);
  map = loadImage("map.png");
  breakables = new ArrayList<FBox>();
  regulars = new ArrayList<FBox>();
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
    
    FBox d = new FBox(gridsize, gridsize/2); // spike boxes
    d.setPosition(x*gridsize,y*gridsize + 15);
    d.setStatic(true);
    d.setStrokeWeight(3);
    
    FBox e = new FBox(gridsize, gridsize-1); // spike boxes
    e.setPosition(x*gridsize,y*gridsize);
    e.setStatic(true);
    e.setStrokeWeight(3);
    
    // individual traits for each block
    if (c == black) {
      b.setFillColor(black);
      b.setName("regwall");
      world.add(b);
      regulars.add(b);
    }
    if (c == #ED1C24) { // red
      d.setFillColor(#E5E5E5);
      d.setName("spike");
      world.add(d);
      regulars.add(d);
    }
    if (c == #FF7F27) { // orange
      e.setFillColor(#989898);
      e.setName("breakable");
      world.add(e);
      breakables.add(e);
    }
    if (c == #22B14C) { //green
      b.setFillColor(#23AF35);
      b.setName("crawler");
      world.add(b);
      regulars.add(b);
    }
    if (c == #00A2E8) { // blue
      b.setFillColor(#00A2E8);
      b.setName("fly");
      world.add(b);
      regulars.add(b);
    }
    
    
    
    x += 1;                 // move forward in row
    if (x == map.width) {   // if get to end of row
      x = 0;                // go back to start
      y += 1;               // go down a row
    }
  }

  player = new FPlayer();
  world.add(player);
}
void draw() {
  background(#8BA2BF);  
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();
  updateplayer();
  updateterrain();
  player.movement();
  player.collisions();
  
  if (bomb != null) bomb.explode();
}

void updateplayer() {
  
}

void updateterrain() {
  
}
