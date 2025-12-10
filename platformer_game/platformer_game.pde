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
int nomovetimer = 8;
boolean dashcharged = true;
color outofbounds = #8000FF;

FloatList posX = new FloatList(), posY = new FloatList();

gif walkgif, dashgif, jumpgif, flopgif, gif5;

FPlayer player;
//FBox player;
//FBox playerbottom;
FBomb bomb;
FWorld world;

void setup() {
  size(1250,1000);
  // gif order is (before, after, n, x, y, w, h)
  // n is frames !!!!!
  walkgif = new gif("walk_" , "_delay-0.05s.png", 10,595,458,60,60);
  dashgif = new gif("dashright_" , "_delay-0.06s.png", 8, 595,458,67,67);
  jumpgif = new gif("jump_" , "_delay-0.09s.png", 4, 595,458,67,67);
  flopgif = new gif("flop_" , "_delay-0.09s.png", 6, 595, 458, 67,67);
  //i forgot the idle gif so do that on thursday
  
  
  

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
    
    
    else if (c == outofbounds) {
      posX.append(x*gridsize);
      posY.append(y*gridsize);
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
  
  if (rightkey == false && leftkey == false) {
    
  }
  if (dashing == false) {
    walkgif.show();
  }
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  rectMode(CENTER);
  for (int i = 0; i < posX.size(); i++) {
    fill(#171717);
    noStroke();
    square(posX.get(i), posY.get(i), gridsize);
  }
  
  world.step();
  world.draw();
  popMatrix();
  //updateplayer();
  //updateterrain();
  player.movement();
  player.collision();
  
  if (bomb != null) bomb.explode();
}

void updateplayer() {
  
}

void updateterrain() {
  
}
