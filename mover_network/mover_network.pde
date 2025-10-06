// mover network
ArrayList<mover> movers;
gif gif1;
boolean playgif;
//int numofmovers = 50;

void setup() {
  size(800,800);
  gif1 = new gif("frame_","_delay-0.04s.gif", 66, 0,-100,width,height);
  movers = new ArrayList();
  //for (int i = 0; i < numofmovers; i++) {
  //  movers.add(new mover());
  //}
}


void draw() {
  background(0);
  if (playgif == true) {
    gif1.show();
  }
  for (int i = 0; i < movers.size(); i++) {
    mover m = movers.get(i); // temporary mover (m) for cleaner code
    m.act(); // getting mover out of array list at index i
    m.showbody();
    m.showconnections();
    if (m.alive == false) {
      movers.remove(i);
    }
    //movers.get(i).act(); // unclean version
    //movers.get(i).showbody();
    //movers.get(i).showconnections();
  }
  
}

void keyPressed() {
  if (key == ' ') movers.add(new mover(mouseX, mouseY));
  if (key == 'g') playgif = true;
}

void mousePressed() {

}
