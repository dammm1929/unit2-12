// asteroids
import java.util.ArrayList;
int mode = 3;
PFont retro;
boolean pleasedontleave;
button[] buttons;
boolean upkey, leftkey, downkey, rightkey, spacekey;

ship player1; 

// list of bullets
ArrayList<gameobject> objects;

void setup() {
  size(1000,1000);
  buttons = new button[4];
  buttons[0] = new button("Play",500,400,350,150, 0, #4B4A4A); 
  buttons[1] = new button("Settings",500,600,350,150, 0, #4B4A4A); 
  buttons[2] = new button("Leave :(",500,800,350,150, 0, #4B4A4A); 
  buttons[3] = new button("go back", 170,850, 150,75, 0, #4B4A4A);
  retro = createFont("Eight-Bit Madness.ttf", 70);
  
  objects = new ArrayList(); 
  player1 = new ship();
  objects.add(player1);
  
}

void draw() {
  print(objects.size());
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
