gif gif1, gif2, gif3;

void setup() {
  size(800,600);
  gif1 = new gif("frame_" , 64 , "_delay-0.1s.gif");
  //gif2 = new gif("");
  //gif3 = new gif("");
}

void draw() {
  gif1.show();
  gif1.act();
  //gif2.show();
  //gif3.show();
  
}
