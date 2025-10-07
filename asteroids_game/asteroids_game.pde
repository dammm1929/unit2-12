// asteroids

int mode = 1;
PFont retro; 
boolean modeerror;
int pleasepressplay = 0;
button[] buttons;

void setup() {
  size(1000,1000);
  buttons = new button[3];
  buttons[0] = new button("Play",500,400,200,100, 0, #4B4A4A); 
  buttons[1] = new button("yes",500,600,200,100, 0, #4B4A4A); 
  buttons[2] = new button("yes",500,800,200,100, 0, #4B4A4A); 
  retro = createFont("Eight-Bit Madness.ttf", 70);
  
}

void draw() {
  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    game();
  } else if (mode == 3) {
    gameover();
  } else {
    modeerror = true;
  }
  
  if (buttons[0].clicked) mode = 2;
  if (buttons[1].clicked) mode = 3;
  if (buttons[2].clicked) mode = 4;
  if (modeerror == true && pleasepressplay < 50) {
    text("ur meatn to press play", 400,880);
    pleasepressplay += 1;
  }
  if (pleasepressplay <= 50) {
    pleasepressplay = 0;
    modeerror = false;
  }
}


//void keyPressed() {
  
//}


//void keyReleased() {
  
  
//}
