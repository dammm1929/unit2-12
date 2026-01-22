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
ArrayList<FGameObject> enemies;
int dashcooldown = 30;
boolean dashed = false;
boolean nomove = false;
boolean dashing = false;
int nomovetimer = 8;
boolean dashcharged = true;
color outofbounds = #8000FF;

PImage[] idle;
PImage[] jump;
PImage[] walk;
PImage[] dashimg;
PImage[] flop;
PImage[] action;
PImage[] crabwalk;
PImage[] batfly;
PImage[] npc;
PImage background;
PImage rightedge;
PImage leftedge;
PImage middleground;
PImage fillground;

int imgw = 45;
int imgh = 50;

boolean dialogue = false;
boolean info = false;

int respawnx, respawny;

FloatList posX = new FloatList(), posY = new FloatList(); // for filling outside of the map
int mode = 1;

//gif walkgif, jumpgif, flopgif, idlegif;
//gif2 dashgif;

FPlayer player;
//FBox player;
//FBox playerbottom;
FBomb bomb;
FWorld world;
void setup() {
  respawnx = 980;
  respawny = 1100;
  size(1250,1000, JAVA2D);
  noSmooth();
  background = loadImage("stolen_background_idontcare.png");
  // gif order is (before, after, n, x, y, w, h)
  // n is frames !!!!!
  
  //walkgif = new gif("walk_" , "_delay-0.05s.png", 10,595,458,60,60);
  //dashgif = new gif2("dash_" , "_delay-0.06s.png", 8, 595,458,67,67);
  //jumpgif = new gif("jump_" , "_delay-0.09s.png", 4, 595,458,56,58);
  //flopgif = new gif("flop_" , "_delay-0.09s.png", 6, 595, 458, 60,60);
  //idlegif = new gif("idle_" , "_delay-0.09s.png", 5, 594, 460, 56, 58);
  
  // image method for animations
  
  idle = new PImage[5];
  idle[0] = loadImage("idle_" + 0 + "_delay-0.09s.png");
  idle[1] = loadImage("idle_" + 1 + "_delay-0.09s.png");
  idle[2] = loadImage("idle_" + 2 + "_delay-0.09s.png");
  idle[3] = loadImage("idle_" + 3 + "_delay-0.09s.png");
  idle[4] = loadImage("idle_" + 4 + "_delay-0.09s.png");
  for (int n = 0; n <= 4; n++) {
    idle[n].resize(imgw,imgh);
  }
  
  jump = new PImage[4];
  jump[0] = loadImage("jump_" + 0 + "_delay-0.09s.png");
  jump[1] = loadImage("jump_" + 1 + "_delay-0.09s.png");
  jump[2] = loadImage("jump_" + 2 + "_delay-0.09s.png");
  jump[3] = loadImage("jump_" + 3 + "_delay-0.09s.png");
  for (int n = 0; n <= 3; n++) {
    jump[n].resize(imgw,imgh);
  }
  
  walk = new PImage[10];
  walk[0] = loadImage("walk_" + 0 + "_delay-0.05s.png");
  walk[1] = loadImage("walk_" + 1 + "_delay-0.05s.png");
  walk[2] = loadImage("walk_" + 2 + "_delay-0.05s.png");
  walk[3] = loadImage("walk_" + 3 + "_delay-0.05s.png");
  walk[4] = loadImage("walk_" + 4 + "_delay-0.05s.png");
  walk[5] = loadImage("walk_" + 5 + "_delay-0.05s.png");
  walk[6] = loadImage("walk_" + 6 + "_delay-0.05s.png");
  walk[7] = loadImage("walk_" + 7 + "_delay-0.05s.png");
  walk[8] = loadImage("walk_" + 8 + "_delay-0.05s.png");
  walk[9] = loadImage("walk_" + 9 + "_delay-0.05s.png");
  for (int n = 0; n <= 9; n++) {
    walk[n].resize(imgw+6,imgh+6);
  }
  
  dashimg = new PImage[8];
  for (int n = 0; n <= 7; n++) {
    dashimg[n] = loadImage("dash_" + n + "_delay-0.06s.png");
  }
  //dashimg[0] = loadImage("dash_" + 0 + "_delay-0.06s.png");
  //dashimg[1] = loadImage("dash_" + 1 + "_delay-0.06s.png");
  //dashimg[2] = loadImage("dash_" + 2 + "_delay-0.06s.png");
  //dashimg[3] = loadImage("dash_" + 3 + "_delay-0.06s.png");
  //dashimg[4] = loadImage("dash_" + 4 + "_delay-0.06s.png");
  //dashimg[5] = loadImage("dash_" + 5 + "_delay-0.06s.png");
  //dashimg[6] = loadImage("dash_" + 6 + "_delay-0.06s.png");
  //dashimg[7] = loadImage("dash_" + 7 + "_delay-0.06s.png");
  for (int n = 0; n <= 7; n++) {
    dashimg[n].resize(imgw+10,imgh+5);
  }
  
  flop = new PImage[6];
  flop[0] = loadImage("flop_" + 0 + "_delay-0.09s.png");
  flop[1] = loadImage("flop_" + 1 + "_delay-0.09s.png");
  flop[2] = loadImage("flop_" + 2 + "_delay-0.09s.png");
  flop[3] = loadImage("flop_" + 3 + "_delay-0.09s.png");
  flop[4] = loadImage("flop_" + 4 + "_delay-0.09s.png");
  flop[5] = loadImage("flop_" + 5 + "_delay-0.09s.png");
  for (int n = 0; n <= 5; n++) {
    flop[n].resize(imgw,imgh);
  }
  
  action = idle;
  
  crabwalk = new PImage[4];
  crabwalk[0] = loadImage("crab_" + 0 + "_delay-0.1s.gif");
  crabwalk[1] = loadImage("crab_" + 1 + "_delay-0.1s.gif");
  crabwalk[2] = loadImage("crab_" + 2 + "_delay-0.1s.gif");
  crabwalk[3] = loadImage("crab_" + 3 + "_delay-0.1s.gif");
  for (int n = 0; n <= 3; n++) {
    crabwalk[n].resize(imgw+40,imgh+40);
  }
  
  batfly = new PImage[10];
  for (int n = 0; n <= 9; n++) {
    batfly[n] = loadImage("bat_" + n + "_delay-0.08s.gif");
  }
  for (int n = 0; n <= 9; n++) {
    batfly[n].resize(imgw+90,imgh+90);
  }
  
  npc = new PImage[2];
  npc[0] = loadImage("orange_" + 0 + ".png");
  npc[1] = loadImage("orange_" + 1 + ".png");
  npc[0].resize(imgw+30,imgh+30);
  npc[1].resize(imgw+30, imgh+30);
  
  
  // terrain images
  rightedge = loadImage("rightedge.png");
  leftedge = loadImage("leftedge.png");
  middleground = loadImage("middleground.png");
  fillground = loadImage("fillground.png");
  

  Fisica.init(this);
  world = new FWorld(-100,-300, 10000,10000);
  map = loadImage("map.png");
  breakables = new ArrayList<FBox>();
  regulars = new ArrayList<FBox>();
  enemies = new ArrayList<FGameObject>();
  world.setGravity(0,900);
  zoom = 5;
  
  //loading the world up  
  while (y < map.height) {
    
    color current = map.get(x, y);
   
    // general stuff that apply to all blocks
    color c = map.get(x,y); // get a pixel's colour and coord
    FBox b = new FBox(gridsize+1, gridsize+1); // (50,50)
    b.setPosition(x*gridsize,y*gridsize); // so they're spaced properly
    b.setStatic(true); // dont fall
    b.setNoStroke();
    
    FBox d = new FBox(gridsize+1, gridsize/2 + 1); // spike boxes
    d.setPosition(x*gridsize,y*gridsize + 15);
    d.setStatic(true);
    d.setStrokeWeight(3);
    
    FBox e = new FBox(gridsize + 1, gridsize-1 + 1); // breakable boxes
    e.setPosition(x*gridsize,y*gridsize);
    e.setStatic(true);
    e.setStrokeWeight(3);
    
    FBox f = new FBox(gridsize+1, gridsize+1);
    f.setPosition(x*gridsize, y*gridsize);
    f.setStatic(true);
    f.setSensor(true);
    f.setFillColor(#7AF7F6);
    f.setStrokeWeight(6);
    f.setStroke(255);

    
    // individual traits for each block
    
    if (c == black) {
      
      b.setFillColor(#587655);
       
      // textures
      if (map.get(x, y+1) == black && map.get(x+1, y) == black && map.get(x-y, y) == black && map.get(x, y-1) != black) b.attachImage(middleground); // if bottom is black
      else if (map.get(x+1, y) == black && map.get(x-1, y) != black && map.get(x, y-1) != black) b.attachImage(leftedge); // left
      else if (map.get(x-1, y) == black && map.get(x+1, y) != black && map.get(x, y-1) != black) b.attachImage(rightedge); // right
      else if (map.get(x-1, y) == #7F7F7F && map.get(x, y-1) != black) b.attachImage(middleground); // if breakable on side
      else if (map.get(x+1, y) == #7F7F7F && map.get(x, y-1) != black) b.attachImage(middleground);
      else if (map.get(x, y-1) == black || map.get(x, y-1) == #7F7F7F) b.attachImage(fillground);// if smt above
      else if (map.get(x+1, y) == black && map.get(x-1, y) == black) b.attachImage(middleground); // platforms
      else if (map.get(x+1, y) != black && map.get(x-1, y) != black) b.attachImage(middleground); // platforms
      
      b.setName("regwall");
      world.add(b);
      regulars.add(b);
    }

    if (c == #7F7F7F) { // grayish on the map img
    
      b.setFillColor(#587655);
      
      // textures
      if (map.get(x, y+1) == black && map.get(x+1, y) == black && map.get(x-y, y) == black && map.get(x, y-1) != black) b.attachImage(middleground); // if top is not black
      else if (map.get(x+1, y) == black && map.get(x-1, y) != black && map.get(x, y-1) != black) b.attachImage(leftedge); // left
      else if (map.get(x-1, y) == black && map.get(x+1, y) != black && map.get(x, y-1) != black) b.attachImage(rightedge); // right
      else if (map.get(x, y-1) == black) b.attachImage(fillground);// if smt above
      else if (map.get(x+1, y) == black && map.get(x-1, y) == black) b.attachImage(middleground); // platforms
      else if (map.get(x+1,y) == black && map.get(x-1,y) != black && map.get(x, y-1) == black) b.attachImage(fillground);

      b.setName("bouncewall");
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
      FGoomba gmb = new FGoomba(x*gridsize, y*gridsize);
      gmb.setNoFill();
      world.add(gmb);
      enemies.add(gmb);
    }
    
    if (c == #00A2E8) { // blue
      Ffly fly = new Ffly(x*gridsize, y*gridsize);
      fly.setNoFill();
      world.add(fly);
      enemies.add(fly);
    }
    
    if (c == #004080) { // npc spawn (dark blueish)
      FNPC npc = new FNPC(x*gridsize, y*gridsize);
      world.add(npc);
      enemies.add(npc);
    }
    
    if (c == #00FFFF) { // respawn 1
      f.setName("respawn1");
      world.add(f);
      regulars.add(f);
    }
    
    if (c == #00FFFE) { // respawn 2
      f.setName("respawn2");
      world.add(f);
      regulars.add(f);
    }
    
    if (c == #00FFFD) {
      f.setName("respawn3");
      world.add(f);
      regulars.add(f);
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
  // mode framework
  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    game();
  }

}

void mousePressed() {
  if (mouseX > 500 && mouseX < 700 && mouseY > 400 && mouseY < 500 && mode == 1) { // start button
    mode = 2;
  }
}

void tactile(int x, int y) {
  if (mouseX > 500 && mouseX < 700 && mouseY > 400 && mouseY < 500) {
    fill(#C6C6C6);
  }
}
