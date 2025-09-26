boolean mouseReleased;
boolean waspressed;


button[] mybuttons;

void setup() {
  size(600,600);
  mybuttons = new button[4];
  mybuttons[0] = new button("red", 100,100,100,50, #E87E7E, #743F3F);
  mybuttons[1] = new button("pink", 300,150,150,70, #FF6AF5, #FFA7F9);
  mybuttons[2] = new button("green", 140,350,130,90, #31DB65, #349D54);
  mybuttons[3] = new button("orange", 500,500,180,70, #FFAC12, #CB9733);
}


void draw() {
  click();
  mybuttons[0].show();
  mybuttons[1].show();
  mybuttons[2].show();
  mybuttons[3].show();
  if (mybuttons[0].clicked) {
    background(#E87E7E);
  }
  if (mybuttons[1].clicked) {
    background(#FFA7F9);
  }
  if (mybuttons[2].clicked) {
    background(#31DB65);
  }
  if (mybuttons[3].clicked) {
    background(#FFAC12);
  }
  
}
