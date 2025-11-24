import fisica.*;

// bouncy sumo game

//assets

boolean wkey, akey, skey, dkey;
boolean upkey, leftkey, rightkey, downkey;
boolean leftinbounds, rightinbounds;
boolean leftpoint, rightpoint;
PImage sicksunglasses;
PImage stache;
int score1;
int score2;
boolean wrestle;
int wrestle1count = 0;
int wrestle2count = 0;
int wrestletimer = 90;
boolean outlines;
int outlinethickness = 5;
int outlinethicknesstimer = 0;
int grace = 100;
//float leftX = leftPlayer.getX();
//float leftY = leftPlayer.getY();
//float rightX = rightPlayer.getX();
//float rightY = rightPlayer.getY();
float anglebetween;
boolean player1win, player2win;
int mode = 1;
button[] buttons;


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
  
  buttons = new button[2];
  buttons[0] = new button("play", 500,400,350,150,#D1D1D1,#8B8B8B);
  buttons[1] = new button("play again", 600,600,650,150,#D1D1D1, #8B8B8B);
}

//===========================================================================================
int celebratetimer = 120;

void draw() {

  click();
  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    game();
  } else if (mode == 3) {
    endscreen();
  } else {
    print("mode is " + mode);
  }
} // end of draw
