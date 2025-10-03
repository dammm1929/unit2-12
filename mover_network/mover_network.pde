// mover network
mover[] movers;
gif gif1;
boolean playgif;
int numofmovers = 50;

void setup() {
  size(800,800);
  gif1 = new gif("frame_","_delay-0.04s.gif", 66, 0,-100,width,height);
  movers = new mover[numofmovers];
  for (int i = 0; i < numofmovers; i++) {
    movers[i] = new mover();
  }
}


void draw() {
  background(0);
  if (playgif == true) {
    gif1.show();
  }
  for (int i = 0; i < numofmovers; i++) {
   movers[i].act();
   movers[i].showbody();
   movers[i].showconnections();
  }
  
}

void keyPressed() {
  playgif = true;
}
