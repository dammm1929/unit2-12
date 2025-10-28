// asteroids
import java.util.ArrayList;
int mode = 1;
PFont retro;
boolean pleasedontleave;
button[] buttons;
boolean upkey, leftkey, downkey, rightkey, spacekey, shiftkey;
boolean showshadow;
float fuel = 50;
float fuelbarx = 200;
int change = 0;
boolean hit = false;
ship player1; 
int score = 0;
float iframes = 180;
boolean showshield = false;


// list of bullets
ArrayList<gameobject> objects;
ArrayList<particles> particle;

void setup() {
  size(1000,1000);
  buttons = new button[5];
  buttons[0] = new button("Play",500,400,350,150, 0, #4B4A4A); 
  buttons[1] = new button("Settings",500,600,350,150, 0, #4B4A4A); 
  buttons[2] = new button("Leave :(",500,800,350,150, 0, #4B4A4A); 
  buttons[3] = new button("go back", 170,850, 150,75, 0, #4B4A4A);
  buttons[4] = new button("try again", 600,600, 150,75, 0, #4B4A4A);
  retro = createFont("Eight-Bit Madness.ttf", 70);
  
  particle = new ArrayList();
  objects = new ArrayList(); 
  player1 = new ship();
  objects.add(new asteroid());
  objects.add(new asteroid());
  objects.add(new asteroid());
  objects.add(new asteroid());
  objects.add(player1);
}

void draw() {
  click();
  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    settingz();
  } else if (mode == 3) {
    game();
  } else if (mode == 4) {
    gameover();
  } else {
    print("mode is " + mode);
  }
  
 

}
